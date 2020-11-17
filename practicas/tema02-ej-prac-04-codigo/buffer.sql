select num,name,value,default_value,
  isses_modifiable is_session_modifiable,
  issys_modifiable is_system_modifiable
  from v$parameter
  where name='optimizer_mode';