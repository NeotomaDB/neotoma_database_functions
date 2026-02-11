-- ap.summaries Table definition

-- Drop table

-- DROP TABLE IF EXISTS ap.summaries

CREATE TABLE IF NOT EXISTS ap.summaries (

    dbdate date NOT NULL,
    sites bigint NULL,
    datasets bigint NULL,
    publications bigint NULL,
    observations bigint NULL

);


-- Table Constraints, Comments and Triggers

--- Table comments
COMMENT ON TABLE ap.summaries IS "";

--- Table indices
CREATE UNIQUE INDEX summaries_pkey ON ap.summaries USING btree (dbdate)

--- Remove existing constraints if needed
-- ALTER TABLE ap.summaries DROP CONSTRAINT IF EXISTS summaries_pkey;

--- Non-foreign key constraints
ALTER TABLE ap.summaries ADD CONSTRAINT summaries_pkey PRIMARY KEY (dbdate);

--- Foreign Key Restraints

--- Triggers