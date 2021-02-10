-- @Autor:            Francisco Pablo Rodrigo
-- @Fecha creacion:   04/02/2021
-- @Descripcion: Creacion de indices en el tablespace indexes_tbs

connect admin_usuario/admin_usuario

-- Indices para AUTOR
create unique index autor_email_uk on autor(email)
tablespace indexes_tbs;

-- Indices para CARGO_TARJETA
create unique index cargo_tarjeta_folio_uk on cargo_tarjeta(folio)
tablespace indexes_tbs;

-- Indices para PLAN_SUSCRIPCION
create unique index plan_suscripcion_clave_uk on plan_suscripcion(clave)
tablespace indexes_tbs;

-- Indices para PLAYLIST_CONTENIDO
create index playlist_contenido_playlist_id_multimedia_id_ix 
on playlist_contenido(playlist_id,multimedia_id)
tablespace indexes_tbs;

-- Indices para STREAMING
create index streaming_usuario_id_multimedia_id_ix 
on streaming(usuario_id,multimedia_id)
tablespace indexes_tbs;

-- Indices para TARJETA
create unique index tarjeta_num_tarjeta_uk on tarjeta(num_tarjeta)
tablespace indexes_tbs;

-- Indices para USUARIO
create unique index usuario_username_uk on usuario(username)
tablespace indexes_tbs;
create unique index usuario_email_uk on usuario(email)
tablespace indexes_tbs;
create unique index usuario_rfc_uk on usuario(rfc)
tablespace indexes_tbs;
