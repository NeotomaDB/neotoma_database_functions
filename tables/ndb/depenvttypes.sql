-- depenvttypes definition

-- Drop table

-- DROP TABLE IF EXISTS depenvttypes.depenvttypes

CREATE TABLE depenvttypes.depenvttypes (
    depenvtid integer DEFAULT nextval('ndb.seq_depenvttypes_depenvtid'::regclass) NOT NULL,
    depenvt character varying(255) NOT NULL,
    depenvthigherid integer NOT NULL,
    recdatecreated timestamp(0) without time zone DEFAULT timezone('UTC'::text, now()) NOT NULL,
    recdatemodified timestamp(0) without time zone NOT NULL,
    CONSTRAINT depenvttypes_pkey PRIMARY KEY (depenvtid)
);


-- adempiere.wmv_ghgaudit foreign keys

ALTER TABLE ndb.depenvttypes ADD CONSTRAINT fk_depenvthigherid FOREIGN KEY (depenvthigherid) REFERENCES ndb.depenvttypes(depenvtid);