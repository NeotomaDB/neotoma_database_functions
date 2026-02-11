-- ap.gadm Table definition

-- Drop table

-- DROP TABLE IF EXISTS ap.gadm

CREATE TABLE IF NOT EXISTS ap.gadm (

    objectid integer DEFAULT nextval('ap.gadm_objectid_seq'::regclass) NOT NULL,
    uid integer NULL,
    gid_0 character varying(3) NULL,
    name_0 character varying(44) NULL,
    varname_0 character varying(29) NULL,
    gid_1 character varying(8) NULL,
    name_1 character varying(50) NULL,
    varname_1 character varying(129) NULL,
    nl_name_1 character varying(87) NULL,
    iso_1 character varying(8) NULL,
    hasc_1 character varying(10) NULL,
    cc_1 character varying(9) NULL,
    type_1 character varying(37) NULL,
    engtype_1 character varying(37) NULL,
    validfr_1 character varying(15) NULL,
    gid_2 character varying(12) NULL,
    name_2 character varying(51) NULL,
    varname_2 character varying(116) NULL,
    nl_name_2 character varying(75) NULL,
    hasc_2 character varying(15) NULL,
    cc_2 character varying(12) NULL,
    type_2 character varying(43) NULL,
    engtype_2 character varying(34) NULL,
    validfr_2 character varying(15) NULL,
    gid_3 character varying(15) NULL,
    name_3 character varying(64) NULL,
    varname_3 character varying(54) NULL,
    nl_name_3 character varying(56) NULL,
    hasc_3 character varying(27) NULL,
    cc_3 character varying(9) NULL,
    type_3 character varying(34) NULL,
    engtype_3 character varying(34) NULL,
    validfr_3 character varying(10) NULL,
    gid_4 character varying(18) NULL,
    name_4 character varying(98) NULL,
    varname_4 character varying(54) NULL,
    cc_4 character varying(12) NULL,
    type_4 character varying(29) NULL,
    engtype_4 character varying(29) NULL,
    validfr_4 character varying(7) NULL,
    gid_5 character varying(19) NULL,
    name_5 character varying(45) NULL,
    cc_5 character varying(15) NULL,
    type_5 character varying(22) NULL,
    engtype_5 character varying(255) NULL,
    governedby character varying(17) NULL,
    sovereign character varying(32) NULL,
    disputedby character varying(57) NULL,
    region character varying(36) NULL,
    varregion character varying(56) NULL,
    country character varying(60) NULL,
    continent character varying(15) NULL,
    subcont character varying(25) NULL,
    shape_length double precision NULL,
    shape_area double precision NULL,
    shape geometry(MultiPolygon,4326) NULL

);


-- Table Constraints, Comments and Triggers

--- Table comments
COMMENT ON TABLE ap.gadm IS "";

--- Table indices
CREATE UNIQUE INDEX gadm_pkey ON ap.gadm USING btree (objectid);
CREATE INDEX gadm_shape_geom_idx ON ap.gadm USING gist (shape)

--- Remove existing constraints if needed
-- ALTER TABLE ap.gadm DROP CONSTRAINT IF EXISTS gadm_pkey;

--- Non-foreign key constraints
ALTER TABLE ap.gadm ADD CONSTRAINT gadm_pkey PRIMARY KEY (objectid);

--- Foreign Key Restraints

--- Triggers