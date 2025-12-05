-- ============================================
-- ADVANCED SQL QUERIES FOR FARM MANAGEMENT SYSTEM
-- ============================================

-- 1) Урожайность по полям (т/га)
WITH harvest_data AS (
    SELECT f.field_id,
           f.name AS field,
           h.quantity_t,
           f.area_ha
    FROM harvests h
    JOIN plantings p ON h.planting_id = p.planting_id
    JOIN fields f ON p.field_id = f.field_id
)
SELECT field,
       quantity_t,
       area_ha,
       ROUND(quantity_t / area_ha, 2) AS yield_t_per_ha
FROM harvest_data;

-- 2) Общий урожай по культурам
SELECT c.name AS crop,
       SUM(h.quantity_t) AS total_tons
FROM crops c
JOIN plantings p ON c.crop_id = p.crop_id
JOIN harvests h ON h.planting_id = p.planting_id
GROUP BY c.name
ORDER BY total_tons DESC;

-- 3) ТОП расходов по операциям (агрегаты)
SELECT op_type,
       COUNT(*) AS total_ops,
       SUM(cost) AS total_cost,
       ROUND(AVG(cost), 2) AS avg_cost
FROM operations
GROUP BY op_type
ORDER BY total_cost DESC;

-- 4) Расходы по конкретному посеву (CTE)
WITH op_costs AS (
    SELECT planting_id, cost
    FROM operations
)
SELECT planting_id,
       SUM(cost) AS total_cost
FROM op_costs
GROUP BY planting_id;

-- 5) Продажи + остаток партии (JOIN + аналитика)
SELECT s.sale_id,
       s.sale_date,
       s.buyer,
       s.qty_t AS sold_qty,
       i.qty_available_t AS remaining_qty
FROM sales s
JOIN inventory_lots i ON s.lot_id = i.lot_id;

-- 6) Оконная функция: доля урожая каждого поля в общем урожае
WITH total AS (
  SELECT SUM(quantity_t) AS total_volume FROM harvests
)
SELECT f.name AS field,
       h.quantity_t,
       ROUND(h.quantity_t * 100.0 / (SELECT total_volume FROM total), 2)
         AS percent_of_total
FROM harvests h
JOIN plantings p ON h.planting_id = p.planting_id
JOIN fields f ON p.field_id = f.field_id;

-- 7) Рентабельность: прибыль = сумма продаж − расходы
WITH expenses_sum AS (
    SELECT planting_id, SUM(cost) AS total_expenses
    FROM operations
    GROUP BY planting_id
),
sales_sum AS (
    SELECT p.planting_id, SUM(s.amount) AS revenue
    FROM sales s
    JOIN inventory_lots l ON s.lot_id = l.lot_id
    JOIN harvests h ON l.harvest_id = h.harvest_id
    JOIN plantings p ON h.planting_id = p.planting_id
    GROUP BY p.planting_id
)
SELECT c.name AS crop,
       COALESCE(sales_sum.revenue, 0) AS revenue,
       COALESCE(expenses_sum.total_expenses, 0) AS expenses,
       COALESCE(sales_sum.revenue, 0) - COALESCE(expenses_sum.total_expenses, 0)
         AS profit
FROM crops c
JOIN plantings p ON c.crop_id = p.crop_id
LEFT JOIN expenses_sum ON expenses_sum.planting_id = p.planting_id
LEFT JOIN sales_sum ON sales_sum.planting_id = p.planting_id;

