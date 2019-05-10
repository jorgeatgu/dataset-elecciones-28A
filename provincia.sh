#!/usr/local/bin/bash

: '
Dependencias: csvkit - bash 4.0+
A partir del CSV con todos los resultados por municipio
generamos un CSV para cada una de las provincias
'

# Generamos el array cargando la lista de provincias
readarray -t provincia < provincia.csv

folder=~/github/dataset-elecciones-28a/csv/provincias/


# Recorremos el array de provincias
for (( i=0; i<${#provincia[@]}; ++i )); do

    # Buscamos en la columna provincia y generamos un CSV por cada una de las provincias
    csvgrep -c prov -r "${provincia[$i]}" elecciones-generales-2019.csv > "$folder""${provincia[$i]}".csv

    echo "${provincia[$i]} terminada!"
done
