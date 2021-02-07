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
fa db
CWoNFeehX7/T69VDBS33csInc9Ywg/ByAJkVfC/UUsE/GAWDrNYrxNzex/ACdXa/obGM4xPj
ys46EJM2Un35EvmlL8YceclG+M1rsNlCvCsak8jWrWZZQPjW7uhAzA59UPBrpi/sd8AULuhO
VI3eA1xg/T2AsEwcOV3Aczt3zZoujJvyjFwYs5al2mwXw/Ghwme7JOwZ/l2xC0vN/L2uxaLE


/
show errors
create or replace procedure spv_check_tables wrapped 
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
106a 526
icGZBtBiTXBJ5S2zmm/Y1hHzR5cwgw3qBUiDfAQZKq7umBpew0RhueBM1WOPnxHIkb01BUhW
nOxvYvTvxvVbCGUSqe3dSPjgx9N0OXZFUA3l5qXuwdrk+Xn4N7EC7RapynK5s11KWbxmSmQL
8RMiGOYEU/8vrC229ZraNcHn0mormal/kgSvj07lVXotzYzrwguKdGbnaBEw+9brJ34WQN0c
mwAgqc9JuEAKuc0ZpZc1EP4lCqQv3Uu1RHsf1iobA2Kqo6S0gUC8wea/RmAZhYh3OTR0yqKE
U0B3RanqEOpfHTubJNLGhb0CL+/zxy+yVWnzyS18SoCfut38QhGPTGttfZvTOUBcR1s573iO
THKwXhVpIvihaUCI3GnAeXnSaOAhDLCgJ5bUlJL9ZqL6CqaPWxCv2/hwq3zBfiLux0CvRmVg
G3bWZsWP4WCIKujE2YVgrSwWP+0AHWDc4H8MR0GwaM9CNsk+sI95n7E5XmC2cFZvE+T1N21T
pbaKYO/nkmqoioGkCBuq6XCBkRuJPks8UH5PYtrYYWyadP7uruYERHg2fMDato7e0bhivRj+
EHS1sxtIv2k/B+mmicyrDG2J6A3aJ4wZkCffpvyFvS5l7PGJ79ytSnhRWYioFqi9ASTs/Zi9
NFE0CrwhM6Ffy48D3MoMenuVhlwIMHmU8EkOX7qcoxN3kYuKjnQMDxvFRzKUFYO681YQpFd5
zdHPXtZ9R2F+DAeg8gp/Sj5eCVT2Qy3/5SezuRqAlEtCV7hx+Yhs2JXm1lQDRlntaMFhAanH
cP0SzVepmPH3tfS80/N3JZxTMp6ivCgdA9ENSv9fcnwh2PyTE6ku0lPqnagBLFdxyEXIDawW
NiwuGDtDw13UOtzJfmS+akQxxWAq5fUo0FSd8mFaetHw2GwjLpG7ttvIPf6dQ0B0U7ArWrQu
n2jqFrYefMF1wWdIU735h2EY17DOj3VV04eN1RWV3lphH0HKVt+iCC1+E2MRQbZjLV9U0hYF
93Zuf3uoQkqXx0p7c/0BD0THbu96waA6SNjIJ/XkMPCOVAmy9PG1heNcUoff+iDgy0oLe69x
dWxTOxNEWFFjrdYuFC5Xbg7aUnteNsiwFm6RfzV44RoyDq/Vlr9x+UnWxLAkPUOk6C6RIwNB
NEPExYnUEjduY+awe07ZynKcBKto1YOBW/+DE9vCSnrsohKWdKT4VfyXUC3qv0Dy3EJSWhw/
sAORHuE1CfDQ4V1zamQwn4SBlceID8oQViXHWgP2pjArMiGdv1Nne6UCYDtv9RKwlvnh0E+h
sw==

/
show errors
Prompt Realizando limpieza..
exec spv_clean('&&p_nombre'||'0403');
Prompt invocando script s-01-redo-log-buffer.sql
start s-01-redo-log-buffer.sql
connect sys/&&p_sys_password as sysdba
Prompt invocando script s-02-shared-pool.sql
start s-02-shared-pool.sql
connect sys/&&p_sys_password as sysdba
Prompt invocando script s-03-pga-stats.sql
start s-03-pga-stats.sql
connect sys/&&p_sys_password as sysdba
Prompt invocando script s-04-pga-process.sql
start s-04-pga-process.sql
set serveroutput on
set linesize window
exec spv_print_header
host sha256sum &&p_script_validador
exec spv_check_tables('&&p_nombre'||'0403');
exec spv_print_ok('Validación concluida');
exit