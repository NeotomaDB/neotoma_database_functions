-- ndb definition

-- Drop table

-- DROP TABLE IF EXISTS ndb.sampleanalysts

CREATE TABLE IF NOT EXISTS ndb.sampleanalysts (

    analystid integer DEFAULT nextval('ndb.seq_sampleanalysts_analystid'::regclass) NOT NULL,
    sampleid integer NOT NULL,
    contactid integer NOT NULL,
    analystorder integer NOT NULL,
    recdatecreated timestamp(0) without time zone DEFAULT timezone('UTC'::text, now()) NOT NULL,
    recdatemodified timestamp(0) without time zone NOT NULL

);


-- adempiere.wmv_ghgaudit constraints

--- Table comments
COMMENT ON TABLE ndb.sampleanalysts IS "This table lists the Sample Analysts.";

--- Table indices
CREATE UNIQUE INDEX sampleanalysts_pkey ON ndb.sampleanalysts USING btree (analystid);
CREATE INDEX ix_contactid_sampleanalysts ON ndb.sampleanalysts USING btree (contactid) WITH (fillfactor='10');
CREATE INDEX ix_sampleid_sampleanalysts ON ndb.sampleanalysts USING btree (sampleid) WITH (fillfactor='10')

--- Remove existing constraints if needed
ALTER TABLE ndb.sampleanalysts DROP CONSTRAINT IF EXISTS sampleanalysts_pkey;

--- Non-foreign key constraints
ALTER TABLE ndb.sampleanalysts ADD CONSTRAINT sampleanalysts_pkey PRIMARY KEY (analystid);

--- Foreign Key Restraints
ALTER TABLE ndb.sampleanalysts ADD CONSTRAINT fk_sampleanalysts_contacts FOREIGN KEY (contactid) REFERENCES ndb.contacts(contactid) ON UPDATE CASCADE;
ALTER TABLE ndb.sampleanalysts ADD CONSTRAINT fk_sampleanalysts_samples FOREIGN KEY (sampleid) REFERENCES ndb.samples(sampleid) ON UPDATE CASCADE ON DELETE CASCADE;