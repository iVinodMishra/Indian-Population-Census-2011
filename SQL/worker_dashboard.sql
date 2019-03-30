------------------ WORKERS DASHBOARD
---- 1) total no of workers of various types present
select sum(ic_agricultural_workers) as "AGRICULTURAL WORKERS",
sum(ic_cultivator_workers) as "CULTIVATOR WORKERS",
sum(ic_household_workers) as "HOUSEHOLD WORKERS",
sum(ic_main_workers) as "MAIN WORKERS",
sum(ic_marginal_workers) as "MARGINAL WORKERS",
sum(ic_non_workers) as "NON WORKERS",
sum(ic_other_workers) as "OTHER WORKERS"
from india_census;

---- 2) finding different workers in various district
select ic_state_name as "STATE",
ic_district_name as "DISTRICT",
sum(ic_agricultural_workers) as "AGRICULTURAL WORKERS",
sum(ic_cultivator_workers) as "CULTIVATOR WORKERS",
sum(ic_household_workers) as "HOUSEHOLD WORKERS",
sum(ic_main_workers) as "MAIN WORKERS",
sum(ic_marginal_workers) as "MARGINAL WORKERS",
sum(ic_non_workers) as "NON WORKERS",
sum(ic_other_workers) as "OTHER WORKERS",
sum(ic_male_workers) as "MALE WORKERS",
sum(ic_female_workers) as "FEMALE WORKERS"
from india_census
group by ic_state_name, ic_district_name;

---- 3) finding different workers in various states ---- 
select ic_state_name as "STATE",
sum(ic_agricultural_workers) as "AGRICULTURAL WORKERS",
sum(ic_cultivator_workers) as "CULTIVATOR WORKERS",
sum(ic_household_workers) as "HOUSEHOLD WORKERS",
sum(ic_main_workers) as "MAIN WORKERS",
sum(ic_marginal_workers) as "MARGINAL WORKERS",
sum(ic_non_workers) as "NON WORKERS",
sum(ic_other_workers) as "OTHER WORKERS",
sum(ic_male_workers) as "MALE WORKERS",
sum(ic_female_workers) as "FEMALE WORKERS"
from india_census
group by ic_state_name;

---- 4) finding mobile penetration in places where agricultural workers are more than other workers and ----
-----no of households with access to mobile is more than average of mobile users ---- 
select ic_district_name as "DISTRICT",
ic_state_name as "STATE", 
ic_Households_with_Telephone_Mobile_Phone_Mobile_only as "PEOPLE WITH ACCESS TO MOBILE"
from india_census
where 
(ic_Households_with_Telephone_Mobile_Phone_Mobile_only > (select avg(ic_Households_with_Telephone_Mobile_Phone_Mobile_only) from india_census))
and ic_agricultural_workers > ic_other_workers
and ic_agricultural_workers > ic_cultivator_workers
and ic_agricultural_workers > ic_household_workers
and ic_agricultural_workers > ic_marginal_workers
order by ic_Households_with_Telephone_Mobile_Phone_Mobile_only desc;
