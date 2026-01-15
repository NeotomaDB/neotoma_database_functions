-- keywords definition

-- Drop table

-- DROP TABLE IF EXISTS keywords.keywords

CREATE TABLE keywords.keywords (
    keywordid integer DEFAULT nextval('ndb.seq_keywords_keywordid'::regclass) NOT NULL,
    keyword character varying(64) NOT NULL,
    recdatecreated timestamp(0) without time zone DEFAULT timezone('UTC'::text, now()) NOT NULL,
    recdatemodified timestamp(0) without time zone NOT NULL,
    CONSTRAINT keywords_pkey PRIMARY KEY (keywordid)
);


-- adempiere.wmv_ghgaudit foreign keys

;