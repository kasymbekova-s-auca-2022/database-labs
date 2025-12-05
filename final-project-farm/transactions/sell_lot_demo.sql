-- ============================================
-- TRANSACTION: SELL PART OF INVENTORY LOT
-- ============================================
-- Параметры, которые передаются через -v:
--   lot      = номер партии
--   qty      = количество (тонн)
--   price    = цена за тонну
--   buyer    = покупатель

BEGIN;

-- 1) Проверяем остаток
DO $$
DECLARE
    available NUMERIC;
BEGIN
    SELECT qty_available_t INTO available
    FROM inventory_lots
    WHERE lot_id = :lot
    FOR UPDATE;

    IF available IS NULL THEN
        RAISE EXCEPTION 'Lot % does not exist', :lot;
    END IF;

    IF available < :qty THEN
        RAISE EXCEPTION 'Not enough quantity in lot %. Available: %, requested: %',
            :lot, available, :qty;
    END IF;
END $$;

-- 2) Записываем продажу
INSERT INTO sales (lot_id, sale_date, buyer, price_per_t, qty_t)
VALUES (:lot, NOW()::date, :'buyer', :price, :qty);

-- 3) Обновляем остаток в партии
UPDATE inventory_lots
SET qty_available_t = qty_available_t - :qty
WHERE lot_id = :lot;

COMMIT;

-- Проверка результата
SELECT * FROM inventory_lots WHERE lot_id = :lot;

