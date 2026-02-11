-- ndb definition

-- Drop table

-- DROP TABLE IF EXISTS ndb.isosamplepretreatments

CREATE TABLE IF NOT EXISTS ndb.isosamplepretreatments (

    dataid integer NOT NULL,
    isopretreatmenttypeid integer NOT NULL,
    "order" integer NOT NULL,
    value double precision NULL,
    recdatecreated timestamp(0) without time zone DEFAULT timezone('UTC'::text, now()) NOT NULL,
    recdatemodified timestamp(0) without time zone NOT NULL

);


-- adempiere.wmv_ghgaudit constraints

--- Table comments
COMMENT ON TABLE ndb.isosamplepretreatments IS "";

--- Table indices
CREATE UNIQUE INDEX isosamplepretreatments_pkey ON ndb.isosamplepretreatments USING btree (dataid, isopretreatmenttypeid, "order")

--- Remove existing constraints if needed
ALTER TABLE ndb.isosamplepretreatments DROP CONSTRAINT IF EXISTS isosamplepretreatments_pkey;

--- Non-foreign key constraints
ALTER TABLE ndb.isosamplepretreatments ADD CONSTRAINT isosamplepretreatments_pkey PRIMARY KEY (dataid, isopretreatmenttypeid, "order");

--- Foreign Key Restraints
ALTER TABLE ndb.isosamplepretreatments ADD CONSTRAINT fk_isosamplepretreatments_data FOREIGN KEY (dataid) REFERENCES ndb.data(dataid) ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE ndb.isosamplepretreatments ADD CONSTRAINT fk_isosamplepretreatments_isopretratmenttypes FOREIGN KEY (isopretreatmenttypeid) REFERENCES ndb.isopretreatmenttypes(isopretreatmenttypeid) ON UPDATE CASCADE ON DELETE CASCADE;