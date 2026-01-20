-- ndb definition

-- Drop table

-- DROP TABLE IF EXISTS ndb.isostratdata

CREATE TABLE IF NOT EXISTS ndb.isostratdata (

    dataid integer NOT NULL,
    sd double precision NULL,
    taxonid integer NULL,
    elementtypeid integer NULL,
    recdatecreated timestamp(0) without time zone DEFAULT timezone('UTC'::text, now()) NOT NULL,
    recdatemodified timestamp(0) without time zone NOT NULL

);


-- adempiere.wmv_ghgaudit constraints

--- Table comments
COMMENT ON TABLE ndb.isostratdata IS "";

--- Table indices
CREATE UNIQUE INDEX isostratdata_pkey ON ndb.isostratdata USING btree (dataid)

--- Remove existing constraints if needed
ALTER TABLE ndb.isostratdata DROP CONSTRAINT IF EXISTS isostratdata_pkey;

--- Non-foreign key constraints
ALTER TABLE ndb.isostratdata ADD CONSTRAINT isostratdata_pkey PRIMARY KEY (dataid);

--- Foreign Key Restraints
ALTER TABLE ndb.isostratdata ADD CONSTRAINT fk_isostratdata_elementtypes FOREIGN KEY (elementtypeid) REFERENCES ndb.elementtypes(elementtypeid) ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE ndb.isostratdata ADD CONSTRAINT fk_isostratdata_data FOREIGN KEY (dataid) REFERENCES ndb.data(dataid) ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE ndb.isostratdata ADD CONSTRAINT fk_isostratdata_taxa FOREIGN KEY (taxonid) REFERENCES ndb.taxa(taxonid);