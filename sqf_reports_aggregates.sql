--Precinct Report Quality
SELECT pct::smallint as precinct
, COUNT(*)
FROM sqf_2010
LEFT JOIN ny_police_precincts npp ON npp.precinct = sqf_2010.pct::smallint
GROUP BY pct::smallint
ORDER BY pct::smallint

--Address Data Quality
SELECT 
  CASE WHEN COALESCE(TRIM(xcoord),'') <> '' AND COALESCE(TRIM(ycoord),'') <> '' THEN 'Coordinates Present' ELSE 'Coordinates Missing' END as xcoord_present
, CASE WHEN COALESCE(TRIM(stname),'') <> '' THEN 'Street Present' ELSE 'Street Missing' END as street_name
, CASE WHEN COALESCE(TRIM(stinter),'') <> '' THEN 'Intersection Present' ELSE 'Intersection Missing' END as intersection
, COUNT(*)
FROM sqf_2010
GROUP BY
  CASE WHEN COALESCE(TRIM(xcoord),'') <> '' AND COALESCE(TRIM(ycoord),'') <> '' THEN 'Coordinates Present' ELSE 'Coordinates Missing' END
, CASE WHEN COALESCE(TRIM(stname),'') <> '' THEN 'Street Present' ELSE 'Street Missing' END
, CASE WHEN COALESCE(TRIM(stinter),'') <> '' THEN 'Intersection Present' ELSE 'Intersection Missing' END