use automatesale;

INSERT INTO `categories` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'Telephone et Accessoires', '2025-05-10 16:19:17', '2025-05-10 16:19:17'),
(2, 'Informatique', '2025-05-10 16:19:44', '2025-05-10 16:19:44'),
(3, 'Electromenager', '2025-05-10 16:20:35', '2025-05-10 16:20:35'),
(4, 'Electronique', '2025-05-10 16:21:33', '2025-05-10 16:21:33');

INSERT INTO `products` (`id`, `category_id`, `name`, `created_at`, `updated_at`) VALUES
(1, 1, 'Android', '2025-05-10 16:22:39', '2025-05-10 16:22:39'),
(2, 1, 'Apple', '2025-05-10 16:22:53', '2025-05-10 16:22:53'),
(3, 1, 'Telephone Basic', '2025-05-10 16:23:09', '2025-05-10 16:23:09');

