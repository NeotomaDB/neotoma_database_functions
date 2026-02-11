-- ndb definition

-- Drop table

-- DROP TABLE IF EXISTS ndb.leadmodelbasis

CREATE TABLE IF NOT EXISTS ndb.leadmodelbasis (

    pbbasisid integer DEFAULT nextval('ndb.leadmodelbasis_pbbasisid_seq'::regclass) NOT NULL,
    pbbasis text NULL

);


-- adempiere.wmv_ghgaudit constraints

--- Table comments
COMMENT ON TABLE ndb.leadmodelbasis IS "";

--- Table indices
CREATE UNIQUE INDEX leadmodelbasis_pkey ON ndb.leadmodelbasis USING btree (pbbasisid)

--- Remove existing constraints if needed
ALTER TABLE ndb.leadmodelbasis DROP CONSTRAINT IF EXISTS leadmodelbasis_pkey;

--- Non-foreign key constraints
ALTER TABLE ndb.leadmodelbasis ADD CONSTRAINT leadmodelbasis_pkey PRIMARY KEY (pbbasisid);

--- Foreign Key Restraints