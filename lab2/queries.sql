\! echo LISTA EL NOMBRE DE LA CIUDAD, NOMBRE DEL PAÍS, REGIÓN Y FORMA DE GOBIERNO DE LAS 10 CIUDADES MÁS POBLADAS DEL MUNDO.
SELECT
	C.NAME,
	CT.NAME,
	CT.DISTRICT,
	C.GOVERNMENTFORM
FROM
	COUNTRY C
JOIN CITY CT ON
	CT.COUNTRYCODE = C.CODE
ORDER BY
	CT.POPULATION DESC
LIMIT 10;

\! echo LISTAR LOS 10 PAÍSES CON MENOR POBLACIÓN DEL MUNDO, JUNTO A SUS CIUDADES CAPITALES \(HINT: PUEDE QUE UNO DE ESTOS PAÍSES NO TENGA CIUDAD CAPITAL ASIGNADA, EN ESTE CASO DEBERÁ MOSTRAR "NULL"\).
SELECT
	C.NAME,
	CT.NAME
FROM
	COUNTRY C
LEFT JOIN CITY CT ON
	C.CAPITAL = CT.ID
ORDER BY
	C.POPULATION ASC
LIMIT 10;

\! ECHO LISTAR EL NOMBRE,CONTINENTE Y TODOS LOS LENGUAJES OFICIALES DE CADA PAÍS. \(HINT: HABRÁ MÁS DE UNA FILA POR PAÍS SI TIENE VARIOS IDIOMAS OFICIALES\).
SELECT
	C.NAME,
	C.CONTINENT,
	F.LANGUAGE
FROM
	COUNTRY C
JOIN COUNTRYLANGUAGE F ON
	F.COUNTRYCODE = C.CODE;

\ ! ECHO LISTAR EL NOMBRE DEL PAÍS Y NOMBRE DE CAPITAL, DE LOS 20 PAÍSES CON MAYOR SUPERFICIE DEL MUNDO.
SELECT
	NAME,
	SURFACEAREA
FROM
	COUNTRY
ORDER BY
	SURFACEAREA DESC
LIMIT 20;

\ ! ECHO LISTAR LAS CIUDADES JUNTO A SUS IDIOMAS OFICIALES ORDENADO POR LA POBLACIÓN DE LA CIUDAD Y EL PORCENTAJE DE HABLANTES DEL IDIOMA.

SELECT
	C.NAME,
	F.LANGUAGE,
	F.PERCENTAGE
FROM
	COUNTRY C
JOIN COUNTRYLANGUAGE F ON
	F.COUNTRYCODE = C.CODE
WHERE
	F.ISOFFICIAL = 'T';

\ ! ECHO LISTAR LOS 10 PAÍSES CON MAYOR POBLACIÓN Y LOS 10 PAÍSES CON MENOR POBLACIÓN (QUE TENGAN AL MENOS 100 HABITANTES) EN LA MISMA CONSULTA.
SELECT
	NAME
FROM
	COUNTRY
EXCEPT (
SELECT
	NAME
FROM
	COUNTRY
ORDER BY
	POPULATION
LIMIT 182 OFFSET 10);

\ ! ECHO LISTAR AQUELLOS PAÍSES QUE TENGAN HABLANTES DEL INGLÉS PERO NO DEL ESPAÑOL EN SU POBLACIÓN
--STEPS: TOMAS EL CODIGO Y LENGUA DE PAISES NO SPANISH-SPEAKERS _T2_ Y DE ELLOS TE LLEVAS LOS ENGLISH SPEAKERS
 SELECT
	NAME
FROM
	COUNTRY
WHERE
	CODE IN (
	SELECT
		T1.COUNTRYCODE
	FROM
		(
		SELECT
			T2.COUNTRYCODE, T2.LANGUAGE
		FROM
			COUNTRYLANGUAGE T2
		WHERE
			T2.LANGUAGE != 'SPANISH') T1
	WHERE
		T1.LANGUAGE = 'ENGLISH');
--1 IGUAL SALVO POR INNER JOIN
--2
