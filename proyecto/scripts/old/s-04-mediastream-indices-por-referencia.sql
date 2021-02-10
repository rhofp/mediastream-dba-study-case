-- @Autor:            Francisco Pablo Rodrigo
-- @Fecha creacion:   04/02/2021
-- @Descripcion:      Creacion de indices de referencia en el tablespace
--                    indexes_tbs

-- Indices para AUTOR_MULTIMEDIA
create index autor_multimedia_autor_id_fk on autor_multimedia(autor_id)
tablespace indexes_tbs;
create index autor_multimedia_multimedia_id_fk 
on autor_multimedia(multimedia)
tablespace indexes_tbs;

-- Indices para CARGO_TARJETA
create index cargo_tarjeta_tarjeta_id_fk on cargo_tarjeta(tarjeta_id)
tablespace indexes_tbs;

-- Indices para COMENTARIO
create index comentario_multimedia_id_fk on comentario(multimedia_id)
tablespace indexes_tbs;
create index comentario_usuario_id_fk on comentario(usuario_id)
tablespace indexes_tbs;
create index comentario_usuario_respuesta_id_fk 
on comentario(usuario_respuesta_id)
tablespace indexes_tbs;

-- Indices para DISPOSITIVO_USUARIO
create index dispositivo_usuario_usuario_id_fk 
on dispositivo_usuario(usuario_id)
tablespace indexes_tbs;

-- Indices para HISTORICO_PLAN_SUSCRIPTOR
create index hist_plan_suscriptor_plan_suscriptor_id_fk
on historico_plan_suscriptor(plan_suscriptor_id)
tablespace indexes_tbs;

-- Indices para PLAYLIST_CONTENIDO
create index playlist_contenido_multimedia_id_fk 
on playlist_contenido(multimedia_id)
tablespace indexes_tbs;

-- Indices para PLAYLIST_CONTENIDO
create index playlist_contenido_multimedia_id_fk 
on playlist_contenido(multimedia_id)
tablespace indexes_tbs;

-- Indices para PLAYLIST_USUARIO_AUTORIZADO
create index playlist_usu_aut_playlist_id_fk 
on playlist_usario_autorizado(usuario_autorizado_id)
tablespace indexes_tbs;

-- Indices para PLAYLIST
create index playlist_usuario_id_fk on playlist(usuario_id)
tablespace indexes_tbs;

-- Indices para SECCIONES_MULTIMEDIA
create index secciones_multimedia_multimedia_id_fk 
on secciones_multimedia(multimedia_id)
tablespace indexes_tbs;

-- Indices para STREAMING
create index streaming_dispositivo_usuario_id_fk 
on streaming(dispositivo_usuario_id)
tablespace indexes_tbs;

-- Indices para STREAMING
create index streaming_multimedia_id_fk on streaming(multimedia_id)
tablespace indexes_tbs;

-- Indices para STREAMING
create index streaming_usuario_id_fk on streaming(usuario_id)
tablespace indexes_tbs;

-- Indices para TARJETA
create index tarjeta_usuario_id_fk on tarjeta(usuario_id)
tablespace indexes_tbs;

-- Indices para USUARIO_ASOCIADO
create index usuario_asociado_usuario_anexo_id_fk 
on usuario_asociado(usuario_anexo_id)
tablespace indexes_tbs;

-- Indices para USUARIO_ASOCIADO
create index usuario_asociado_usuario_anexo_id_fk 
on usuario_asociado(usuario_anexo_id)
tablespace indexes_tbs;

-- Indices para USUARIO_ASOCIADO
create index usuario_asociado_usuario_id_fk on usuario_asociado(usuario_id)
tablespace indexes_tbs;

-- Indices para USUARIO
create index usuario_plan_suscriptor_id_fk on usuario(plan_suscriptor_id)
tablespace indexes_tbs;
