-- ndb definition

-- Drop table

-- DROP TABLE IF EXISTS ndb.elementtaxagroups

CREATE TABLE IF NOT EXISTS ndb.elementtaxagroups (

    elementtaxagroupid integer DEFAULT nextval('ndb.seq_elementtaxagroups_elementtaxagroupid'::regclass) NOT NULL,
    taxagroupid character varying(3) NOT NULL,
    elementtypeid integer NOT NULL,
    recdatecreated timestamp(0) without time zone DEFAULT timezone('UTC'::text, now()) NOT NULL,
    recdatemodified timestamp(0) without time zone NOT NULL

);


-- adempiere.wmv_ghgaudit constraints

--- Table comments
COMMENT ON TABLE ndb.elementtaxagroups IS "";

--- Table indices
CREATE UNIQUE INDEX elementtaxagroups_pkey ON ndb.elementtaxagroups USING btree (elementtaxagroupid);
CREATE UNIQUE INDEX ix_elementtaxagrouptypes ON ndb.elementtaxagroups USING btree (taxagroupid, elementtypeid) WITH (fillfactor='10')

--- Remove existing constraints if needed
ALTER TABLE ndb.elementtaxagroups DROP CONSTRAINT IF EXISTS elementtaxagroups_pkey;

--- Non-foreign key constraints
ALTER TABLE ndb.elementtaxagroups ADD CONSTRAINT elementtaxagroups_pkey PRIMARY KEY (elementtaxagroupid);

--- Foreign Key Restraints
ALTER TABLE ndb.elementtaxagroups ADD CONSTRAINT fk_elementtaxagrouptypes_elementtypes FOREIGN KEY (elementtypeid) REFERENCES ndb.elementtypes(elementtypeid) ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE ndb.elementtaxagroups ADD CONSTRAINT fk_elementtaxagrouptypes_taxagrouptypes FOREIGN KEY (taxagroupid) REFERENCES ndb.taxagrouptypes(taxagroupid) ON UPDATE CASCADE ON DELETE CASCADE;