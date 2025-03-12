#!/bin/bash

file="penguin.png"  # Remplace par ton fichier si différent
output_dir="extracted_segments"
mkdir -p "$output_dir"  # Crée un dossier pour stocker les segments

offsets=(545628 935927 1087528 1367901 1488805 1714767 1981973 2123905 2237184 2366687 2512230 2607611 2766084 3179968 3271603 3407080 3511322 3579746 3580770 3694369 3697646 3914995)  

for ((i=0; i<${#offsets[@]}-1; i++)); do
    start=${offsets[i]}
    end=${offsets[i+1]}
    size=$((end - start))
    output_file="$output_dir/segment_$((i+1)).bin"

    echo "Extraction du segment $((i+1)) : Offset $start -> $end (Taille: $size octets)"
    dd if="$file" bs=1 skip=$start count=$size of="$output_file" status=progress
done

echo "Extraction terminée ! Les fichiers sont dans le dossier '$output_dir'."

