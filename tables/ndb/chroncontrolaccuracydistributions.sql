-- chroncontrolaccuracydistributions definition

-- Drop table

-- DROP TABLE IF EXISTS chroncontrolaccuracydistributions.chroncontrolaccuracydistributions

CREATE TABLE chroncontrolaccuracydistributions.chroncontrolaccuracydistributions (
    accuracydistributionid integer DEFAULT nextval('ndb.seq_chroncontrolaccuracydistributions_accuracydistributionid'::regclass) NOT NULL,
    accuracydistribution character varying(40) NOT NULL,
    recdatecreated timestamp(0) without time zone DEFAULT timezone('UTC'::text, now()) NOT NULL,
    recdatemodified timestamp(0) without time zone NOT NULL,
    CONSTRAINT chroncontrolaccuracydistributions_pkey PRIMARY KEY (accuracydistributionid)
);


-- adempiere.wmv_ghgaudit foreign keys

;