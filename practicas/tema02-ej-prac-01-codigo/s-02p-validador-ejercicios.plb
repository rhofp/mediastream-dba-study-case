create or replace procedure  spv_valida_db_info wrapped 
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
109e 662
qeFT8DbPoziWQBqcflAvNg/p7WEwg5BUTCAF345Vxz9ED56tAm+0oV50+nFnYXXcbWxCknzs
vOdfRxThkbONXW+kmxcztkC8zT2qfpyJkRCzLV7KZxQIGdnHy5YoWEekEhgymq8WuqqyvPFX
o/FwQiyi+h39Rx0QBpi0NZnXWPlrrcGwhbizveZemr3oYUOSgq6Ehe3HHVua3YCxn+I4MPPk
QwvBSJzfMHh2y65t9ybNuhzCz8esqCvPZVax69g+y1bX2zIlfRBYUa7hVd8qauXG/weBBLUG
4GT3MJPLwHBBOOAWIP8TEZdSIjMx31Jwmmig1SGXrskz0t+48HJXdWhCtGItKNE9xYWf0OfA
S0gs84sxQd8d90e+eTjZ2mZmfElcUBFNQZzM6DMmSinnEn+JOSm0kDw1u5qh1qO3CHtJtuSz
S9yrCj8qYPJgC6uLFpETFCw0AOnM8YL1DT+raweJOy/0hspJ/n/XUMRJ7AkUh6xG2BarTlPH
TQdawqKKuubrBgUCFfuvKPlGsLwH9zjsVHghMOXo31ZyGYF1u6s8gBp97LAuIR+EE1W0GPxy
waa8/H6vs5CW4dcCeCB8q5wx/Fo7QY5ta19m7EZW+uvNKI62N5wObDeaFIzgxGemW/ARXxEz
AYTqNj5ycu30i8updIoFNwah9uOhhfEWsLFkjpTJhD31cnKXkwrCULlX7ts0Li5n+bzFrPau
q8pPJcYW2V7/Yyvla6Is7KL9ISc8PirzbChc8SXYGhKYXieqsjXYd4xDWSdq9HfoTk2ksMwS
/wlNDcZpwybWTRJWjNE9KuFc/LLlR5nDMRlk1b/Ez767qwCzKs1YUpnFnb4P8bP96Vw/0PEW
X+eKuyjkt1GfY6Jc+Ni5OP6WPtLAp7c2wI+hbuYlYciVH7Pqz8zaA26f2pNC4//fcGWXU76J
mGQ7RCv1YeFvX4Yx+QMoaZSOwiECOYZ8L8YtCuvGDtfR/xC7i3gBaHu8dyMOVXECCapIfe+G
24Tx8Xxbckemkyo7dOxWjPsDopP/JdYxAHruaMR+P0hyyeXh8QOObHRsE3U+7TOAwCAWwjyp
OQGaA8rQK448uA2nNyBEiRG6t9IyczIwQip2m2PNSLwnWsKWlPjuqIw62W1x1KmJj5GqA0YO
SafxjiNkjBewRaLDMRAGHatR8l4w0ZwPvLuNAucK6rxQtn4fRmYFqpWsmsZ0/yxIpxFR1SW3
sP3V5VnS36i+TKFU+tFn0ytlnPiIKzGI2hJEYhwZ7xuvZqgbnaChTe1wPWSoSWB2nklMRxwD
6riOrYKFKfONZrdpzUx6bFYSSf/7rPoznZQumbbgCioMEfGZmqx5pGpC0QERpPLldTKzdjUY
Dw/Qj5XQ1x13EWEbqASq/6aUIPJNRxXX7JoJPMjTA9i9D2COnGwYkbyJUWcl11XGH2nyFgzR
+bK7YNNOp3Eo7F1CVO1RPft2eC8VCxVb6l3a25yXhQSuD9wm4zP7pF0++Z9ClHKS1OuG+iBD
IZnrEaRgBSz6csI9/rHIgkPIy2WNv7h4i7QzYiNkDT2e4Af9YYwYhfFO0xBFmDU8gW8GnbIC
IsonBCCPDfUztn4psZ3kKLSumWw=

/
show errors
create or replace procedure spv_elimina_usuario wrapped 
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
174 175
8lGcpv+9ekyobEcbdK48VOMsW5Iwg1zIfyDWfC8C2k7VGTkpabNK6aJluD6n4ITwkGG3AuEd
CatmL5DOCDIRogWvmyncuxK74sPp8ljMRgibAQVe/jGQ9trwXgD1EGmjXojoMDcdXt7/d+s5
NJup1hAqGiI8n6UEQBMRiBoC96sl40bDXWzSFUMsr8d0nYiSmegtpI9yTid/ciJKgTDYEzyd
8cWDXuUtj6wSwdUyLQYtXgJnp3ywG1zuYknEFQ2nWS/gdcIUgROq+tS/Cj9tL3uw9mVXX01+
OPXe0tYSn3JsRCIGVxmsP9HASCN3SWi5m5b+rDl9kAmMvXHnl1fHPXlD50jcZccz98H5fbn9
uOoXiQ==

/
show errors
Prompt realizando limpieza
exec spv_elimina_usuario('&&p_nombre'||'0201');
Prompt Invocando scripts del ejercicio
@s-01-database-info.sql
pause Script invocado. Presionar ENTER para comenzar la validación o Ctrl +C para cancelar.
set serveroutput on
whenever sqlerror exit rollback
exec spv_print_header
host sha256sum &&p_script_validador
exec spv_valida_db_info('&&p_nombre'||'0201');
exec spv_remove_procedures
whenever sqlerror continue none
exit