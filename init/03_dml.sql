INSERT INTO dim_pet (pet_type, pet_breed)
SELECT DISTINCT
    customer_pet_type,
    customer_pet_breed
FROM mock_data;

INSERT INTO dim_customer (customer_id, first_name, last_name, age, email, country, postal_code, pet_id)
SELECT DISTINCT ON (sale_customer_id)
    sale_customer_id,
    customer_first_name,
    customer_last_name,
    customer_age,
    customer_email,
    customer_country,
    customer_postal_code,
    p.pet_id
FROM mock_data m
JOIN dim_pet p
    ON m.customer_pet_type = p.pet_type
    AND m.customer_pet_breed = p.pet_breed
ORDER BY sale_customer_id;

INSERT INTO dim_seller (seller_id, first_name, last_name, email, country, postal_code)
SELECT DISTINCT ON (sale_seller_id)
    sale_seller_id,
    seller_first_name,
    seller_last_name,
    seller_email,
    seller_country,
    seller_postal_code
FROM mock_data
ORDER BY sale_seller_id;

INSERT INTO dim_product (product_id, name, category, price, quantity, weight, color, size, brand, material, description, rating, reviews, release_date, expiry_date, pet_category)
SELECT DISTINCT ON (sale_product_id)
    sale_product_id,
    product_name,
    product_category,
    product_price,
    product_quantity,
    product_weight,
    product_color,
    product_size,
    product_brand,
    product_material,
    product_description,
    product_rating,
    product_reviews,
    product_release_date,
    product_expiry_date,
    pet_category
FROM mock_data
ORDER BY sale_product_id;

INSERT INTO dim_store (name, location, city, state, country, phone, email)
SELECT DISTINCT ON (store_name)
    store_name,
    store_location,
    store_city,
    store_state,
    store_country,
    store_phone,
    store_email
FROM mock_data
ORDER BY store_name;

INSERT INTO dim_supplier (name, contact, email, phone, address, city, country)
SELECT DISTINCT ON (supplier_name)
    supplier_name,
    supplier_contact,
    supplier_email,
    supplier_phone,
    supplier_address,
    supplier_city,
    supplier_country
FROM mock_data
ORDER BY supplier_name;

INSERT INTO fact_sale (customer_id, seller_id, product_id, store_id, supplier_id, sale_date, sale_quantity, sale_total_price)
SELECT
    m.sale_customer_id,
    m.sale_seller_id,
    m.sale_product_id,
    s.store_id,
    sup.supplier_id,
    m.sale_date,
    m.sale_quantity,
    m.sale_total_price
FROM mock_data AS m
JOIN dim_store AS s ON m.store_name = s.name
JOIN dim_supplier AS sup ON m.supplier_name = sup.name;
