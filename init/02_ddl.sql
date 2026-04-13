-- Питомец
CREATE TABLE dim_pet (
    pet_id SERIAL PRIMARY KEY,
    pet_type VARCHAR,
    pet_breed VARCHAR
);

-- Покупатель
CREATE TABLE dim_customer (
    customer_id INTEGER PRIMARY KEY,
    first_name VARCHAR,
    last_name VARCHAR,
    age INTEGER,
    email VARCHAR,
    country VARCHAR,
    postal_code VARCHAR,
    pet_id INTEGER REFERENCES dim_pet(pet_id)
);

-- Продавец
CREATE TABLE dim_seller (
    seller_id INTEGER PRIMARY KEY,
    first_name VARCHAR,
    last_name VARCHAR,
    email VARCHAR,
    country VARCHAR,
    postal_code VARCHAR
);

-- Товар
CREATE TABLE dim_product (
    product_id INTEGER PRIMARY KEY,
    name VARCHAR,
    category VARCHAR,
    price NUMERIC,
    quantity INTEGER,
    weight NUMERIC,
    color VARCHAR,
    size VARCHAR,
    brand VARCHAR,
    material VARCHAR,
    description TEXT,
    rating NUMERIC,
    reviews INTEGER,
    release_date VARCHAR,
    expiry_date VARCHAR,
    pet_category VARCHAR
);

-- Магазин
CREATE TABLE dim_store (
    store_id SERIAL PRIMARY KEY,
    name VARCHAR,
    location VARCHAR,
    city VARCHAR,
    state VARCHAR,
    country VARCHAR,
    phone VARCHAR,
    email VARCHAR
);

-- Поставщик
CREATE TABLE dim_supplier (
    supplier_id SERIAL PRIMARY KEY,
    name VARCHAR,
    contact VARCHAR,
    email VARCHAR,
    phone VARCHAR,
    address VARCHAR,
    city VARCHAR,
    country VARCHAR
);

-- Факт продажи
CREATE TABLE fact_sale (
    sale_id SERIAL PRIMARY KEY,
    customer_id INTEGER REFERENCES dim_customer(customer_id),
    seller_id INTEGER REFERENCES dim_seller(seller_id),
    product_id INTEGER REFERENCES dim_product(product_id),
    store_id INTEGER REFERENCES dim_store(store_id),
    supplier_id INTEGER REFERENCES dim_supplier(supplier_id),
    sale_date VARCHAR,
    sale_quantity INTEGER,
    sale_total_price NUMERIC
);
