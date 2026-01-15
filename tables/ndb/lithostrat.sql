-- lithostrat definition

-- Drop table

-- DROP TABLE IF EXISTS lithostrat.lithostrat

CREATE TABLE lithostrat.lithostrat (
    lithostratid integer DEFAULT nextval('ndb.seq_lithostrat_lithostratid'::regclass) NOT NULL,
    lithostratunitid integer NOT NULL,
    lithostratname character varying(64) NOT NULL,
    higherlithostratid integer NOT NULL,
    recdatecreated timestamp(0) without time zone DEFAULT timezone('UTC'::text, now()) NOT NULL,
    recdatemodified timestamp(0) without time zone NOT NULL,
    CONSTRAINT lithostrat_pkey PRIMARY KEY (lithostratid)
);


-- adempiere.wmv_ghgaudit foreign keys

ALTER TABLE ndb.lithostrat ADD CONSTRAINT fk_higherlithostratid FOREIGN KEY (higherlithostratid) REFERENCES ndb.lithostrat(lithostratid);
ALTER TABLE ndb.lithostrat ADD CONSTRAINT fk_lithostratunits_lithostrattypes FOREIGN KEY (lithostratunitid) REFERENCES ndb.lithostratunits(lithostratunitid) ON UPDATE CASCADE ON DELETE CASCADE;