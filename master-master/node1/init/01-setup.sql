-- ============================================
--  Init Script Node1 - Master-Master Demo
-- ============================================

-- Buat user replication untuk dipakai Node2
CREATE USER 'replicator'@'%' IDENTIFIED WITH mysql_native_password BY 'replicapass';
GRANT REPLICATION SLAVE ON *.* TO 'replicator'@'%';
FLUSH PRIVILEGES;

-- Seed data awal (hanya di Node1)
USE demo_db;

CREATE TABLE orders (
  id         INT AUTO_INCREMENT PRIMARY KEY,
  customer   VARCHAR(100) NOT NULL,
  product    VARCHAR(100) NOT NULL,
  amount     DECIMAL(10,2),
  node_src   TINYINT COMMENT '1=dari node1, 2=dari node2',
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Data awal dari node1 (ID akan ganjil: 1, 3, 5, ...)
INSERT INTO orders (customer, product, amount, node_src) VALUES
  ('Alice', 'Laptop',   9500000, 1),
  ('Bob',   'Mouse',     150000, 1);
