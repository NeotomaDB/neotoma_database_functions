CREATE OR REPLACE FUNCTION doi.chronmeta(dsid integer[])
 RETURNS TABLE(datasetid integer, chronologies json)
 LANGUAGE sql
AS $function$
	WITH contactinfo AS (
		SELECT
		chrs.chronologyid,
		json_agg(json_build_object('contactid', cnt.contactid,
											'contactname', cnt.contactname,
											'familyname', cnt.familyname,
											'givenname', cnt.givennames,
											'leadinginitial', cnt.leadinginitials)) AS contact
			FROM ndb.dslinks AS dsl
			LEFT OUTER JOIN     ndb.chronologies AS chrs    ON chrs.collectionunitid = dsl.collectionunitid
			LEFT OUTER JOIN          ndb.contacts AS cnt    ON cnt.contactid = chrs.contactid
		WHERE    dsl.datasetid = ANY(dsid) AND cnt.contactid IS NOT NULL
		GROUP BY chrs.chronologyid

	),
	chronmeta AS (
		SELECT
			chrs.chronologyid,
			jsonb_build_object('modelagetype', aty.agetype,
							'isdefault', chrs.isdefault,
							'chronologyname', chrs.chronologyname,
							'dateprepared', chrs.dateprepared,
							'agemodel', chrs.agemodel,
							'agerange', json_build_object('ageboundyounger', chrs.ageboundyounger,
														  'ageboundolder', chrs.ageboundolder),
							'notes', chrs.notes,
							'contact', cinf.contact) AS meta
		FROM          ndb.dslinks AS dsl
		  LEFT OUTER JOIN      ndb.chronologies AS chrs         ON chrs.collectionunitid = dsl.collectionunitid
		  LEFT OUTER JOIN          ndb.agetypes AS aty    ON chrs.agetypeid = aty.agetypeid
		  LEFT OUTER JOIN          ndb.datasets AS dts    ON dsl.datasetid = dts.datasetid
		  LEFT OUTER JOIN contactinfo AS cinf ON cinf.chronologyid = chrs.chronologyid
		WHERE    dsl.datasetid = ANY(dsid)
	)
	SELECT
	  dts.datasetid,
	  json_build_object('chronologyid', cmet.chronologyid,
						'chronology', cmet.meta,
	  'chroncontrols',
		  json_agg(json_build_object('chroncontrolid', chctrl.chroncontrolid,
							'depth', chctrl.depth,
							'thickness', chctrl.thickness,
							'chroncontrolage', chctrl.age,
	  'agelimityounger', chctrl.agelimityounger,
	  'agelimitolder', chctrl.agelimitolder,
	  'chroncontroltype', chty.chroncontroltype,
	  'geochron', json_build_object('geochronid', gc.geochronid,
									'labnumber', gc.labnumber,
									'geochrontype', gct.geochrontype,
									'geochronage', gc.age,
									'geochronerrorolder', gc.errorolder,
									'geochronerroryounger', gc.erroryounger,
									'infinite', gc.infinite,
									'delta13c', gc.delta13c,
									'agetype', atyg.agetype,
									'geochronnotes', gc.notes,
									'geochronmaterialdated', gc.materialdated,
							  	'radiocarbonmethod', rcm.radiocarbonmethod,
							    'percentc', rcb.percentc,
							    'percentn', rcb.percentn,
						      'delta13c', rcb.delta13c,
					        'delta15n', rcb.delta15n,
				          'percentcollagen', rcb.percentcollagen,
			            'reservoir', rcb.reservoir)))) AS meta
	FROM            ndb.dslinks AS dsl
		  LEFT OUTER JOIN     ndb.chronologies AS chrs          ON chrs.collectionunitid = dsl.collectionunitid
	  LEFT OUTER JOIN     ndb.chroncontrols AS chctrl ON chrs.chronologyid = chctrl.chronologyid
	  LEFT OUTER JOIN ndb.chroncontroltypes AS chty   ON chctrl.chroncontroltypeid = chty.chroncontroltypeid

	  LEFT OUTER JOIN          ndb.agetypes AS aty    ON chrs.agetypeid = aty.agetypeid
	  LEFT OUTER JOIN          ndb.datasets AS dts    ON dsl.datasetid = dts.datasetid
	  LEFT OUTER JOIN      ndb.datasettypes AS dty    ON dts.datasettypeid = dty.datasettypeid
	  LEFT OUTER JOIN  ndb.geochroncontrols AS gcc    ON gcc.chroncontrolid = chctrl.chroncontrolid
	  LEFT OUTER JOIN     ndb.geochronology AS gc     ON gc.geochronid = gcc.geochronid
	  LEFT OUTER JOIN     ndb.geochrontypes AS gct    ON gct.geochrontypeid = gc.geochrontypeid
	  LEFT OUTER JOIN          ndb.agetypes AS atyg   ON atyg.agetypeid = gc.agetypeid
	  LEFT OUTER JOIN chronmeta AS cmet ON cmet.chronologyid = chrs.chronologyid
		LEFT OUTER JOIN ndb.radiocarbon AS rcb ON rcb.geochronid = gc.geochronid
		LEFT JOIN ndb.radiocarbonmethods AS rcm ON rcm.radiocarbonmethodid = rcb.radiocarbonmethodid
	WHERE    dts.datasetid = ANY(dsid)
	GROUP BY dts.datasetid, cmet.chronologyid, cmet.meta
$function$
