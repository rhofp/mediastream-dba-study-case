whenever sqlerror exit rollback
create or replace procedure spv_clean wrapped 
a000000
369
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
7
d7 ca
SU+6fofer2vd9xypNInQtrRLjhIwg/BHAJ4VZy85aR5u4EUUcGstWSr6P/zmMwcxiqw9yuBJ
ZudBmvKiLaWmu+m971lvUHMzUOtDzzTfzMesMJ8OFWW5k0WnflEn3f+SGBaVUWDmd1gHvS4A
ZDz8j6x2iURu/EOYEfhPDhI3hRXcma6ItVPXsAM//byONCkfrhMQ2js=

/
show errors
create or replace procedure spv_check_tables_usr_local wrapped 
a000000
369
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
7
1597 739
rHKuSzMGHnDuipGjMh61Lk995Yowg9fqVUgGYI65Kq5/v0AnjggDBZ+3Ofo3NzJteSeEiXlc
8Bt8L6NL93klLEMBM4gjsQU0VNDGC4aqFWDNKxjjEP8ICG672ppYCHdlW5FXxOeb/tD1CN0f
nSWpVSC+rii8gMS5rHkTXnvE9AFNezXE5SowZKNVbyWKYB1rupJqblQs0xJOeZhVRdNKN614
yYV1HnjbGFYzVGNhM+8+BIBvqMNJRb1YJSJM7YxepQq39K1pF5F1COWGLenUcG9/gj2rt4iQ
5aflSTjw/WU8dONgsggXru5//RhYr5sbx1VLXpUAAD4fA5+A0Ublb8x5RAco7+n94Lo9sLbm
B6XmfvdroSCLjPMtoulUhyh3rxLTk36p1nQpdyFJ9zUU7EYKWYidXiA9d3lfL/9rrJlaoinl
qGndluPnDEGj7H+Mi/4uAs43v1Q2W9BrAh5Cz/N8oBe46hZ2HNyzMELwgzhh9943LoJAXcve
OfxxcdJQ2yGwsi1uU/3Ko2gduCKaFQzIncl3muT6UjAtm1ew2rzH7SSlSnPc/nALBUux4bzb
m6FGtCPNCCq0omfdNCooEVO0kHQxVzdt0f4opHQkVaWwH/k097mNwbnIm9KJAVep5oy/XotS
i9mPmhxTxrPJ9OJqXyCN1TgfJF1KdIuCrCFMSYSy3dz8NsPXww+G5njGlYmgZeJ5j747iIYE
KQrnVQtO316j/A/vUHYJ8DijOJqHv4NVeFQtdQOfs64vN4RqcpdS6frljbphMgBnXp9G/TKi
5pNGnqY+nOtF8qfHftgWgBA5Rputlx7y0B0WZF4JVbEPELeOsd4LUwDEoPW2vOUVtvQYbG+w
o8MacT/D9n99DekfjTP6AZ0WXC2l7D+WNQ4bkg1pw66nrsZdNG7IiWeN7n2OeJYFE0UI4298
ULoyZUlcuolfX7i2+PQ0jkyNcNXwzPc6Yh7bSCo0oXkwwSBXQz2g4HoYC+rzConalxUAVzVO
2TxSHxF3snNIetJEbNL3eSh67HOzXSCeSnsWim9TI+vTIotW98/R4I6Ba64F9HKuTUAH0Mlr
8Bos8uHkW7QSp/W7Rbp/qIL/eQQP7vgCAMLYmWy8QwBMfFcVbNFs0voA8n6G4YOJFJixJTeY
V7wJOeIDg9g3S5WLOpZbYkJG3Tmj5C9TmMHQr8mvyIZglovKYkmltPFMyhPvubu+xrlY1kXn
l5qm+OIoca0RmbUQhZju3N0Q0gTy4/icZqHLzxSzZAKdnrXrNneCaQw1YluUFOfMjvUIZYkL
+s/RXOffRcDibzFacPq391Em7NA/3+js9yPy/K0mymNZBN4B9dMB9YdRX1rWqFJ0MLdjWktw
xPW07LsOu4Q9GkS2LlWMJ2fhLRHcJxsuLr2CQ2b6+rBup27b+ZrmJsbaO0/O/aWCFk2/vKzC
Sl6ijYI9ZJRpndxnkxenCvmdGiyPzd1htZAwI/Aj3P9Vj8eA1sXf/FNNOFFuB8cqx56GBkBO
rAvelhLI61/3iCzy8L5KamdW3L8wWmD8z2Vt/yNUA0MAcTHb6EWtd2DsI4K9TDMHoO7k6wEx
UV2vmPWmd/qd8uTt2M54/5d52xW/tMt3uw7oUV26NcxLUV2jZ7TCd9V/457D+jH/cuksEl5o
yexXeb2dPNMKR3UpGhEAuewZLCvVuT7yDCYA37wM23PR88Qa+Dq7pFtzNcakrqomZJa5Dgl3
CReAgJGX9B9mTyS5MHW5wg5WbpxeoHVWdQSUZ9s+MoaKdN3AZkP725O9FRPQTVzyf4//yT58
PjtzzqQ+krYimWS8zltwavRH

/
show errors
Prompt conectando como sys para iniciar Validación
connect sys/&&p_sys_password as sysdba
Prompt Realizando limpieza..
exec spv_clean('&&p_nombre'||'0404');
Prompt invocando script s-01-objetos-iniciales.sql
start s-01-objetos-iniciales.sql
connect sys/&&p_sys_password as sysdba
Prompt invocando script s-02-obten-datos-reinicio.sql
start s-02-obten-datos-reinicio.sql
connect sys/&&p_sys_password as sysdba
Prompt invocando script s-03-carga-maxima.sql
Pause 'La instancia será reiniciada. Presione Enter para continuar, Ctrl c para cancelar.'
start s-03-carga-maxima.sql
connect sys/&&p_sys_password as sysdba
Prompt invocando script s-04-automatic-shared.sql 
start s-04-automatic-shared.sql
connect sys/&&p_sys_password as sysdba
Prompt invocando script s-05-manual-shared.sql 
start s-05-manual-shared.sql
connect sys/&&p_sys_password as sysdba
Prompt invocando script s-06-automatic-memory.sql 
start s-06-automatic-memory.sql 
set serveroutput on
set linesize window
exec spv_print_header
host sha256sum &&p_script_validador
exec spv_check_tables_usr_local('&&p_username')
exec spv_print_ok('Validación concluida');
exit