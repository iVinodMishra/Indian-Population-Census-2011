------------------ EDUCATION DASHBOARD
---- 1) finding no of people with different types of degrees
select sum(ic_below_primary_education) as "BELOW PRIMARY EDUCATION",
sum(ic_Primary_Education) as "PRIMARY EDUCATION",
sum(ic_Middle_Education) as "MIDDLE EDUCATION",
sum(ic_Secondary_Education) as "SECONDARY EDUCATION",
sum(ic_Higher_Education) as "HIGHER EDUCATION",
sum(ic_Graduate_Education) as "GRADUATE EDUCATION",
sum(ic_Other_Education) as "OTHER EDUCATION"
from india_census;


--- 2) finding no of people with different types of degrees in each district
select ic_state_name as "STATE",
ic_district_name as "DISTRICT",
sum(ic_below_primary_education) as "BELOW PRIMARY EDUCATION",
sum(ic_Primary_Education) as "PRIMARY EDUCATION",
sum(ic_Middle_Education) as "MIDDLE EDUCATION",
sum(ic_Secondary_Education) as "SECONDARY EDUCATION",
sum(ic_Higher_Education) as "HIGHER EDUCATION",
sum(ic_Graduate_Education) as "GRADUATE EDUCATION",
sum(ic_Other_Education) as "OTHER EDUCATION"
from india_census
group by ic_state_name, ic_district_name;


--- 3) finding no of people with different types of degrees in each state
select ic_state_name as "STATE",
sum(ic_below_primary_education) as "BELOW PRIMARY EDUCATION",
sum(ic_Primary_Education) as "PRIMARY EDUCATION",
sum(ic_Middle_Education) as "MIDDLE EDUCATION",
sum(ic_Secondary_Education) as "SECONDARY EDUCATION",
sum(ic_Higher_Education) as "HIGHER EDUCATION",
sum(ic_Graduate_Education) as "GRADUATE EDUCATION",
sum(ic_Other_Education) as "OTHER EDUCATION"
from india_census
group by ic_state_name;

---- 4) finding literacy rates of every state
select ic_state_name as "STATE",
sum(ic_literate) as "LITERATE",
sum(ic_population) as "POPULATION",
round(sum(ic_literate)/sum(ic_population)*100,2) as "LITERACY RATE (%)"
from india_census
group by ic_state_name
order by sum(ic_literate)/sum(ic_population)*100 desc;

---- 5) finding districts where female literacy is higher than male literacy
select ic_district_name as "DISTRICT",
ic_state_name as "STATE",
round((ic_female_literate)/(ic_literate)*100,2) as "FEMALE LITERATE (%)",
round((ic_male_literate)/(ic_literate)*100,2) as "MALE LITERATE (%)"
from india_census
where ((ic_female_literate)/(ic_literate)) > ((ic_male_literate)/(ic_literate));

