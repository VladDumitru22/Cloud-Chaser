INSERT INTO `clients` (`name`, `email`, `phone_number`, `address`)
VALUES
('ACME Corp', 'contact@acme.com', '0740123456', '10 Example St, Bucharest'),
('TechStars', 'info@techstars.com', '0720987654', '5 Technology St, Cluj'),
('SocialGuru', 'hello@socialguru.com', '0730456789', '12 Marketing Blvd, Iasi');

INSERT INTO `products` (`id_client`, `name`, `start_date`, `end_date`)
VALUES
(1, 'Gold Social Media Package', '2025-11-01', '2026-01-31'),
(2, 'Starter Social Media Package', '2025-11-15', '2025-12-15'),
(3, 'Premium Influencer Package', '2025-12-01', '2026-02-28');

INSERT INTO `components` (`name`, `component_type`, `unit_cost`, `description`)
VALUES
('Instagram Posts', 'Content', 50.00, 'Daily Instagram posts creation'),
('Facebook Ads', 'Advertising', 100.00, 'Targeted Facebook campaigns'),
('TikTok Videos', 'Content', 120.00, 'Viral videos for TikTok'),
('Monthly Report', 'Analytics', 30.00, 'Monthly performance report'),
('Community Management', 'Engagement', 200.00, 'Handling comments and messages');

INSERT INTO `packages` (`id_product`, `id_component`, `quantity`, `notes`)
VALUES
(1, 1, 30, 'Daily posts for 1 month'),
(1, 2, 10, 'Targeted campaigns'),
(1, 4, 3, 'Monthly report for 3 months'),
(2, 1, 15, 'Posts every 2 days'),
(3, 3, 20, 'Viral videos'),
(3, 5, 2, 'Community management');

INSERT INTO `campaigns` (`id_product`, `name`, `status`, `start_date`, `end_date`)
VALUES
(1, 'Instagram November Campaign', 'Active', '2025-11-01', '2025-11-30'),
(3, 'TikTok Winter Campaign', 'Pending', '2025-12-01', '2026-01-31');
