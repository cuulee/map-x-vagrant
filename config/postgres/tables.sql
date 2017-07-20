


/*
mx_users : table of user 
 */

DROP TABLE IF EXISTS mx_users ;

create table mx_users (
  id serial,
  username citext unique,
  email citext unique,
  key text,
  validated boolean,
  hidden boolean,
  date_validated timestamp,
  date_hidden timestamp,
  date_last_visit timestamp,
  data jsonb,
  CONSTRAINT mx_users_pkey PRIMARY KEY (id)
);

ALTER TABLE mx_users OWNER TO mapxw;

create table if not exists mx_views (
  id character varying(20),
  country character varying(3),
  editor integer,
  target jsonb,
  date_modified timestamp with time zone,
  data jsonb,
  type character varying(10),
  CONSTRAINT mx_views_pkey PRIMARY KEY (id,date_modified)
);

ALTER TABLE mx_views OWNER TO mapxw;

create table if not exists mx_sources (
  id character varying(31),
  country character varying(3),
  editor integer,
  target jsonb,
  date_modified timestamp with time zone,
  data jsonb,
  type character varying(10),
  CONSTRAINT mx_sources_pkey PRIMARY KEY (id)
);

ALTER TABLE mx_sources OWNER TO mapxw;


