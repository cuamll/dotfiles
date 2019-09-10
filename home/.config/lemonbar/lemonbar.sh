#!/bin/bash

while true; do
  output="";
  DELAY=0.2;

  # Left Align

  # Workspaces

  while read -r line; do
    if [[ "$line" == *'true'* ]]; then
      output="${output}%{F#051525}"
    elif [[ "$line" == *'false'* ]]; then
      output="${output}%{F#888888}"
    fi
    num=$(echo "${line/\]/}" | cut -d , -f 2)
    output="${output}%{A:i3-msg workspace ${num}:}[${num}]%{A}"
  done <<< "$(i3-msg -t get_workspaces | jq -M -c -r '.[] | [.focused, .num]')"
  output="${output}%{F#888888}"


  # Center Align
  output="${output}%{c}"

  # Pianobar
  if [[ "$(pgrep pianobar)" != '' ]]; then
    while read -r line; do
      if [[ "$line" != *"Station"* ]]; then
        song=$(echo "$line" | cut -d \" -f 2)
        artist=$(echo "$line" | cut -d \" -f 4)
        output="${output}%{A:echo -n \" \" > ~/.config/pianobar/ctl:}%{A3:echo -n \"n\" > ~/.config/pianobar/ctl:}"
        output="${output}%{F#051525}\"${song}\"%{F#888888} by %{F#051525}\"${artist}\"%{F#888888}"
        output="${output}%{A}%{A}"
        break
      fi
    done <<< "$(tac ~/.config/pianobar/out | grep '|')"
  fi


  # Right Align
  output="${output}%{r} "

  # Wifi
  wifi_icon=
  essid=$(iwgetid | cut -d \" -f 2)
  if [[ "$essid" != "" ]]; then
    output="${output}%{T2}${wifi_icon}%{T1}%{F#888888}wifi %{F#051525}$(iwconfig wlan0 | grep Quality | cut -d = -f 2 | cut -d / -f 1)%"
  fi

  output="${output}       "

  # Volume
  vol_icon=
  output="${output}%{F#888888}%{T1}${vol_icon}%{T1} %{F#051525}$(amixer -D pulse | grep Front\ Left:\ Playback | cut -d \  -f 7 | cut -d [ -f 2 | cut -d ] -f 1)%{F#888888}"
  output="${output} "

  # Battery
  # output="${output}%{F#888888}Battery%{F#051525} $(acpi | cut -d , -f 2 | cut -d " " -f 2)"

  output="${output}   "

  # Time
  clock_icon=
  date=$(date +"%a %d/%m        %H:%M" | tr '[:upper:]' '[:lower:]')
  output="${output}%{F#888888}     %{F#051525}%{T2}${clock_icon}%{T1}${date}"

  echo -e " ${output} "; sleep $DELAY;
done | lemonbar -f "Overpass Mono-10" -f "FontAwesome-8" -d -g 1800x40+60+24 -B \#bbdde5eb -F \#cccccc | /bin/bash
# done | lemonbar -f "Overpass Mono-10" -f "FontAwesome-8" -d -g 1800x24+60+24 -B \#bbdde5eb -F \#cccccc | /bin/bash

##!/bin/zsh
#
## need to figure out how the fonts and geometry work for starters
## note: T*index* tells bar which font to use for the next block appazza
## to test:
## (echo "%{c}test%{l}test%{r}test"; sleep 5) | lemonbar -B#66666666 -d -g 1800x24+60+36
## check man page for more detail
## also colours
#
#FONT1="RobotoMono-10"
#FONT2="Material-Design-Iconic-Font-10"
#FONT3="FontAwesome-10"
#
#clock() {
#  ICON="\uf017"
#  echo -e $ICON $(date '+%H:%M')
#}
#
#while :; do
#  echo -e "$(clock)"
#  sleep 0.2s
#done
#
## BELOW HERE IS COPY PASTED FROM some guy i dunno fuck about with it a bit
##!/bin/bash
#
#DELAY=1
#
#conky -c ~/.config/lemonbar/conky.conf &
#
#workspaces() {
#  output="%{F#888888}"
#  # jq strips out the focused and num parts of the json object
#  # which is all we need, then we need to format it a bit
#  json=$(i3-msg -t get_workspaces | jq -M -c -r '.[] | [.focused, .num]')  
#  while read line; do
#    if [[ "$line" == *'true'* ]]; then
#      output="${output}%{F051525}"
#    elif [[ "$line" == *'false'* ]]; then
#      output="${outut}%{F888888}"
#    fi
#    num=$(echo "${line/\]/}" | cut -d , -f 2)
#    output="${output}%{A:i3-msg workspace ${num}:}[${num}]%{A}"
#  done <<< json
#  echo -e ${output}
#}
#
##music() {
##}
#
#wifi() {
#  output=""
#  wifi_icon=
#  mid_wifi="\uf2e2"
#  no_wifi="\uf2e7"
#  max_strength=-20.0
#  min_strength=-90.0
#  strength=$(iwconfig wlan0 | grep Quality | cut -d = -f 3 | cut -d \  -f 1)
#  percent=((100.0 - 70.0 * (max_strength - strength) / (max_strength - min_strength) ))
#  output="%{T2}${wifi_icon}%{T1}%{F#051525}${percent}%"
#  echo -e "${output}"
#}
#
## for now, the battery doesn't seem to be working at all, so fuck it
##battery() {
##  output=""
##  full_batt=""
##  mid_batt=""
##  no_batt=""
##  charge=""
##  batt_info=$(upower -i /org/freedesktop/UPower/devices/battery_BAT0 | grep )
##  percent=
##  output="%{F#888888}Battery%{F#051525} $(acpi | cut -d , -f 2 | cut -d " " -f 2)"
##
##  output="${output} "
##}
#
#volume() {
#  output=""
#  vol_icon=
#  percent=$(amixer -D pulse | grep Front\ Left:\ Playback | cut -d \  -f 7 | cut -d [ -f 2 | cut -d ] -f 1)
#  output="%{T3}${vol_icon}%{T1}%{F#051525}${percent}"
#  echo -e "${output}"
#}
#
#date() {
#  date=$(date +"%a %d/%m  %H:%M" | tr '[:upper:]' '[:lower:]')
#  clock_icon=
#  echo -e "%{T2}${clock_icon}%{T1}${date}"
#}
#
#while true; do
#  echo "%{r}$(date)"
#  sleep $DELAY;
#done

