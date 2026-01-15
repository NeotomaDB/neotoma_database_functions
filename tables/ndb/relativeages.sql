-- relativeages definition

-- Drop table

-- DROP TABLE IF EXISTS relativeages.relativeages

CREATE TABLE relativeages.relativeages (
    relativeageid integer DEFAULT nextval('ndb.seq_relativeages_relativeageid'::regclass) NOT NULL,
    relativeageunitid integer NOT NULL,
    relativeagescaleid integer NOT NULL,
    relativeage character varying(64) NOT NULL,
    c14ageyounger double precision NULL,
    c14ageolder double precision NULL,
    calageyounger double precision NULL,
    calageolder double precision NULL,
    notes text NULL,
    recdatecreated timestamp(0) without time zone DEFAULT timezone('UTC'::text, now()) NOT NULL,
    recdatemodified timestamp(0) without time zone NOT NULL,
    CONSTRAINT relativeages_pkey PRIMARY KEY (relativeageid)
);


-- adempiere.wmv_ghgaudit foreign keys

ALTER TABLE ndb.relativeages ADD CONSTRAINT fk_relativeages_relativeageunits FOREIGN KEY (relativeageunitid) REFERENCES ndb.relativeageunits(relativeageunitid) ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE ndb.relativeages ADD CONSTRAINT fk_relativeages_relativeagescales FOREIGN KEY (relativeagescaleid) REFERENCES ndb.relativeagescales(relativeagescaleid) ON UPDATE CASCADE ON DELETE CASCADE;