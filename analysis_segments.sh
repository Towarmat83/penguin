#!/bin/bash

input_dir="extracted_segments"
output_dir="analysis_results"
mkdir -p "$output_dir/individual_reports"  # Dossier pour les rapports individuels
output_file="$output_dir/all_segments_analysis.txt"

echo "Début de l'analyse des segments..."  
echo "=== ANALYSE DES SEGMENTS ===" > "$output_file"

for segment in "$input_dir"/*.bin; do
    segment_name=$(basename "$segment" .bin)  # Nom du fichier sans extension
    report_file="$output_dir/individual_reports/${segment_name}.txt"

    echo "Analyse du fichier : $segment_name"

    # Vérifier l'entropie du fichier
    entropy=$(ent "$segment" 2>/dev/null | grep "Entropy" | awk '{print $3}')

    # Exécute `file`, `strings`, `ent`, et enregistre les sorties
    {
        echo "=== FILE OUTPUT ==="
        file "$segment"
        
        echo -e "\n=== ENTROPY OUTPUT ==="
        echo "Entropie : $entropy bits/octet"

        echo -e "\n=== STRINGS OUTPUT ==="
        strings "$segment"
    } > "$report_file"

    # Ajoute le rapport au fichier global
    echo -e "\n\n==== [$segment_name] ====\n" >> "$output_file"
    cat "$report_file" >> "$output_file"
done

echo "Analyse terminée ! Résultats enregistrés dans '$output_dir'."
