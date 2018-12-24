percent=$(acpi | cut -d ' ' -f4 | tr -d ',')
state=$(acpi | cut -d ' ' -f3 | tr -d ',')

case $state in
    Charging)
        symbol="<span font='Font Awesome 5 Free 9'>\uf0e7</span>"
        ;;
    *)
        symbol="<span font='Icons 11'>\uf213 </span>"
        ;;
esac

echo -e "$symbol $percent"
