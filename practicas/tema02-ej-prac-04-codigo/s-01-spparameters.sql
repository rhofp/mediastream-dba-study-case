-- @Autor: Francisco Pablo Rodrigo
-- @Fecha creacion: 27/10/2010
-- @Descripcion: Creacion de tabla con valores de ssparameters
whenever sqlerror exit rollback
set serveroutput on

connect sys/system2 as sysdba

declare
  v_count number;
  v_username varchar2(30) := 'RODRIGO0204';
  v_table_name varchar2(30) := 'T01_SPPARAMETERS';

begin
  select count(*) into v_count
  from all_users
  where username = v_username;

  if v_count = 0 then
    -- Creando usuario
    execute immediate 'create user '
    || v_username
    || ' identified by rodrigo quota unlimited on users';
    -- Otorgando permisos al usuario
    execute immediate 'grant create table, create session, create sequence, 
    create procedure to '|| v_username;
  else 
    dbms_output.put_line('El usuario '||v_username||' ya existe');
  end if;

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
create table rodrigo0204.t01_spparameters
  as (select name,value from v$spparameter where value is not null);

whenever sqlerror continue