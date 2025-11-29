-- CloudEats: Database Schema for All Microservices
-- PostgreSQL

-- ===========================
-- USERS (Customers + Drivers)
-- ===========================
CREATE TABLE users (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(120) UNIQUE NOT NULL,
    phone VARCHAR(20),
    role VARCHAR(20) CHECK (role IN ('customer', 'driver')),
    created_at TIMESTAMP DEFAULT NOW()
);

-- ===========================
-- INVENTORY SERVICE
-- ===========================
CREATE TABLE ingredients (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    quantity INT NOT NULL,
    unit VARCHAR(20) NOT NULL,
    updated_at TIMESTAMP DEFAULT NOW()
);

CREATE TABLE menu_items (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    description TEXT,
    price NUMERIC(10,2) NOT NULL,
    ingredient_id INT REFERENCES ingredients(id),
    updated_at TIMESTAMP DEFAULT NOW()
);

-- ===========================
-- ORDERS
-- ===========================
CREATE TABLE orders (
    id SERIAL PRIMARY KEY,
    user_id INT REFERENCES users(id),
    status VARCHAR(20) CHECK (status IN ('pending','confirmed','preparing','delivering','completed','cancelled')),
    total NUMERIC(10,2),
    created_at TIMESTAMP DEFAULT NOW()
);

CREATE TABLE order_items (
    id SERIAL PRIMARY KEY,
    order_id INT REFERENCES orders(id) ON DELETE CASCADE,
    menu_item_id INT REFERENCES menu_items(id),
    quantity INT NOT NULL
);

-- ===========================
-- FLEET / DELIVERY
-- ===========================
CREATE TABLE deliveries (
    id SERIAL PRIMARY KEY,
    order_id INT REFERENCES orders(id),
    driver_id INT REFERENCES users(id),
    status VARCHAR(20) CHECK (status IN ('assigned','out_for_delivery','delivered')),
    estimated_time VARCHAR(50)
);

-- ===========================
-- PAYMENT SERVICE
-- ===========================
CREATE TABLE payments (
    id SERIAL PRIMARY KEY,
    order_id INT REFERENCES orders(id),
    amount NUMERIC(10,2) NOT NULL,
    status VARCHAR(20) CHECK(status IN ('pending','paid','failed')),
    transaction_time TIMESTAMP DEFAULT NOW()
);

-- ===========================
-- NOTIFICATIONS
-- ===========================
CREATE TABLE notifications (
    id SERIAL PRIMARY KEY,
    user_id INT REFERENCES users(id),
    message TEXT NOT NULL,
    sent_at TIMESTAMP DEFAULT NOW()
);
