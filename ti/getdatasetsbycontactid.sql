CREATE OR REPLACE FUNCTION ti.getdatasetsbycontactid(_contactid integer)
 RETURNS TABLE(datasetid integer, datasettype character varying, siteid integer, sitename character varying, geopolname1 character varying, geopolname2 character varying, geopolname3 character varying)
 LANGUAGE sql
AS $function$
SELECT ndb.datasetpis.datasetid, ndb.datasettypes.datasettype, ndb.sites.siteid, ndb.sites.sitename, ti.geopol1.geopolname1, 
          ti.geopol2.geopolname2, ti.geopol3.geopolname3
FROM ndb.datasetpis INNER JOIN
     ndb.datasets ON ndb.datasetpis.datasetid = ndb.datasets.datasetid INNER JOIN
     ndb.collectionunits ON ndb.datasets.collectionunitid = ndb.collectionunits.collectionunitid INNER JOIN
     ndb.sites ON ndb.collectionunits.siteid = ndb.sites.siteid INNER JOIN
     ndb.datasettypes ON ndb.datasets.datasettypeid = ndb.datasettypes.datasettypeid LEFT OUTER JOIN
     ti.geopol3 ON ndb.sites.siteid = ti.geopol3.siteid LEFT OUTER JOIN
     ti.geopol2 ON ndb.sites.siteid = ti.geopol2.siteid LEFT OUTER JOIN
     ti.geopol1 ON ndb.sites.siteid = ti.geopol1.siteid
WHERE ndb.datasetpis.contactid = _contactid
ORDER BY ndb.sites.sitename;
$function$
