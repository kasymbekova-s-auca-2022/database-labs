-- ============================================
-- ДОПОЛНИТЕЛЬНЫЕ ОГРАНИЧЕНИЯ И ИНДЕКСЫ
-- ============================================

-- Индексы для ускорения запросов по основным связям
CREATE INDEX idx_fields_farm_id ON fields(farm_id);
CREATE INDEX idx_plantings_field_id ON plantings(field_id);
CREATE INDEX idx_plantings_crop_id ON plantings(crop_id);
CREATE INDEX idx_operations_planting_id ON operations(planting_id);
CREATE INDEX idx_harvests_planting_id ON harvests(planting_id);
CREATE INDEX idx_inventory_harvest_id ON inventory_lots(harvest_id);
CREATE INDEX idx_sales_lot_id ON sales(lot_id);

-- Индекс по дате операций
CREATE INDEX idx_operations_date ON operations(op_date);

-- Индекс по дате урожая
CREATE INDEX idx_harvests_date ON harvests(harvest_date);

-- Индекс по дате продаж
CREATE INDEX idx_sales_date ON sales(sale_date);

-- Проверка: дата операции не может быть раньше даты посева
ALTER TABLE operations
  ADD CONSTRAINT operations_date_check
      CHECK (op_date >= (SELECT planting_date FROM plantings WHERE planting_id = operations.planting_id));

-- Проверка: урожай не может быть раньше посева
ALTER TABLE harvests
  ADD CONSTRAINT harvest_date_check
      CHECK (harvest_date >= (SELECT planting_date FROM plantings WHERE planting_id = harvests.planting_id));

-- Ограничение: проданное количество не может превышать остаток партии (контролируется транзакцией)
ALTER TABLE sales
  ADD CONSTRAINT sales_qty_positive CHECK (qty_t > 0);

