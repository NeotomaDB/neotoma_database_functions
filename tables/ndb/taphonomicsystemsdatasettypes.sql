-- taphonomicsystemsdatasettypes definition

-- Drop table

-- DROP TABLE IF EXISTS taphonomicsystemsdatasettypes.taphonomicsystemsdatasettypes

CREATE TABLE taphonomicsystemsdatasettypes.taphonomicsystemsdatasettypes (
    datasettypeid integer NOT NULL,
    taphonomicsystemid integer NOT NULL,
    recdatecreated timestamp(0) without time zone DEFAULT timezone('UTC'::text, now()) NOT NULL,
    recdatemodified timestamp(0) without time zone NOT NULL,
    CONSTRAINT taphonomicsystemsdatasettypes_pkey PRIMARY KEY (datasettypeid, taphonomicsystemid)
);


-- adempiere.wmv_ghgaudit foreign keys

ALTER TABLE ndb.taphonomicsystemsdatasettypes ADD CONSTRAINT fk_taphonomicsystemsdatasettypes_taphonomicsystems FOREIGN KEY (taphonomicsystemid) REFERENCES ndb.taphonomicsystems(taphonomicsystemid) ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE ndb.taphonomicsystemsdatasettypes ADD CONSTRAINT fk_taphonomicsystemsdatasettypes_taphonomicsystemsdatasettypes FOREIGN KEY (datasettypeid) REFERENCES ndb.datasettypes(datasettypeid) ON UPDATE CASCADE ON DELETE CASCADE;