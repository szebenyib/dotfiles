#!/bin/bash
#constants
readonly HLCOLOR="#ffff00"

if [ $1 = "volume" ]
#Changes volume and notifies about volume related changes. Supports volume up,
#down, and mute. Call example "sh i3helper.sh volume down".
then
	if [ $2 = "up" ] || [ $2 = "down" ]
	then
		case $2 in
			up)
				amixer set Master 5%+ -q
				;;
			down)
				amixer set Master 5%- -q
				;;
		esac
		volume=`amixer get Master | egrep -o "[0-9]+%" -m 1`
		notify-send "Volume" "♪: " -h "int:value:${volume:-1}"
	fi

	if [ $2 = "mute" ]
	then
		amixer set Master toggle -q
		state=`amixer get Master | egrep -o "\[[^%]+\]" -m 1`
		#stripping parentheses
		state=${state:1:-1}
		if [ $state == "off" ]
		then
			notify-send "Volume" "♪: $state" -h "string:fgcolor:$HLCOLOR"
		else
			notify-send "Volume" "♪: $state"
		fi
	fi
elif [ $1 = "brightness" ]
#Changes brightness up or down by reading the current value and modifying it.
#It checks if the limit has been reached. Working on sony vaio vpcca.
#Call example "sh i3helper.sh brightness down".
then
#Reading maximum value, setting minimum value
	max_brightness=`sudo cat /sys/class/backlight/acpi_video0/max_brightness`
	min_brightness=1
	cur_brightness=`sudo cat /sys/class/backlight/acpi_video0/brightness`

	if [ $2 = "up" ]
	then
		if [ $cur_brightness -lt $max_brightness ]
		then
			let "cur_brightness += 1"
			echo "$cur_brightness" | sudo tee /sys/class/backlight/acpi_video0/brightness
			cur_percent=$(echo "scale=2; (($cur_brightness-1)/($max_brightness-1))*100" | bc | xargs printf "%.0f")
			notify-send "Brightness" "✹: " -h "int:value:$cur_percent"
		fi
	fi

	if [ $2 = "down" ]
	then
		if [ $cur_brightness -gt $min_brightness ]
		then
			let "cur_brightness -= 1"
			echo "$cur_brightness" | sudo tee /sys/class/backlight/acpi_video0/brightness
			cur_percent=$(echo "scale=2; (($cur_brightness-1)/($max_brightness-1))*100" | bc | xargs printf "%.0f")
			notify-send "Brightness" "✹: " -h "int:value:$cur_percent"
		fi
	fi
elif [ $1 = "dpms" ]
then
	if [ $2 = "toggle" ]
	then
		if [ -z `xset -q | egrep -o "Enabled"` ]
		then 
			`xset +dpms`
			notify-send "DPMS" "Enabled"
		else
			`xset -dpms`
			notify-send "DPMS" "Disabled" -h "string:fgcolor:$HLCOLOR"
		fi
	fi
elif [ $1 = "keyboard_backlight" ]
then
	if [ $2 = "toggle" ]
	then
		current=`sudo cat /sys/devices/platform/sony-laptop/kbd_backlight`
		case $current in
			0)
				echo 1 | sudo tee /sys/devices/platform/sony-laptop/kbd_backlight
				notify-send "Keyboard backlight" "Switched on" -h "string:fgcolor:$HLCOLOR"
				;;
			1)
				echo 0 | sudo tee /sys/devices/platform/sony-laptop/kbd_backlight
				notify-send "Keyboard backlight" "Switched off" -h "string:fgcolor:$HLCOLOR"
				;;
	esac
	fi
elif [ $1 = "mpc" ]
then
	if [ $2 = "toggle" ]
	then
		mpc -q toggle
	fi
fi