
SELECT *
FROM dbo.monkeypoxdata



---GLOBAL NUMBERS---

SELECT SUM(CAST(new_cases AS INT)) AS TotalCases, SUM(CAST(new_deaths AS INT)) AS TotalDeaths
FROM dbo.monkeypoxdata
WHERE location IS NOT NULL 
AND location NOT IN ('World')
ORDER BY 1

---TOTAL CASES AND DEATHS PER COUNTRY---

SELECT location, SUM(CAST(new_cases AS INT)) AS TotalCases, SUM(CAST(new_deaths AS INT)) AS TotalDeaths
FROM dbo.monkeypoxdata
WHERE location IS NOT NULL 
AND location NOT IN ('World')
GROUP BY location
ORDER BY 2 DESC

SELECT location, date, SUM(CAST(new_cases AS INT)) AS TotalCases, SUM(CAST(new_deaths AS INT)) AS TotalDeaths
FROM dbo.monkeypoxdata
WHERE location IS NOT NULL 
AND location NOT IN ('World')
GROUP BY location, date
ORDER BY 3 DESC



---COUNTRIES WITH HIGHEST INFECTION RATE---

SELECT location, population, MAX(total_cases) AS HighestInfectionCount
,MAX((total_cases/population))*100 AS PercentPopulationInfected
FROM dbo.monkeypoxdata
WHERE location IS NOT NULL 
AND location NOT IN ('World')
GROUP BY location, population
ORDER BY PercentPopulationInfected DESC

Select location, population,date, MAX(total_cases) as HighestInfectionCount,  Max((total_cases/population))*100 as PercentPopulationInfected
From dbo.monkeypoxdata
Group by location, population, date
order by PercentPopulationInfected desc