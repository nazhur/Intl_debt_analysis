select * from international_debt;

/* 1. Finding the number of distinct countries */

select distinct country_name from international_debt;
select COUNT(distinct(country_name)) AS total_distinct_country from international_debt;

/* 2. Finding out the distinct debt indicators */
select distinct(indicator_code) AS distinct_ind_code from international_debt;

/* 3. Totaling the amount of debt owed by the countries */
select round((SUM(debt)/1000000),2) AS total_debt from international_debt;

/* 4. Country with the highest debt */
select country_name, SUM(debt) AS total_debt from international_debt
group by country_name
order by total_debt desc
limit 1;

/* 5. Average amount of debt across indicators */
select indicator_code, indicator_name, avg(debt) AS average_debt from international_debt
group by indicator_code, indicator_name
order by average_debt desc;

/* 6. The highest amount of principal repayments */
select country_name, indicator_name from international_debt
WHERE debt = ( select max(debt) from international_debt Where indicator_name = 'DT');

/* The most common debt indicator */

select indicator_code, COUNT(indicator_code) as cnt_ic from international_debt
group by indicator_code
order by cnt_ic desc;

/* The most common debt indicator */

select country_name, indicator_code, MAX(debt) AS total_debt from international_debt
group by country_name, indicator_code
order by total_debt DESC;
