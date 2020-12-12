-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th12 03, 2020 lúc 04:14 AM
-- Phiên bản máy phục vụ: 10.4.14-MariaDB
-- Phiên bản PHP: 7.4.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `class_management`
--
CREATE DATABASE IF NOT EXISTS `class_management` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `class_management`;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `attend_classes`
--

CREATE TABLE `attend_classes` (
  `id` int(20) UNSIGNED NOT NULL,
  `class_id` int(20) NOT NULL,
  `student_id` bigint(20) NOT NULL,
  `teacher_id` bigint(20) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `attend_classes`
--

INSERT INTO `attend_classes` (`id`, `class_id`, `student_id`, `teacher_id`, `created_at`, `updated_at`) VALUES
(3, 7, 4, 3, '2020-12-02 19:55:52', '2020-12-02 19:55:52'),
(5, 9, 6, 5, '2020-12-02 20:05:49', '2020-12-02 20:05:49'),
(6, 9, 4, 5, '2020-12-02 20:06:49', '2020-12-02 20:06:49');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `classrooms`
--

CREATE TABLE `classrooms` (
  `id` int(20) UNSIGNED NOT NULL,
  `class_code` char(10) COLLATE utf8_unicode_ci NOT NULL,
  `creator_id` int(11) NOT NULL,
  `room` char(10) COLLATE utf8_unicode_ci NOT NULL,
  `class_name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `subject` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `class_image` varchar(500) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `classrooms`
--

INSERT INTO `classrooms` (`id`, `class_code`, `creator_id`, `room`, `class_name`, `subject`, `class_image`, `created_at`, `updated_at`) VALUES
(7, 'ID9874', 3, 'a01', 'admin\'s class 1', 'Admin\'s subject 1', 'images/class-1606963999.jpeg', '2020-12-03 02:53:19', '2020-12-03 02:53:19'),
(9, 'ID9239', 5, 'a02', 'Teacher\'s class 1', 'Teacher\'s subject 1', 'images/class-1606964419.jpeg', '2020-12-03 03:00:19', '2020-12-03 03:00:19');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `comments`
--

CREATE TABLE `comments` (
  `id` bigint(20) NOT NULL,
  `class_id` int(11) NOT NULL,
  `commentor` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `content` varchar(255) COLLATE utf32_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf32 COLLATE=utf32_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `documents`
--

CREATE TABLE `documents` (
  `id` int(11) NOT NULL,
  `class_id` int(11) NOT NULL,
  `description` varchar(255) COLLATE utf32_unicode_ci NOT NULL,
  `source` char(255) COLLATE utf32_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf32 COLLATE=utf32_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `invite_joins`
--

CREATE TABLE `invite_joins` (
  `id` int(20) UNSIGNED NOT NULL,
  `teacher_id` int(20) NOT NULL,
  `class_id` int(20) NOT NULL,
  `student_id` bigint(20) NOT NULL,
  `state` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `invite_joins`
--

INSERT INTO `invite_joins` (`id`, `teacher_id`, `class_id`, `student_id`, `state`, `created_at`, `updated_at`) VALUES
(1, 3, 7, 6, 1, '2020-12-03 02:56:58', '2020-12-02 19:56:58'),
(2, 5, 9, 6, 1, '2020-12-03 03:05:49', '2020-12-02 20:05:49');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `request_joins`
--

CREATE TABLE `request_joins` (
  `id` int(20) UNSIGNED NOT NULL,
  `class_id` int(20) NOT NULL,
  `student_id` bigint(20) NOT NULL,
  `state` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `request_joins`
--

INSERT INTO `request_joins` (`id`, `class_id`, `student_id`, `state`, `created_at`, `updated_at`) VALUES
(3, 7, 4, 1, '2020-12-03 02:55:52', '2020-12-02 19:55:52'),
(4, 9, 4, 1, '2020-12-03 03:06:49', '2020-12-02 20:06:49');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `role` int(11) NOT NULL DEFAULT 3,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `role`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(3, 'admin', 'admin@gmail.com', 1, NULL, '$2y$10$SwlUjQe8Dpl9b07RC6jA0egewXK5e5AO0BHrL6vY5Y2ZD8QQEtQoK', NULL, '2020-11-29 12:04:59', '2020-11-29 12:04:59'),
(4, 'student1', 'student1@gmail.com', 3, NULL, '$2y$10$A3GA7riCvAV/rxlADo3lKuKennAak2/ZUdUitNDquUB5QlpDCRzS6', NULL, '2020-12-02 19:50:33', '2020-12-02 19:50:33'),
(5, 'teacher1', 'teacher1@gmail.com', 2, NULL, '$2y$10$q9bQdkYUaBuPMiBzZU7VdeUYVKDgB8Opo6.en.zcW2bBl.3JJSl/q', NULL, '2020-12-02 19:50:58', '2020-12-02 19:51:34'),
(6, 'student2', 'student2@gmail.com', 3, NULL, '$2y$10$MWUGtgGKxlXUgYLLzkmN4.ztKRnbBYXFk64TY2mhb.p3whiUhYbi2', NULL, '2020-12-02 19:51:22', '2020-12-02 19:51:22');

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `attend_classes`
--
ALTER TABLE `attend_classes`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `classrooms`
--
ALTER TABLE `classrooms`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `documents`
--
ALTER TABLE `documents`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `invite_joins`
--
ALTER TABLE `invite_joins`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Chỉ mục cho bảng `request_joins`
--
ALTER TABLE `request_joins`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `attend_classes`
--
ALTER TABLE `attend_classes`
  MODIFY `id` int(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT cho bảng `classrooms`
--
ALTER TABLE `classrooms`
  MODIFY `id` int(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT cho bảng `comments`
--
ALTER TABLE `comments`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT cho bảng `documents`
--
ALTER TABLE `documents`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT cho bảng `invite_joins`
--
ALTER TABLE `invite_joins`
  MODIFY `id` int(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT cho bảng `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT cho bảng `request_joins`
--
ALTER TABLE `request_joins`
  MODIFY `id` int(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT cho bảng `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
