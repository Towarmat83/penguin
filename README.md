## Prérequis

Assurez-vous d'avoir les outils suivants installés sur votre système :
- `file`
- `strings`
- `ent`

## Utilisation

1. Clonez ce dépôt sur votre machine locale :
    ```sh
    git clone <URL_DU_DEPOT>
    cd <NOM_DU_DEPOT>
    ```

2. Placez votre fichier à partir duquel extraire les segments dans le répertoire racine du projet (par défaut [penguin.png](http://_vscodecontentref_/0)).

3. Exécutez le script [`extract_segments.sh`](extract_segments.sh ) pour extraire les segments :
    ```sh
    ./extract_segments.sh
    ```

4. Les segments extraits seront placés dans le répertoire [`extracted_segments`](extracted_segments ).

5. Exécutez le script [`analysis_segments.sh`](analysis_segments.sh ) pour analyser les segments :
    ```sh
    ./analysis_segments.sh
    ```

6. Les résultats de l'analyse seront générés dans le répertoire [`analysis_results`](analysis_results ) :
    - `all_segments_analysis.txt` : Rapport global contenant les analyses de tous les segments.
    - `individual_reports/` : Dossier contenant les rapports individuels pour chaque segment.

## Licence

Ce projet est sous licence MIT. Voir le fichier LICENSE pour plus de détails.