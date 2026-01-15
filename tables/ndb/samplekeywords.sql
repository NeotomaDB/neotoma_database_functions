-- samplekeywords definition

-- Drop table

-- DROP TABLE IF EXISTS samplekeywords.samplekeywords

CREATE TABLE samplekeywords.samplekeywords (
    sampleid integer NOT NULL,
    keywordid integer NOT NULL,
    recdatecreated timestamp(0) without time zone DEFAULT timezone('UTC'::text, now()) NOT NULL,
    recdatemodified timestamp(0) without time zone NOT NULL,
    CONSTRAINT samplekeywords_pkey PRIMARY KEY (sampleid, keywordid)
);


-- adempiere.wmv_ghgaudit foreign keys

ALTER TABLE ndb.samplekeywords ADD CONSTRAINT fk_samplekeywords_keywords FOREIGN KEY (keywordid) REFERENCES ndb.keywords(keywordid);
ALTER TABLE ndb.samplekeywords ADD CONSTRAINT fk_samplekeywords_samples FOREIGN KEY (sampleid) REFERENCES ndb.samples(sampleid) ON UPDATE CASCADE ON DELETE CASCADE;