-- ============================================
-- BASIC SQL QUERIES FOR FARM MANAGEMENT SYSTEM
-- ============================================

-- 1) Список всех полей
SELECT field_id, name, area_ha, soil_type
FROM fields
ORDER BY field_id;

-- 2) Список культур
SELECT crop_id, name AS crop, variety, seasonality
FROM crops
ORDER BY crop_id;

-- 3) Посевы с указанием названия поля и культуры
SELECT p.planting_id,
       f.name AS field,
       c.name AS crop,
       p.planting_date,
       p.expected_yield_t_per_ha
FROM plantings p
JOIN fields f ON p.field_id = f.field_id
JOIN crops c ON p.crop_id = c.crop_id;

-- 4) Все операции по конкретному посеву
SELECT o.*
FROM operations o
WHERE o.planting_id = 1
ORDER BY o.op_date;

-- 5) Урожай по культурам
SELECT h.harvest_id,
       c.name AS crop,
       h.quantity_t,
       h.harvest_date
FROM harvests h
JOIN plantings p ON h.planting_id = p.planting_id
JOIN crops c ON p.crop_id = c.crop_id
ORDER BY h.harvest_date;

-- 6) Наличие на складе
SELECT lot_id, qty_available_t, storage_location
FROM inventory_lots;

-- 7) Продажи по партиям
SELECT s.sale_id,
       s.sale_date,
       s.buyer,
       s.qty_t,
       s.price_per_t,
       s.amount,
       i.storage_location
FROM sales s
JOIN inventory_lots i ON s.lot_id = i.lot_id
ORDER BY s.sale_date DESC;


