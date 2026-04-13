-- Скрипты для анализа исходных данных
-- и выявления сущностей фактов и измерений

-- Просмотр первых строк для понимания структуры данных
SELECT * FROM mock_data LIMIT 5;

-- Проверяем количество уникальных покупателей, продавцов и товаров
SELECT COUNT(DISTINCT sale_customer_id) FROM mock_data;
SELECT COUNT(DISTINCT sale_seller_id) FROM mock_data;
SELECT COUNT(DISTINCT sale_product_id) FROM mock_data;
-- Получаем по 1000 уникальных значений

-- Проверяем количество уникальных магазинов и поставщиков
SELECT COUNT(DISTINCT store_name) FROM mock_data;
SELECT COUNT(DISTINCT supplier_name) FROM mock_data;
-- Получаем по 383

-- Проверяем связь магазина и поставщика
SELECT store_name, supplier_name FROM mock_data LIMIT 10;
-- Получаем, что каждый магазин связан со своим поставщиком

-- Проверяем, может ли один поставщик быть в разных магазинах
SELECT supplier_name, COUNT(DISTINCT store_name)
FROM mock_data
GROUP BY supplier_name
LIMIT 10;
-- Получаем, что может

-- Проверяем, привязан ли поставщик к товару или к магазину
SELECT product_name, supplier_name, store_name
FROM mock_data
LIMIT 10;
-- Получаем, что один товар поставляется разными поставщиками через разные магазины
-- то есть, поставщик привязан к магазину, а не к товару

-- ИТОГ:

-- Факт: 
-- fact_sale (продажа - событие которое связывает все сущности)

-- Измерения: 
-- dim_customer (покупатели)
-- dim_pet (питомцы - подтаблица покупателя)
-- dim_seller (продавцы)
-- dim_product (товары)
-- dim_store (магазины)
-- dim_supplier (поставщики)
