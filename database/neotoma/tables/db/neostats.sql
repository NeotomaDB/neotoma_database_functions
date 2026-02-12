-- db.neostats Table definition

-- Drop table

-- DROP TABLE IF EXISTS db.neostats

CREATE TABLE IF NOT EXISTS db.neostats (

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
    datacl aclitem[] NULL

);


-- Table Constraints, Comments and Triggers

--- Table comments
COMMENT ON TABLE db.neostats IS '';
COMMENT ON COLUMN db.neostats.userid IS '';
COMMENT ON COLUMN db.neostats.dbid IS '';
COMMENT ON COLUMN db.neostats.queryid IS '';
COMMENT ON COLUMN db.neostats.query IS '';
COMMENT ON COLUMN db.neostats.calls IS '';
COMMENT ON COLUMN db.neostats.total_time IS '';
COMMENT ON COLUMN db.neostats.min_time IS '';
COMMENT ON COLUMN db.neostats.max_time IS '';
COMMENT ON COLUMN db.neostats.mean_time IS '';
COMMENT ON COLUMN db.neostats.stddev_time IS '';
COMMENT ON COLUMN db.neostats.rows IS '';
COMMENT ON COLUMN db.neostats.shared_blks_hit IS '';
COMMENT ON COLUMN db.neostats.shared_blks_read IS '';
COMMENT ON COLUMN db.neostats.shared_blks_dirtied IS '';
COMMENT ON COLUMN db.neostats.shared_blks_written IS '';
COMMENT ON COLUMN db.neostats.local_blks_hit IS '';
COMMENT ON COLUMN db.neostats.local_blks_read IS '';
COMMENT ON COLUMN db.neostats.local_blks_dirtied IS '';
COMMENT ON COLUMN db.neostats.local_blks_written IS '';
COMMENT ON COLUMN db.neostats.temp_blks_read IS '';
COMMENT ON COLUMN db.neostats.temp_blks_written IS '';
COMMENT ON COLUMN db.neostats.blk_read_time IS '';
COMMENT ON COLUMN db.neostats.blk_write_time IS '';
COMMENT ON COLUMN db.neostats.datname IS '';
COMMENT ON COLUMN db.neostats.datdba IS '';
COMMENT ON COLUMN db.neostats.encoding IS '';
COMMENT ON COLUMN db.neostats.datcollate IS '';
COMMENT ON COLUMN db.neostats.datctype IS '';
COMMENT ON COLUMN db.neostats.datistemplate IS '';
COMMENT ON COLUMN db.neostats.datallowconn IS '';
COMMENT ON COLUMN db.neostats.datconnlimit IS '';
COMMENT ON COLUMN db.neostats.datlastsysoid IS '';
COMMENT ON COLUMN db.neostats.datfrozenxid IS '';
COMMENT ON COLUMN db.neostats.datminmxid IS '';
COMMENT ON COLUMN db.neostats.dattablespace IS '';
COMMENT ON COLUMN db.neostats.datacl IS '';

--- Table indices


--- Remove existing constraints if needed

--- Non-foreign key constraints

--- Foreign Key Restraints

--- Triggers