-- ndb definition

-- Drop table

-- DROP TABLE IF EXISTS ndb.elementsymmetries

CREATE TABLE IF NOT EXISTS ndb.elementsymmetries (

    symmetryid integer DEFAULT nextval('ndb.seq_elementsymmetries_symmetryid'::regclass) NOT NULL,
    symmetry character varying(24) NOT NULL,
    recdatecreated timestamp(0) without time zone DEFAULT timezone('UTC'::text, now()) NOT NULL,
    recdatemodified timestamp(0) without time zone NOT NULL

);


-- adempiere.wmv_ghgaudit constraints

--- Table comments
COMMENT ON TABLE ndb.elementsymmetries IS "";

--- Table indices
CREATE UNIQUE INDEX elementsymmetries_pkey ON ndb.elementsymmetries USING btree (symmetryid);
CREATE UNIQUE INDEX ix_elementsymmetries ON ndb.elementsymmetries USING btree (symmetry) WITH (fillfactor='10')

--- Remove existing constraints if needed
ALTER TABLE ndb.elementsymmetries DROP CONSTRAINT IF EXISTS elementsymmetries_pkey;

--- Non-foreign key constraints
ALTER TABLE ndb.elementsymmetries ADD CONSTRAINT elementsymmetries_pkey PRIMARY KEY (symmetryid);

--- Foreign Key Restraints