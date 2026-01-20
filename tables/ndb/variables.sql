-- ndb definition

-- Drop table

-- DROP TABLE IF EXISTS ndb.variables

CREATE TABLE IF NOT EXISTS ndb.variables (

    variableid integer DEFAULT nextval('ndb.seq_variables_variableid'::regclass) NOT NULL,
    taxonid integer NOT NULL,
    variableelementid integer NULL,
    variableunitsid integer NULL,
    variablecontextid integer NULL,
    recdatecreated timestamp(0) without time zone DEFAULT timezone('UTC'::text, now()) NOT NULL,
    recdatemodified timestamp(0) without time zone NOT NULL

);


-- adempiere.wmv_ghgaudit constraints

--- Table comments
COMMENT ON TABLE ndb.variables IS "This table lists Variables, which always consist of a Taxon and Units of measurement. Variables can also have Elements, Contexts, and Modifications. Thus, the same taxon with different measurement units (e.g. present/absent, NISP, MNI) are different Variables.";

--- Table indices
CREATE UNIQUE INDEX variables_pkey ON ndb.variables USING btree (variableid);
CREATE INDEX ix_taxonid_variables ON ndb.variables USING btree (taxonid) WITH (fillfactor='10');
CREATE INDEX variableel ON ndb.variables USING btree (taxonid, variableelementid, variableunitsid);
CREATE UNIQUE INDEX variables_unique ON ndb.variables USING btree (taxonid, variableelementid, variableunitsid, variablecontextid)

--- Remove existing constraints if needed
ALTER TABLE ndb.variables DROP CONSTRAINT IF EXISTS variables_pkey;
ALTER TABLE ndb.variables DROP CONSTRAINT IF EXISTS variables_unique;

--- Non-foreign key constraints
ALTER TABLE ndb.variables ADD CONSTRAINT variables_pkey PRIMARY KEY (variableid);
ALTER TABLE ndb.variables ADD CONSTRAINT variables_unique UNIQUE (taxonid, variableelementid, variableunitsid, variablecontextid);

--- Foreign Key Restraints
ALTER TABLE ndb.variables ADD CONSTRAINT fk_variables_variablecontexts FOREIGN KEY (variablecontextid) REFERENCES ndb.variablecontexts(variablecontextid) ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE ndb.variables ADD CONSTRAINT fk_variables_taxa FOREIGN KEY (taxonid) REFERENCES ndb.taxa(taxonid) ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE ndb.variables ADD CONSTRAINT fk_variables_variableunits FOREIGN KEY (variableunitsid) REFERENCES ndb.variableunits(variableunitsid) ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE ndb.variables ADD CONSTRAINT fk_variables_variableelements FOREIGN KEY (variableelementid) REFERENCES ndb.variableelements(variableelementid) ON UPDATE CASCADE ON DELETE CASCADE;