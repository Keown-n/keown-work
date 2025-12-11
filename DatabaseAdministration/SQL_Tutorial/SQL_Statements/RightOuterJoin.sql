SELECT *
  FROM sales.staffs sf
  RIGHT OUTER JOIN sales.stores s
  ON sf.staff_id = s.store_id;
