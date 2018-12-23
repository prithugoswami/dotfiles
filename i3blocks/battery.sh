percent=$(acpi | awk '{print $4}')
state=$(acpi | awk '{print $3}' | tr -d ',')

case $state in
    Charging)
        symbol="<span font='Font Awesome 5 Free 9'>\uf0e7</span>"
        ;;
    *)
        symbol="<span font='Icons 11'>\uf213 </span>"
        ;;
esac

echo -e "$symbol $percent"
