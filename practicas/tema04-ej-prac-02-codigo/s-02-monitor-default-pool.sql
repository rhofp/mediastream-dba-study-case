-- @Autor: Francisco Pablo Rodrigo
-- @Fecha creacion: 15/12/2020
-- @Descripcion: Creacion de tabla que tendrá contenido random
whenever sqlerror exit rollback
set serveroutput on

-- connect sys/system2 as sysdba
connect rodrigo0402/rodrigo 

prompt Creando tabla random

create table t01_random_data(
  id number(18,0),
  r_varchar varchar2(1024),
  r_char char(18),
  r_integer number(10,0),
  r_double number(20,10),
  r_date date,
  r_timestamp timestamp
);

create sequence seq_t01_random_data;

create table t02_db_cache_stats(
  sample_date date,
  db_blocks_gets_from_cache number,
  consistent_gets_from_cache number,
  physical_reads_cache number,
  cache_hit_radio number
);

prompt Listo !
whenever sqlerror continue
