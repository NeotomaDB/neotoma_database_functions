# ndb.speleothems

## Description

## Columns

| # | Name                  | Type    | Default                                           | Nullable | Children                                                                                                                                                                                                                                                                                                                                                                                                                                                                    | Parents                                       | Comment |
| - | --------------------- | ------- | ------------------------------------------------- | -------- | --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | --------------------------------------------- | ------- |
| 1 | entityid              | integer | nextval('ndb.speleothems_entityid_seq'::regclass) | false    | [ndb.entitycovers](ndb.entitycovers.md) [ndb.entitydripheight](ndb.entitydripheight.md) [ndb.entitygeology](ndb.entitygeology.md) [ndb.entitylandusecover](ndb.entitylandusecover.md) [ndb.entityrelationship](ndb.entityrelationship.md) [ndb.entitysamples](ndb.entitysamples.md) [ndb.entityvegetationcover](ndb.entityvegetationcover.md) [ndb.externalspeleothemdata](ndb.externalspeleothemdata.md) [ndb.speleothemcollectionunits](ndb.speleothemcollectionunits.md) |                                               |         |
| 2 | entityname            | text    |                                                   | true     |                                                                                                                                                                                                                                                                                                                                                                                                                                                                             |                                               |         |
| 3 | entrancedistance      | real    |                                                   | true     |                                                                                                                                                                                                                                                                                                                                                                                                                                                                             |                                               |         |
| 4 | entrancedistanceunits | integer |                                                   | true     |                                                                                                                                                                                                                                                                                                                                                                                                                                                                             | [ndb.variableunits](ndb.variableunits.md)     |         |
| 5 | monitoring            | boolean |                                                   | true     |                                                                                                                                                                                                                                                                                                                                                                                                                                                                             |                                               |         |
| 6 | rockageid             | integer |                                                   | true     |                                                                                                                                                                                                                                                                                                                                                                                                                                                                             | [ndb.relativeages](ndb.relativeages.md)       |         |
| 7 | siteid                | integer |                                                   | true     |                                                                                                                                                                                                                                                                                                                                                                                                                                                                             | [ndb.sites](ndb.sites.md)                     |         |
| 8 | speleothemtypeid      | integer |                                                   | true     |                                                                                                                                                                                                                                                                                                                                                                                                                                                                             | [ndb.speleothemtypes](ndb.speleothemtypes.md) |         |

## Constraints

| # | Name                                   | Type        | Definition                                                                        |
| - | -------------------------------------- | ----------- | --------------------------------------------------------------------------------- |
| 1 | speleothems_entrancedistanceunits_fkey | FOREIGN KEY | FOREIGN KEY (entrancedistanceunits) REFERENCES ndb.variableunits(variableunitsid) |
| 2 | speleothems_pkey                       | PRIMARY KEY | PRIMARY KEY (entityid)                                                            |
| 3 | speleothems_rockageid_fkey             | FOREIGN KEY | FOREIGN KEY (rockageid) REFERENCES ndb.relativeages(relativeageid)                |
| 4 | speleothems_siteid_fkey                | FOREIGN KEY | FOREIGN KEY (siteid) REFERENCES ndb.sites(siteid) ON DELETE CASCADE               |
| 5 | speleothems_speleothemtypeid_fkey      | FOREIGN KEY | FOREIGN KEY (speleothemtypeid) REFERENCES ndb.speleothemtypes(speleothemtypeid)   |

## Indexes

| # | Name             | Definition                                                                     |
| - | ---------------- | ------------------------------------------------------------------------------ |
| 1 | speleothems_pkey | CREATE UNIQUE INDEX speleothems_pkey ON ndb.speleothems USING btree (entityid) |

## Relations

![er](ndb.speleothems.svg)

---

> Generated by [tbls](https://github.com/k1LoW/tbls)