# ndb.taphonomicsystems

## Description

## Columns

| # | Name               | Type                           | Default                                                           | Nullable | Children                                                                                                                | Parents | Comment |
| - | ------------------ | ------------------------------ | ----------------------------------------------------------------- | -------- | ----------------------------------------------------------------------------------------------------------------------- | ------- | ------- |
| 1 | taphonomicsystemid | integer                        | nextval('ndb.seq_taphonomicsystems_taphonomicsystemid'::regclass) | false    | [ndb.taphonomicsystemsdatasettypes](ndb.taphonomicsystemsdatasettypes.md) [ndb.taphonomictypes](ndb.taphonomictypes.md) |         |         |
| 2 | taphonomicsystem   | varchar(64)                    |                                                                   | false    |                                                                                                                         |         |         |
| 3 | notes              | text                           |                                                                   | true     |                                                                                                                         |         |         |
| 4 | recdatecreated     | timestamp(0) without time zone | timezone('UTC'::text, now())                                      | false    |                                                                                                                         |         |         |
| 5 | recdatemodified    | timestamp(0) without time zone |                                                                   | false    |                                                                                                                         |         |         |

## Constraints

| # | Name                   | Type        | Definition                       |
| - | ---------------------- | ----------- | -------------------------------- |
| 1 | taphonomicsystems_pkey | PRIMARY KEY | PRIMARY KEY (taphonomicsystemid) |

## Indexes

| # | Name                   | Definition                                                                                           |
| - | ---------------------- | ---------------------------------------------------------------------------------------------------- |
| 1 | taphonomicsystems_pkey | CREATE UNIQUE INDEX taphonomicsystems_pkey ON ndb.taphonomicsystems USING btree (taphonomicsystemid) |

## Triggers

| # | Name                | Definition                                                                                                                                     |
| - | ------------------- | ---------------------------------------------------------------------------------------------------------------------------------------------- |
| 1 | tr_sites_modifydate | CREATE TRIGGER tr_sites_modifydate BEFORE INSERT OR UPDATE ON ndb.taphonomicsystems FOR EACH ROW EXECUTE FUNCTION ndb.update_recdatemodified() |

## Relations

![er](ndb.taphonomicsystems.svg)

---

> Generated by [tbls](https://github.com/k1LoW/tbls)