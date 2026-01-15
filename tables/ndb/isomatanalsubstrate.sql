-- isomatanalsubstrate definition

-- Drop table

-- DROP TABLE IF EXISTS isomatanalsubstrate.isomatanalsubstrate

CREATE TABLE isomatanalsubstrate.isomatanalsubstrate (
    isomatanaltypeid integer NOT NULL,
    isosubstratetypeid integer NOT NULL,
    recdatecreated timestamp(0) without time zone DEFAULT timezone('UTC'::text, now()) NOT NULL,
    recdatemodified timestamp(0) without time zone NOT NULL,
    CONSTRAINT isomatanalsubstrate_pkey PRIMARY KEY (isomatanaltypeid, isosubstratetypeid)
);


-- adempiere.wmv_ghgaudit foreign keys

ALTER TABLE ndb.isomatanalsubstrate ADD CONSTRAINT fk_isomatanalsubstrate_isomaterialanalyzedtypes FOREIGN KEY (isomatanaltypeid) REFERENCES ndb.isomaterialanalyzedtypes(isomatanaltypeid) ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE ndb.isomatanalsubstrate ADD CONSTRAINT fk_isomatanalsubstrate_isosubstratetypes FOREIGN KEY (isosubstratetypeid) REFERENCES ndb.isosubstratetypes(isosubstratetypeid) ON UPDATE CASCADE ON DELETE CASCADE;