# ndb.isospecimendata

## Description

## Columns

| # | Name              | Type                           | Default                                                        | Nullable | Children | Parents                           | Comment |
| - | ----------------- | ------------------------------ | -------------------------------------------------------------- | -------- | -------- | --------------------------------- | ------- |
| 1 | isospecimendataid | integer                        | nextval('ndb.seq_isospecimendata_isospecimendataid'::regclass) | false    |          |                                   |         |
| 2 | dataid            | integer                        |                                                                | false    |          | [ndb.data](ndb.data.md)           |         |
| 3 | specimenid        | integer                        |                                                                | false    |          | [ndb.specimens](ndb.specimens.md) |         |
| 4 | sd                | double precision               |                                                                | true     |          |                                   |         |
| 5 | recdatecreated    | timestamp(0) without time zone | timezone('UTC'::text, now())                                   | false    |          |                                   |         |
| 6 | recdatemodified   | timestamp(0) without time zone |                                                                | false    |          |                                   |         |

## Constraints

| # | Name                         | Type        | Definition                                                                           |
| - | ---------------------------- | ----------- | ------------------------------------------------------------------------------------ |
| 1 | fk_isospecimendata_data      | FOREIGN KEY | FOREIGN KEY (dataid) REFERENCES ndb.data(dataid) ON UPDATE CASCADE ON DELETE CASCADE |
| 2 | isospecimendata_pkey         | PRIMARY KEY | PRIMARY KEY (isospecimendataid)                                                      |
| 3 | fk_isospecimendata_specimens | FOREIGN KEY | FOREIGN KEY (specimenid) REFERENCES ndb.specimens(specimenid) ON DELETE CASCADE      |

## Indexes

| # | Name                 | Definition                                                                                      |
| - | -------------------- | ----------------------------------------------------------------------------------------------- |
| 1 | isospecimendata_pkey | CREATE UNIQUE INDEX isospecimendata_pkey ON ndb.isospecimendata USING btree (isospecimendataid) |

## Triggers

| # | Name                | Definition                                                                                                                                   |
| - | ------------------- | -------------------------------------------------------------------------------------------------------------------------------------------- |
| 1 | tr_sites_modifydate | CREATE TRIGGER tr_sites_modifydate BEFORE INSERT OR UPDATE ON ndb.isospecimendata FOR EACH ROW EXECUTE FUNCTION ndb.update_recdatemodified() |

## Relations

![er](ndb.isospecimendata.svg)

---

> Generated by [tbls](https://github.com/k1LoW/tbls)