-- embargo definition

-- Drop table

-- DROP TABLE IF EXISTS embargo.embargo

CREATE TABLE embargo.embargo (
    embargoid integer DEFAULT nextval('ndb.seq_embargo_embargoid'::regclass) NOT NULL,
    embargodate date NOT NULL,
    embargopw character varying(20) NULL,
    CONSTRAINT embargo_pkey PRIMARY KEY (embargoid)
);


-- adempiere.wmv_ghgaudit foreign keys

;