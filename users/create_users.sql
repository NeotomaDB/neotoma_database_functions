-- This role is for high level administration of the database.
CREATE ROLE "admin" WITH 
	NOSUPERUSER
	CREATEDB
	CREATEROLE
	INHERIT
	NOLOGIN
	NOREPLICATION
	NOBYPASSRLS
	CONNECTION LIMIT -1;

-- This is administrator level management of the database, including managing data issues.
CREATE ROLE "neotomaAdmin" WITH 
	NOSUPERUSER
	CREATEDB
	CREATEROLE
	INHERIT
	LOGIN
	NOREPLICATION
	NOBYPASSRLS
	CONNECTION LIMIT -1
	VALID UNTIL '+292278994-08-16T15:00';

CREATE ROLE cleanbackup IN ROLE "neotomaAdmin";
ALTER ROLE cleanbackup WITH
    LOGIN
    PASSWORD 'testlogin';

-- This role is to support use through AWS's RDS services.
GRANT rds_superuser TO "neotomaAdmin";

-- This role (not user) is intended for all read-oriented users. This may also include
-- direct end-user connections at come point.
-- This role has no login permissions, it is only to provide the necessary rules for
-- read only users.
CREATE ROLE readonlyinternal WITH 
	NOSUPERUSER
	NOCREATEDB
	NOCREATEROLE
	INHERIT
	NOLOGIN
	NOREPLICATION
	NOBYPASSRLS
	CONNECTION LIMIT -1;

GRANT USAGE ON SCHEMA ndb TO readonlyinternal;
GRANT SELECT ON ALL TABLES IN SCHEMA ndb TO readonlyinternal;

GRANT USAGE ON SCHEMA ap TO readonlyinternal;
GRANT SELECT ON ALL TABLES IN SCHEMA ap TO readonlyinternal;

GRANT USAGE ON SCHEMA doi TO readonlyinternal;
GRANT SELECT ON ALL TABLES IN SCHEMA doi TO readonlyinternal;

GRANT USAGE ON SCHEMA da TO readonlyinternal;
GRANT SELECT ON ALL TABLES IN SCHEMA da TO readonlyinternal;

GRANT USAGE ON SCHEMA ndb TO readonlyinternal;
GRANT SELECT ON ALL TABLES IN SCHEMA ndb TO readonlyinternal;

GRANT USAGE ON SCHEMA ti TO readonlyinternal;
GRANT SELECT ON ALL TABLES IN SCHEMA da TO readonlyinternal;

GRANT USAGE ON SCHEMA ts TO readonlyinternal;
GRANT SELECT ON ALL TABLES IN SCHEMA da TO readonlyinternal;

CREATE ROLE neotomaapidev IN ROLE readonlyinternal;
ALTER ROLE neotomaapidev WITH
    LOGIN
    PASSWORD 'testlogin';

CREATE ROLE neotomaapi IN ROLE readonlyinternal;
ALTER ROLE neotomaapi WITH
    LOGIN
    PASSWORD 'testlogin';

-- Read/Write Service Role:

CREATE ROLE readwriteinternal WITH 
	NOSUPERUSER
	NOCREATEDB
	NOCREATEROLE
	INHERIT
	NOLOGIN
	NOREPLICATION
	NOBYPASSRLS
	CONNECTION LIMIT -1;

GRANT USAGE ON SCHEMA ndb TO readwriteinternal;
GRANT ALL ON ALL TABLES IN SCHEMA ndb TO readwriteinternal;

GRANT USAGE ON SCHEMA ap TO readwriteinternal;
GRANT  ALL ON ALL TABLES IN SCHEMA ap TO readwriteinternal;

GRANT USAGE ON SCHEMA doi TO readwriteinternal;
GRANT  ALL ON ALL TABLES IN SCHEMA doi TO readwriteinternal;

GRANT USAGE ON SCHEMA da TO readwriteinternal;
GRANT  ALL ON ALL TABLES IN SCHEMA da TO readwriteinternal;

GRANT USAGE ON SCHEMA ndb TO readwriteinternal;
GRANT  ALL ON ALL TABLES IN SCHEMA ndb TO readwriteinternal;

GRANT USAGE ON SCHEMA ti TO readwriteinternal;
GRANT  ALL ON ALL TABLES IN SCHEMA ndb TO readwriteinternal;

GRANT USAGE ON SCHEMA ts TO readwriteinternal;
GRANT  ALL ON ALL TABLES IN SCHEMA ndb TO readwriteinternal;

CREATE ROLE tiliaapi IN ROLE readwriteinternal;
ALTER ROLE tiliaapi WITH
    LOGIN
    PASSWORD 'testlogin';

CREATE ROLE tiliadevapi IN ROLE readwriteinternal;
ALTER ROLE tiliadevapi WITH
    LOGIN
    PASSWORD 'testlogin';

CREATE ROLE jkn128;
CREATE ROLE nhoffman;
CREATE ROLE ondrej;
CREATE ROLE sedv8808;
CREATE ROLE sug335;

