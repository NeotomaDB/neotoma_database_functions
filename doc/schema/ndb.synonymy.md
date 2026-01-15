# ndb.synonymy

## Description

The synonymy table links dataset-level synonymies to particular publications or contacts.  This allows users to maintain the original taxonomic information within a table, but tie it to newer and more authoritative taxonomic information.

## Columns

| #  | Name            | Type                           | Default                                          | Nullable | Children | Parents                                 | Comment                           |
| -- | --------------- | ------------------------------ | ------------------------------------------------ | -------- | -------- | --------------------------------------- | --------------------------------- |
| 1  | contactid       | integer                        |                                                  | true     |          | [ndb.contacts](ndb.contacts.md)         |                                   |
| 2  | datasetid       | integer                        |                                                  | false    |          | [ndb.datasets](ndb.datasets.md)         | DatasetID from the Datasets table |
| 3  | datesynonymized | date                           |                                                  | true     |          |                                         |                                   |
| 4  | fromcontributor | boolean                        |                                                  | true     |          |                                         |                                   |
| 5  | notes           | text                           |                                                  | true     |          |                                         |                                   |
| 6  | publicationid   | integer                        |                                                  | true     |          | [ndb.publications](ndb.publications.md) |                                   |
| 7  | recdatecreated  | timestamp(0) without time zone | timezone('UTC'::text, now())                     | false    |          |                                         |                                   |
| 8  | recdatemodified | timestamp(0) without time zone |                                                  | false    |          |                                         |                                   |
| 9  | reftaxonid      | integer                        |                                                  | false    |          | [ndb.taxa](ndb.taxa.md)                 |                                   |
| 10 | synonymyid      | integer                        | nextval('ndb.seq_synonymy_synonymyid'::regclass) | false    |          |                                         |                                   |
| 11 | taxonid         | integer                        |                                                  | false    |          | [ndb.taxa](ndb.taxa.md)                 |                                   |

## Viewpoints

| Name                                     | Definition                                                       |
| ---------------------------------------- | ---------------------------------------------------------------- |
| [Contact related tables](viewpoint-4.md) | Tables that relate to people, or are connected to the contactid. |

## Constraints

| # | Name                     | Type        | Definition                                                                                                 |
| - | ------------------------ | ----------- | ---------------------------------------------------------------------------------------------------------- |
| 1 | fk_synonymy_contacts     | FOREIGN KEY | FOREIGN KEY (contactid) REFERENCES ndb.contacts(contactid)                                                 |
| 2 | fk_synonymy_datasets     | FOREIGN KEY | FOREIGN KEY (datasetid) REFERENCES ndb.datasets(datasetid) ON UPDATE CASCADE ON DELETE CASCADE             |
| 3 | fk_synonymy_publications | FOREIGN KEY | FOREIGN KEY (publicationid) REFERENCES ndb.publications(publicationid) ON UPDATE CASCADE ON DELETE CASCADE |
| 4 | fk_synonymy_taxa1        | FOREIGN KEY | FOREIGN KEY (taxonid) REFERENCES ndb.taxa(taxonid) ON UPDATE CASCADE ON DELETE CASCADE                     |
| 5 | fk_synonymy_taxa2        | FOREIGN KEY | FOREIGN KEY (reftaxonid) REFERENCES ndb.taxa(taxonid)                                                      |
| 6 | synonymy_pkey            | PRIMARY KEY | PRIMARY KEY (synonymyid)                                                                                   |

## Indexes

| # | Name          | Definition                                                                 |
| - | ------------- | -------------------------------------------------------------------------- |
| 1 | synonymy_pkey | CREATE UNIQUE INDEX synonymy_pkey ON ndb.synonymy USING btree (synonymyid) |

## Triggers

| # | Name                | Definition                                                                                                                            |
| - | ------------------- | ------------------------------------------------------------------------------------------------------------------------------------- |
| 1 | tr_sites_modifydate | CREATE TRIGGER tr_sites_modifydate BEFORE INSERT OR UPDATE ON ndb.synonymy FOR EACH ROW EXECUTE FUNCTION ndb.update_recdatemodified() |

## Relations

![er](ndb.synonymy.svg)

---

> Generated by [tbls](https://github.com/k1LoW/tbls)