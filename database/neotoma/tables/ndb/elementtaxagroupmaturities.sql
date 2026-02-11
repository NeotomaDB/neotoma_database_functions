-- ndb definition

-- Drop table

-- DROP TABLE IF EXISTS ndb.elementtaxagroupmaturities

CREATE TABLE IF NOT EXISTS ndb.elementtaxagroupmaturities (

    elementtaxagroupid integer NOT NULL,
    maturityid integer NOT NULL,
    recdatecreated timestamp(0) without time zone DEFAULT timezone('UTC'::text, now()) NOT NULL,
    recdatemodified timestamp(0) without time zone NOT NULL

);


-- adempiere.wmv_ghgaudit constraints

--- Table comments
COMMENT ON TABLE ndb.elementtaxagroupmaturities IS "";

--- Table indices
CREATE UNIQUE INDEX elementtaxagroupmaturities_pkey ON ndb.elementtaxagroupmaturities USING btree (elementtaxagroupid, maturityid)

--- Remove existing constraints if needed
ALTER TABLE ndb.elementtaxagroupmaturities DROP CONSTRAINT IF EXISTS elementtaxagroupmaturities_pkey;

--- Non-foreign key constraints
ALTER TABLE ndb.elementtaxagroupmaturities ADD CONSTRAINT elementtaxagroupmaturities_pkey PRIMARY KEY (elementtaxagroupid, maturityid);

--- Foreign Key Restraints
ALTER TABLE ndb.elementtaxagroupmaturities ADD CONSTRAINT fk_elementtaxagroupmaturities_elementmaturities FOREIGN KEY (maturityid) REFERENCES ndb.elementmaturities(maturityid) ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE ndb.elementtaxagroupmaturities ADD CONSTRAINT fk_elementtaxagroupmaturities_elementtaxagroup FOREIGN KEY (elementtaxagroupid) REFERENCES ndb.elementtaxagroups(elementtaxagroupid) ON UPDATE CASCADE ON DELETE CASCADE;