# ndb.chroncontrolranks

## Description

## Columns

| # | Name                   | Type                           | Default                                                           | Nullable | Children | Parents                                                                           | Comment |
| - | ---------------------- | ------------------------------ | ----------------------------------------------------------------- | -------- | -------- | --------------------------------------------------------------------------------- | ------- |
| 1 | chroncontrolrankid     | integer                        | nextval('ndb.seq_chroncontrolranks_chroncontrolrankid'::regclass) | false    |          |                                                                                   |         |
| 2 | chroncontrolid         | integer                        |                                                                   | true     |          | [ndb.chroncontrols](ndb.chroncontrols.md)                                         |         |
| 3 | accuracyrankid         | integer                        |                                                                   | true     |          | [ndb.chroncontrolaccuracyranks](ndb.chroncontrolaccuracyranks.md)                 |         |
| 4 | accuracydirectionid    | integer                        |                                                                   | true     |          | [ndb.chroncontrolaccuracydirections](ndb.chroncontrolaccuracydirections.md)       |         |
| 5 | accuracydistributionid | integer                        |                                                                   | true     |          | [ndb.chroncontrolaccuracydistributions](ndb.chroncontrolaccuracydistributions.md) |         |
| 6 | precisionrankid        | integer                        |                                                                   | true     |          | [ndb.chroncontrolprecisionranks](ndb.chroncontrolprecisionranks.md)               |         |
| 7 | outlier                | boolean                        |                                                                   | true     |          |                                                                                   |         |
| 8 | recdatecreated         | timestamp(0) without time zone | timezone('UTC'::text, now())                                      | false    |          |                                                                                   |         |
| 9 | recdatemodified        | timestamp(0) without time zone |                                                                   | false    |          |                                                                                   |         |

## Constraints

| # | Name                                                   | Type        | Definition                                                                                                                                        |
| - | ------------------------------------------------------ | ----------- | ------------------------------------------------------------------------------------------------------------------------------------------------- |
| 1 | fk_chroncontrolranks_chroncontrolaccuracydirections    | FOREIGN KEY | FOREIGN KEY (accuracydirectionid) REFERENCES ndb.chroncontrolaccuracydirections(accuracydirectionid) ON UPDATE CASCADE ON DELETE CASCADE          |
| 2 | fk_chroncontrolranks_chroncontrolaccuracydistributions | FOREIGN KEY | FOREIGN KEY (accuracydistributionid) REFERENCES ndb.chroncontrolaccuracydistributions(accuracydistributionid) ON UPDATE CASCADE ON DELETE CASCADE |
| 3 | fk_chroncontrolranks_chroncontrolaccuracyranks         | FOREIGN KEY | FOREIGN KEY (accuracyrankid) REFERENCES ndb.chroncontrolaccuracyranks(accuracyrankid) ON UPDATE CASCADE ON DELETE CASCADE                         |
| 4 | fk_chroncontrolranks_chroncontrolprecisionranks        | FOREIGN KEY | FOREIGN KEY (precisionrankid) REFERENCES ndb.chroncontrolprecisionranks(precisionrankid) ON UPDATE CASCADE ON DELETE CASCADE                      |
| 5 | chroncontrolranks_pkey                                 | PRIMARY KEY | PRIMARY KEY (chroncontrolrankid)                                                                                                                  |
| 6 | fk_chroncontrolranks_chroncontrols                     | FOREIGN KEY | FOREIGN KEY (chroncontrolid) REFERENCES ndb.chroncontrols(chroncontrolid) ON UPDATE CASCADE ON DELETE CASCADE                                     |

## Indexes

| # | Name                   | Definition                                                                                           |
| - | ---------------------- | ---------------------------------------------------------------------------------------------------- |
| 1 | chroncontrolranks_pkey | CREATE UNIQUE INDEX chroncontrolranks_pkey ON ndb.chroncontrolranks USING btree (chroncontrolrankid) |

## Triggers

| # | Name                | Definition                                                                                                                                     |
| - | ------------------- | ---------------------------------------------------------------------------------------------------------------------------------------------- |
| 1 | tr_sites_modifydate | CREATE TRIGGER tr_sites_modifydate BEFORE INSERT OR UPDATE ON ndb.chroncontrolranks FOR EACH ROW EXECUTE FUNCTION ndb.update_recdatemodified() |

## Relations

![er](ndb.chroncontrolranks.svg)

---

> Generated by [tbls](https://github.com/k1LoW/tbls)