#!/bin/bash
# Setup configurations using symbolic link from home folder to config files
# within this repository.
# Script copied and modified from :
# https://github.com/nicovince/dotfiles/blob/main/init_config.sh

config_dir=$(git rev-parse --show-toplevel)
ignore_patterns=('README.md' "$(basename "$0")" '.git$' '~' 'backup' '.*\.swp')
backup_folder=${config_dir}_$(date "+%F_%H.%M.%S")

#symbolic link creation
for file in $(ls -A "$config_dir")
do
    ignore_flag=0
    for p in ${ignore_patterns[*]}; do
        match=$(echo "$file" | grep -c "${p}")
        if [ "$match" -ne 0 ]; then
            ignore_flag=1
        fi
    done
    if [ "$ignore_flag" -ne 1 ]
    then
        if [ -e "$HOME/$file" ] && [ ! -h "$HOME/$file" ]
        then
            #backup existing conf file
            mkdir -p "${backup_folder}"
            mv "$HOME/${file}" "${backup_folder}/${file}.old"
        fi
        if [ ! -h "${HOME}/${file}" ]; then
            ln -s "$config_dir/$file" "$HOME/$file"
        fi

    fi
done

