#!/bin/bash

#create the list of paths shadow and passwd
list_path=('/etc/passwd''etc/shadow')


for p in list_path${list_path[@]};
        do
                echo '(ls -l $path)'
        done
