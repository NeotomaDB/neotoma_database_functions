-- ndb definition

-- Drop table

-- DROP TABLE IF EXISTS ndb.elementmaturities

CREATE TABLE IF NOT EXISTS ndb.elementmaturities (

    maturityid integer DEFAULT nextval('ndb.seq_elementmaturities_maturityid'::regclass) NOT NULL,
    maturity character varying(36) NOT NULL,
    recdatecreated timestamp(0) without time zone DEFAULT timezone('UTC'::text, now()) NOT NULL,
    recdatemodified timestamp(0) without time zone NOT NULL

);


-- adempiere.wmv_ghgaudit constraints

--- Table comments
COMMENT ON TABLE ndb.elementmaturities IS "";

--- Table indices
CREATE UNIQUE INDEX elementmaturities_pkey ON ndb.elementmaturities USING btree (maturityid);
CREATE UNIQUE INDEX ix_elementmaturities ON ndb.elementmaturities USING btree (maturity) WITH (fillfactor='10')

--- Remove existing constraints if needed
ALTER TABLE ndb.elementmaturities DROP CONSTRAINT IF EXISTS elementmaturities_pkey;

--- Non-foreign key constraints
ALTER TABLE ndb.elementmaturities ADD CONSTRAINT elementmaturities_pkey PRIMARY KEY (maturityid);

--- Foreign Key Restraints