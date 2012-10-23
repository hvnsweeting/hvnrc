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


#run it forever
while [ "1" == "1" ]; do
    if [ $(is_on_battery) ]; then
        if [ $(percent_bat) -lt "30" ]; then
            echo "HETPIN" # thich lam j thi lam o day, play 1 file nhac chang han
        fi
    fi
    sleep 30
done

