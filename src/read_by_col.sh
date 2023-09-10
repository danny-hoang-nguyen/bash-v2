#!/bin/bash
while read -r index name age nickname; do
    echo "$index : $name, $age, $nickname"
done < "input.txt"