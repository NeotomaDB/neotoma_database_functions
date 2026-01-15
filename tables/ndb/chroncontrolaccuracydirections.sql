-- chroncontrolaccuracydirections definition

-- Drop table

-- DROP TABLE IF EXISTS chroncontrolaccuracydirections.chroncontrolaccuracydirections

CREATE TABLE chroncontrolaccuracydirections.chroncontrolaccuracydirections (
    accuracydirectionid integer DEFAULT nextval('ndb.seq_chroncontrolaccuracydirections_accuracydirectionid'::regclass) NOT NULL,
    accuracydirection character varying(80) NOT NULL,
    recdatecreated timestamp(0) without time zone DEFAULT timezone('UTC'::text, now()) NOT NULL,
    recdatemodified timestamp(0) without time zone NOT NULL,
    CONSTRAINT chroncontrolaccuracydirections_pkey PRIMARY KEY (accuracydirectionid)
);


-- adempiere.wmv_ghgaudit foreign keys

;