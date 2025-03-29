-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: localhost
-- Thời gian đã tạo: Th3 23, 2025 lúc 02:04 AM
-- Phiên bản máy phục vụ: 10.4.28-MariaDB
-- Phiên bản PHP: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `chatbot_laptop_db`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `admin`
--

CREATE TABLE `admin` (
  `id` int(11) NOT NULL,
  `username` varchar(100) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password_hash` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `admin`
--

INSERT INTO `admin` (`id`, `username`, `email`, `password_hash`, `created_at`) VALUES
(1, 'admin', 'admin@example.com', 'scrypt:32768:8:1$a7BJbiW88tckKHns$f4e3a8653fc47d8a9b9386adf1a87133e0913563350ecd20cd191ef2a4a57df91938f7f4ed60801fb7eaef086c779952fef9ac9a4543ba52a0831f70d0c0e8c0', '2025-03-19 03:08:56');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `chatbot_history`
--

CREATE TABLE `chatbot_history` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `message` text NOT NULL,
  `response` text NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `chatbot_history`
--

INSERT INTO `chatbot_history` (`id`, `user_id`, `message`, `response`, `timestamp`) VALUES
(12, NULL, 'Tôi muốn tăng RAM MacBook Air M2 lên 16GB', 'Xin lỗi, tôi không tìm thấy thông tin về laptop này.', '2025-03-19 05:46:59'),
(13, NULL, 'Tôi muốn tăng RAM MacBook Air M2 lên 16GB', 'Xin lỗi, tôi không tìm thấy thông tin về laptop này.', '2025-03-19 05:47:04'),
(14, NULL, 'Nâng cấp RAM MacBook Air M2 thành 16GB', 'Xin lỗi, tôi không tìm thấy thông tin về laptop này.', '2025-03-19 05:47:17'),
(15, NULL, 'MacBook Air M2', 'Hãng: Apple, Giá: 1200.00$, Thông số: Chip M2, RAM 16GB, SSD 512GB, Hình ảnh: images/macbook_air_m2.jpg', '2025-03-19 05:53:35'),
(16, NULL, 'Nâng cấp RAM MacBook Air M2 thành 16GB', 'Xin lỗi, tôi không tìm thấy thông tin về laptop này.', '2025-03-19 05:53:47'),
(17, NULL, 'MacBook Air M2', 'Hãng: Apple, Giá: 1200.00$, Thông số: Chip M2, RAM 16GB, SSD 512GB, Hình ảnh: images/macbook_air_m2.jpg', '2025-03-19 05:54:16'),
(18, NULL, 'Nâng cấp RAM MacBook Air M2 thành 16GB', 'Xin lỗi, tôi không tìm thấy thông tin về laptop này.', '2025-03-19 05:54:26'),
(19, NULL, 'Tăng RAM của MacBook Air M2 lên 16GB', 'Xin lỗi, tôi không tìm thấy thông tin về laptop này.', '2025-03-19 05:55:20'),
(20, NULL, 'Nâng cấp RAM MacBook Air M2 thành 16GB', 'Xin lỗi, tôi không tìm thấy thông tin về laptop này.', '2025-03-19 05:55:32'),
(21, NULL, 'MacBook Air M2', 'Hãng: Apple, Giá: 1200.00$, Thông số: Chip M2, RAM 16GB, SSD 512GB, Hình ảnh: images/macbook_air_m2.jpg', '2025-03-19 05:58:59'),
(22, NULL, 'Nâng cấp RAM MacBook Air M2 thành 16GB', 'Xin lỗi, tôi không tìm thấy thông tin về laptop này.', '2025-03-19 05:59:50'),
(23, NULL, 'Nâng cấp RAM 8GB của MacBook Air M2 thành RAM 16GB', 'Xin lỗi, tôi không tìm thấy thông tin về laptop này.', '2025-03-19 06:00:24'),
(24, NULL, 'MacBook Air M2', 'Hãng: Apple, Giá: 1200.00$, Thông số: Chip M2, RAM 16GB, SSD 512GB, Hình ảnh: images/macbook_air_m2.jpg', '2025-03-19 06:10:34'),
(25, NULL, 'MacBook Air M2', 'Hãng: Apple, Giá: 1200.00$, Thông số: Chip M2, RAM 16GB, SSD 512GB, Hình ảnh: images/macbook_air_m2.jpg', '2025-03-19 06:49:04'),
(26, NULL, 'MacBook Air M2', 'Hãng: Apple, Giá: 1200.00$, Thông số: Chip M2, RAM 16GB, SSD 512GB, Hình ảnh: images/macbook_air_m2.jpg', '2025-03-19 07:23:19'),
(27, NULL, 'MacBook Air M2', 'Hãng: Apple, Giá: 1200.00$, Thông số: Chip M2, RAM 16GB, SSD 512GB, Hình ảnh: images/macbook_air_m2.jpg', '2025-03-19 07:28:10'),
(28, NULL, 'Dell XPS 13', 'Hãng: Dell, Giá: 1400.00$, Thông số: Intel i7, RAM 16GB, SSD 1TB, Hình ảnh: images/dell_xps_13.jpg', '2025-03-19 07:31:34'),
(29, NULL, 'MacBook Air M2', 'Hãng: Apple, Giá: 1200.00$, Thông số: Chip M2, RAM 16GB, SSD 512GB, Hình ảnh: images/macbook_air_m2.jpg', '2025-03-19 07:59:56'),
(30, NULL, 'Nâng cấp RAM cho MacBook Air M2 lên 32GB', 'Xin lỗi, tôi không tìm thấy thông tin về laptop này.', '2025-03-19 08:00:58'),
(31, NULL, 'nâng cấp RAM cho MacBook Air M2 lên 32GB', 'Xin lỗi, tôi không tìm thấy thông tin về laptop này.', '2025-03-19 08:01:27'),
(32, NULL, 'Nâng cấp RAM MacBook Air M2 lên 32GB', 'Xin lỗi, tôi không tìm thấy thông tin về laptop này.', '2025-03-19 08:16:50'),
(33, NULL, 'Nâng cấp RAM MacBook Air M2 lên 32GB.', 'Xin lỗi, tôi không tìm thấy thông tin về laptop này.', '2025-03-19 08:16:55'),
(34, NULL, 'Nâng cấp RAM laptop_id 1 lên 32GB', 'Xin lỗi, tôi không tìm thấy thông tin về laptop này.', '2025-03-19 08:17:28'),
(35, NULL, 'MacBook Air M2', 'Hãng: Apple, Giá: 1200.00$, Thông số: Chip M2, RAM 16GB, SSD 512GB, Hình ảnh: images/macbook_air_m2.jpg', '2025-03-19 08:18:04'),
(36, NULL, 'Nâng cấp RAM MacBook Air M2 lên 32GB', 'Xin lỗi, tôi không tìm thấy thông tin về laptop này.', '2025-03-19 08:31:51'),
(37, NULL, 'Nâng cấp RAM MacBook Air M2 lên 32GB.', 'Xin lỗi, tôi không tìm thấy thông tin về laptop này.', '2025-03-19 08:34:38'),
(38, NULL, 'Nâng cấp RAM MacBook Air M2 lên 32GB', 'Xin lỗi, tôi không tìm thấy thông tin về laptop này.', '2025-03-19 08:34:41'),
(39, NULL, 'Nâng cấp RAM MacBook Air M2 lên 32GB', 'Hãng: Apple, Giá: 1200.00$, Thông số: Chip M2, RAM 16GB, SSD 512GB, Hình ảnh: images/macbook_air_m2.jpg', '2025-03-19 08:39:45'),
(40, NULL, 'Nâng cấp RAM MacBook Air M2 lên 32GB', 'Hãng: Apple, Giá: 1200.00$, Thông số: Chip M2, RAM 16GB, SSD 512GB, Hình ảnh: images/macbook_air_m2.jpg', '2025-03-19 08:39:53'),
(41, NULL, 'Dell', 'Hãng: Dell, Giá: 1400.00$, Thông số: Intel i7, RAM 16GB, SSD 1TB, Hình ảnh: images/dell_xps_13.jpg', '2025-03-19 08:40:25'),
(42, NULL, 'Asus', 'Hãng: Asus, Giá: 1600.00$, Thông số: Ryzen 9, RAM 32GB, RTX 3060, Hình ảnh: images/asus_rog_g14.jpg', '2025-03-19 08:40:32'),
(43, NULL, 'Nâng cấp RAM MacBook Air M2 lên 32GB.', 'Hãng: Apple, Giá: 1200.00$, Thông số: Chip M2, RAM 16GB, SSD 512GB, Hình ảnh: images/macbook_air_m2.jpg\nMacBook không hỗ trợ 32GB RAM. Các tùy chọn RAM có sẵn là:\n8GB RAM (Thay đổi giá: -200.00$)\n16GB RAM (Thay đổi giá: 150.00$)\n32GB RAM (Thay đổi giá: 300.00$)', '2025-03-19 08:53:23'),
(44, NULL, 'MacBook Air M2', 'Hãng: Apple, Giá: 1200.00$, Thông số: Chip M2, RAM 16GB, SSD 512GB, Hình ảnh: images/macbook_air_m2.jpg\nKhông có yêu cầu về RAM.', '2025-03-19 08:53:36'),
(45, NULL, 'Dell XPS 13', 'Hãng: Dell, Giá: 1400.00$, Thông số: Intel i7, RAM 16GB, SSD 1TB, Hình ảnh: images/dell_xps_13.jpg\nKhông có yêu cầu về RAM.', '2025-03-19 08:57:46'),
(46, NULL, 'Nâng cấp CPU Dell XPS 13 lên Intel i9', 'Hãng: Dell, Giá: 1400.00$, Thông số: Intel i7, RAM 16GB, SSD 1TB, Hình ảnh: images/dell_xps_13.jpg\nKhông có yêu cầu về RAM.', '2025-03-19 08:59:28'),
(47, NULL, 'Nâng cấp RAM MacBook Air M2 lên 32GB', 'Hãng: Apple, Giá: 1200.00$, Thông số: Chip M2, RAM 16GB, SSD 512GB, Hình ảnh: images/macbook_air_m2.jpg\nMacBook không hỗ trợ 32GB RAM. Các tùy chọn RAM có sẵn là:\n8GB RAM (Thay đổi giá: -200.00$)\n16GB RAM (Thay đổi giá: 150.00$)\n32GB RAM (Thay đổi giá: 300.00$)', '2025-03-19 08:59:59'),
(48, NULL, 'hạ cấp CPU Dell XPS 13 xuống SSD 512GB', 'Hãng: Dell, Giá: 1400.00$, Thông số: Intel i7, RAM 16GB, SSD 1TB, Hình ảnh: images/dell_xps_13.jpg\nDell không hỗ trợ 512GB RAM. Các tùy chọn RAM có sẵn là:\n8GB RAM (Thay đổi giá: -150.00$)', '2025-03-19 09:05:19'),
(49, NULL, 'hạ cấp RAM MacBook Air M2 lên 8GB', 'Hãng: Apple, Giá: 1200.00$, Thông số: Chip M2, RAM 16GB, SSD 512GB, Hình ảnh: images/macbook_air_m2.jpg\nMacBook không hỗ trợ 8GB RAM. Các tùy chọn RAM có sẵn là:\n8GB RAM (Thay đổi giá: -200.00$)\n16GB RAM (Thay đổi giá: 150.00$)\n32GB RAM (Thay đổi giá: 300.00$)', '2025-03-19 09:05:38'),
(50, NULL, 'hạ cấp RAM MacBook Air M2 xuống 8GB', 'Hãng: Apple, Giá: 1200.00$, Thông số: Chip M2, RAM 16GB, SSD 512GB, Hình ảnh: images/macbook_air_m2.jpg\nMacBook không hỗ trợ 8GB RAM. Các tùy chọn RAM có sẵn là:\n8GB RAM (Thay đổi giá: -200.00$)\n16GB RAM (Thay đổi giá: 150.00$)\n32GB RAM (Thay đổi giá: 300.00$)', '2025-03-19 09:05:54'),
(51, NULL, 'hạ cấp RAM MacBook Air M2 xuống 16GB', 'Hãng: Apple, Giá: 1200.00$, Thông số: Chip M2, RAM 16GB, SSD 512GB, Hình ảnh: images/macbook_air_m2.jpg\nMacBook không hỗ trợ 16GB RAM. Các tùy chọn RAM có sẵn là:\n8GB RAM (Thay đổi giá: -200.00$)\n16GB RAM (Thay đổi giá: 150.00$)\n32GB RAM (Thay đổi giá: 300.00$)', '2025-03-19 09:07:29'),
(52, NULL, 'hạ cấp RAM MacBook Air M2 lên 16GB', 'Hãng: Apple, Giá: 1200.00$, Thông số: Chip M2, RAM 16GB, SSD 512GB, Hình ảnh: images/macbook_air_m2.jpg\nMacBook không hỗ trợ 16GB RAM. Các tùy chọn RAM có sẵn là:\n8GB RAM (Thay đổi giá: -200.00$)\n16GB RAM (Thay đổi giá: 150.00$)\n32GB RAM (Thay đổi giá: 300.00$)', '2025-03-19 09:07:42'),
(53, NULL, 'MacBook Air M2', 'Hãng: Apple, Giá: 1200.00$, Thông số: Chip M2, RAM 16GB, SSD 512GB, Hình ảnh: images/macbook_air_m2.jpg\nKhông có yêu cầu về RAM.\nKhông có yêu cầu về GPU.\nKhông có yêu cầu về CPU.\nKhông có yêu cầu về SSD.\n', '2025-03-19 13:27:45'),
(54, NULL, 'Dell XPS 13', 'Hãng: Dell, Giá: 1400.00$, Thông số: Intel i7, RAM 16GB, SSD 1TB, Hình ảnh: images/dell_xps_13.jpg\nKhông có yêu cầu về RAM.\nKhông có yêu cầu về GPU.\nKhông có yêu cầu về CPU.\nKhông có yêu cầu về SSD.\n', '2025-03-19 13:27:54'),
(55, NULL, 'Asus ROG Zephyrus G14', 'Hãng: Asus, Giá: 1600.00$, Thông số: Ryzen 9, RAM 32GB, RTX 3060, Hình ảnh: images/asus_rog_g14.jpg\nKhông có yêu cầu về RAM.\nKhông có yêu cầu về GPU.\nKhông có yêu cầu về CPU.\nKhông có yêu cầu về SSD.\n', '2025-03-19 13:28:19'),
(56, NULL, 'Nâng cấp RAM Asus ROG Zephyrus G14 lên 32GB', 'Hãng: Asus, Giá: 1600.00$, Thông số: Ryzen 9, RAM 32GB, RTX 3060, Hình ảnh: images/asus_rog_g14.jpg\nAsus không hỗ trợ 32GB RAM. Các tùy chọn RAM có sẵn là:\n8GB RAM (Thay đổi giá: -250.00$)\n16GB RAM (Thay đổi giá: 0.00$)\n32GB RAM (Thay đổi giá: 300.00$)\nAsus không hỗ trợ 32GB GPU. Các tùy chọn GPU có sẵn là:\nRTX 3050 (Thay đổi giá: -300.00$)\nRTX 3060 (Thay đổi giá: 0.00$)\nRTX 3070 (Thay đổi giá: 500.00$)\nAsus không hỗ trợ 32GB CPU. Các tùy chọn CPU có sẵn là:\nRyzen 3 (Thay đổi giá: -400.00$)\nRyzen 5 (Thay đổi giá: -200.00$)\nRyzen 7 (Thay đổi giá: 0.00$)\nRyzen 9 (Thay đổi giá: 450.00$)\nAsus không hỗ trợ 32GB SSD. Các tùy chọn SSD có sẵn là:\n512GB SSD (Thay đổi giá: -200.00$)\n1TB SSD (Thay đổi giá: 0.00$)\n2TB SSD (Thay đổi giá: 400.00$)\n', '2025-03-19 13:28:37'),
(57, NULL, 'Hạ cấp CPU Dell XPS 13 xuống Intel i5', 'Hãng: Dell, Giá: 1400.00$, Thông số: Intel i7, RAM 16GB, SSD 1TB, Hình ảnh: images/dell_xps_13.jpg\nKhông có yêu cầu về RAM.\nKhông có yêu cầu về GPU.\nKhông có yêu cầu về CPU.\nKhông có yêu cầu về SSD.\n', '2025-03-19 13:29:17'),
(58, NULL, 'Hạ cấp GPU Asus ROG Zephyrus G14 xuống RTX 3050', 'Hãng: Asus, Giá: 1600.00$, Thông số: Ryzen 9, RAM 32GB, RTX 3060, Hình ảnh: images/asus_rog_g14.jpg\nKhông có yêu cầu về RAM.\nKhông có yêu cầu về GPU.\nKhông có yêu cầu về CPU.\nKhông có yêu cầu về SSD.\n', '2025-03-19 13:29:47'),
(59, NULL, 'Hạ cấp SSD Dell XPS 13 xuống 256GB', 'Hãng: Dell, Giá: 1400.00$, Thông số: Intel i7, RAM 16GB, SSD 1TB, Hình ảnh: images/dell_xps_13.jpg\nDell không hỗ trợ 256GB RAM. Các tùy chọn RAM có sẵn là:\n8GB RAM (Thay đổi giá: -150.00$)\n16GB RAM (Thay đổi giá: 0.00$)\n32GB RAM (Thay đổi giá: 450.00$)\nDell không hỗ trợ 256GB GPU. Các tùy chọn GPU có sẵn là:\n\nDell không hỗ trợ 256GB CPU. Các tùy chọn CPU có sẵn là:\nIntel i5 (Thay đổi giá: -200.00$)\nIntel i7 (Thay đổi giá: 0.00$)\nIntel i9 (Thay đổi giá: 350.00$)\nBạn có thể nâng cấp SSD lên 256GB với giá -120.00$.\n', '2025-03-19 13:30:04'),
(60, NULL, 'Nâng cấp RAM Asus ROG Zephyrus G14 lên 32GB', 'Hãng: Asus, Giá: 1600.00$, Thông số: Ryzen 9, RAM 32GB, RTX 3060, Hình ảnh: images/asus_rog_g14.jpg\nAsus không hỗ trợ 32GB RAM. Các tùy chọn RAM có sẵn là:\n8GB RAM (Thay đổi giá: -250.00$)\n16GB RAM (Thay đổi giá: 0.00$)\n32GB RAM (Thay đổi giá: 300.00$)\nAsus không hỗ trợ 32GB SSD. Các tùy chọn SSD có sẵn là:\n512GB SSD (Thay đổi giá: -200.00$)\n1TB SSD (Thay đổi giá: 0.00$)\n2TB SSD (Thay đổi giá: 400.00$)\n', '2025-03-19 13:39:06'),
(61, NULL, 'Hạ cấp CPU Dell XPS 13 xuống Intel i5', 'Hãng: Dell, Giá: 1400.00$, Thông số: Intel i7, RAM 16GB, SSD 1TB, Hình ảnh: images/dell_xps_13.jpg\nBạn có thể nâng cấp CPU lên Intel i5 với giá -200.00$.\n', '2025-03-19 13:39:25'),
(62, NULL, 'Nâng cấp CPU Dell XPS 13 lên Intel i5', 'Hãng: Dell, Giá: 1400.00$, Thông số: Intel i7, RAM 16GB, SSD 1TB, Hình ảnh: images/dell_xps_13.jpg\nBạn có thể nâng cấp CPU lên Intel i5 với giá -200.00$.\n', '2025-03-19 13:39:40'),
(63, NULL, 'Hạ cấp GPU Asus ROG Zephyrus G14 xuống RTX 3050', 'Hãng: Asus, Giá: 1600.00$, Thông số: Ryzen 9, RAM 32GB, RTX 3060, Hình ảnh: images/asus_rog_g14.jpg\nBạn có thể nâng cấp GPU lên RTX 3050 với giá -300.00$.\n', '2025-03-19 13:39:53'),
(64, NULL, 'Nâng cấp GPU Asus ROG Zephyrus G14 lên RTX 3060', 'Hãng: Asus, Giá: 1600.00$, Thông số: Ryzen 9, RAM 32GB, RTX 3060, Hình ảnh: images/asus_rog_g14.jpg\nBạn có thể nâng cấp GPU lên RTX 3060 với giá 0.00$.\n', '2025-03-19 13:40:19'),
(65, NULL, 'Hạ cấp SSD Dell XPS 13 xuống 256GB.', 'Hãng: Dell, Giá: 1400.00$, Thông số: Intel i7, RAM 16GB, SSD 1TB, Hình ảnh: images/dell_xps_13.jpg\nDell không hỗ trợ 256GB RAM. Các tùy chọn RAM có sẵn là:\n8GB RAM (Thay đổi giá: -150.00$)\n16GB RAM (Thay đổi giá: 0.00$)\n32GB RAM (Thay đổi giá: 450.00$)\nBạn có thể nâng cấp SSD lên 256GB với giá -120.00$.\n', '2025-03-19 13:40:36'),
(66, NULL, 'Nâng cấp SSD Dell XPS 13 lên 256GB.', 'Hãng: Dell, Giá: 1400.00$, Thông số: Intel i7, RAM 16GB, SSD 1TB, Hình ảnh: images/dell_xps_13.jpg\nDell không hỗ trợ 256GB RAM. Các tùy chọn RAM có sẵn là:\n8GB RAM (Thay đổi giá: -150.00$)\n16GB RAM (Thay đổi giá: 0.00$)\n32GB RAM (Thay đổi giá: 450.00$)\nBạn có thể nâng cấp SSD lên 256GB với giá -120.00$.\n', '2025-03-19 13:40:55'),
(67, NULL, 'Nâng cấp RAM Asus ROG Zephyrus G14 lên 32GB', 'Hãng: Asus, Giá: 1600.00$, Thông số: Ryzen 9, RAM 32GB, RTX 3060, Hình ảnh: images/asus_rog_g14.jpg\nAsus không hỗ trợ 32GB RAM. Các tùy chọn RAM có sẵn là:\n8GB RAM (Thay đổi giá: -250.00$)\n16GB RAM (Thay đổi giá: 0.00$)\n32GB RAM (Thay đổi giá: 300.00$)\nAsus không hỗ trợ 32GB SSD. Các tùy chọn SSD có sẵn là:\n512GB SSD (Thay đổi giá: -200.00$)\n1TB SSD (Thay đổi giá: 0.00$)\n2TB SSD (Thay đổi giá: 400.00$)\n', '2025-03-19 13:41:13'),
(68, NULL, 'Hạ cấp RAM Asus ROG Zephyrus G14 xuống 16GB', 'Hãng: Asus, Giá: 1600.00$, Thông số: Ryzen 9, RAM 32GB, RTX 3060, Hình ảnh: images/asus_rog_g14.jpg\nAsus không hỗ trợ 16GB RAM. Các tùy chọn RAM có sẵn là:\n8GB RAM (Thay đổi giá: -250.00$)\n16GB RAM (Thay đổi giá: 0.00$)\n32GB RAM (Thay đổi giá: 300.00$)\nAsus không hỗ trợ 16GB SSD. Các tùy chọn SSD có sẵn là:\n512GB SSD (Thay đổi giá: -200.00$)\n1TB SSD (Thay đổi giá: 0.00$)\n2TB SSD (Thay đổi giá: 400.00$)\n', '2025-03-19 13:41:25'),
(69, NULL, 'Nâng cấp RAM Asus ROG Zephyrus G14 lên 32GB', 'Hãng: Asus, Giá: 1600.00$, Thông số: Ryzen 9, RAM 32GB, RTX 3060, Hình ảnh: images/asus_rog_g14.jpg\nAsus không hỗ trợ 32GB RAM. Các tùy chọn RAM có sẵn là:\n8GB RAM (Thay đổi giá: -250.00$)\n16GB RAM (Thay đổi giá: 0.00$)\n32GB RAM (Thay đổi giá: 300.00$)\nKhông có yêu cầu về GPU.\nKhông có yêu cầu về CPU.\n', '2025-03-19 13:50:04'),
(70, NULL, 'Hạ cấp CPU Dell XPS 13 xuống Intel i5', 'Hãng: Dell, Giá: 1400.00$, Thông số: Intel i7, RAM 16GB, SSD 1TB, Hình ảnh: images/dell_xps_13.jpg\nKhông có yêu cầu về RAM.\nKhông có yêu cầu về GPU.\nBạn có thể nâng cấp CPU lên Intel i5 với giá -200.00$.\nKhông có yêu cầu về SSD.\n', '2025-03-19 13:50:26'),
(71, NULL, 'Hạ cấp GPU Asus ROG Zephyrus G14 xuống RTX 3050', 'Hãng: Asus, Giá: 1600.00$, Thông số: Ryzen 9, RAM 32GB, RTX 3060, Hình ảnh: images/asus_rog_g14.jpg\nKhông có yêu cầu về RAM.\nBạn có thể nâng cấp GPU lên RTX 3050 với giá -300.00$.\nKhông có yêu cầu về CPU.\nKhông có yêu cầu về SSD.\n', '2025-03-19 13:50:43'),
(72, NULL, 'Nâng cấp RAM Asus ROG Zephyrus G14 lên 32GB', 'Hãng: Asus, Giá: 1600.00$, Thông số: Ryzen 9, RAM 32GB, RTX 3060, Hình ảnh: images/asus_rog_g14.jpg\nAsus không hỗ trợ 32GB RAM. Các tùy chọn RAM có sẵn là:\n8GB RAM (Thay đổi giá: -250.00$)\n16GB RAM (Thay đổi giá: 0.00$)\n32GB RAM (Thay đổi giá: 300.00$)\nAsus không hỗ trợ 32GB SSD. Các tùy chọn SSD có sẵn là:\n512GB SSD (Thay đổi giá: -200.00$)\n1TB SSD (Thay đổi giá: 0.00$)\n2TB SSD (Thay đổi giá: 400.00$)\n', '2025-03-19 13:54:10'),
(73, NULL, 'Hạ cấp CPU Dell XPS 13 xuống Intel i5', 'Hãng: Dell, Giá: 1400.00$, Thông số: Intel i7, RAM 16GB, SSD 1TB, Hình ảnh: images/dell_xps_13.jpg\nBạn có thể nâng cấp CPU lên Intel i5 với giá -200.00$.\n', '2025-03-19 13:54:25'),
(74, NULL, 'Hạ cấp GPU Asus ROG Zephyrus G14 xuống RTX 3050', 'Hãng: Asus, Giá: 1600.00$, Thông số: Ryzen 9, RAM 32GB, RTX 3060, Hình ảnh: images/asus_rog_g14.jpg\nBạn có thể nâng cấp GPU lên RTX 3050 với giá -300.00$.\n', '2025-03-19 13:54:36'),
(75, NULL, 'Hạ cấp SSD Dell XPS 13 xuống 256GB', 'Hãng: Dell, Giá: 1400.00$, Thông số: Intel i7, RAM 16GB, SSD 1TB, Hình ảnh: images/dell_xps_13.jpg\nDell không hỗ trợ 256GB RAM. Các tùy chọn RAM có sẵn là:\n8GB RAM (Thay đổi giá: -150.00$)\n16GB RAM (Thay đổi giá: 0.00$)\n32GB RAM (Thay đổi giá: 450.00$)\nBạn có thể nâng cấp SSD lên 256GB với giá -120.00$.\n', '2025-03-19 13:55:06'),
(76, NULL, 'Nâng cấp RAM Asus ROG Zephyrus G14 lên 32GB', 'Hãng: Asus, Giá: 1600.00$, Thông số: Ryzen 9, RAM 32GB, RTX 3060, Hình ảnh: images/asus_rog_g14.jpg\nKhông xác định yêu cầu về RAM. Vui lòng nhập yêu cầu rõ ràng về **nâng cấp** hoặc **hạ cấp**.\nKhông xác định yêu cầu về SSD. Vui lòng nhập yêu cầu rõ ràng về **nâng cấp** hoặc **hạ cấp**.\n', '2025-03-19 14:00:17'),
(77, NULL, 'nâng cấp RAM Asus ROG Zephyrus G14 lên 32GB', 'Hãng: Asus, Giá: 1600.00$, Thông số: Ryzen 9, RAM 32GB, RTX 3060, Hình ảnh: images/asus_rog_g14.jpg\nAsus không hỗ trợ 32GB RAM. Các tùy chọn RAM có sẵn là:\n8GB RAM (Thay đổi giá: -250.00$)\n16GB RAM (Thay đổi giá: 0.00$)\n32GB RAM (Thay đổi giá: 300.00$)\nAsus không hỗ trợ 32GB SSD. Các tùy chọn SSD có sẵn là:\n512GB SSD (Thay đổi giá: -200.00$)\n1TB SSD (Thay đổi giá: 0.00$)\n2TB SSD (Thay đổi giá: 400.00$)\n', '2025-03-19 14:00:35'),
(78, NULL, 'Hạ cấp CPU Dell XPS 13 xuống Intel i5', 'Hãng: Dell, Giá: 1400.00$, Thông số: Intel i7, RAM 16GB, SSD 1TB, Hình ảnh: images/dell_xps_13.jpg\nKhông xác định yêu cầu về CPU. Vui lòng nhập yêu cầu rõ ràng về **nâng cấp** hoặc **hạ cấp**.\n', '2025-03-19 14:00:53'),
(79, NULL, 'hạ cấp CPU Dell XPS 13 xuống Intel i5', 'Hãng: Dell, Giá: 1400.00$, Thông số: Intel i7, RAM 16GB, SSD 1TB, Hình ảnh: images/dell_xps_13.jpg\nBạn có thể **hạ cấp** CPU xuống Intel i5 với giá -200.00$.\n', '2025-03-19 14:01:01'),
(80, NULL, 'nâng cấp CPU Dell XPS 13 lên Intel i5', 'Hãng: Dell, Giá: 1400.00$, Thông số: Intel i7, RAM 16GB, SSD 1TB, Hình ảnh: images/dell_xps_13.jpg\nBạn có thể **nâng cấp** CPU lên Intel i5 với giá -200.00$.\n', '2025-03-19 14:01:22'),
(81, NULL, 'hạ cấp GPU Asus ROG Zephyrus G14 xuống RTX 3050', 'Hãng: Asus, Giá: 1600.00$, Thông số: Ryzen 9, RAM 32GB, RTX 3060, Hình ảnh: images/asus_rog_g14.jpg\nBạn có thể **hạ cấp** GPU xuống RTX 3050 với giá -300.00$.\n', '2025-03-19 14:01:47'),
(82, NULL, 'Hạ cấp SSD Dell XPS 13 xuống 256GB', 'Hãng: Dell, Giá: 1400.00$, Thông số: Intel i7, RAM 16GB, SSD 1TB, Hình ảnh: images/dell_xps_13.jpg\nKhông xác định yêu cầu về RAM. Vui lòng nhập yêu cầu rõ ràng về **nâng cấp** hoặc **hạ cấp**.\nKhông xác định yêu cầu về SSD. Vui lòng nhập yêu cầu rõ ràng về **nâng cấp** hoặc **hạ cấp**.\n', '2025-03-19 14:02:03'),
(83, NULL, 'hạ cấp SSD Dell XPS 13 xuống 256GB', 'Hãng: Dell, Giá: 1400.00$, Thông số: Intel i7, RAM 16GB, SSD 1TB, Hình ảnh: images/dell_xps_13.jpg\nDell không hỗ trợ 256GB RAM. Các tùy chọn RAM có sẵn là:\n8GB RAM (Thay đổi giá: -150.00$)\n16GB RAM (Thay đổi giá: 0.00$)\n32GB RAM (Thay đổi giá: 450.00$)\nBạn có thể **hạ cấp** SSD xuống 256GB với giá -120.00$.\n', '2025-03-19 14:02:09'),
(84, NULL, 'Nâng cấp RAM Asus ROG Zephyrus G14 lên 32GB', 'Hãng: Asus, Giá: 1600.00$, Thông số: Ryzen 9, RAM 32GB, RTX 3060, Hình ảnh: images/asus_rog_g14.jpg\nAsus không hỗ trợ 32GB RAM. Các tùy chọn RAM có sẵn là:\n8GB RAM (Thay đổi giá: -250.00$)\n16GB RAM (Thay đổi giá: 0.00$)\n32GB RAM (Thay đổi giá: 300.00$)\nAsus không hỗ trợ 32GB SSD. Các tùy chọn SSD có sẵn là:\n512GB SSD (Thay đổi giá: -200.00$)\n1TB SSD (Thay đổi giá: 0.00$)\n2TB SSD (Thay đổi giá: 400.00$)\n', '2025-03-19 14:09:08'),
(85, NULL, 'nâng cấp RAM Asus ROG Zephyrus G14 lên 32GB', 'Hãng: Asus, Giá: 1600.00$, Thông số: Ryzen 9, RAM 32GB, RTX 3060, Hình ảnh: images/asus_rog_g14.jpg\nAsus không hỗ trợ 32GB RAM. Các tùy chọn RAM có sẵn là:\n8GB RAM (Thay đổi giá: -250.00$)\n16GB RAM (Thay đổi giá: 0.00$)\n32GB RAM (Thay đổi giá: 300.00$)\nAsus không hỗ trợ 32GB SSD. Các tùy chọn SSD có sẵn là:\n512GB SSD (Thay đổi giá: -200.00$)\n1TB SSD (Thay đổi giá: 0.00$)\n2TB SSD (Thay đổi giá: 400.00$)\n', '2025-03-19 14:09:18'),
(86, NULL, 'Hạ cấp CPU Dell XPS 13 xuống Intel i5', 'Hãng: Dell, Giá: 1400.00$, Thông số: Intel i7, RAM 16GB, SSD 1TB, Hình ảnh: images/dell_xps_13.jpg\nBạn có thể **nâng cấp** CPU lên Intel i5 với giá -200.00$.\n', '2025-03-19 14:09:31'),
(87, NULL, 'Hạ cấp GPU Asus ROG Zephyrus G14 xuống RTX 3050', 'Hãng: Asus, Giá: 1600.00$, Thông số: Ryzen 9, RAM 32GB, RTX 3060, Hình ảnh: images/asus_rog_g14.jpg\nBạn có thể **nâng cấp** GPU lên RTX 3050 với giá -300.00$.\n', '2025-03-19 14:09:43'),
(88, NULL, 'Hạ cấp SSD Dell XPS 13 xuống 256GB', 'Hãng: Dell, Giá: 1400.00$, Thông số: Intel i7, RAM 16GB, SSD 1TB, Hình ảnh: images/dell_xps_13.jpg\nDell không hỗ trợ 256GB RAM. Các tùy chọn RAM có sẵn là:\n8GB RAM (Thay đổi giá: -150.00$)\n16GB RAM (Thay đổi giá: 0.00$)\n32GB RAM (Thay đổi giá: 450.00$)\nBạn có thể **nâng cấp** SSD lên 256GB với giá -120.00$.\n', '2025-03-19 14:10:03'),
(89, NULL, 'Nâng cấp RAM Asus ROG Zephyrus G14 lên 32GB', 'Hãng: Asus, Giá: 1600.00$, Thông số: Ryzen 9, RAM 32GB, RTX 3060, Hình ảnh: images/asus_rog_g14.jpg\nAsus không hỗ trợ 32GB SSD. Các tùy chọn SSD có sẵn là:\n512GB SSD (Thay đổi giá: -200.00$)\n1TB SSD (Thay đổi giá: 0.00$)\n2TB SSD (Thay đổi giá: 400.00$)\n', '2025-03-19 14:11:41'),
(90, NULL, 'nâng cấp RAM Asus ROG Zephyrus G14 lên 32GB', 'Hãng: Asus, Giá: 1600.00$, Thông số: Ryzen 9, RAM 32GB, RTX 3060, Hình ảnh: images/asus_rog_g14.jpg\nAsus không hỗ trợ 32GB SSD. Các tùy chọn SSD có sẵn là:\n512GB SSD (Thay đổi giá: -200.00$)\n1TB SSD (Thay đổi giá: 0.00$)\n2TB SSD (Thay đổi giá: 400.00$)\n', '2025-03-19 14:11:51'),
(91, NULL, 'Hạ cấp CPU Dell XPS 13 xuống Intel i5', 'Hãng: Dell, Giá: 1400.00$, Thông số: Intel i7, RAM 16GB, SSD 1TB, Hình ảnh: images/dell_xps_13.jpg\nBạn có thể **nâng cấp** CPU lên Intel i5 với giá -200.00$.\n', '2025-03-19 14:12:02'),
(92, NULL, 'Hạ cấp SSD Dell XPS 13 xuống 256GB', 'Hãng: Dell, Giá: 1400.00$, Thông số: Intel i7, RAM 16GB, SSD 1TB, Hình ảnh: images/dell_xps_13.jpg\nBạn có thể **nâng cấp** SSD lên 256GB với giá -120.00$.\n', '2025-03-19 14:12:17'),
(93, NULL, 'Nâng cấp RAM Asus ROG Zephyrus G14 lên 32GB', 'Hãng: Asus, Giá: 1600.00$, Thông số: Ryzen 9, RAM 32GB, RTX 3060, Hình ảnh: images/asus_rog_g14.jpg\nAsus không hỗ trợ 32GB SSD. Các tùy chọn SSD có sẵn là:\n512GB SSD (Thay đổi giá: -200.00$)\n1TB SSD (Thay đổi giá: 0.00$)\n2TB SSD (Thay đổi giá: 400.00$)\n', '2025-03-19 14:13:24'),
(94, NULL, 'Hạ cấp SSD Dell XPS 13 xuống 256GB', 'Hãng: Dell, Giá: 1400.00$, Thông số: Intel i7, RAM 16GB, SSD 1TB, Hình ảnh: images/dell_xps_13.jpg\nBạn có thể **nâng cấp** SSD lên 256GB với giá -120.00$.\n', '2025-03-19 14:13:44'),
(95, NULL, 'Nâng cấp RAM Asus ROG Zephyrus G14 lên 32GB', 'Hãng: Asus, Giá: 1600.00$, Thông số: Ryzen 9, RAM 32GB, RTX 3060, Hình ảnh: images/asus_rog_g14.jpg\nAsus không hỗ trợ 32GB SSD. Các tùy chọn SSD có sẵn là:\n512GB SSD (Thay đổi giá: -200.00$)\n1TB SSD (Thay đổi giá: 0.00$)\n2TB SSD (Thay đổi giá: 400.00$)\n', '2025-03-19 14:15:49'),
(96, NULL, 'Hạ cấp SSD Dell XPS 13 xuống 256GB', 'Hãng: Dell, Giá: 1400.00$, Thông số: Intel i7, RAM 16GB, SSD 1TB, Hình ảnh: images/dell_xps_13.jpg\nBạn có thể **nâng cấp** SSD lên 256GB với giá -120.00$.\n', '2025-03-19 14:16:21'),
(97, NULL, 'Nâng cấp RAM Asus ROG Zephyrus G14 lên 32GB', 'Hãng: Asus, Giá: 1600.00$, Thông số: Ryzen 9, RAM 32GB, RTX 3060, Hình ảnh: images/asus_rog_g14.jpg\nAsus không hỗ trợ 32GB RAM. Các tùy chọn RAM có sẵn là:\n8GB RAM (Thay đổi giá: -250.00$)\n16GB RAM (Thay đổi giá: 0.00$)\n32GB RAM (Thay đổi giá: 300.00$)\nAsus không hỗ trợ 32GB SSD. Các tùy chọn SSD có sẵn là:\n512GB SSD (Thay đổi giá: -200.00$)\n1TB SSD (Thay đổi giá: 0.00$)\n2TB SSD (Thay đổi giá: 400.00$)\n', '2025-03-19 14:19:17'),
(98, NULL, 'Nâng cấp RAM Asus ROG Zephyrus G14 lên 32GB', 'Hãng: Asus, Giá: 1600.00$, Thông số: Ryzen 9, RAM 32GB, RTX 3060, Hình ảnh: images/asus_rog_g14.jpg\nAsus không hỗ trợ 32GB SSD. Các tùy chọn SSD có sẵn là:\n512GB SSD (Thay đổi giá: -200.00$)\n1TB SSD (Thay đổi giá: 0.00$)\n2TB SSD (Thay đổi giá: 400.00$)\n', '2025-03-19 14:21:15'),
(99, NULL, 'Hạ cấp SSD Dell XPS 13 xuống 256GB', 'Hãng: Dell, Giá: 1400.00$, Thông số: Intel i7, RAM 16GB, SSD 1TB, Hình ảnh: images/dell_xps_13.jpg\nBạn có thể **nâng cấp** SSD lên 256GB với giá -120.00$.\n', '2025-03-19 23:53:07'),
(100, NULL, 'Dell XPS 13', 'Hãng: Dell, Giá: 1400.00$, Thông số: Intel i7, RAM 16GB, SSD 1TB, Hình ảnh: images/dell_xps_13.jpg\n', '2025-03-19 23:53:25'),
(101, NULL, 'MacBook Air M2', 'Hãng: Apple, Giá: 1200.00$, Thông số: Chip M2, RAM 16GB, SSD 512GB, Hình ảnh: images/macbook_air_m2.jpg\n', '2025-03-19 23:53:43'),
(102, NULL, 'Hạ cấp GPU Asus ROG Zephyrus G14 xuống RTX 3050', 'Hãng: Asus, Giá: 1600.00$, Thông số: Ryzen 9, RAM 32GB, RTX 3060, Hình ảnh: images/asus_rog_g14.jpg\nBạn có thể **nâng cấp** GPU lên RTX 3050 với giá -300.00$.\n', '2025-03-19 23:54:00'),
(103, NULL, 'Nâng cấp RAM Asus ROG Zephyrus G14 lên 32G', 'Hãng: Asus, Giá: 1600.00$, Thông số: Ryzen 9, RAM 32GB, RTX 3060, Hình ảnh: images/asus_rog_g14.jpg\n', '2025-03-19 23:54:21'),
(104, NULL, 'Nâng cấp RAM Asus ROG Zephyrus G14 lên 32GB', 'Hãng: Asus, Giá: 1600.00$, Thông số: Ryzen 9, RAM 32GB, RTX 3060, Hình ảnh: images/asus_rog_g14.jpg\nAsus không hỗ trợ 32GB SSD. Các tùy chọn SSD có sẵn là:\n512GB SSD (Thay đổi giá: -200.00$)\n1TB SSD (Thay đổi giá: 0.00$)\n2TB SSD (Thay đổi giá: 400.00$)\n', '2025-03-19 23:54:28'),
(105, NULL, 'Hạ cấp CPU Dell XPS 13 xuống Intel i5', 'Hãng: Dell, Giá: 1400.00$, Thông số: Intel i7, RAM 16GB, SSD 1TB, Hình ảnh: images/dell_xps_13.jpg\nBạn có thể **nâng cấp** CPU lên Intel i5 với giá -200.00$.\n', '2025-03-20 01:38:13'),
(106, NULL, 'Nâng cấp RAM Asus ROG Zephyrus G14 lên 32GB', 'Hãng: Asus, Giá: 1600.00$, Thông số: Ryzen 9, RAM 32GB, RTX 3060, Hình ảnh: images/asus_rog_g14.jpg\nAsus không hỗ trợ 32GB SSD. Các tùy chọn SSD có sẵn là:\n512GB SSD (Thay đổi giá: -200.00$)\n1TB SSD (Thay đổi giá: 0.00$)\n2TB SSD (Thay đổi giá: 400.00$)\n', '2025-03-20 01:45:22'),
(107, NULL, 'Nâng cấp RAM Asus ROG Zephyrus G14 lên 32GB', 'Hãng: Asus, Giá: 1600.00$, Thông số: Ryzen 9, RAM 32GB, RTX 3060, Hình ảnh: images/asus_rog_g14.jpg\n', '2025-03-20 01:47:53'),
(108, NULL, 'Nâng cấp RAM Asus ROG Zephyrus G14 lên 32GB RAM', 'Hãng: Asus, Giá: 1600.00$, Thông số: Ryzen 9, RAM 32GB, RTX 3060, Hình ảnh: images/asus_rog_g14.jpg\nBạn có thể **nâng cấp** RAM lên 32GB RAM với giá 300.00$.\n', '2025-03-20 01:48:04'),
(109, NULL, 'hạ cấp RAM Asus ROG Zephyrus G14 xuống 16GB RAM', 'Hãng: Asus, Giá: 1600.00$, Thông số: Ryzen 9, RAM 32GB, RTX 3060, Hình ảnh: images/asus_rog_g14.jpg\nBạn có thể **nâng cấp** RAM lên 16GB RAM với giá 0.00$.\n', '2025-03-20 01:48:28'),
(110, NULL, 'Hạ cấp SSD Dell XPS 13 xuống 256GB.', 'Hãng: Dell, Giá: 1400.00$, Thông số: Intel i7, RAM 16GB, SSD 1TB, Hình ảnh: images/dell_xps_13.jpg\n', '2025-03-22 13:36:50'),
(111, NULL, 'Hạ cấp SSD Dell XPS 13 xuống 256GB', 'Hãng: Dell, Giá: 1400.00$, Thông số: Intel i7, RAM 16GB, SSD 1TB, Hình ảnh: images/dell_xps_13.jpg\n', '2025-03-22 13:36:54'),
(112, NULL, 'hạ cấp SSD Dell XPS 13 xuống 256GB.', 'Hãng: Dell, Giá: 1400.00$, Thông số: Intel i7, RAM 16GB, SSD 1TB, Hình ảnh: images/dell_xps_13.jpg\n', '2025-03-22 13:37:04'),
(113, NULL, 'hạ cấp SSD Dell XPS 13 xuống 256GB SSD', 'Hãng: Dell, Giá: 1400.00$, Thông số: Intel i7, RAM 16GB, SSD 1TB, Hình ảnh: images/dell_xps_13.jpg\nDell không hỗ trợ 256GB SSD. Các tùy chọn SSD có sẵn là:\n256GB (Thay đổi giá: -120.00$)\n512GB (Thay đổi giá: 0.00$)\n1TB (Thay đổi giá: 230.00$)\n', '2025-03-22 13:37:20'),
(114, NULL, 'nâng cấp RAM cho MacBook Air M2 lên 32GB RAM', 'Hãng: Apple, Giá: 1200.00$, Thông số: Chip M2, RAM 16GB, SSD 512GB, Hình ảnh: images/macbook_air_m2.jpg\nBạn có thể **thay đổi** RAM lên 32GB RAM với giá 300.00$.\n', '2025-03-22 13:38:59'),
(115, NULL, 'hạ cấp RAM cho MacBook Air M2 xuống 8GB RAM', 'Hãng: Apple, Giá: 1200.00$, Thông số: Chip M2, RAM 16GB, SSD 512GB, Hình ảnh: images/macbook_air_m2.jpg\nBạn có thể **thay đổi** RAM lên 8GB RAM với giá -200.00$.\n', '2025-03-22 13:39:28'),
(116, NULL, 'hạ cấp RAM cho MacBook Air M2 xuống 16GB RAM', 'Hãng: Apple, Giá: 1200.00$, Thông số: Chip M2, RAM 16GB, SSD 512GB, Hình ảnh: images/macbook_air_m2.jpg\nBạn có thể **thay đổi** RAM lên 16GB RAM với giá 150.00$.\n', '2025-03-22 13:39:53'),
(117, NULL, 'Hạ cấp RAM cho MacBook Air M2 xuống 4GB RAM', 'Hãng: Apple, Giá: 1200.00$, Thông số: Chip M2, RAM 16GB, SSD 512GB, Hình ảnh: images/macbook_air_m2.jpg\nMacBook không hỗ trợ 4GB RAM RAM. Các tùy chọn RAM có sẵn là:\n8GB RAM (Thay đổi giá: -200.00$)\n16GB RAM (Thay đổi giá: 150.00$)\n32GB RAM (Thay đổi giá: 300.00$)\n', '2025-03-22 13:42:39'),
(118, NULL, 'Tôi muốn nâng cấp laptop Asus lên 32GB RAM', 'Hãng: Asus, Giá: 1600.00$, Thông số: Ryzen 9, RAM 32GB, RTX 3060, Hình ảnh: images/asus_rog_g14.jpg\nRAM của bạn đã là 32GB RAM, không cần nâng cấp hay hạ cấp.\n', '2025-03-22 13:48:25'),
(119, NULL, 'Tôi muốn hạ cấp laptop Asus xuống 16GB RAM', 'Hãng: Asus, Giá: 1600.00$, Thông số: Ryzen 9, RAM 32GB, RTX 3060, Hình ảnh: images/asus_rog_g14.jpg\nBạn có thể **hạ cấp** RAM xuống 16GB RAM với giá 0.00$.\n', '2025-03-22 13:48:40'),
(120, NULL, 'Tôi muốn nâng cấp laptop Asus lên 2TB SSD', 'Hãng: Asus, Giá: 1600.00$, Thông số: Ryzen 9, RAM 32GB, RTX 3060, Hình ảnh: images/asus_rog_g14.jpg\nKhông xác định được cấu hình hiện tại của SSD.\n', '2025-03-22 13:49:47'),
(121, NULL, 'Tôi muốn nâng cấp laptop Asus lên SSD 2TB', 'Hãng: Asus, Giá: 1600.00$, Thông số: Ryzen 9, RAM 32GB, RTX 3060, Hình ảnh: images/asus_rog_g14.jpg\n', '2025-03-22 13:50:04'),
(122, NULL, 'Tôi muốn nâng cấp SSD laptop Asus lên 2TB', 'Hãng: Asus, Giá: 1600.00$, Thông số: Ryzen 9, RAM 32GB, RTX 3060, Hình ảnh: images/asus_rog_g14.jpg\n', '2025-03-22 13:50:20'),
(123, NULL, 'Tôi muốn hạ cấp laptop Asus xuống 512GB SSD', 'Hãng: Asus, Giá: 1600.00$, Thông số: Ryzen 9, RAM 32GB, RTX 3060, Hình ảnh: images/asus_rog_g14.jpg\nKhông xác định được cấu hình hiện tại của SSD.\n', '2025-03-22 13:51:04'),
(124, NULL, 'Tôi muốn nâng cấp laptop Asus lên RTX 3060', 'Hãng: Asus, Giá: 1600.00$, Thông số: Ryzen 9, RAM 32GB, RTX 3060, Hình ảnh: images/asus_rog_g14.jpg\nKhông xác định được cấu hình hiện tại của GPU.\n', '2025-03-22 13:51:29'),
(125, NULL, 'Tôi muốn nâng cấp laptop Asus lên RTX 3050', 'Hãng: Asus, Giá: 1600.00$, Thông số: Ryzen 9, RAM 32GB, RTX 3060, Hình ảnh: images/asus_rog_g14.jpg\nKhông xác định được cấu hình hiện tại của GPU.\n', '2025-03-22 13:51:38'),
(126, NULL, 'Tôi muốn nâng cấp GPU laptop Asus lên RTX 4080', 'Hãng: Asus, Giá: 1600.00$, Thông số: Ryzen 9, RAM 32GB, RTX 3060, Hình ảnh: images/asus_rog_g14.jpg\nAsus không hỗ trợ RTX 4080 GPU. Các tùy chọn GPU có sẵn là:\nRTX 3050 (Thay đổi giá: -300.00$)\nRTX 3060 (Thay đổi giá: 0.00$)\nRTX 3070 (Thay đổi giá: 500.00$)\n', '2025-03-22 13:52:04'),
(127, NULL, 'Tôi muốn nâng cấp laptop Asus lên SSD 512GB', 'Hãng: Asus, Giá: 1600.00$, Thông số: Ryzen 9, RAM 32GB, RTX 3060, Hình ảnh: images/asus_rog_g14.jpg\n', '2025-03-22 13:52:28'),
(128, NULL, 'Tôi muốn nâng cấp laptop Asus lên 512GB SSD', 'Hãng: Asus, Giá: 1600.00$, Thông số: Ryzen 9, RAM 32GB, RTX 3060, Hình ảnh: images/asus_rog_g14.jpg\nKhông xác định được cấu hình hiện tại của SSD.\n', '2025-03-22 13:52:39'),
(129, NULL, 'Tôi muốn hạ cấp CPU laptop Asus xuống GTX 1650', 'Hãng: Asus, Giá: 1600.00$, Thông số: Ryzen 9, RAM 32GB, RTX 3060, Hình ảnh: images/asus_rog_g14.jpg\nAsus không hỗ trợ GTX 1650 GPU. Các tùy chọn GPU có sẵn là:\nRTX 3050 (Thay đổi giá: -300.00$)\nRTX 3060 (Thay đổi giá: 0.00$)\nRTX 3070 (Thay đổi giá: 500.00$)\n', '2025-03-22 13:53:11'),
(130, NULL, 'Tôi muốn nâng cấp CPU laptop Asus lên RTX 3070', 'Hãng: Asus, Giá: 1600.00$, Thông số: Ryzen 9, RAM 32GB, RTX 3060, Hình ảnh: images/asus_rog_g14.jpg\nKhông xác định được cấu hình hiện tại của GPU.\n', '2025-03-22 13:53:40'),
(131, NULL, 'Tôi muốn nâng cấp CPU laptop Asus lên RTX 3070', 'Hãng: Asus, Giá: 1600.00$, Thông số: Ryzen 9, RAM 32GB, RTX 3060, Hình ảnh: images/asus_rog_g14.jpg\nKhông xác định được cấu hình hiện tại của GPU.\n', '2025-03-22 13:54:00'),
(132, NULL, 'Tôi muốn nâng cấp GPU laptop Asus lên RTX 3070', 'Hãng: Asus, Giá: 1600.00$, Thông số: Ryzen 9, RAM 32GB, RTX 3060, Hình ảnh: images/asus_rog_g14.jpg\nKhông xác định được cấu hình hiện tại của GPU.\n', '2025-03-22 13:54:13'),
(133, NULL, 'Tôi muốn nâng cấp laptop Asus lên Intel i9', 'Hãng: Asus, Giá: 1600.00$, Thông số: Ryzen 9, RAM 32GB, RTX 3060, Hình ảnh: images/asus_rog_g14.jpg\nAsus không hỗ trợ Intel i9 CPU. Các tùy chọn CPU có sẵn là:\nRyzen 3 (Thay đổi giá: -400.00$)\nRyzen 5 (Thay đổi giá: -200.00$)\nRyzen 7 (Thay đổi giá: 0.00$)\nRyzen 9 (Thay đổi giá: 450.00$)\n', '2025-03-22 13:55:04'),
(134, NULL, 'Tôi muốn nâng cấp laptop Asus lên Ryzen 7', 'Hãng: Asus, Giá: 1600.00$, Thông số: Ryzen 9, RAM 32GB, RTX 3060, Hình ảnh: images/asus_rog_g14.jpg\n', '2025-03-22 13:55:19'),
(135, NULL, 'Tôi muốn nâng cấp CPU laptop Asus lên Ryzen 7', 'Hãng: Asus, Giá: 1600.00$, Thông số: Ryzen 9, RAM 32GB, RTX 3060, Hình ảnh: images/asus_rog_g14.jpg\n', '2025-03-22 13:55:39'),
(136, NULL, 'Tôi muốn nâng cấp CPU của laptop Asus lên Ryzen 7', 'Hãng: Asus, Giá: 1600.00$, Thông số: Ryzen 9, RAM 32GB, RTX 3060, Hình ảnh: images/asus_rog_g14.jpg\n', '2025-03-22 13:55:49'),
(137, NULL, 'Hạ cấp GPU Asus ROG Zephyrus G14 xuống RTX 3050', 'Hãng: Asus, Giá: 1600.00$, Thông số: Ryzen 9, RAM 32GB, RTX 3060, Hình ảnh: images/asus_rog_g14.jpg\nBạn có thể **nâng cấp** GPU lên RTX 3050 với giá -300.00$.\n', '2025-03-22 13:57:17'),
(138, NULL, 'nâng cấp ram asus rog zephyrus g14 lên 32gb', 'Hãng: Asus, Giá: 1600.00$, Thông số: Ryzen 9, RAM 32GB, RTX 3060, Hình ảnh: images/asus_rog_g14.jpg\n', '2025-03-22 14:00:58'),
(139, NULL, 'nâng cấp asus rog zephyrus g14 lên 32gb ram', 'Hãng: Asus, Giá: 1600.00$, Thông số: Ryzen 9, RAM 32GB, RTX 3060, Hình ảnh: images/asus_rog_g14.jpg\n', '2025-03-22 14:01:08'),
(140, NULL, 'nâng cấp ram asus rog zephyrus g14 lên 32gb ram', 'Hãng: Asus, Giá: 1600.00$, Thông số: Ryzen 9, RAM 32GB, RTX 3060, Hình ảnh: images/asus_rog_g14.jpg\n', '2025-03-22 14:01:17'),
(141, NULL, 'nâng cấp ram asus rog zephyrus g14 lên 32gb ram.', 'Hãng: Asus, Giá: 1600.00$, Thông số: Ryzen 9, RAM 32GB, RTX 3060, Hình ảnh: images/asus_rog_g14.jpg\n', '2025-03-22 14:01:45'),
(142, NULL, 'hạ cấp cpu dell xps 13 xuống intel i5', 'Hãng: Dell, Giá: 1400.00$, Thông số: Intel i7, RAM 16GB, SSD 1TB, Hình ảnh: images/dell_xps_13.jpg\n', '2025-03-22 14:02:02'),
(143, NULL, 'tôi muốn hạ cấp ram xuống 8gb trên asus', 'Hãng: Asus, Giá: 1600.00$, Thông số: Ryzen 9, RAM 32GB, RTX 3060, Hình ảnh: images/asus_rog_g14.jpg\n', '2025-03-22 14:05:13'),
(144, NULL, 'mình muốn nâng cấp ssd lên 2tb trên macbook', 'Hãng: Apple, Giá: 1200.00$, Thông số: Chip M2, RAM 16GB, SSD 512GB, Hình ảnh: images/macbook_air_m2.jpg\n', '2025-03-22 14:05:29'),
(145, NULL, 'nâng cấp ram asus rog zephyrus g14 lên 32gb', 'Hãng: Asus, Giá: 1600.00$, Thông số: Ryzen 9, RAM 32GB, RTX 3060, Hình ảnh: images/asus_rog_g14.jpg\n', '2025-03-22 14:05:47'),
(146, NULL, 'nâng cấp asus rog zephyrus g14 lên 32gb ram', 'Hãng: Asus, Giá: 1600.00$, Thông số: Ryzen 9, RAM 32GB, RTX 3060, Hình ảnh: images/asus_rog_g14.jpg\n', '2025-03-22 14:05:59'),
(147, NULL, 'Hạ cấp SSD Dell XPS 13 xuống 256GB', 'Hãng: Dell, Giá: 1400.00$, Thông số: Intel i7, RAM 16GB, SSD 1TB, Hình ảnh: images/dell_xps_13.jpg\n', '2025-03-22 14:11:45'),
(148, NULL, 'Hạ cấp SSD Dell XPS 13 xuống 256GB SSD', 'Hãng: Dell, Giá: 1400.00$, Thông số: Intel i7, RAM 16GB, SSD 1TB, Hình ảnh: images/dell_xps_13.jpg\nDell không hỗ trợ 256GB SSD SSD. Các tùy chọn SSD có sẵn là:\n256GB (Thay đổi giá: -120.00$)\n512GB (Thay đổi giá: 0.00$)\n1TB (Thay đổi giá: 230.00$)\n', '2025-03-22 14:11:49'),
(149, NULL, 'Tôi muốn hạ cấp RAM xuống 8GB trên Asus ROG G14', 'Hãng: Asus, Giá: 1600.00$, Thông số: Ryzen 9, RAM 32GB, RTX 3060, Hình ảnh: images/asus_rog_g14.jpg\n', '2025-03-22 14:12:09'),
(150, NULL, 'Hạ cấp Dell XPS 13 xuống 256GB SSD', 'Hãng: Dell, Giá: 1400.00$, Thông số: Intel i7, RAM 16GB, SSD 1TB, Hình ảnh: images/dell_xps_13.jpg\nDell không hỗ trợ 256GB SSD SSD. Các tùy chọn SSD có sẵn là:\n256GB (Thay đổi giá: -120.00$)\n512GB (Thay đổi giá: 0.00$)\n1TB (Thay đổi giá: 230.00$)\n', '2025-03-22 14:12:36'),
(151, NULL, 'hạ cấp SSD Dell XPS 13 xuống 256GB', 'Hãng: Dell, Giá: 1400.00$, Thông số: Intel i7, RAM 16GB, SSD 1TB, Hình ảnh: images/dell_xps_13.jpg\n', '2025-03-22 14:13:03'),
(152, NULL, 'Hạ cấp SSD Dell XPS 13 xuống 256GB', 'Hãng: Dell, Giá: 1400.00$, Thông số: Intel i7, RAM 16GB, SSD 1TB, Hình ảnh: images/dell_xps_13.jpg\n', '2025-03-22 14:21:29'),
(153, NULL, 'Hạ cấp SSD Dell XPS 13 xuống 256GB', 'Hãng: Dell, Giá: 1400.00$, Thông số: Intel i7, RAM 16GB, SSD 1TB, Hình ảnh: images/dell_xps_13.jpg\n', '2025-03-22 14:23:10'),
(154, NULL, 'Hạ cấp SSD Dell XPS 13 xuống 256GB', 'Hãng: Dell, Giá: 1400.00$, Thông số: Intel i7, RAM 16GB, SSD 1TB, Hình ảnh: images/dell_xps_13.jpg\n', '2025-03-22 14:26:46'),
(155, NULL, 'Hạ cấp GPU Asus ROG Zephyrus G14 xuống RTX 3050', 'Hãng: Asus, Giá: 1600.00$, Thông số: Ryzen 9, RAM 32GB, RTX 3060, Hình ảnh: images/asus_rog_g14.jpg\nBạn có thể **hạ cấp** GPU xuống RTX 3050 và tiết kiệm 300.00$.\n', '2025-03-22 14:27:12'),
(156, NULL, 'Hạ cấp SSD Dell XPS 13 xuống 256GB SSD', 'Hãng: Dell, Giá: 1400.00$, Thông số: Intel i7, RAM 16GB, SSD 1TB, Hình ảnh: images/dell_xps_13.jpg\nDell không hỗ trợ 256GB SSD SSD. Các tùy chọn SSD có sẵn là:\n256GB (Thay đổi giá: -120.00$)\n512GB (Thay đổi giá: 0.00$)\n1TB (Thay đổi giá: 230.00$)\n', '2025-03-22 14:27:29'),
(157, NULL, 'Hạ cấp Dell XPS 13 xuống 256GB', 'Hãng: Dell, Giá: 1400.00$, Thông số: Intel i7, RAM 16GB, SSD 1TB, Hình ảnh: images/dell_xps_13.jpg\n', '2025-03-22 14:27:36'),
(158, NULL, 'Hạ cấp SSD Dell XPS 13 xuống SSD 256GB', 'Hãng: Dell, Giá: 1400.00$, Thông số: Intel i7, RAM 16GB, SSD 1TB, Hình ảnh: images/dell_xps_13.jpg\n', '2025-03-22 14:28:03'),
(159, NULL, 'Hạ cấp Dell XPS 13 xuống SSD 256GB', 'Hãng: Dell, Giá: 1400.00$, Thông số: Intel i7, RAM 16GB, SSD 1TB, Hình ảnh: images/dell_xps_13.jpg\n', '2025-03-22 14:28:14'),
(160, NULL, 'Hạ cấp CPU Dell XPS 13 xuống Intel i5', 'Hãng: Dell, Giá: 1400.00$, Thông số: Intel i7, RAM 16GB, SSD 1TB, Hình ảnh: images/dell_xps_13.jpg\nBạn có thể **hạ cấp** CPU xuống Intel i5 và tiết kiệm 200.00$.\n', '2025-03-22 14:28:53'),
(161, NULL, 'Nâng cấp RAM Asus ROG Zephyrus G14 lên 32GB', 'Hãng: Asus, Giá: 1600.00$, Thông số: Ryzen 9, RAM 32GB, RTX 3060, Hình ảnh: images/asus_rog_g14.jpg\n', '2025-03-22 14:29:06'),
(162, NULL, 'Nâng cấp RAM Asus ROG Zephyrus G14 lên 32GB RAM', 'Hãng: Asus, Giá: 1600.00$, Thông số: Ryzen 9, RAM 32GB, RTX 3060, Hình ảnh: images/asus_rog_g14.jpg\nBạn có thể **nâng cấp** RAM lên 32GB RAM với giá 300.00$.\n', '2025-03-22 14:29:11'),
(163, NULL, 'Hạ cấp RAM Asus ROG Zephyrus G14 xuống 16GB RAM', 'Hãng: Asus, Giá: 1600.00$, Thông số: Ryzen 9, RAM 32GB, RTX 3060, Hình ảnh: images/asus_rog_g14.jpg\nAsus hỗ trợ 16GB RAM, nhưng không có thay đổi về giá.\n', '2025-03-22 14:29:35'),
(164, NULL, 'Hạ cấp RAM Asus ROG Zephyrus G14 xuống 8GB RAM', 'Hãng: Asus, Giá: 1600.00$, Thông số: Ryzen 9, RAM 32GB, RTX 3060, Hình ảnh: images/asus_rog_g14.jpg\nBạn có thể **hạ cấp** RAM xuống 8GB RAM và tiết kiệm 250.00$.\n', '2025-03-22 14:30:12'),
(165, NULL, 'Nâng cấp CPU Dell XPS 13 lên Intel i7', 'Hãng: Dell, Giá: 1400.00$, Thông số: Intel i7, RAM 16GB, SSD 1TB, Hình ảnh: images/dell_xps_13.jpg\nDell hỗ trợ Intel i7, nhưng không có thay đổi về giá.\n', '2025-03-22 14:30:43'),
(166, NULL, 'Nâng cấp CPU Dell XPS 13 lên Intel i9', 'Hãng: Dell, Giá: 1400.00$, Thông số: Intel i7, RAM 16GB, SSD 1TB, Hình ảnh: images/dell_xps_13.jpg\nBạn có thể **nâng cấp** CPU lên Intel i9 với giá 350.00$.\n', '2025-03-22 14:30:57'),
(167, NULL, 'Nâng cấp GPU Asus ROG Zephyrus G14 lên RTX 3070', 'Hãng: Asus, Giá: 1600.00$, Thông số: Ryzen 9, RAM 32GB, RTX 3060, Hình ảnh: images/asus_rog_g14.jpg\nBạn có thể **nâng cấp** GPU lên RTX 3070 với giá 500.00$.\n', '2025-03-22 14:31:24'),
(168, NULL, 'Hạ cấp SSD Dell XPS 13 xuống 256 GB', 'Hãng: Dell, Giá: 1400.00$, Thông số: Intel i7, RAM 16GB, SSD 1TB, Hình ảnh: images/dell_xps_13.jpg\n', '2025-03-22 14:31:37'),
(169, NULL, 'Hạ cấp SSD Dell XPS 13 xuống 256GB', 'Hãng: Dell, Giá: 1400.00$, Thông số: Intel i7, RAM 16GB, SSD 1TB, Hình ảnh: images/dell_xps_13.jpg\n', '2025-03-22 14:34:31'),
(170, NULL, 'Hạ cấp SSD Dell XPS 13 xuống 256GB SSD', 'Hãng: Dell, Giá: 1400.00$, Thông số: Intel i7, RAM 16GB, SSD 1TB, Hình ảnh: images/dell_xps_13.jpg\nDell không hỗ trợ 256GB SSD SSD. Các tùy chọn SSD có sẵn là:\n256GB (Thay đổi giá: -120.00$)\n512GB (Thay đổi giá: 0.00$)\n1TB (Thay đổi giá: 230.00$)\n', '2025-03-22 14:34:44'),
(171, NULL, 'Hạ cấp Dell XPS 13 xuống SSD 256GB', 'Hãng: Dell, Giá: 1400.00$, Thông số: Intel i7, RAM 16GB, SSD 1TB, Hình ảnh: images/dell_xps_13.jpg\nDell không hỗ trợ SSD 256GB SSD. Các tùy chọn SSD có sẵn là:\n256GB (Thay đổi giá: -120.00$)\n512GB (Thay đổi giá: 0.00$)\n1TB (Thay đổi giá: 230.00$)\n', '2025-03-22 14:34:59'),
(172, NULL, 'Hạ cấp SSD Dell XPS 13 xuống 256GB', 'Hãng: Dell, Giá: 1400.00$, Thông số: Intel i7, RAM 16GB, SSD 1TB, Hình ảnh: images/dell_xps_13.jpg\n', '2025-03-22 14:37:05'),
(173, NULL, 'Hạ cấp SSD Dell XPS 13 xuống 256GB SSD', 'Hãng: Dell, Giá: 1400.00$, Thông số: Intel i7, RAM 16GB, SSD 1TB, Hình ảnh: images/dell_xps_13.jpg\nDell không hỗ trợ 256GB SSD SSD. Các tùy chọn SSD có sẵn là:\n256GB (Thay đổi giá: -120.00$)\n512GB (Thay đổi giá: 0.00$)\n1TB (Thay đổi giá: 230.00$)\n', '2025-03-22 14:37:19'),
(174, NULL, 'Hạ cấp SSD Dell XPS 13 xuống 256GB', 'Hãng: Dell, Giá: 1400.00$, Thông số: Intel i7, RAM 16GB, SSD 1TB, Hình ảnh: images/dell_xps_13.jpg\n', '2025-03-22 14:43:58'),
(175, NULL, 'Hạ cấp SSD Dell XPS 13 xuống SSD 256GB', 'Hãng: Dell, Giá: 1400.00$, Thông số: Intel i7, RAM 16GB, SSD 1TB, Hình ảnh: images/dell_xps_13.jpg\n', '2025-03-22 14:44:06'),
(176, NULL, 'Hạ cấp SSD Dell XPS 13 xuống 256GB SSD', 'Hãng: Dell, Giá: 1400.00$, Thông số: Intel i7, RAM 16GB, SSD 1TB, Hình ảnh: images/dell_xps_13.jpg\nDell không hỗ trợ 256GB SSD SSD. Các tùy chọn SSD có sẵn là:\n256GB (Thay đổi giá: -120.00$)\n512GB (Thay đổi giá: 0.00$)\n1TB (Thay đổi giá: 230.00$)\n', '2025-03-22 14:44:13'),
(177, NULL, 'Nâng cấp SSD Dell XPS 13 lên 256', 'Hãng: Dell, Giá: 1400.00$, Thông số: Intel i7, RAM 16GB, SSD 1TB, Hình ảnh: images/dell_xps_13.jpg\n', '2025-03-22 14:45:04'),
(178, NULL, 'Nâng cấp SSD lên 256GB Dell XPS 13', 'Hãng: Dell, Giá: 1400.00$, Thông số: Intel i7, RAM 16GB, SSD 1TB, Hình ảnh: images/dell_xps_13.jpg\n', '2025-03-22 14:45:21'),
(179, NULL, 'Nâng cấp SSD Dell XPS 13 lên 256GB', 'Hãng: Dell, Giá: 1400.00$, Thông số: Intel i7, RAM 16GB, SSD 1TB, Hình ảnh: images/dell_xps_13.jpg\n', '2025-03-22 14:45:38'),
(180, NULL, 'Nâng cấp SSD Dell XPS 13 lên 256GB SSD', 'Hãng: Dell, Giá: 1400.00$, Thông số: Intel i7, RAM 16GB, SSD 1TB, Hình ảnh: images/dell_xps_13.jpg\nDell không hỗ trợ 256GB SSD SSD. Các tùy chọn SSD có sẵn là:\n256GB (Thay đổi giá: -120.00$)\n512GB (Thay đổi giá: 0.00$)\n1TB (Thay đổi giá: 230.00$)\n', '2025-03-22 14:45:47'),
(181, NULL, 'Nâng cấp SSD Dell XPS 13 lên 256GB SSD', 'Hãng: Dell, Giá: 1400.00$, Thông số: Intel i7, RAM 16GB, SSD 1TB, Hình ảnh: images/dell_xps_13.jpg\nDell không hỗ trợ 256GB SSD. Các tùy chọn SSD có sẵn là:\n256gb (Thay đổi giá: -120.00$)\n512gb (Thay đổi giá: 0.00$)\n1tb (Thay đổi giá: 230.00$)\n', '2025-03-22 14:52:34'),
(182, NULL, 'Nâng cấp SSD Dell XPS 13 lên 256GB', 'Hãng: Dell, Giá: 1400.00$, Thông số: Intel i7, RAM 16GB, SSD 1TB, Hình ảnh: images/dell_xps_13.jpg\n', '2025-03-22 14:52:41'),
(183, NULL, 'Nâng cấp SSD Dell XPS 13 lên 256GB SSD', 'Hãng: Dell, Giá: 1400.00$, Thông số: Intel i7, RAM 16GB, SSD 1TB, Hình ảnh: images/dell_xps_13.jpg\nBạn có thể **hạ cấp** SSD xuống 256GB SSD và tiết kiệm 120.00$.\n', '2025-03-22 14:54:06'),
(184, NULL, 'Nâng cấp SSD Dell XPS 13 lên 512GB SSD', 'Hãng: Dell, Giá: 1400.00$, Thông số: Intel i7, RAM 16GB, SSD 1TB, Hình ảnh: images/dell_xps_13.jpg\nDell hỗ trợ 512GB SSD, nhưng không có thay đổi về giá.\n', '2025-03-22 14:55:18'),
(185, NULL, 'hạ cấp SSD Dell XPS 13 xuống 256GB SSD', 'Hãng: Dell, Giá: 1400.00$, Thông số: Intel i7, RAM 16GB, SSD 1TB, Hình ảnh: images/dell_xps_13.jpg\nBạn có thể **hạ cấp** SSD xuống 256GB SSD và tiết kiệm 120.00$.\n', '2025-03-22 14:55:49'),
(186, NULL, 'Hạ cấp GPU Asus ROG Zephyrus G14 xuống RTX 3050', 'Hãng: Asus, Giá: 1600.00$, Thông số: Ryzen 9, RAM 32GB, RTX 3060, Hình ảnh: images/asus_rog_g14.jpg\nBạn có thể **hạ cấp** GPU xuống RTX 3050 và tiết kiệm 300.00$.\n', '2025-03-22 14:56:20'),
(187, NULL, 'Nâng cấp GPU Asus ROG Zephyrus G14 lên RTX 3070', 'Hãng: Asus, Giá: 1600.00$, Thông số: Ryzen 9, RAM 32GB, RTX 3060, Hình ảnh: images/asus_rog_g14.jpg\nBạn có thể **nâng cấp** GPU lên RTX 3070 với giá 500.00$.\n', '2025-03-22 14:56:32'),
(188, NULL, 'Hạ cấp CPU Dell XPS 13 xuống Intel i5', 'Hãng: Dell, Giá: 1400.00$, Thông số: Intel i7, RAM 16GB, SSD 1TB, Hình ảnh: images/dell_xps_13.jpg\nBạn có thể **hạ cấp** CPU xuống INTEL I5 và tiết kiệm 200.00$.\n', '2025-03-22 14:56:40'),
(189, NULL, 'nâng  cấp CPU Dell XPS 13 lên Intel i7', 'Hãng: Dell, Giá: 1400.00$, Thông số: Intel i7, RAM 16GB, SSD 1TB, Hình ảnh: images/dell_xps_13.jpg\nDell hỗ trợ INTEL I7, nhưng không có thay đổi về giá.\n', '2025-03-22 14:56:52'),
(190, NULL, 'nâng cấp CPU Dell XPS 13 lên Intel i9', 'Hãng: Dell, Giá: 1400.00$, Thông số: Intel i7, RAM 16GB, SSD 1TB, Hình ảnh: images/dell_xps_13.jpg\nBạn có thể **nâng cấp** CPU lên INTEL I9 với giá 350.00$.\n', '2025-03-22 14:56:59'),
(191, NULL, 'Nâng cấp RAM Asus ROG Zephyrus G14 lên 32GB', 'Hãng: Asus, Giá: 1600.00$, Thông số: Ryzen 9, RAM 32GB, RTX 3060, Hình ảnh: images/asus_rog_g14.jpg\n', '2025-03-22 14:57:08'),
(192, NULL, 'Nâng cấp RAM Asus ROG Zephyrus G14 lên 32GB RAM', 'Hãng: Asus, Giá: 1600.00$, Thông số: Ryzen 9, RAM 32GB, RTX 3060, Hình ảnh: images/asus_rog_g14.jpg\nBạn có thể **nâng cấp** RAM lên 32GB RAM với giá 300.00$.\n', '2025-03-22 14:57:14'),
(193, NULL, 'hạ cấp RAM Asus ROG Zephyrus G14 xuống 16GB RAM', 'Hãng: Asus, Giá: 1600.00$, Thông số: Ryzen 9, RAM 32GB, RTX 3060, Hình ảnh: images/asus_rog_g14.jpg\nAsus hỗ trợ 16GB RAM, nhưng không có thay đổi về giá.\n', '2025-03-22 14:57:28');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `laptops`
--

CREATE TABLE `laptops` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `brand` varchar(100) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `specifications` text NOT NULL,
  `image_url` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `laptops`
--

INSERT INTO `laptops` (`id`, `name`, `brand`, `price`, `specifications`, `image_url`) VALUES
(1, 'MacBook Air M2', 'Apple', 1200.00, 'Chip M2, RAM 16GB, SSD 512GB', 'images/macbook_air_m2.jpg'),
(2, 'Dell XPS 13', 'Dell', 1400.00, 'Intel i7, RAM 16GB, SSD 1TB', 'images/dell_xps_13.jpg'),
(3, 'Asus ROG Zephyrus G14', 'Asus', 1600.00, 'Ryzen 9, RAM 32GB, RTX 3060', 'images/asus_rog_g14.jpg');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `upgrades`
--

CREATE TABLE `upgrades` (
  `id` int(11) NOT NULL,
  `laptop_id` int(11) NOT NULL,
  `component_type` enum('CPU','RAM','SSD','GPU') NOT NULL,
  `component_name` varchar(255) NOT NULL,
  `price_change` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `upgrades`
--

INSERT INTO `upgrades` (`id`, `laptop_id`, `component_type`, `component_name`, `price_change`) VALUES
(1, 1, 'RAM', '8GB RAM', -200.00),
(2, 1, 'RAM', '16GB RAM', 150.00),
(3, 1, 'RAM', '32GB RAM', 300.00),
(4, 1, 'CPU', 'M1', -300.00),
(5, 1, 'CPU', 'M2', 200.00),
(6, 1, 'CPU', 'M3', 400.00),
(7, 1, 'SSD', '256GB', -150.00),
(8, 1, 'SSD', '512GB', 0.00),
(9, 1, 'SSD', '1TB', 250.00),
(10, 2, 'RAM', '8GB RAM', -150.00),
(11, 2, 'CPU', 'Intel i5', -200.00),
(12, 2, 'CPU', 'Intel i7', 0.00),
(13, 2, 'CPU', 'Intel i9', 350.00),
(14, 2, 'SSD', '256GB', -120.00),
(15, 2, 'SSD', '512GB', 0.00),
(16, 2, 'SSD', '1TB', 230.00),
(17, 3, 'RAM', '8GB RAM', -250.00),
(18, 3, 'RAM', '16GB RAM', 0.00),
(19, 3, 'RAM', '32GB RAM', 300.00),
(20, 3, 'SSD', '512GB SSD', -200.00),
(21, 3, 'SSD', '1TB SSD', 0.00),
(22, 3, 'SSD', '2TB SSD', 400.00),
(23, 3, 'GPU', 'RTX 3050', -300.00),
(24, 3, 'GPU', 'RTX 3060', 0.00),
(25, 3, 'GPU', 'RTX 3070', 500.00),
(26, 3, 'CPU', 'Ryzen 3', -400.00),
(27, 3, 'CPU', 'Ryzen 5', -200.00),
(28, 3, 'CPU', 'Ryzen 7', 0.00),
(29, 3, 'CPU', 'Ryzen 9', 450.00),
(30, 2, 'RAM', '16GB RAM', 0.00),
(31, 2, 'RAM', '32GB RAM', 450.00);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(100) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password_hash` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Chỉ mục cho bảng `chatbot_history`
--
ALTER TABLE `chatbot_history`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Chỉ mục cho bảng `laptops`
--
ALTER TABLE `laptops`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `upgrades`
--
ALTER TABLE `upgrades`
  ADD PRIMARY KEY (`id`),
  ADD KEY `laptop_id` (`laptop_id`);

--
-- Chỉ mục cho bảng `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT cho bảng `chatbot_history`
--
ALTER TABLE `chatbot_history`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=194;

--
-- AUTO_INCREMENT cho bảng `laptops`
--
ALTER TABLE `laptops`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT cho bảng `upgrades`
--
ALTER TABLE `upgrades`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT cho bảng `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `chatbot_history`
--
ALTER TABLE `chatbot_history`
  ADD CONSTRAINT `chatbot_history_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Các ràng buộc cho bảng `upgrades`
--
ALTER TABLE `upgrades`
  ADD CONSTRAINT `upgrades_ibfk_1` FOREIGN KEY (`laptop_id`) REFERENCES `laptops` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
