Select e.employee_id, e.last_name, e.job_id,m.employee_id, m.last_name, m.job_id
From employees e join employees m
on(e.manager_id = m.employee_id)
order by 1 asc;

--select * from SYS.USER_CONS_COLUMNS ;

select last_name, hire_date
from employees
where to_char(hire_date,'fmDD') < '16';