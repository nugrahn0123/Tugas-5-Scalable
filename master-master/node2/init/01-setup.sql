-- ============================================
--  Init Script Node2 - Master-Master Demo
-- ============================================

-- Buat user replication untuk dipakai Node1
CREATE USER 'replicator'@'%' IDENTIFIED WITH mysql_native_password BY 'replicapass';
GRANT REPLICATION SLAVE ON *.* TO 'replicator'@'%';
FLUSH PRIVILEGES;
