-- ndb.keywords Table definition

-- Drop table

-- DROP TABLE IF EXISTS ndb.keywords

CREATE TABLE IF NOT EXISTS ndb.keywords (

    keywordid integer DEFAULT nextval('ndb.seq_keywords_keywordid'::regclass) NOT NULL,
    keyword character varying(64) NOT NULL,
    recdatecreated timestamp(0) without time zone DEFAULT timezone('UTC'::text, now()) NOT NULL,
    recdatemodified timestamp(0) without time zone NOT NULL

);


-- Table Constraints, Comments and Triggers

--- Table comments
COMMENT ON TABLE ndb.keywords IS 'Lookup table of Keywords referenced by the SampleKeywords table. The table provides a means to identify samples sharing a common attribute. For example, the keyword «modern sample» identifies modern surface samples in the database. These samples include individual surface samples, as well as core tops. Although not implemented, a «pre-European settlement» keyword would be a means to identify samples just predating European settlement.';
COMMENT ON COLUMN ndb.keywords.keywordid IS 'An arbitrary Keyword identification number.';
COMMENT ON COLUMN ndb.keywords.keyword IS 'A keyword for identifying samples sharing a common attribute.';
COMMENT ON COLUMN ndb.keywords.recdatecreated IS '';
COMMENT ON COLUMN ndb.keywords.recdatemodified IS '';

--- Table indices
CREATE UNIQUE INDEX keywords_pkey ON ndb.keywords USING btree (keywordid)

--- Remove existing constraints if needed
-- ALTER TABLE ndb.keywords DROP CONSTRAINT IF EXISTS keywords_pkey;

--- Non-foreign key constraints
ALTER TABLE ndb.keywords ADD CONSTRAINT keywords_pkey PRIMARY KEY (keywordid);

--- Foreign Key Restraints

--- Triggers
-- DROP TRIGGER IF EXISTS tr_sites_modifydate ON ndb.keywords;\n
-- DROP TRIGGER IF EXISTS tr_sites_modifydate ON ndb.keywords;\n
CREATE TRIGGER tr_sites_modifydate BEFORE INSERT ON ndb.keywords FOR EACH ROW EXECUTE FUNCTION ndb.update_recdatemodified();\n
CREATE TRIGGER tr_sites_modifydate BEFORE UPDATE ON ndb.keywords FOR EACH ROW EXECUTE FUNCTION ndb.update_recdatemodified();\n