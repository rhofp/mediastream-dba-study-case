--@Author:              Rodrigo Francisco Pablo 
--@Fecha de creacion:   14/02/2021
--@Descripcion:         Eliminacion y creacion de usuarios

whenever sqlerror exit rollback
set serveroutput on

connect sys/system3 as sysdba

declare
v_count number(1,0);
begin
  select count(*) into v_count
  from dba_users
  where lower(username) ='admin_usuario';
  if v_count > 0 then
    execute immediate 'drop user admin_usuario cascade';
  else
    dbms_output.put_line('El usuario admin_usuario no existe');
  end if;

  select count(*) into v_count
  from dba_users
  where lower(username) ='admin_multimedia';
  if v_count > 0 then
    execute immediate 'drop user admin_multimedia cascade';
  else
    dbms_output.put_line('El usuario admin_multimedia no existe');
  end if;
end;
/

Prompt Creando al usuario admin_usuario
create user admin_usuario identified by admin_usuario quota unlimited on users
quota unlimited on indexes_tbs 
quota unlimited on contenido_blob_tbs
;

Prompt Creando al usuario admin_multimedia
create user admin_multimedia identified by admin_multimedia 
quota unlimited on multimedia_tbs 
quota unlimited on indexes_tbs
quota unlimited on contenido_blob_tbs
;

Prompt Otorgando privilegios basicos para admin_usuario
grant create session, create table, create sequence, create procedure 
to admin_usuario;

Prompt Otorgando privilegios basicos para admin_multimedia
grant create session, create table, create sequence, create procedure 
to admin_multimedia;

whenever sqlerror continue
