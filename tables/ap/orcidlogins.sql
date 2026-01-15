-- orcidlogins definition

-- Drop table

-- DROP TABLE IF EXISTS orcidlogins.orcidlogins

CREATE TABLE orcidlogins.orcidlogins (
    orcidid text NULL,
    userip cidr NULL,
    sessionuuid uuid NULL,
    expiresat timestamp with time zone NULL,
    recdatecreated timestamp with time zone NULL,
    recdatemodified timestamp with time zone NULL,

);


-- adempiere.wmv_ghgaudit foreign keys

;