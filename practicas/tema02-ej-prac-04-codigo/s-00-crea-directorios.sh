#!/bin/bash
# @Autor: Francisco Pablo Rodrigo
# @Fecha creacion: 25/10/2010
# @Descripcion: Creacion de directorios 

mkdir -p /unam-bda/ejercicios-practicos/t0204
# Alternativa para solo cambiar una carpeta de dueno
# chgrp oinstall /unam-bda/ejercicios-practicos/t0204
# En este caso nos piden cambiar de grupo y dueno por ello usamos chown
chown rodrigo:oinstall /unam-bda/ejercicios-practicos/t0204
chmod 774 -R /unam-bda/ejercicios-practicos/t0204
