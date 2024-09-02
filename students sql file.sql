create database mental_health;
use mental_health;
select * from students;
show tables;

select column_name
from information_schema.columns
where table_name = 'students';

use mental_health;

select * from students;
---- This will give the output of the null values 

select sum(inti) as intimate_null, sum(inter) as internet_null from (select if(intimate = '',1,intimate) as inti, 
if(internet='',1,internet) as inter
from students
where if(intimate = '',1,intimate) = 1 and if(internet='',1,internet) = 1)as a;

select inter_dom, count(inter_dom) as count from students
group by inter_dom;

select * from students;

select * from students 
where inter_dom = 'inter';

select * from students
where inter_dom = 'dom';

---- summary stats for the tests

select min(todep) as todep_min, max(todep)as todep_max, round(avg(todep),2) as todep_avg
from students;

select min(toas) as toas_min, max(toas) as toas_max, round(avg(toas),2) as toas_avg
from students;

select min(tosc) as tosc_min, max(tosc) as tosc_max, round(avg(tosc),2) as tosc_avg
from students;

---- summary stats as per the students category
select min(todep) as todep_min, max(todep)as todep_max, round(avg(todep),2) as todep_avg
from students
where inter_dom = 'inter';

select min(toas) as toas_min, max(toas) as toas_max, round(avg(toas),2) as toas_avg
from students
where inter_dom = 'inter';

select min(tosc) as tosc_min, max(tosc) as tosc_max, round(avg(tosc),2) as tosc_avg
from students
where inter_dom = 'inter';

select * from students;

---- Find the average scores by length of stay for international students, and view them in descending order
select stay, round(avg(tosc),2) as tosc_avg, round(avg(toas),2) as toas_avg, round(avg(todep),2) as todep_avg
from students
group by stay
order by stay desc;

---- lets check where are the international students from 

select * from students;

select if(inter_dom = 'inter', region, 'Local hai bhai') as student_type, count(if(inter_dom = 'inter', region, 'Local hai bhai')) as num_of_students from students
group by if(inter_dom = 'inter', region, 'Local hai bhai');

select inter_dom, round(avg(todep),2) as avg_todep, min(todep) as min_todep, max(todep)as max_todep,
round(avg(toas),2) as avg_toas, min(toas) as min_toas, max(toas) as max_toas,
round(avg(tosc),2) as avg_tosc, min(tosc) as min_tosc, max(tosc) as max_tosc from students
group by inter_dom ;

---- is the age impacting factor for the students?

select * from students;

select inter_dom, age, round(avg(todep),2) as avg_todep, min(todep) as min_todep, max(todep)as max_todep,
round(avg(toas),2) as avg_toas, min(toas) as min_toas, max(toas) as max_toas,
round(avg(tosc),2) as avg_tosc, min(tosc) as min_tosc, max(tosc) as max_tosc from students
group by inter_dom, age
order by age ;




