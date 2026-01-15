-- chroncontrolranks definition

-- Drop table

-- DROP TABLE IF EXISTS chroncontrolranks.chroncontrolranks

CREATE TABLE chroncontrolranks.chroncontrolranks (
    chroncontrolrankid integer DEFAULT nextval('ndb.seq_chroncontrolranks_chroncontrolrankid'::regclass) NOT NULL,
    chroncontrolid integer NULL,
    accuracyrankid integer NULL,
    accuracydirectionid integer NULL,
    accuracydistributionid integer NULL,
    precisionrankid integer NULL,
    outlier boolean NULL,
    recdatecreated timestamp(0) without time zone DEFAULT timezone('UTC'::text, now()) NOT NULL,
    recdatemodified timestamp(0) without time zone NOT NULL,
    CONSTRAINT chroncontrolranks_pkey PRIMARY KEY (chroncontrolrankid)
);


-- adempiere.wmv_ghgaudit foreign keys

ALTER TABLE ndb.chroncontrolranks ADD CONSTRAINT fk_chroncontrolranks_chroncontrolaccuracydirections FOREIGN KEY (accuracydirectionid) REFERENCES ndb.chroncontrolaccuracydirections(accuracydirectionid) ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE ndb.chroncontrolranks ADD CONSTRAINT fk_chroncontrolranks_chroncontrolaccuracydistributions FOREIGN KEY (accuracydistributionid) REFERENCES ndb.chroncontrolaccuracydistributions(accuracydistributionid) ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE ndb.chroncontrolranks ADD CONSTRAINT fk_chroncontrolranks_chroncontrolaccuracyranks FOREIGN KEY (accuracyrankid) REFERENCES ndb.chroncontrolaccuracyranks(accuracyrankid) ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE ndb.chroncontrolranks ADD CONSTRAINT fk_chroncontrolranks_chroncontrolprecisionranks FOREIGN KEY (precisionrankid) REFERENCES ndb.chroncontrolprecisionranks(precisionrankid) ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE ndb.chroncontrolranks ADD CONSTRAINT fk_chroncontrolranks_chroncontrols FOREIGN KEY (chroncontrolid) REFERENCES ndb.chroncontrols(chroncontrolid) ON UPDATE CASCADE ON DELETE CASCADE;