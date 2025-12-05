-- ============================================
-- SAMPLE DATA FOR FARM MANAGEMENT SYSTEM
-- ============================================

-- 1) Ферма
INSERT INTO farms (name, region) VALUES
('Green Valley Farm', 'Chui Region');

-- 2) Поля
INSERT INTO fields (farm_id, name, area_ha, soil_type, location_geo) VALUES
(1, 'Field A', 12.50, 'chernozem', '42.87, 74.60'),
(1, 'Field B', 8.40,  'loam',     '42.88, 74.61');

-- 3) Культуры
INSERT INTO crops (name, variety, seasonality) VALUES
('Wheat', 'Premium-1', 'spring'),
('Barley', 'GoldenBar', 'spring'),
('Corn', 'SweetStar', 'summer');

-- 4) Посевы
INSERT INTO plantings (
    field_id, crop_id, planting_date, seed_rate_kg_per_ha,
    expected_yield_t_per_ha, status
) VALUES
(1, 1, '2024-03-15', 180, 5.2, 'active'),
(2, 3, '2024-04-01', 200, 7.0, 'active');

-- 5) Операции
INSERT INTO operations (planting_id, op_type, op_date, material, qty, unit, cost) VALUES
(1, 'fertilize', '2024-03-20', 'NPK 16-16-16', 150, 'kg', 12000),
(1, 'irrigate',  '2024-04-01', NULL, 20, 'm3', 4000),
(2, 'spray',     '2024-04-10', 'Herbicide X', 10, 'L', 9000);

-- 6) Урожай
INSERT INTO harvests (planting_id, harvest_date, quantity_t, moisture_pct) VALUES
(1, '2024-07-22', 48.0, 12.5),
(2, '2024-08-18', 55.0, 13.0);

-- 7) Партии на складе
INSERT INTO inventory_lots (harvest_id, storage_location, qty_available_t) VALUES
(1, 'Warehouse A', 48.0),
(2, 'Warehouse B', 55.0);

-- 8) Пробная продажа (для демонстрации)
INSERT INTO sales (lot_id, sale_date, buyer, price_per_t, qty_t)
VALUES
(1, '2024-08-01', 'ABC Grain LLC', 230.00, 10.0);

