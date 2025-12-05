-- Создание БД (можно выполнять в psql, если БД ещё нет)
-- CREATE DATABASE farmdb;
-- \c farmdb

-- 1) Хозяйства
CREATE TABLE farms (
  farm_id SERIAL PRIMARY KEY,
  name       VARCHAR(100) NOT NULL,
  region     VARCHAR(100)
);

-- 2) Поля
CREATE TABLE fields (
  field_id  SERIAL PRIMARY KEY,
  farm_id   INT NOT NULL REFERENCES farms(farm_id),
  name      VARCHAR(100) NOT NULL,
  area_ha   NUMERIC(10,2) NOT NULL CHECK (area_ha > 0),
  soil_type VARCHAR(50),
  location_geo TEXT
);

-- 3) Культуры
CREATE TABLE crops (
  crop_id SERIAL PRIMARY KEY,
  name        VARCHAR(80) NOT NULL,
  variety     VARCHAR(80),
  seasonality VARCHAR(20) -- spring / autumn / perennial
);

-- 4) Посевы
CREATE TABLE plantings (
  planting_id SERIAL PRIMARY KEY,
  field_id    INT NOT NULL REFERENCES fields(field_id),
  crop_id     INT NOT NULL REFERENCES crops(crop_id),
  planting_date DATE NOT NULL,
  seed_rate_kg_per_ha NUMERIC(10,2),
  expected_yield_t_per_ha NUMERIC(10,2),
  status VARCHAR(20) DEFAULT 'active' -- planned/active/harvested
);

-- 5) Операции
CREATE TABLE operations (
  operation_id SERIAL PRIMARY KEY,
  planting_id  INT NOT NULL REFERENCES plantings(planting_id),
  op_type   VARCHAR(20) NOT NULL, -- fertilize/irrigate/spray/other
  op_date   DATE NOT NULL,
  material  VARCHAR(100),
  qty       NUMERIC(12,3),
  unit      VARCHAR(20),
  cost      NUMERIC(12,2) DEFAULT 0
);

-- 6) Урожай
CREATE TABLE harvests (
  harvest_id SERIAL PRIMARY KEY,
  planting_id INT NOT NULL REFERENCES plantings(planting_id),
  harvest_date DATE NOT NULL,
  quantity_t   NUMERIC(12,3) NOT NULL CHECK (quantity_t > 0),
  moisture_pct NUMERIC(5,2)
);

-- 7) Складские партии
CREATE TABLE inventory_lots (
  lot_id SERIAL PRIMARY KEY,
  harvest_id INT NOT NULL REFERENCES harvests(harvest_id),
  storage_location VARCHAR(80),
  qty_available_t NUMERIC(12,3) NOT NULL CHECK (qty_available_t >= 0)
);

-- 8) Продажи
CREATE TABLE sales (
  sale_id SERIAL PRIMARY KEY,
  lot_id  INT NOT NULL REFERENCES inventory_lots(lot_id),
  sale_date DATE NOT NULL,
  buyer VARCHAR(100) NOT NULL,
  price_per_t NUMERIC(12,2) NOT NULL CHECK (price_per_t > 0),
  qty_t      NUMERIC(12,3) NOT NULL CHECK (qty_t > 0),
  amount     NUMERIC(12,2) GENERATED ALWAYS AS (price_per_t * qty_t) STORED
);

-- 9) Прочие расходы
CREATE TABLE expenses (
  expense_id SERIAL PRIMARY KEY,
  planting_id INT REFERENCES plantings(planting_id),
  expense_date DATE NOT NULL,
  category VARCHAR(50) NOT NULL,
  amount NUMERIC(12,2) NOT NULL CHECK (amount >= 0),
  note TEXT
);

