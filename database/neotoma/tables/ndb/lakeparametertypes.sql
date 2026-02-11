-- ndb definition

-- Drop table

-- DROP TABLE IF EXISTS ndb.lakeparametertypes

CREATE TABLE IF NOT EXISTS ndb.lakeparametertypes (

    lakeparameterid integer DEFAULT nextval('ndb.seq_lakeparametertypes_lakeparameterid'::regclass) NOT NULL,
    lakeparametercode character varying(20) NOT NULL,
    lakeparametershortname character varying(40) NOT NULL,
    lakeparameter character varying(80) NOT NULL,
    recdatecreated timestamp(0) without time zone DEFAULT timezone('UTC'::text, now()) NOT NULL,
    recdatemodified timestamp(0) without time zone NOT NULL

);


-- adempiere.wmv_ghgaudit constraints

--- Table comments
COMMENT ON TABLE ndb.lakeparametertypes IS "A set of variables associated with lakes, including area, depth and volume.";

--- Table indices
CREATE UNIQUE INDEX lakeparametertypes_pkey ON ndb.lakeparametertypes USING btree (lakeparameterid)

--- Remove existing constraints if needed
ALTER TABLE ndb.lakeparametertypes DROP CONSTRAINT IF EXISTS lakeparametertypes_pkey;

--- Non-foreign key constraints
ALTER TABLE ndb.lakeparametertypes ADD CONSTRAINT lakeparametertypes_pkey PRIMARY KEY (lakeparameterid);

--- Foreign Key Restraints