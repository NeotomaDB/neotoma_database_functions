-- neostats definition

-- Drop table

-- DROP TABLE IF EXISTS neostats.neostats

CREATE TABLE neostats.neostats (
    userid oid NULL,
    dbid oid NULL,
    queryid bigint NULL,
    query text NULL,
    calls bigint NULL,
    total_time double precision NULL,
    min_time double precision NULL,
    max_time double precision NULL,
    mean_time double precision NULL,
    stddev_time double precision NULL,
    rows bigint NULL,
    shared_blks_hit bigint NULL,
    shared_blks_read bigint NULL,
    shared_blks_dirtied bigint NULL,
    shared_blks_written bigint NULL,
    local_blks_hit bigint NULL,
    local_blks_read bigint NULL,
    local_blks_dirtied bigint NULL,
    local_blks_written bigint NULL,
    temp_blks_read bigint NULL,
    temp_blks_written bigint NULL,
    blk_read_time double precision NULL,
    blk_write_time double precision NULL,
    datname name NULL,
    datdba oid NULL,
    encoding integer NULL,
    datcollate name NULL,
    datctype name NULL,
    datistemplate boolean NULL,
    datallowconn boolean NULL,
    datconnlimit integer NULL,
    datlastsysoid oid NULL,
    datfrozenxid xid NULL,
    datminmxid xid NULL,
    dattablespace oid NULL,
    datacl aclitem[] NULL,

);


-- adempiere.wmv_ghgaudit foreign keys

;