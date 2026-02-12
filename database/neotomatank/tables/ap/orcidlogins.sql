-- ap.orcidlogins Table definition

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


-- Table Constraints, Comments and Triggers

--- Table comments
COMMENT ON TABLE ap.orcidlogins IS '';
COMMENT ON COLUMN ap.orcidlogins.orcidid IS '';
COMMENT ON COLUMN ap.orcidlogins.userip IS '';
COMMENT ON COLUMN ap.orcidlogins.sessionuuid IS '';
COMMENT ON COLUMN ap.orcidlogins.expiresat IS '';
COMMENT ON COLUMN ap.orcidlogins.recdatecreated IS '';
COMMENT ON COLUMN ap.orcidlogins.recdatemodified IS '';

--- Table indices


--- Remove existing constraints if needed

--- Non-foreign key constraints

--- Foreign Key Restraints

--- Triggers