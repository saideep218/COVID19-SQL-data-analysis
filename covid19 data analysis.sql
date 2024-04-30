select * from symptoms;


-- 1. Find the number of corona patients who faced shortness of breath.

select sex,count(*) as patients from symptoms
where Shortness_of_breath = 'True'
group by 1 with rollup
order by 2 desc;

-- we have total of 883 paitents with symptoms of shortness_of_breath out of which 665 paitents are females and 228 paitents are males.

-- 2. Find the number of negative corona patients who have fever and sore_throat. 

select sex,count(*) as paitents from symptoms
where fever = 'True' and sore_throat = 'True' and corona = 0 
group by 1
order by 2 desc;

-- paitents with symptoms like fever and sore_throat are tested corona negative are about of 85 paitents out of which 80 paitents are
-- females and 5 paitents are males. 

-- 3. Group the data by month and rank the number of positive cases.

select month(test_date) as month,count(*) as positive_cases from symptoms
where corona = 1
group by 1
order by 2 desc;

-- we have positive cases of 3776  in the month of march. 

-- 4. Find the female negative corona patients who faced cough and headache.

select sex,count(*) as paitents from symptoms
where corona = 0 and cough = 'True' and Headache = 'True' and sex = 'Female'
group by 1
order by 2 desc;

-- total of 39 females paitents with corona negative who have both headache and cough.

-- 5. How many elderly corona patients have faced breathing problems?

select sex,count(*) as elder_paitents from symptoms
where corona = 1 and Age_60_above = 'yes' and Shortness_of_breath = 'True' 
group by 1 
order by 2 desc;

-- The elder paitents who's age is above 60 are infected by corona which a count of 118 out of which female are 72 and males are 46.

-- 6. Which three symptoms were more common among COVID positive patients?

select * from symptoms;

select sex,
    SUM(CASE WHEN corona = 1 AND cough = 'True' THEN 1 ELSE 0 END) AS cough,
    SUM(CASE WHEN corona = 1 AND fever = 'True' THEN 1 ELSE 0 END) AS fever,
    SUM(CASE WHEN corona = 1 AND sore_throat = 'True' THEN 1 ELSE 0 END) AS sore_throat,
    SUM(CASE WHEN corona = 1 AND shortness_of_breath = 'True' THEN 1 ELSE 0 END) AS shortness_of_breath,
    SUM(CASE WHEN corona = 1 AND headache = 'True' THEN 1 ELSE 0 END) AS headache
from symptoms
group by 1 with rollup;

SELECT 'cough' AS symptom,COUNT(*) AS count
FROM symptoms
WHERE corona = 1 AND cough = 'True'
UNION ALL
SELECT 'fever' AS symptom,COUNT(*) AS count
FROM symptoms
WHERE corona = 1 AND fever = 'True'
UNION ALL
SELECT 'sore_throat' AS symptom,COUNT(*) AS count
FROM symptoms
WHERE corona = 1 AND sore_throat = 'True'
UNION ALL
SELECT 'shortness_of_breath' AS symptom,COUNT(*) AS count
FROM symptoms
WHERE corona = 1 AND shortness_of_breath = 'True'
UNION ALL
SELECT 'headache' AS symptom, COUNT(*) AS count
FROM symptoms
WHERE corona = 1 AND headache = 'True'
limit 3;

-- symptoms like cough,fever and sore_throat are the main symptoms for corona positive. 

-- 7. Which symptom was less common among COVID negative people?

select sex,
    SUM(CASE WHEN corona = 0 AND cough = 'True' THEN 1 ELSE 0 END) AS cough,
    SUM(CASE WHEN corona = 0 AND fever = 'True' THEN 1 ELSE 0 END) AS fever,
    SUM(CASE WHEN corona = 0 AND sore_throat = 'True' THEN 1 ELSE 0 END) AS sore_throat,
    SUM(CASE WHEN corona = 0 AND shortness_of_breath = 'True' THEN 1 ELSE 0 END) AS shortness_of_breath,
    SUM(CASE WHEN corona = 0 AND headache = 'True' THEN 1 ELSE 0 END) AS headache
from symptoms
group by 1 with rollup;

-- headache and sore_throat,shortness_of_breath are the less common symptoms for corona negative. 

-- 8. What are the most common symptoms among COVID positive males whose known contact was abroad?

select sex,
    SUM(CASE WHEN corona = 1 AND cough = 'True' THEN 1 ELSE 0 END) AS cough,
    SUM(CASE WHEN corona = 1 AND fever = 'True' THEN 1 ELSE 0 END) AS fever,
    SUM(CASE WHEN corona = 1 AND sore_throat = 'True' THEN 1 ELSE 0 END) AS sore_throat,
    SUM(CASE WHEN corona = 1 AND shortness_of_breath = 'True' THEN 1 ELSE 0 END) AS shortness_of_breath,
    SUM(CASE WHEN corona = 1 AND headache = 'True' THEN 1 ELSE 0 END) AS headache
from symptoms
where contact = 'abroad' and sex = 'male'
group by 1;

-- cough and fever are the most common symptoms of male corona positive paitents from abroad.




 

