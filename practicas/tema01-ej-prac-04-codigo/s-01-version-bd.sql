-- @Autor: Rodrigo Francisco Pablo
-- @Fecha creacion: 05 de octubre de 2020
-- @Descripcion: Script para obtener version de la BD

declare
  v_count number;
  v_username varchar2(30) := 'RODRIGO0104';
begin
  select count(*) into v_count 
  from all_users
  where username = v_username;
  if v_count = 0 then
    -- Creando usuario
    execute immediate 'create user ' 
      || v_username 
      || ' identified by rodrigo quota unlimited on users';
    execute immediate 'grant create table, create session to ' || v_username;
  else
    dbms_output.put_line('El usuario '|| v_username||' ya existe');
  end if;

  -- Crear la tabla t01_db_version
  select count(*) into v_count
  from all_tables
  where table_name='T01_DB_VERSION'
  and owner = v_username;

  -- Eliminar la tabla en caso de existir
  if v_count > 0 then
    execute immediate 'drop table ' || v_username || '.T01_DB_VERSION';
  end if;

  -- Creando tabla
  execute immediate 'create table ' || v_username || '.t01_db_version (
    product varchar2(100),
    version varchar(50),
    version_full varchar2(50)
  )';

  -- Insertanto datos
  execute immediate 'insert into '|| v_username || '.t01_db_version(
    product, version, version_full
  ) select product, version, version_full from product_component_version';
  commit;

end;
/
