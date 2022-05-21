PID=$$
xdotool search --class $1 | while read line
do
  echo "$line"
  if [ `xdotool windowactivate $line 2> /dev/stdout | grep -c fail` -eq 0 ]
    then
    kill $PID
    exit
  fi
done
## Launch the program if we reach here
$1 & disown
