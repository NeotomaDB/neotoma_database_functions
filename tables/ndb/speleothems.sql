-- speleothems definition

-- Drop table

-- DROP TABLE IF EXISTS speleothems.speleothems

CREATE TABLE speleothems.speleothems (
    siteid integer NULL,
    entityid integer DEFAULT nextval('ndb.speleothems_entityid_seq'::regclass) NOT NULL,
    entityname text NULL,
    monitoring boolean NULL,
    rockageid integer NULL,
    entrancedistance real NULL,
    entrancedistanceunits integer NULL,
    speleothemtypeid integer NULL,
    CONSTRAINT speleothems_pkey PRIMARY KEY (entityid)
);


-- adempiere.wmv_ghgaudit foreign keys

ALTER TABLE ndb.speleothems ADD CONSTRAINT speleothems_speleothemtypeid_fkey FOREIGN KEY (speleothemtypeid) REFERENCES ndb.speleothemtypes(speleothemtypeid);
ALTER TABLE ndb.speleothems ADD CONSTRAINT speleothems_entrancedistanceunits_fkey FOREIGN KEY (entrancedistanceunits) REFERENCES ndb.variableunits(variableunitsid);
ALTER TABLE ndb.speleothems ADD CONSTRAINT speleothems_rockageid_fkey FOREIGN KEY (rockageid) REFERENCES ndb.relativeages(relativeageid);
ALTER TABLE ndb.speleothems ADD CONSTRAINT speleothems_siteid_fkey FOREIGN KEY (siteid) REFERENCES ndb.sites(siteid) ON DELETE CASCADE;