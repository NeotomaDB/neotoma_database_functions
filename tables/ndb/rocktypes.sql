-- rocktypes definition

-- Drop table

-- DROP TABLE IF EXISTS rocktypes.rocktypes

CREATE TABLE rocktypes.rocktypes (
    rocktypeid integer DEFAULT nextval('ndb.seq_rocktypes_rocktypeid'::regclass) NOT NULL,
    rocktype character varying(64) NOT NULL,
    higherrocktypeid integer NOT NULL,
    description text NOT NULL,
    recdatecreated timestamp(0) without time zone DEFAULT timezone('UTC'::text, now()) NOT NULL,
    recdatemodified timestamp(0) without time zone NOT NULL,
    CONSTRAINT rocktypes_pkey PRIMARY KEY (rocktypeid)
);


-- adempiere.wmv_ghgaudit foreign keys

ALTER TABLE ndb.rocktypes ADD CONSTRAINT fk_higherrocktypeid FOREIGN KEY (higherrocktypeid) REFERENCES ndb.rocktypes(rocktypeid);