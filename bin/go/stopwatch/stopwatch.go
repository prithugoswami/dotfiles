package main

import (
	"fmt"
	"os"
	"time"

	"golang.org/x/term"
)

func main() {
	// Switch terminal to raw mode for keypress detection
	oldState, err := term.MakeRaw(int(os.Stdin.Fd()))
	if err != nil {
		fmt.Println("Error setting raw mode:", err)
		os.Exit(1)
	}
	defer term.Restore(int(os.Stdin.Fd()), oldState)

	// Enable mouse tracking (basic press + SGR extended mode for modern terminals)
	fmt.Fprint(os.Stdout, "\033[?1000h") // basic mouse press reporting
	fmt.Fprint(os.Stdout, "\033[?1006h") // SGR extended mouse mode
	defer func() {
		fmt.Fprint(os.Stdout, "\033[?1006l")
		fmt.Fprint(os.Stdout, "\033[?1000l")
	}()

	var (
		running   bool
		elapsed   time.Duration
		startTime time.Time
	)

	// Channel for raw input bytes
	input := make(chan byte, 64)
	go func() {
		buf := make([]byte, 1)
		for {
			n, err := os.Stdin.Read(buf)
			if n > 0 {
				input <- buf[0]
			}
			if err != nil {
				return
			}
		}
	}()

	ticker := time.NewTicker(50 * time.Millisecond)
	defer ticker.Stop()

	togglePause := func() {
		if running {
			elapsed += time.Since(startTime)
			running = false
		} else {
			startTime = time.Now()
			running = true
		}
	}

	reset := func() {
		running = false
		elapsed = 0
	}

	printStatus := func() {
		d := elapsed
		if running {
			d += time.Since(startTime)
		}
		h := int(d.Hours())
		m := int(d.Minutes()) % 60
		s := int(d.Seconds()) % 60
		ms := int(d.Milliseconds()) % 1000 / 10
		status := "PAUSED "
		if running {
			status = "RUNNING"
		}
		fmt.Fprintf(os.Stdout, "\r\033[K  %s   %02d:%02d:%02d.%02d", status, h, m, s, ms)
	}

	printStatus()

	readByte := func(timeout time.Duration) (byte, bool) {
		select {
		case b := <-input:
			return b, true
		case <-time.After(timeout):
			return 0, false
		}
	}

	// parseSGRMouse handles SGR mouse sequences: \033[< button;x;y M|m
	parseSGRMouse := func() {
		var seq []byte
		for {
			b, ok := readByte(100 * time.Millisecond)
			if !ok {
				return
			}
			seq = append(seq, b)
			if b == 'M' || b == 'm' {
				break
			}
		}
		final := seq[len(seq)-1]
		if final != 'M' {
			return // only act on press, ignore release
		}
		var button int
		for i := 0; i < len(seq) && seq[i] >= '0' && seq[i] <= '9'; i++ {
			button = button*10 + int(seq[i]-'0')
		}
		if button == 0 { // left click
			togglePause()
			printStatus()
		}
	}

	// parseX10Mouse handles classic X10 sequences: \033[M <cb> <cx> <cy>
	parseX10Mouse := func() {
		var params [3]byte
		for i := 0; i < 3; i++ {
			b, ok := readByte(100 * time.Millisecond)
			if !ok {
				return
			}
			params[i] = b
		}
		button := params[0] - 32
		if button == 0 { // left click
			togglePause()
			printStatus()
		}
	}

	for {
		select {
		case key := <-input:
			if key == 27 { // ESC — beginning of escape sequence
				b, ok := readByte(50 * time.Millisecond)
				if !ok {
					continue
				}
				if b == '[' {
					b2, ok := readByte(50 * time.Millisecond)
					if !ok {
						continue
					}
					switch b2 {
					case '<':
						parseSGRMouse() // \033[<...
					case 'M':
						parseX10Mouse() // \033[M...
					}
				}
			} else {
				switch key {
				case ' ':
					togglePause()
				case 'r', 'R':
					reset()
				case 'q', 'Q', 3: // q, Q, Ctrl+C
					fmt.Fprintf(os.Stdout, "\r\033[K")
					return
				}
				printStatus()
			}
		case <-ticker.C:
			if running {
				printStatus()
			}
		}
	}
}
