-- ap definition

-- Drop table

-- DROP TABLE IF EXISTS ap.orcidlogins

CREATE TABLE IF NOT EXISTS ap.orcidlogins (

    orcidid text NULL,
    userip cidr NULL,
    sessionuuid uuid NULL,
    expiresat timestamp with time zone NULL,
    recdatecreated timestamp with time zone NULL,
    recdatemodified timestamp with time zone NULL

);


-- adempiere.wmv_ghgaudit constraints

--- Table comments
COMMENT ON TABLE ap.orcidlogins IS "";

--- Table indices


--- Remove existing constraints if needed

--- Non-foreign key constraints

--- Foreign Key Restraints