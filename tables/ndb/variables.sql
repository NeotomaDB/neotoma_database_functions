-- variables definition

-- Drop table

-- DROP TABLE IF EXISTS variables.variables

CREATE TABLE variables.variables (
    variableid integer DEFAULT nextval('ndb.seq_variables_variableid'::regclass) NOT NULL,
    taxonid integer NOT NULL,
    variableelementid integer NULL,
    variableunitsid integer NULL,
    variablecontextid integer NULL,
    recdatecreated timestamp(0) without time zone DEFAULT timezone('UTC'::text, now()) NOT NULL,
    recdatemodified timestamp(0) without time zone NOT NULL,
    CONSTRAINT variables_pkey PRIMARY KEY (variableid),
    CONSTRAINT variables_unique UNIQUE (taxonid, variableelementid, variableunitsid, variablecontextid)
);


-- adempiere.wmv_ghgaudit foreign keys

ALTER TABLE ndb.variables ADD CONSTRAINT fk_variables_variablecontexts FOREIGN KEY (variablecontextid) REFERENCES ndb.variablecontexts(variablecontextid) ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE ndb.variables ADD CONSTRAINT fk_variables_taxa FOREIGN KEY (taxonid) REFERENCES ndb.taxa(taxonid) ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE ndb.variables ADD CONSTRAINT fk_variables_variableunits FOREIGN KEY (variableunitsid) REFERENCES ndb.variableunits(variableunitsid) ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE ndb.variables ADD CONSTRAINT fk_variables_variableelements FOREIGN KEY (variableelementid) REFERENCES ndb.variableelements(variableelementid) ON UPDATE CASCADE ON DELETE CASCADE;