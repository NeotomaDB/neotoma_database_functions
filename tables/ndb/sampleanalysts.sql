-- sampleanalysts definition

-- Drop table

-- DROP TABLE IF EXISTS sampleanalysts.sampleanalysts

CREATE TABLE sampleanalysts.sampleanalysts (
    analystid integer DEFAULT nextval('ndb.seq_sampleanalysts_analystid'::regclass) NOT NULL,
    sampleid integer NOT NULL,
    contactid integer NOT NULL,
    analystorder integer NOT NULL,
    recdatecreated timestamp(0) without time zone DEFAULT timezone('UTC'::text, now()) NOT NULL,
    recdatemodified timestamp(0) without time zone NOT NULL,
    CONSTRAINT sampleanalysts_pkey PRIMARY KEY (analystid)
);


-- adempiere.wmv_ghgaudit foreign keys

ALTER TABLE ndb.sampleanalysts ADD CONSTRAINT fk_sampleanalysts_contacts FOREIGN KEY (contactid) REFERENCES ndb.contacts(contactid) ON UPDATE CASCADE;
ALTER TABLE ndb.sampleanalysts ADD CONSTRAINT fk_sampleanalysts_samples FOREIGN KEY (sampleid) REFERENCES ndb.samples(sampleid) ON UPDATE CASCADE ON DELETE CASCADE;