# ap.gadm

## Description

## Columns

| #  | Name         | Type                        | Default                                   | Nullable | Children                                        | Parents | Comment |
| -- | ------------ | --------------------------- | ----------------------------------------- | -------- | ----------------------------------------------- | ------- | ------- |
| 1  | objectid     | integer                     | nextval('ap.gadm_objectid_seq'::regclass) | false    | [ndb.sitegeopolitical](ndb.sitegeopolitical.md) |         |         |
| 2  | uid          | integer                     |                                           | true     |                                                 |         |         |
| 3  | gid_0        | varchar(3)                  |                                           | true     |                                                 |         |         |
| 4  | name_0       | varchar(44)                 |                                           | true     |                                                 |         |         |
| 5  | varname_0    | varchar(29)                 |                                           | true     |                                                 |         |         |
| 6  | gid_1        | varchar(8)                  |                                           | true     |                                                 |         |         |
| 7  | name_1       | varchar(50)                 |                                           | true     |                                                 |         |         |
| 8  | varname_1    | varchar(129)                |                                           | true     |                                                 |         |         |
| 9  | nl_name_1    | varchar(87)                 |                                           | true     |                                                 |         |         |
| 10 | iso_1        | varchar(8)                  |                                           | true     |                                                 |         |         |
| 11 | hasc_1       | varchar(10)                 |                                           | true     |                                                 |         |         |
| 12 | cc_1         | varchar(9)                  |                                           | true     |                                                 |         |         |
| 13 | type_1       | varchar(37)                 |                                           | true     |                                                 |         |         |
| 14 | engtype_1    | varchar(37)                 |                                           | true     |                                                 |         |         |
| 15 | validfr_1    | varchar(15)                 |                                           | true     |                                                 |         |         |
| 16 | gid_2        | varchar(12)                 |                                           | true     |                                                 |         |         |
| 17 | name_2       | varchar(51)                 |                                           | true     |                                                 |         |         |
| 18 | varname_2    | varchar(116)                |                                           | true     |                                                 |         |         |
| 19 | nl_name_2    | varchar(75)                 |                                           | true     |                                                 |         |         |
| 20 | hasc_2       | varchar(15)                 |                                           | true     |                                                 |         |         |
| 21 | cc_2         | varchar(12)                 |                                           | true     |                                                 |         |         |
| 22 | type_2       | varchar(43)                 |                                           | true     |                                                 |         |         |
| 23 | engtype_2    | varchar(34)                 |                                           | true     |                                                 |         |         |
| 24 | validfr_2    | varchar(15)                 |                                           | true     |                                                 |         |         |
| 25 | gid_3        | varchar(15)                 |                                           | true     |                                                 |         |         |
| 26 | name_3       | varchar(64)                 |                                           | true     |                                                 |         |         |
| 27 | varname_3    | varchar(54)                 |                                           | true     |                                                 |         |         |
| 28 | nl_name_3    | varchar(56)                 |                                           | true     |                                                 |         |         |
| 29 | hasc_3       | varchar(27)                 |                                           | true     |                                                 |         |         |
| 30 | cc_3         | varchar(9)                  |                                           | true     |                                                 |         |         |
| 31 | type_3       | varchar(34)                 |                                           | true     |                                                 |         |         |
| 32 | engtype_3    | varchar(34)                 |                                           | true     |                                                 |         |         |
| 33 | validfr_3    | varchar(10)                 |                                           | true     |                                                 |         |         |
| 34 | gid_4        | varchar(18)                 |                                           | true     |                                                 |         |         |
| 35 | name_4       | varchar(98)                 |                                           | true     |                                                 |         |         |
| 36 | varname_4    | varchar(54)                 |                                           | true     |                                                 |         |         |
| 37 | cc_4         | varchar(12)                 |                                           | true     |                                                 |         |         |
| 38 | type_4       | varchar(29)                 |                                           | true     |                                                 |         |         |
| 39 | engtype_4    | varchar(29)                 |                                           | true     |                                                 |         |         |
| 40 | validfr_4    | varchar(7)                  |                                           | true     |                                                 |         |         |
| 41 | gid_5        | varchar(19)                 |                                           | true     |                                                 |         |         |
| 42 | name_5       | varchar(45)                 |                                           | true     |                                                 |         |         |
| 43 | cc_5         | varchar(15)                 |                                           | true     |                                                 |         |         |
| 44 | type_5       | varchar(22)                 |                                           | true     |                                                 |         |         |
| 45 | engtype_5    | varchar(255)                |                                           | true     |                                                 |         |         |
| 46 | governedby   | varchar(17)                 |                                           | true     |                                                 |         |         |
| 47 | sovereign    | varchar(32)                 |                                           | true     |                                                 |         |         |
| 48 | disputedby   | varchar(57)                 |                                           | true     |                                                 |         |         |
| 49 | region       | varchar(36)                 |                                           | true     |                                                 |         |         |
| 50 | varregion    | varchar(56)                 |                                           | true     |                                                 |         |         |
| 51 | country      | varchar(60)                 |                                           | true     |                                                 |         |         |
| 52 | continent    | varchar(15)                 |                                           | true     |                                                 |         |         |
| 53 | subcont      | varchar(25)                 |                                           | true     |                                                 |         |         |
| 54 | shape_length | double precision            |                                           | true     |                                                 |         |         |
| 55 | shape_area   | double precision            |                                           | true     |                                                 |         |         |
| 56 | shape        | geometry(MultiPolygon,4326) |                                           | true     |                                                 |         |         |

## Constraints

| # | Name      | Type        | Definition             |
| - | --------- | ----------- | ---------------------- |
| 1 | gadm_pkey | PRIMARY KEY | PRIMARY KEY (objectid) |

## Indexes

| # | Name                | Definition                                                      |
| - | ------------------- | --------------------------------------------------------------- |
| 1 | gadm_pkey           | CREATE UNIQUE INDEX gadm_pkey ON ap.gadm USING btree (objectid) |
| 2 | gadm_shape_geom_idx | CREATE INDEX gadm_shape_geom_idx ON ap.gadm USING gist (shape)  |

## Relations

![er](ap.gadm.svg)

---

> Generated by [tbls](https://github.com/k1LoW/tbls)