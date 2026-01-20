CREATE OR REPLACE FUNCTION public.wmv_get_table_definition (
    p_schema_name character varying,
    p_table_name character varying
)
    RETURNS SETOF TEXT
    AS $BODY$
BEGIN
    RETURN query 
    WITH table_rec AS (
        SELECT
            c.relname, n.nspname, c.oid, COALESCE(obj_description((p_schema_name||'.'||quote_ident(p_table_name))::regclass), '') AS commentlines
        FROM
            pg_catalog.pg_class c
            LEFT JOIN pg_catalog.pg_namespace n ON n.oid = c.relnamespace

        WHERE
            relkind = 'r'
            AND n.nspname = p_schema_name
            AND c.relname LIKE p_table_name
        ORDER BY
            c.relname
    ),
    col_rec AS (
        SELECT
            a.attname AS colname,
            pg_catalog.format_type(a.atttypid, a.atttypmod) AS coltype,
            a.attrelid AS oid,
            ' DEFAULT ' || (
                SELECT
                    pg_catalog.pg_get_expr(d.adbin, d.adrelid)
                FROM
                    pg_catalog.pg_attrdef d
                WHERE
                    d.adrelid = a.attrelid
                    AND d.adnum = a.attnum
                    AND a.atthasdef) AS column_default_value,
            CASE WHEN a.attnotnull = TRUE THEN
                'NOT NULL'
            ELSE
                'NULL'
            END AS column_not_null,
            a.attnum AS attnum
        FROM
            pg_catalog.pg_attribute a
        WHERE
            a.attnum > 0
            AND NOT a.attisdropped
        ORDER BY
            a.attnum
    ),
    con_rec AS (
        SELECT
            conrelid::regclass::text AS relname,
            n.nspname,
            conname,
            pg_get_constraintdef(c.oid) AS condef,
            contype,
            conrelid AS oid
        FROM
            pg_constraint c
            JOIN pg_namespace n ON n.oid = c.connamespace
    ),
    glue AS (
        SELECT
            format( E'-- %1$I definition\n\n-- Drop table\n\n-- DROP TABLE IF EXISTS %1$I.%2$I\n\nCREATE TABLE IF NOT EXISTS %1$I.%2$I (\n', p_schema_name, table_rec.relname) AS top,
            format( E'\n);\n\n\n-- adempiere.wmv_ghgaudit constraints') AS bottom,
            oid
        FROM
            table_rec
    ),
    cols AS (
        SELECT
            string_agg(format('    %I %s%s %s', colname, coltype, column_default_value, column_not_null), E',\n') AS lines,
            oid
        FROM
            col_rec
        GROUP BY
            oid
    ),
    constrnt AS (
        SELECT
            string_agg(format('ALTER TABLE %s DROP CONSTRAINT IF EXISTS %s;', relname, con_rec.conname), E'\n') AS droplines,
            string_agg(format('ALTER TABLE %s ADD CONSTRAINT %s %s;', relname, con_rec.conname, con_rec.condef), E'\n') AS addlines,
            oid
        FROM
            con_rec
        WHERE
            contype <> 'f'
        GROUP BY
            oid
    ),
    frnkey AS (
        SELECT
            string_agg(format('ALTER TABLE %s ADD CONSTRAINT %s %s;', relname, conname, condef), E'\n') AS lines,
            oid
        FROM
            con_rec
        WHERE
            contype = 'f'
        GROUP BY
            oid
    ),
    indexlines AS (
        SELECT string_agg(format('%s', pgi.indexdef), E';\n') AS indices,
            oid
        FROM table_rec
        LEFT JOIN (SELECT * FROM pg_indexes) AS pgi ON (table_rec.relname = pgi.tablename AND table_rec.nspname = pgi.schemaname)
        GROUP BY oid
    ),
    commentlines AS (
        SELECT
            string_agg(format('COMMENT ON TABLE %1$I.%2$I IS %3$I;', p_schema_name, table_rec.relname, table_rec.commentlines), E'\n') AS lines,
            oid
        FROM
            table_rec
        GROUP BY
            oid
            
    )
    SELECT
        concat_ws(E'\n',
            glue.top,
            cols.lines,
            glue.bottom,
            E'\n--- Table comments', commentlines.lines,
            E'\n--- Table indices', indexlines.indices,
            E'\n--- Remove existing constraints if needed', constrnt.droplines,
            E'\n--- Non-foreign key constraints', constrnt.addlines,
            E'\n--- Foreign Key Restraints', frnkey.lines)
    FROM
        glue
        JOIN cols ON cols.oid = glue.oid
        LEFT JOIN constrnt ON constrnt.oid = glue.oid
        LEFT JOIN commentlines ON commentlines.oid = glue.oid
        LEFT JOIN indexlines ON indexlines.oid = glue.oid
        LEFT JOIN frnkey ON frnkey.oid = glue.oid;
END;
$BODY$
LANGUAGE plpgsql;