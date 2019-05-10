#!/usr/local/bin/bash

: '
Dependencias: sed - bash 4.0+
Rehaciendo los nombres de las CCAA, TOC.
'


ccaa=('"Balears, Illes"' '"Rioja, La"' '"Madrid, Comunidad de"' '"Murcia, Región de"' '"Navarra, Comunidad Foral de"' '"Asturias, Principado de"' 'Teruet' '" A Coruña"' '"Palmas, Las"')

autonomia=('Illes Balears' ' La Rioja' 'Comunidad de Madrid' 'Región de Murcia' 'Comunidad Foral de Navarra' 'Principado de Asturias' ' Teruel' 'A Coruña' 'Las Palmas')

# Recorremos el array de ccaa
for (( i=0; i<${#ccaa[@]}; ++i )); do

    sed -i "s/${ccaa[i]}/${autonomia[i]}/g" elecciones-generales-2019.csv

    echo "${ccaa[$i]} terminada!"
done
