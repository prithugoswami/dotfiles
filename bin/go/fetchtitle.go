package main

import (
	"bytes"
	"fmt"
	"io"
	"net/http"
	"os"
	"regexp"
)

func main() {
    re := regexp.MustCompile(`<title>(.*?)</title>`)
    command := os.Args[0]
    urls := os.Args[1:]

    for _, url := range urls {
        resp, err := http.Get(url)
        if err != nil {
            fmt.Fprintf(os.Stderr, "%s: %v\n", command, err)
            os.Exit(1)
        }
        defer resp.Body.Close()
        b := bytes.NewBuffer([]byte{})
        _, err = io.Copy(b, resp.Body)
        matches := re.FindSubmatch(b.Bytes())
        fmt.Printf("%s", matches[1])

        if err != nil {
            fmt.Fprintf(os.Stderr, "%s: reading %s: %v\n", command, url, err)
            os.Exit(1)
        }
    }
}
