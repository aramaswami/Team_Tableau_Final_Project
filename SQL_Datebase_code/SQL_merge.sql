-- Merge the tables:
SELECT h.hours_amt,
	h.hour_id,
	h.date,
	h.project_id,
	h.emp_id,
	e.region_type as emp_region
INTO tb_full_hours
FROM tb_hours as h
LEFT JOIN tb_employee as e ON (h.emp_id = e.emp_id);

SELECT pr.end_date,
	pr.project_id,
	pr.service_line,
	pr.team,
	pr.project_manager,
	pr.overbudget_yes,
	pr.budget,
	b.region as building_region,
	b.nda
INTO tb_full_project
FROM tb_project as pr
LEFT JOIN tb_building as b ON (pr.building_id = b.building_id);

-- Check the table
SELECT * FROM tb_full_hours;