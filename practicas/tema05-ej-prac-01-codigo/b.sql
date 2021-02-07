set line 200
set heading off
col network format a30
col service format a20

connect sys/system2 as sysdba
select s.sid as session_id,
  s.paddr as process_address,
  s.username bd_username,
  s.status as session_status,
  s.port as client_port,
  s.process as os_client_process_id, --
  s.program as client_program
  from gv$session s
  join v$process p
  on s.paddr = p.addr
  join (
    select 
    sys_context('USERENV','SID') as session_id
    from dual
  ) q
  on s.sid = q.session_id   
  where s.username = 'SYS'
;
select p.sosid, --
 p.pname, p.background, p.tracefile
 from v$process p
 join gv$session s
 on s.paddr = p.addr
 join ( 
   select
   sys_context('USERENV','SID') as session_id
   from dual                            
 ) q
 on s.sid = q.session_id ;
