-- RESET
DROP DATABASE IF EXISTS FoodSystem;
CREATE DATABASE FoodSystem;
USE FoodSystem;

-- TABLE
CREATE TABLE Restaurants (
    id INT AUTO_INCREMENT PRIMARY KEY,
    restaurant_name VARCHAR(255),
    created_at DATETIME
);

-- DATA
INSERT INTO Restaurants (restaurant_name, created_at) VALUES
('Quan A', '2023-01-01 10:00:00'),
('Quan B', '2024-05-10 09:00:00'),
('Quan C', '2025-01-01 08:00:00'),
('Quan D', '2025-02-01 07:00:00'),
('Quan E', '2025-03-01 06:00:00'),
('Quan F', '2025-04-01 05:00:00'),
('Quan G', '2025-05-01 04:00:00');

-- =========================
-- PHÂN TÍCH LỖI
-- =========================
-- Query dùng LIMIT nhưng KHÔNG có ORDER BY
-- => SQL không đảm bảo thứ tự trả về (non-deterministic)
-- => Mỗi lần chạy có thể lấy 5 dòng ngẫu nhiên
-- => Không đúng yêu cầu "quán mới nhất"

-- =========================
-- QUERY SAI (đã comment)
-- =========================
/*
SELECT restaurant_name, created_at
FROM Restaurants
LIMIT 5;
*/

-- =========================
-- QUERY ĐÚNG
-- =========================
-- Sắp xếp theo thời gian tạo giảm dần (mới nhất trước)
SELECT restaurant_name, created_at
FROM Restaurants
ORDER BY created_at DESC
LIMIT 5;