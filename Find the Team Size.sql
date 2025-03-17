-- Solution-1: Using Group By + Join
select 
    E1.employee_id, 
    E2.team_size
from Employee E1  
inner join (
    select 
        team_id, 
        count(*) as team_size
    from Employee 
    group by team_id
) E2 
on E1.team_id = E2.team_id;

-- Solution-2: Using Window Funtion
select 
    employee_id, 
    count(*) over(partition by team_id) as team_size
from Employee;