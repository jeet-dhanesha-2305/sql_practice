-- Solution-1: Using Subquery
select 
    id, 
    name 
from Students 
where department_id not in (
    select id from Departments
);

-- Solution-2: Using Left Join
select 
    S.id, 
    S.name 
from Students S 
left join Departments D 
on S.department_id = D.id 
where D.id is null;