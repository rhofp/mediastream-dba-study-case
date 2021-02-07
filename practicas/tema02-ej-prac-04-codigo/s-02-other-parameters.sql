-- @Autor: Francisco Pablo Rodrigo
-- @Fecha creacion: 27/10/2010
-- @Descripcion: Manipulacion de los parametros de la BD
whenever sqlerror exit rollback
set serveroutput on

connect sys/system2 as sysdba

declare
  v_count number;
  v_username varchar2(30) := 'RODRIGO0204';
  v_table_name varchar2(30) := 'T02_OTHER_PARAMETERS';

begin
  -- Comprobando la existencia de la tabla
  select count(*) into v_count
  from all_tables
  where table_name = v_table_name;

  -- Eliminando tabla en caso de existir
  if v_count > 0 then
    execute immediate 'drop table '|| v_username ||'.'||v_table_name;
  end if;

end;
/

-- Creando tabla con a partir de una consulta
create table rodrigo0204.t02_other_parameters
  as (
  select num,name,value,default_value,
  isses_modifiable is_session_modifiable,
  issys_modifiable is_system_modifiable
  from v$parameter
);

whenever sqlerror continue
