-- ndb definition

-- Drop table

-- DROP TABLE IF EXISTS ndb.elementdatasettaxagroups

CREATE TABLE IF NOT EXISTS ndb.elementdatasettaxagroups (

    datasettypeid integer NOT NULL,
    taxagroupid character varying(3) NOT NULL,
    elementtypeid integer NOT NULL,
    recdatecreated timestamp(0) without time zone DEFAULT timezone('UTC'::text, now()) NOT NULL,
    recdatemodified timestamp(0) without time zone NOT NULL

);


-- adempiere.wmv_ghgaudit constraints

--- Table comments
COMMENT ON TABLE ndb.elementdatasettaxagroups IS "";

--- Table indices
CREATE UNIQUE INDEX elementdatasettaxagroups_pkey ON ndb.elementdatasettaxagroups USING btree (datasettypeid, taxagroupid, elementtypeid)

--- Remove existing constraints if needed
ALTER TABLE ndb.elementdatasettaxagroups DROP CONSTRAINT IF EXISTS elementdatasettaxagroups_pkey;

--- Non-foreign key constraints
ALTER TABLE ndb.elementdatasettaxagroups ADD CONSTRAINT elementdatasettaxagroups_pkey PRIMARY KEY (datasettypeid, taxagroupid, elementtypeid);

--- Foreign Key Restraints
ALTER TABLE ndb.elementdatasettaxagroups ADD CONSTRAINT fk_datasettypeid FOREIGN KEY (datasettypeid) REFERENCES ndb.datasettypes(datasettypeid);
ALTER TABLE ndb.elementdatasettaxagroups ADD CONSTRAINT edt_group FOREIGN KEY (taxagroupid) REFERENCES ndb.taxagrouptypes(taxagroupid);