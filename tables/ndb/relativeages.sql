-- ndb definition

-- Drop table

-- DROP TABLE IF EXISTS ndb.relativeages

CREATE TABLE IF NOT EXISTS ndb.relativeages (

    relativeageid integer DEFAULT nextval('ndb.seq_relativeages_relativeageid'::regclass) NOT NULL,
    relativeageunitid integer NOT NULL,
    relativeagescaleid integer NOT NULL,
    relativeage character varying(64) NOT NULL,
    c14ageyounger double precision NULL,
    c14ageolder double precision NULL,
    calageyounger double precision NULL,
    calageolder double precision NULL,
    notes text NULL,
    recdatecreated timestamp(0) without time zone DEFAULT timezone('UTC'::text, now()) NOT NULL,
    recdatemodified timestamp(0) without time zone NOT NULL

);


-- adempiere.wmv_ghgaudit constraints

--- Table comments
COMMENT ON TABLE ndb.relativeages IS "Lookup table of RelativeAges. Table is referenced by the RelativeChronology table.";

--- Table indices
CREATE UNIQUE INDEX relativeages_pkey ON ndb.relativeages USING btree (relativeageid);
CREATE INDEX ix_relativeagescaleid_relativeages ON ndb.relativeages USING btree (relativeagescaleid) WITH (fillfactor='10')

--- Remove existing constraints if needed
ALTER TABLE ndb.relativeages DROP CONSTRAINT IF EXISTS relativeages_pkey;

--- Non-foreign key constraints
ALTER TABLE ndb.relativeages ADD CONSTRAINT relativeages_pkey PRIMARY KEY (relativeageid);

--- Foreign Key Restraints
ALTER TABLE ndb.relativeages ADD CONSTRAINT fk_relativeages_relativeageunits FOREIGN KEY (relativeageunitid) REFERENCES ndb.relativeageunits(relativeageunitid) ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE ndb.relativeages ADD CONSTRAINT fk_relativeages_relativeagescales FOREIGN KEY (relativeagescaleid) REFERENCES ndb.relativeagescales(relativeagescaleid) ON UPDATE CASCADE ON DELETE CASCADE;