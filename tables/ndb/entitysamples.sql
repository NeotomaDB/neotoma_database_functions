-- entitysamples definition

-- Drop table

-- DROP TABLE IF EXISTS entitysamples.entitysamples

CREATE TABLE entitysamples.entitysamples (
    entityid integer NOT NULL,
    organics boolean NULL,
    fluid_inclusions boolean NULL,
    mineralogy_petrology_fabric boolean NULL,
    clumped_isotopes boolean NULL,
    noble_gas_temperatures boolean NULL,
    c14 boolean NULL,
    odl boolean NULL,
    CONSTRAINT entitysamples_pkey PRIMARY KEY (entityid)
);


-- adempiere.wmv_ghgaudit foreign keys

ALTER TABLE ndb.entitysamples ADD CONSTRAINT entitysamples_entityid_fkey FOREIGN KEY (entityid) REFERENCES ndb.speleothems(entityid);