SELECT * FROM arriendos
ORDER BY precio_m2 DESC LIMIT 13;

DELETE FROM arriendos
WHERE id IN (
	SELECT ID
	FROM arriendos
	ORDER BY precio_m2 DESC
	LIMIT 13
);