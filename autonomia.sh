#!/usr/local/bin/bash

: '
Dependencias: csvkit - bash 4.0+
A partir del CSV con todos los resultados por municipio
generamos un CSV para cada una de las provincias
'

# Generamos el array cargando la lista de provincias
readarray -t autonomia < autonomia.csv

folder=~/github/dataset-elecciones-28a/csv/autonomias/


# Recorremos el array de autonomias
for (( i=0; i<${#autonomia[@]}; ++i )); do

    # Buscamos en la columna autonomia y generamos un CSV por cada una de las autonomias
    csvgrep -c ccaa -r "${autonomia[$i]}" elecciones-generales-2019.csv > "$folder""${autonomia[$i]}".csv

    echo "${autonomia[$i]} terminada!"
done
