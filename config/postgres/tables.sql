


/*
mx_users : table of user 
 */

DROP TABLE IF EXISTS mx_users ;

create table mx_users (
  pid serial PRIMARY KEY,
  id serial unique,
  username citext unique,
  email citext unique,
  key text,
  validated boolean,
  hidden boolean,
  date_validated timestamp,
  date_hidden timestamp,
  date_last_visit timestamp,
  data jsonb
);

ALTER TABLE mx_users OWNER TO mapxw;

create table if not exists mx_views (
  pid serial PRIMARY KEY,
  id character varying(20) not null,
  country character varying(3),
  editor integer,
  target jsonb,
  date_modified timestamp with time zone,
  data jsonb,
  type character varying(10)
);


ALTER TABLE mx_views OWNER TO mapxw;

create table if not exists mx_sources (
  pid serial PRIMARY KEY,
  id character varying(31) unique not null,
  country character varying(3),
  editor integer,
  target jsonb,
  date_modified timestamp with time zone,
  data jsonb,
  type character varying(10)
);

ALTER TABLE mx_sources OWNER TO mapxw;

