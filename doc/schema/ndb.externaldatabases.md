# ndb.externaldatabases

## Description

## Columns

| # | Name            | Type                           | Default                                                      | Nullable | Children                                                                                                                                                                                                                                                                                                                | Parents | Comment |
| - | --------------- | ------------------------------ | ------------------------------------------------------------ | -------- | ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ------- | ------- |
| 1 | extdatabaseid   | integer                        | nextval('ndb.seq_externaldatabases_extdatabaseid'::regclass) | false    | [ndb.contactreferences](ndb.contactreferences.md) [ndb.externalcontacts](ndb.externalcontacts.md) [ndb.externalgeochronology](ndb.externalgeochronology.md) [ndb.externalpublications](ndb.externalpublications.md) [ndb.externalspeleothemdata](ndb.externalspeleothemdata.md) [ndb.externaltaxa](ndb.externaltaxa.md) |         |         |
| 2 | extdatabasename | varchar(80)                    |                                                              | false    |                                                                                                                                                                                                                                                                                                                         |         |         |
| 3 | recdatecreated  | timestamp(0) without time zone | timezone('UTC'::text, now())                                 | false    |                                                                                                                                                                                                                                                                                                                         |         |         |
| 4 | recdatemodified | timestamp(0) without time zone |                                                              | false    |                                                                                                                                                                                                                                                                                                                         |         |         |
| 5 | url             | varchar(128)                   |                                                              | true     |                                                                                                                                                                                                                                                                                                                         |         |         |
| 6 | urlmask         | varchar(128)                   |                                                              | true     |                                                                                                                                                                                                                                                                                                                         |         |         |

## Viewpoints

| Name                                      | Definition                           |
| ----------------------------------------- | ------------------------------------ |
| [Controlled Vocabularies](viewpoint-0.md) | Tables with controlled vocabularies. |

## Constraints

| # | Name                   | Type        | Definition                  |
| - | ---------------------- | ----------- | --------------------------- |
| 1 | externaldatabases_pkey | PRIMARY KEY | PRIMARY KEY (extdatabaseid) |

## Indexes

| # | Name                   | Definition                                                                                      |
| - | ---------------------- | ----------------------------------------------------------------------------------------------- |
| 1 | externaldatabases_pkey | CREATE UNIQUE INDEX externaldatabases_pkey ON ndb.externaldatabases USING btree (extdatabaseid) |

## Triggers

| # | Name                | Definition                                                                                                                                     |
| - | ------------------- | ---------------------------------------------------------------------------------------------------------------------------------------------- |
| 1 | tr_sites_modifydate | CREATE TRIGGER tr_sites_modifydate BEFORE INSERT OR UPDATE ON ndb.externaldatabases FOR EACH ROW EXECUTE FUNCTION ndb.update_recdatemodified() |

## Relations

![er](ndb.externaldatabases.svg)

---

> Generated by [tbls](https://github.com/k1LoW/tbls)