# ndb.decayconstants

## Description

## Columns

| # | Name            | Type    | Default                                                     | Nullable | Children                                  | Parents                                 | Comment |
| - | --------------- | ------- | ----------------------------------------------------------- | -------- | ----------------------------------------- | --------------------------------------- | ------- |
| 1 | decayconstantid | integer | nextval('ndb.decayconstants_decayconstantid_seq'::regclass) | false    | [ndb.uraniumseries](ndb.uraniumseries.md) |                                         |         |
| 2 | decayconstant   | text    |                                                             | true     |                                           |                                         |         |
| 3 | publicationid   | integer |                                                             | true     |                                           | [ndb.publications](ndb.publications.md) |         |
| 4 | notes           | text    |                                                             | true     |                                           |                                         |         |

## Constraints

| # | Name                              | Type        | Definition                                                             |
| - | --------------------------------- | ----------- | ---------------------------------------------------------------------- |
| 1 | decayconstants_publicationid_fkey | FOREIGN KEY | FOREIGN KEY (publicationid) REFERENCES ndb.publications(publicationid) |
| 2 | decayconstants_pkey               | PRIMARY KEY | PRIMARY KEY (decayconstantid)                                          |

## Indexes

| # | Name                | Definition                                                                                  |
| - | ------------------- | ------------------------------------------------------------------------------------------- |
| 1 | decayconstants_pkey | CREATE UNIQUE INDEX decayconstants_pkey ON ndb.decayconstants USING btree (decayconstantid) |

## Relations

![er](ndb.decayconstants.svg)

---

> Generated by [tbls](https://github.com/k1LoW/tbls)