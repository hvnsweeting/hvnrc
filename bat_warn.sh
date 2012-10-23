#!/bin/bash
function is_on_battery() # None : Bool
{
    grep -q "discharg" /proc/acpi/battery/BAT0/state 
    echo $?  # 0 is True, 1 is False
}

function percent_bat()  # None : Int
{
    RATE=$(grep rate /proc/acpi/battery/BAT0/state | cut -d" " -f14)
    CAPACITY=$(grep remaining /proc/acpi/battery/BAT0/state | cut -d" " -f8)
    echo "60 * $CAPACITY/$RATE" | bc
}


BAT_MIN=10
#run it forever
while [ "1" == "1" ]; do
    if [ $(is_on_battery) ]; then
        if [ $(percent_bat) -lt "$BAT_MIN" ]; then
            # do thing you want to alert
            echo "CHARGE YOUR LAPTOP NOW!" 
        fi
    fi
    sleep 30
done

