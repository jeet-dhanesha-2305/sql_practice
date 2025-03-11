with cte_1 as (
    select P.employee_id, P.employee_name, P.manager_id as manager_lvl_1, Q.manager_id as manager_lvl_2
    from Employees P 
    inner join Employees Q 
    on P.manager_id = Q.employee_id
), cte_2 as (
    select R.employee_id, R.employee_name, R.manager_lvl_1, R.manager_lvl_2, S.manager_id as manager_lvl_3
    from cte_1 R
    inner join Employees S 
    on R.manager_lvl_2 = S.employee_id
) 

select employee_id from cte_2 
where (manager_lvl_1 = 1 or manager_lvl_2 = 1 or manager_lvl_3 = 1 ) and employee_id <> 1
