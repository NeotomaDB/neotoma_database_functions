-- isometadata definition

-- Drop table

-- DROP TABLE IF EXISTS isometadata.isometadata

CREATE TABLE isometadata.isometadata (
    isometadataid integer DEFAULT nextval('ndb.seq_isometadata_isometadataid'::regclass) NOT NULL,
    dataid integer NOT NULL,
    isomatanaltypeid integer NULL,
    isosubstratetypeid integer NULL,
    analystid integer NULL,
    lab character varying(255) NULL,
    labnumber character varying(64) NULL,
    mass_mg double precision NULL,
    weightpercent double precision NULL,
    atomicpercent double precision NULL,
    reps integer NULL,
    recdatecreated timestamp(0) without time zone DEFAULT timezone('UTC'::text, now()) NOT NULL,
    recdatemodified timestamp(0) without time zone NOT NULL,
    CONSTRAINT isometadata_pkey PRIMARY KEY (isometadataid)
);


-- adempiere.wmv_ghgaudit foreign keys

ALTER TABLE ndb.isometadata ADD CONSTRAINT fk_isometadata_contacts FOREIGN KEY (analystid) REFERENCES ndb.contacts(contactid);
ALTER TABLE ndb.isometadata ADD CONSTRAINT fk_isometadata_isomaterialanalyzedtypes FOREIGN KEY (isomatanaltypeid) REFERENCES ndb.isomaterialanalyzedtypes(isomatanaltypeid) ON DELETE SET NULL;
ALTER TABLE ndb.isometadata ADD CONSTRAINT fk_isometadata_isosubstratetypes FOREIGN KEY (isosubstratetypeid) REFERENCES ndb.isosubstratetypes(isosubstratetypeid) ON UPDATE CASCADE ON DELETE SET NULL;
ALTER TABLE ndb.isometadata ADD CONSTRAINT fk_isometadata_data FOREIGN KEY (dataid) REFERENCES ndb.data(dataid) ON UPDATE CASCADE ON DELETE CASCADE;