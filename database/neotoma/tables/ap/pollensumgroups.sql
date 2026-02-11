-- ap definition

-- Drop table

-- DROP TABLE IF EXISTS ap.pollensumgroups

CREATE TABLE IF NOT EXISTS ap.pollensumgroups (

    recid integer NOT NULL,
    ecolgroupid character varying(4) NOT NULL,
    sumgroupid integer NOT NULL

);


-- adempiere.wmv_ghgaudit constraints

--- Table comments
COMMENT ON TABLE ap.pollensumgroups IS "";

--- Table indices
CREATE UNIQUE INDEX pollensumgroups_pkey ON ap.pollensumgroups USING btree (recid)

--- Remove existing constraints if needed
ALTER TABLE ap.pollensumgroups DROP CONSTRAINT IF EXISTS pollensumgroups_pkey;

--- Non-foreign key constraints
ALTER TABLE ap.pollensumgroups ADD CONSTRAINT pollensumgroups_pkey PRIMARY KEY (recid);

--- Foreign Key Restraints