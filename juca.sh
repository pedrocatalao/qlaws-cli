#!/bin/bash
aws ec2 describe-instances --no-cli-pager --query 'Reservations[*].Instances[*].[Tags[?Key==`Name`].Value | [0]]' --output text > options.txt
lines=()
while IFS= read -r line || [[ -n "$line" ]]; do
    lines+=("$line")
done < options.txt
selected_index=0
menu_height=${#lines[@]}

display_menu() {
    tput rc
    for i in "${!lines[@]}"; do
        if [ "$i" -eq "$selected_index" ]; then
            echo -e "$(tput setab 244)$(tput setaf 15)${lines[$i]}$(tput sgr0)"
        else
            echo "${lines[$i]}"
        fi
    done
    tput rc
    if [ "0" -eq "$selected_index" ]; then
        tput cud $selected_index; tput cuu 1
    else
        tput cud $selected_index 0
    fi
}

for i in "${!lines[@]}"; do echo; done
tput cuu $menu_height; tput sc
while true; do
    display_menu
    read -rsn1 input
    if [[ "$input" == $'\x1b' ]]; then
        read -rsn2 input
        if [[ "$input" == '[A' ]]; then ((selected_index--)); [ "$selected_index" -lt 0 ] && selected_index=0
        elif [[ "$input" == '[B' ]]; then ((selected_index++)); [ "$selected_index" -ge "${#lines[@]}" ] && selected_index=$((${#lines[@]} - 1))
        fi
    elif [[ "$input" == "" ]]; then
        tput rc
        tput cud $menu_height
        echo "You selected: ${lines[$selected_index]}"
        break
    fi
done