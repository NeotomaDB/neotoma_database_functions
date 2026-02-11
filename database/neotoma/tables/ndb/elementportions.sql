-- ndb definition

-- Drop table

-- DROP TABLE IF EXISTS ndb.elementportions

CREATE TABLE IF NOT EXISTS ndb.elementportions (

    portionid integer DEFAULT nextval('ndb.seq_elementportions_portionid'::regclass) NOT NULL,
    portion character varying(48) NULL,
    recdatecreated timestamp(0) without time zone DEFAULT timezone('UTC'::text, now()) NOT NULL,
    recdatemodified timestamp(0) without time zone NOT NULL

);


-- adempiere.wmv_ghgaudit constraints

--- Table comments
COMMENT ON TABLE ndb.elementportions IS "";

--- Table indices
CREATE UNIQUE INDEX elementportions_pkey ON ndb.elementportions USING btree (portionid);
CREATE UNIQUE INDEX ix_elementportions ON ndb.elementportions USING btree (portion) WITH (fillfactor='10')

--- Remove existing constraints if needed
ALTER TABLE ndb.elementportions DROP CONSTRAINT IF EXISTS elementportions_pkey;

--- Non-foreign key constraints
ALTER TABLE ndb.elementportions ADD CONSTRAINT elementportions_pkey PRIMARY KEY (portionid);

--- Foreign Key Restraints