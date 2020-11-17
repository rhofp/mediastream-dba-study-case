# !/bin/bash
# @Autor Rodrigo Francisco Pablo
# @Fecha 05/10/2020
# @Descripcion Backups de archivo passwords

oracleSID=orapwrfpbda1

orapwdFILE=${ORACLE_HOME}/dbs/${oracleSID}

# directorio backup del archivo de passwords
mkdir -p /home/${USER}/backups

echo "Buscando ${orapwdFILE}"

# Si $oracleSID existe lo respaldamos y luego lo eliminamos
if [ -f ${orapwdFILE} ]; then
  cp ${orapwdFILE} /home/${USER}/backups/

  # Simulando perdida de archivo de passwords
  rm ${orapwdFILE} 
else
  echo "No existe archivo ${oracleSID}"
fi

orapwd FILE=${orapwdFILE} force=y sys=password sysbackup=password