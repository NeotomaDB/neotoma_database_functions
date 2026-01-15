-- specimendates definition

-- Drop table

-- DROP TABLE IF EXISTS specimendates.specimendates

CREATE TABLE specimendates.specimendates (
    specimendateid integer DEFAULT nextval('ndb.seq_specimendates_specimendateid'::regclass) NOT NULL,
    geochronid integer NOT NULL,
    taxonid integer NOT NULL,
    fractionid integer NULL,
    sampleid integer NOT NULL,
    notes text NULL,
    elementtypeid integer NULL,
    recdatecreated timestamp(0) without time zone DEFAULT timezone('UTC'::text, now()) NOT NULL,
    recdatemodified timestamp(0) without time zone NOT NULL,
    specimenid integer NULL,
    CONSTRAINT specimendates_pkey PRIMARY KEY (specimendateid)
);


-- adempiere.wmv_ghgaudit foreign keys

ALTER TABLE ndb.specimendates ADD CONSTRAINT sd_smpid FOREIGN KEY (sampleid) REFERENCES ndb.samples(sampleid) ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE ndb.specimendates ADD CONSTRAINT fk_specimendates_specimens FOREIGN KEY (specimenid) REFERENCES ndb.specimens(specimenid) ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE ndb.specimendates ADD CONSTRAINT sd_etyid FOREIGN KEY (elementtypeid) REFERENCES ndb.elementtypes(elementtypeid);
ALTER TABLE ndb.specimendates ADD CONSTRAINT sd_fcid FOREIGN KEY (fractionid) REFERENCES ndb.fractiondated(fractionid);
ALTER TABLE ndb.specimendates ADD CONSTRAINT sd_txid FOREIGN KEY (taxonid) REFERENCES ndb.taxa(taxonid);
ALTER TABLE ndb.specimendates ADD CONSTRAINT sd_gcid FOREIGN KEY (geochronid) REFERENCES ndb.geochronology(geochronid) ON UPDATE CASCADE ON DELETE CASCADE;