CREATE OR REPLACE FUNCTION ts.insertradiocarbon(_geochronid integer, _radiocarbonmethodid integer DEFAULT NULL::integer, _percentc double precision DEFAULT NULL::double precision, _percentn double precision DEFAULT NULL::double precision, _delta13c double precision DEFAULT NULL::double precision, _delta15n double precision DEFAULT NULL::double precision, _cnratio double precision DEFAULT NULL::double precision, _masscmg double precision DEFAULT NULL::double precision, _percentcollagen double precision DEFAULT NULL::double precision, _reservoir double precision DEFAULT NULL::double precision)
 RETURNS void
 LANGUAGE sql
AS $function$
  INSERT INTO ndb.radiocarbon(geochronid, radiocarbonmethodid, percentc,
    percentn, delta13c, delta15n, percentcollagen, reservoir, masscmg, cnratio)
  VALUES (_geochronid, _radiocarbonmethodid, _percentc, _percentn, _delta13c,
    _delta15n, _percentcollagen, _reservoir, _masscmg, _cnratio)
  ON CONFLICT (geochronid) DO UPDATE
  SET radiocarbonmethodid = COALESCE(EXCLUDED.radiocarbonmethodid, ndb.radiocarbon.radiocarbonmethodid),
      percentc = COALESCE(EXCLUDED.percentc, ndb.radiocarbon.percentc),
      percentn = COALESCE(EXCLUDED.percentn, ndb.radiocarbon.percentn),
      delta13c = COALESCE(EXCLUDED.delta13c, ndb.radiocarbon.delta13c),
      delta15n = COALESCE(EXCLUDED.delta15n, ndb.radiocarbon.delta15n),
      percentcollagen = COALESCE(EXCLUDED.percentcollagen, ndb.radiocarbon.percentcollagen),
      reservoir = COALESCE(EXCLUDED.reservoir, ndb.radiocarbon.reservoir),
      masscmg = COALESCE(EXCLUDED.masscmg, ndb.radiocarbon.masscmg),
      cnratio = COALESCE(EXCLUDED.cnratio, ndb.radiocarbon.cnratio)
$function$
