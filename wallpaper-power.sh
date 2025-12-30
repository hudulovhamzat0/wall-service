#!/usr/bin/env bash

AC_PATH=$(ls /sys/class/power_supply/ | grep -E 'AC|ACAD|ADP' | head -n1)
AC_STATE_FILE="/sys/class/power_supply/$AC_PATH/online"

while true; do
    if [ -f "$AC_STATE_FILE" ] && [ "$(cat "$AC_STATE_FILE")" -eq 1 ]; then
        dbus-send --session \
          --dest=org.kde.plasmashell \
          --type=method_call \
          /PlasmaShell \
          org.kde.PlasmaShell.evaluateScript \
          'string:
          var ds = desktops();
          for (var i=0;i<ds.length;i++) {
            var d = ds[i];
            d.wallpaperPlugin = "luisbocanegra.smart.video.wallpaper.reborn";
            d.currentConfigGroup = ["Wallpaper","luisbocanegra.smart.video.wallpaper.reborn","General"];
          }'
    else
        dbus-send --session \
          --dest=org.kde.plasmashell \
          --type=method_call \
          /PlasmaShell \
          org.kde.PlasmaShell.evaluateScript \
          'string:
          var ds = desktops();
          for (var i=0;i<ds.length;i++) {
            var d = ds[i];
            d.wallpaperPlugin = "org.kde.image";
            d.currentConfigGroup = ["Wallpaper","org.kde.image","General"];
          }'
    fi

    sleep 60
done
