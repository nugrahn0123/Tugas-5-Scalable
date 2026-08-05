-- ============================================
--  Init Script - Sync vs Async Demo
-- ============================================

CREATE USER 'replicator'@'%' IDENTIFIED WITH mysql_native_password BY 'replicapass';
GRANT REPLICATION SLAVE ON *.* TO 'replicator'@'%';
FLUSH PRIVILEGES;

USE demo_db;

CREATE TABLE transactions (
  id           INT AUTO_INCREMENT PRIMARY KEY,
  description  VARCHAR(200),
  amount       DECIMAL(12,2),
  created_at   TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

INSERT INTO transactions (description, amount) VALUES
  ('Pembayaran awal', 100000.00),
  ('Transfer masuk',  500000.00);
