SELECT *
FROM studentperform.students.info
-------------------------------------------------------
WITH TopPerformers AS (
  SELECT
    ROW_NUMBER() OVER () AS student_id,
    math_score + reading_score + writing_score AS total
  FROM studentperform.students.info
  ORDER BY total DESC
  LIMIT 5
)

SELECT *
FROM TopPerformers;
-------------------------------------------------------
SELECT
  gender,
  COUNT(DISTINCT race_ethnicity) AS count_of_races
FROM studentperform.students.info
GROUP BY gender;
-------------------------------------------------------
WITH GenderRaces AS (
  SELECT
    gender,
    COUNT(DISTINCT race_ethnicity) AS count_of_races
  FROM studentperform.students.info
  GROUP BY gender
),
StudentTotals AS (
  SELECT
    gender,
    ROW_NUMBER() OVER () AS student_id,
    math_score + reading_score + writing_score AS total
  FROM studentperform.students.info
)

SELECT
  s.gender,
  SUM(CASE WHEN s.total > avg_score THEN 1 ELSE 0 END) AS above_avg,
  SUM(CASE WHEN s.total <= avg_score THEN 1 ELSE 0 END) AS below_avg,
  r.count_of_races
FROM StudentTotals s
JOIN GenderRaces r ON s.gender = r.gender
CROSS JOIN (
  SELECT AVG(total) AS avg_score
  FROM StudentTotals
)
GROUP BY s.gender, r.count_of_races;
