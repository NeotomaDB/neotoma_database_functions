-- ndb definition

-- Drop table

-- DROP TABLE IF EXISTS ndb.samplekeywords

CREATE TABLE IF NOT EXISTS ndb.samplekeywords (

    sampleid integer NOT NULL,
    keywordid integer NOT NULL,
    recdatecreated timestamp(0) without time zone DEFAULT timezone('UTC'::text, now()) NOT NULL,
    recdatemodified timestamp(0) without time zone NOT NULL

);


-- adempiere.wmv_ghgaudit constraints

--- Table comments
COMMENT ON TABLE ndb.samplekeywords IS "This table lists the Sample Analysts.";

--- Table indices
CREATE UNIQUE INDEX samplekeywords_pkey ON ndb.samplekeywords USING btree (sampleid, keywordid);
CREATE INDEX ix_keywordid_samplekeywords ON ndb.samplekeywords USING btree (keywordid) WITH (fillfactor='10');
CREATE INDEX ix_sampleid_samplekeywords ON ndb.samplekeywords USING btree (sampleid) WITH (fillfactor='10')

--- Remove existing constraints if needed
ALTER TABLE ndb.samplekeywords DROP CONSTRAINT IF EXISTS samplekeywords_pkey;

--- Non-foreign key constraints
ALTER TABLE ndb.samplekeywords ADD CONSTRAINT samplekeywords_pkey PRIMARY KEY (sampleid, keywordid);

--- Foreign Key Restraints
ALTER TABLE ndb.samplekeywords ADD CONSTRAINT fk_samplekeywords_keywords FOREIGN KEY (keywordid) REFERENCES ndb.keywords(keywordid);
ALTER TABLE ndb.samplekeywords ADD CONSTRAINT fk_samplekeywords_samples FOREIGN KEY (sampleid) REFERENCES ndb.samples(sampleid) ON UPDATE CASCADE ON DELETE CASCADE;