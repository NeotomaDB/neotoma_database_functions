-- pollensumgroups definition

-- Drop table

-- DROP TABLE IF EXISTS pollensumgroups.pollensumgroups

CREATE TABLE pollensumgroups.pollensumgroups (
    recid integer NOT NULL,
    ecolgroupid character varying(4) NOT NULL,
    sumgroupid integer NOT NULL,
    CONSTRAINT pollensumgroups_pkey PRIMARY KEY (recid)
);


-- adempiere.wmv_ghgaudit foreign keys

;