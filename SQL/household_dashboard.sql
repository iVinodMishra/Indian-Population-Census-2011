
------------------ HOUSEHOLD DASHBOARD
---- 1) finding total households --- 
select sum(ic_households) as "TOTAL HOUSEHOLDS", 
sum(ic_rural_households) as "RURAL HOUSEHOLDS",
sum(ic_urban_households) as "URBAN HOUSEHOLDS"
from india_census;

---- 2) finding rural, urban households for each district --- 
select ic_state_name as "STATE",
ic_district_name as "DISTRICT",
sum(ic_households) as "TOTAL HOUSEHOLDS", 
sum(ic_rural_households) as "RURAL HOUSEHOLDS",
sum(ic_urban_households) as "URBAN HOUSEHOLDS"
from india_census
group by ic_state_name, ic_district_name;

---- 3) finding rural, urban households for each state --- 
select ic_state_name as "STATE",
sum(ic_households) as "TOTAL HOUSEHOLDS", 
sum(ic_rural_households) as "RURAL HOUSEHOLDS",
sum(ic_urban_households) as "URBAN HOUSEHOLDS"
from india_census
group by ic_state_name;


--- 4) finding no of household in every state --- 
select ic_state_name as "STATE",
sum(ic_Household_size_1_person_Households) as "1 HOUSEHOLD",
sum(ic_Household_size_2_persons_Households) as "2 HOUSEHOLD",
sum(ic_Household_size_1_to_2_persons) as "1 to 2 HOUSEHOLD",
sum(ic_Household_size_3_persons_Households) as "3 HOUSEHOLD",
sum(ic_Household_size_3_to_5_persons_Households) as "3 to 5 HOUSEHOLD",
sum(ic_Household_size_4_persons_Households) as "4 HOUSEHOLD",
sum(ic_Household_size_5_persons_Households) as "5 HOUSEHOLD",
sum(ic_Household_size_6_8_persons_Households) as "6 to 8 HOUSEHOLD",
sum(ic_Household_size_9_persons_and_above_Households) as "9 HOUSEHOLD"
from india_census
group by ic_state_name;


---- 5) finding no of household in every state, every district --- 
select ic_state_name as "STATE",
ic_district_name as "DISTRICT",
sum(ic_Household_size_1_person_Households) as "1 HOUSEHOLD",
sum(ic_Household_size_2_persons_Households) as "2 HOUSEHOLD",
sum(ic_Household_size_1_to_2_persons) as "1 to 2 HOUSEHOLD",
sum(ic_Household_size_3_persons_Households) as "3 HOUSEHOLD",
sum(ic_Household_size_3_to_5_persons_Households) as "3 to 5 HOUSEHOLD",
sum(ic_Household_size_4_persons_Households) as "4 HOUSEHOLD",
sum(ic_Household_size_5_persons_Households) as "5 HOUSEHOLD",
sum(ic_Household_size_6_8_persons_Households) as "6 to 8 HOUSEHOLD",
sum(ic_Household_size_9_persons_and_above_Households) as "9 HOUSEHOLD"
from india_census
group by ic_state_name, ic_district_name;

---- 6) finding all the districts where rural household is greater then urban household --- 
select ic_state_name, ic_district_name
from india_census
where ic_rural_households > ic_urban_households
order by ic_state_name;

select count(ic_district_name)
from india_census
where ic_rural_households > ic_urban_households;

----- 7) Various Resources of household as per every state --- 
select ic_state_name,
sum(ic_Households_with_Bicycle) as "PEOPLE WITH BICYCLE",
sum(ic_Households_with_Car_Jeep_Van )  as "PEOPLE WITH CAR JEEP VAN",
sum(ic_Households_with_Radio_Transistor )  as "PEOPLE WITH RADIO",
sum(ic_Households_with_Scooter_Motorcycle_Moped )  as "PEOPLE WITH SCOOTER MOTORCYCLE MOPED",
sum(ic_Households_with_Telephone_Mobile_Phone_Landline_only ) as "PEOPLE WITH LANDLINE ONLY",
sum(ic_Households_with_Telephone_Mobile_Phone_Mobile_only ) as "PEOPLE WITH MOBILE ONLY",
sum(ic_Households_with_TV_Computer_Laptop_Telephone_mobile_phone_and_Scooter_Car )  as "PEOPLE WITH ELECTRONICS AND VEHICLE",
sum(ic_Households_with_Television ) as "PEOPLE WITH TELEVISION",
sum(ic_Households_with_Telephone_Mobile_Phone ) as "PEOPLE WITH TELEPHONE",
sum(ic_Households_with_Telephone_Mobile_Phone_Both ) as "PEOPLE WITH TELEPHONE AND MOBILE",
sum(ic_Households_with_separate_kitchen_Cooking_inside_house ) as "PEOPLE WITH SEPERATE KITCHEN"
from india_census
group by ic_state_name;


--- 8) finding top 10 rural dominated districts which tops the lists of access to mobile phone --- 
select * from
(select ic_district_name as "DISTRICT", ic_state_name as "STATE", 
ic_Households_with_Telephone_Mobile_Phone_Mobile_only as "PEOPLE WITH ACCESS TO MOBILE"
from india_census where ic_rural_households > ic_urban_households
order by ic_Households_with_Telephone_Mobile_Phone_Mobile_only desc)
where rownum < 11;

--- 9) finding out top 25 rural dominated district with more owned households --- 
select * from
(select ic_district_name as "DISTRICT",
ic_state_name as "STATE",
ic_Ownership_Owned_Households as "OWNED HOUSE"
from india_census
where ic_rural_households > ic_urban_households
order by "OWNED HOUSE" desc)
where rownum < 26;

