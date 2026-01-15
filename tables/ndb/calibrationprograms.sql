-- calibrationprograms definition

-- Drop table

-- DROP TABLE IF EXISTS calibrationprograms.calibrationprograms

CREATE TABLE calibrationprograms.calibrationprograms (
    calibrationprogramid integer DEFAULT nextval('ndb.seq_calibrationprograms_calibrationprogramid'::regclass) NOT NULL,
    calibrationprogram character varying(24) NOT NULL,
    version character varying(24) NULL,
    recdatecreated timestamp(0) without time zone DEFAULT timezone('UTC'::text, now()) NOT NULL,
    recdatemodified timestamp(0) without time zone NOT NULL,
    CONSTRAINT calibrationprograms_pkey PRIMARY KEY (calibrationprogramid)
);


-- adempiere.wmv_ghgaudit foreign keys

;