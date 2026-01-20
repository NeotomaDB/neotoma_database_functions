-- ndb definition

-- Drop table

-- DROP TABLE IF EXISTS ndb.elementtaxagroupportions

CREATE TABLE IF NOT EXISTS ndb.elementtaxagroupportions (

    elementtaxagroupid integer NOT NULL,
    portionid integer NOT NULL,
    recdatecreated timestamp(0) without time zone DEFAULT timezone('UTC'::text, now()) NOT NULL,
    recdatemodified timestamp(0) without time zone NOT NULL

);


-- adempiere.wmv_ghgaudit constraints

--- Table comments
COMMENT ON TABLE ndb.elementtaxagroupportions IS "";

--- Table indices
CREATE UNIQUE INDEX elementtaxagroupportions_pkey ON ndb.elementtaxagroupportions USING btree (elementtaxagroupid, portionid)

--- Remove existing constraints if needed
ALTER TABLE ndb.elementtaxagroupportions DROP CONSTRAINT IF EXISTS elementtaxagroupportions_pkey;

--- Non-foreign key constraints
ALTER TABLE ndb.elementtaxagroupportions ADD CONSTRAINT elementtaxagroupportions_pkey PRIMARY KEY (elementtaxagroupid, portionid);

--- Foreign Key Restraints
ALTER TABLE ndb.elementtaxagroupportions ADD CONSTRAINT fk_elementtaxagroupportions_elementtaxagroups FOREIGN KEY (elementtaxagroupid) REFERENCES ndb.elementtaxagroups(elementtaxagroupid) ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE ndb.elementtaxagroupportions ADD CONSTRAINT fk_elementtaxagroupportions_elementportions FOREIGN KEY (portionid) REFERENCES ndb.elementportions(portionid) ON UPDATE CASCADE ON DELETE CASCADE;