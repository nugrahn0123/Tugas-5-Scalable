-- ============================================
--  Init Script: Jalankan otomatis di Master
-- ============================================

-- Buat user khusus untuk replication
CREATE USER 'replicator'@'%' IDENTIFIED WITH mysql_native_password BY 'replicapass';
GRANT REPLICATION SLAVE ON *.* TO 'replicator'@'%';
FLUSH PRIVILEGES;

-- Buat tabel demo dan seed data awal
USE demo_db;

CREATE TABLE users (
  id         INT AUTO_INCREMENT PRIMARY KEY,
  name       VARCHAR(100) NOT NULL,
  email      VARCHAR(150),
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE products (
  id         INT AUTO_INCREMENT PRIMARY KEY,
  name       VARCHAR(100) NOT NULL,
  price      DECIMAL(10,2),
  stock      INT DEFAULT 0,
  updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

INSERT INTO users (name, email) VALUES
  ('Alice',   'alice@demo.com'),
  ('Bob',     'bob@demo.com'),
  ('Charlie', 'charlie@demo.com');

INSERT INTO products (name, price, stock) VALUES
  ('Laptop',  9500000, 10),
  ('Mouse',   150000,  50),
  ('Keyboard',250000,  30);
