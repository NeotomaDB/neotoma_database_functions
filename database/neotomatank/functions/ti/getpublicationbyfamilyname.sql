CREATE OR REPLACE FUNCTION ti.getpublicationbyfamilyname(_familyname character varying)
 RETURNS TABLE(publicationid integer, pubtypeid integer, year character varying, citation text, articletitle text, journal text, volume character varying, issue character varying, pages character varying, citationnumber character varying, doi character varying, booktitle text, numvolumes character varying, edition character varying, volumetitle text, seriestitle text, seriesvolume character varying, publisher character varying, url text, city character varying, state character varying, country character varying, originallanguage character varying, notes text, recdatecreated timestamp without time zone, recdatemodified timestamp without time zone)
 LANGUAGE sql
AS $function$
SELECT ndb.publications.publicationid, ndb.publications.pubtypeid,
       ndb.publications.year, ndb.publications.citation,
       ndb.publications.articletitle, ndb.publications.journal,
       ndb.publications.volume, ndb.publications.issue,
       ndb.publications.pages, ndb.publications.citationnumber,
       ndb.publications.doi, ndb.publications.booktitle,
       ndb.publications.numvolumes, ndb.publications.edition,
       ndb.publications.volumetitle, ndb.publications.seriestitle,
       ndb.publications.seriesvolume, ndb.publications.publisher,
       ndb.publications.url, ndb.publications.city, ndb.publications.state,
       ndb.publications.country, ndb.publications.originallanguage,
       ndb.publications.notes, ndb.publications.recdatecreated, ndb.publications.recdatemodified 
FROM ndb.publicationauthors inner join
                      ndb.contacts ON ndb.publicationauthors.contactid = ndb.contacts.contactid INNER JOIN
                      ndb.publications ON ndb.publicationauthors.publicationid = ndb.publications.publicationid
WHERE (ndb.contacts.familyname ILIKE $1) OR (ndb.publicationauthors.familyname ILIKE $1);
$function$
