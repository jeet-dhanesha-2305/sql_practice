with cte as (
    select Wimbledon as player_id from Championships
    union all
    select Fr_open as player_id from Championships 
    union all
    select US_open as player_id from Championships 
    union all 
    select Au_open as player_id from Championships 
) 


select P.player_id, P.player_name, T.grand_slams_count 
from Players P 
inner join (
    select 
        player_id, 
        count(*) as grand_slams_count
    from cte 
    group by player_id
) T 
on P.player_id = T.player_id;
