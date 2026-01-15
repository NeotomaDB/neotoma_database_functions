-- relativeagescales definition

-- Drop table

-- DROP TABLE IF EXISTS relativeagescales.relativeagescales

CREATE TABLE relativeagescales.relativeagescales (
    relativeagescaleid integer DEFAULT nextval('ndb.seq_relativeagescales_relativeagescaleid'::regclass) NOT NULL,
    relativeagescale character varying(64) NOT NULL,
    recdatecreated timestamp(0) without time zone DEFAULT timezone('UTC'::text, now()) NOT NULL,
    recdatemodified timestamp(0) without time zone NOT NULL,
    CONSTRAINT relativeagescales_pkey PRIMARY KEY (relativeagescaleid)
);


-- adempiere.wmv_ghgaudit foreign keys

;