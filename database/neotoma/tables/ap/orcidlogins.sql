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
COMMENT ON TABLE ap.orcidlogins IS 'A table used to manage logins through ORCID for Neotoma-related applications.';
COMMENT ON COLUMN ap.orcidlogins.orcidid IS 'A valid ORCID ID assigned to a user who is using their ORCID to log into the Neotoma system.';
COMMENT ON COLUMN ap.orcidlogins.userip IS 'An IP address from the user who is logging in to the database system';
COMMENT ON COLUMN ap.orcidlogins.sessionuuid IS 'A unique UUID for the login instance.';
COMMENT ON COLUMN ap.orcidlogins.expiresat IS 'A datetime object at which the login period expires.';
COMMENT ON COLUMN ap.orcidlogins.recdatecreated IS 'datetime the record was created.';
COMMENT ON COLUMN ap.orcidlogins.recdatemodified IS 'datetime the record was last modified.';

--- Table indices


--- Remove existing constraints if needed

--- Non-foreign key constraints

--- Foreign Key Restraints

--- Triggers