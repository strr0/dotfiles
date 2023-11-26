#!/usr/bin/bash
cd ~/.config/eww
reserves=$(hyprctl monitors -j | gojq -r -c '.[0]["reserved"]')
state=$(eww get osd_vol)

closewinvol() {
    eww update osd_vol=false
    sleep 0.2
    eww close winosd_vol 2>/dev/null
}
closewinosd() {
    eww update osd_bright=false
    sleep 0.2
    eww close winosd_bright 2>/dev/null
}
openwinosd() {
    if [ "$state" = "true" ]; then
        closewinvol
    fi
    eww open winosd_bright
    eww update osd_bright=true
}

if [[ "$1" == "--open" ]]; then 
    openwinosd
elif [[ "$1" == "--close" ]]; then
    closewinosd
else
    closewinosd
fi
