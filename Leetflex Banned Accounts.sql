-- solution-1: using cross join
select 
    distinct(L1.account_id) 
from LogInfo L1, LogInfo L2 
where 
    L1.account_id = L2.account_id and 
    L1.ip_address != L2.ip_address and
    -- L1 login <= L2 login <= L1 logout
    L2.login >= L1.login and 
    L2.login <= L1.logout; 

-- solution-2: using inner join
select 
    distinct(L1.account_id)
from LogInfo L1 
inner join LogInfo L2 
on L1.account_id = L2.account_id and 
    L1.ip_address != L2.ip_address AND 
    -- L1 login <= L2 login <= L1 logout 
    L2.login >= L1.login and 
    L2.login <= L1.logout;