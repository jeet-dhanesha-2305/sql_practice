-- solution-1 using cte and union all
with parent_ids as (
    select distinct(p_id) as id
    from Tree 
    where p_id is not null and p_id != (
        select id from Tree where p_id is null
    )
), child_ids as (
    select distinct(id) as id 
    from Tree 
    where p_id is not null
)

-- root node 
select id, "Root" as type 
from Tree 
where p_id is null
union all
-- inner node 
select id, "Inner" as type 
from child_ids 
where id in (
    select id from parent_ids
)
union all
-- leaf node 
select id, "Leaf" as type
from child_ids 
where id not in (
    select id from parent_ids
);

-- solution-2: using case when
select 
    id, 
    case 
        when p_id is null then "Root" 
        when id not in (select distinct p_id from Tree where p_id is not null) then "Leaf" 
        else "Inner"
    end as type 
from Tree 