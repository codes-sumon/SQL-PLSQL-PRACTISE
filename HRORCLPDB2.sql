SELECT last_name, salary,manager_id
FROM employees
WHERE manager_id IN (SELECT employee_id FROM employees Where last_name = 'King');

SELECT e.last_name, e.department_id, e.job_id
FROM employees e JOIN departments d
ON( e.department_id=d.department_id)
WHERE d.location_id= 1700;

