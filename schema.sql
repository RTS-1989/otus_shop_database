CREATE TABLE IF NOT EXISTS category(
    id SERIAL PRIMARY KEY,
    name VARCHAR(80) UNIQUE NOT NULL
);

CREATE TABLE IF NOT EXISTS producer(
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) UNIQUE NOT NULL
);

CREATE TABLE IF NOT EXISTS provider(
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) UNIQUE NOT NULL
);

CREATE TABLE IF NOT EXISTS contacts(
    id SERIAL PRIMARY KEY,
    email VARCHAR(100) UNIQUE NOT NULL,
    phone VARCHAR(15)
);

CREATE TABLE IF NOT EXISTS customer(
    id SERIAL PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    last_name VARCHAR(80) NOT NULL,
    contact_id INTEGER NOT NULL,
    CONSTRAINT fk_contact
    FOREIGN KEY(contact_id)
    REFERENCES contacts(id)
    ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS products(
    id SERIAL PRIMARY KEY,
    title VARCHAR(100) NOT NULL,
    description VARCHAR(500) NOT NULL,
    category_id integer NOT NULL,
    producer_id integer NOT NULL,
    CONSTRAINT fk_category
    FOREIGN KEY(category_id)
    REFERENCES category(id)
    ON DELETE SET NULL,
    CONSTRAINT fk_producer
    FOREIGN KEY(producer_id)
    REFERENCES producer(id)
    ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS price(
    id SERIAL PRIMARY KEY,
    value INTEGER CHECK (value > 0) NOT NULL,
    product_id INTEGER NOT NULL,
    provider_id INTEGER NOT NULL,
    CONSTRAINT fk_product
    FOREIGN KEY(product_id)
    REFERENCES products(id)
    ON DELETE CASCADE,
    CONSTRAINT fk_provider
    FOREIGN KEY(provider_id)
    REFERENCES provider(id)
    ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS purchase(
    id SERIAL PRIMARY KEY,
    customer_id INTEGER NOT NULL,
    price_id INTEGER NOT NULL,
    CONSTRAINT fk_customer
    FOREIGN KEY(customer_id)
    REFERENCES customer (id)
    ON DELETE CASCADE,
    CONSTRAINT fk_price
    FOREIGN KEY(price_id)
    REFERENCES price(id)
    ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS stock_goods(
    id SERIAL PRIMARY KEY,
    goods_balance INTEGER CHECK (goods_balance >=0) NOT NULL,
    product_id INTEGER NOT NULL,
    provider_id INTEGER NOT NULL,
    CONSTRAINT fk_product
    FOREIGN KEY(product_id)
    REFERENCES products(id)
    ON DELETE CASCADE,
    FOREIGN KEY(provider_id)
    REFERENCES provider(id)
    ON DELETE CASCADE
);

CREATE INDEX idx_price_value
ON price(value);

CREATE INDEX idx_price_product_id_value
ON price(product_id, value);

CREATE INDEX idx_price_value_provider_id
ON price(provider_id, value);

CREATE INDEX idx_products_title
ON products(title);

CREATE INDEX idx_purchase_price_id
ON purchase(price_id);

CREATE INDEX idx_stock_goods_product_id_goods_balance
ON stock_goods(product_id, goods_balance);

CREATE INDEX idx_stock_goods_provider_id_goods_balance
ON stock_goods(provider_id, goods_balance);
