------------------ POPULATION DASHBOARD
---- 1) population census of various states in terms of religion
select ic_state_name as "STATE",
sum(ic_population) as "POPULATION",
sum(ic_male) as "MALE POPULATION",
sum(ic_female) as "FEMALE POPULATION",
sum(ic_hindus) as "HINDUS",
round(sum(ic_hindus)/sum(ic_population)*100,2) as "HINDUS (%)",
sum(ic_sikhs) as "SIKHS",
round(sum(ic_sikhs)/sum(ic_population)*100,2) as "SIKHS (%)",
sum(ic_buddhists) as "BUDDHISTS",
round(sum(ic_buddhists)/sum(ic_population)*100,2) as "BUDDHISTS (%)",
sum(ic_jains) as "JAINS",
round(sum(ic_jains)/sum(ic_population)*100,2) as "JAINS (%)",
sum(ic_christians) as "CHRISTIANS",
round(sum(ic_christians)/sum(ic_population)*100,2) as "CHRISTIANS (%)",
sum(ic_muslims) as "MUSLIMS",
round(sum(ic_muslims)/sum(ic_population)*100,2) as "MUSLIMS (%)",
sum(ic_other_religion) as "OTHER RELIGION",
round(sum(ic_other_religion)/sum(ic_population)*100,2) as "OTHER RELIGIONS (%)",
sum(ic_religion_not_stated) as "RELIGION NOT SPECIFIED",
round(sum(ic_religion_not_stated)/sum(ic_population)*100,2) as "RELIGION NOT STATED (%)"
from INDIA_CENSUS
group by ic_state_name;

-- 2) Query to find no of people in various age groups
select ic_state_name as "STATE", 
sum(ic_Age_Group_0_29) as "AGE GROUP 0 to 29",
sum(ic_Age_Group_30_49) as "AGE GROUP 30 to 49", 
sum(ic_Age_Group_50) as "AGE GROUP 50 above",
sum(ic_Age_not_stated) as "AGE NOT STATED"
from india_census
group by ic_state_name;

-- 3) finding SC and ST POPULATION in every district
select ic_state_name as "STATE", 
ic_district_name as "DISTRICT", 
sum(ic_sc) as "SC POPULATION", 
sum(ic_st) as "ST POPULATION"
from india_census
group by ic_state_name, ic_district_name
order by ic_state_name;

--- 4) top 5 states with max hindu population
select * from
(select ic_state_name as "STATE", sum(ic_hindus) as "HINDU POPULATION"
from india_census 
group by ic_state_name order by sum(ic_hindus) desc)
where rownum < 6;
