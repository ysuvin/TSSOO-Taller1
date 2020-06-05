#!/bin/bash

if [ $# != 1 ]; then
	echo "Uso: $0 -d <directorio de busqueda> [-h]"
	exit
fi

searchDir=$1

if [ ! -e  $searchDir ]; then
	echo "El directorio $1 no existe"
	exit
fi

#Comprobar si existe el directorio
if [ ! -d $searchDir ]; then
	echo "$1 No un Directorio"
	exit
fi

printf "Directorio busqueda: %s\n" $1
