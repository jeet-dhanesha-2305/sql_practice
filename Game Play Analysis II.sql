-- Solution-1: Using Group By + IN
select 
    player_id, 
    device_id 
from Activity 
where (player_id, event_date) in (
    select 
        player_id, 
        min(event_date) 
    from Activity 
    group by player_id
);

-- Solution-2: Using Window Funtion
select 
    P.player_id, 
    P.device_id 
from (
    select 
        *, 
        min(event_date) over(partition by player_id) as first_login_date
    from Activity
) P 
where P.event_date = P.first_login_date;