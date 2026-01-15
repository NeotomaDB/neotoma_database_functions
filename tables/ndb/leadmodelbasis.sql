-- leadmodelbasis definition

-- Drop table

-- DROP TABLE IF EXISTS leadmodelbasis.leadmodelbasis

CREATE TABLE leadmodelbasis.leadmodelbasis (
    pbbasisid integer DEFAULT nextval('ndb.leadmodelbasis_pbbasisid_seq'::regclass) NOT NULL,
    pbbasis text NULL,
    CONSTRAINT leadmodelbasis_pkey PRIMARY KEY (pbbasisid)
);


-- adempiere.wmv_ghgaudit foreign keys

;