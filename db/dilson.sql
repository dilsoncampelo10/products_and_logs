--
-- Arquivo gerado com SQLiteStudio v3.4.4 em dom. abr. 13 14:35:38 2025
--
-- Codificação de texto usada: UTF-8
--
PRAGMA foreign_keys = off;
BEGIN TRANSACTION;

-- Tabela: admin_user
CREATE TABLE IF NOT EXISTS admin_user (
    id integer primary key,
    company_id integer,
    email text unique not null,
    name text not null,
    foreign key (company_id) references company(id)
);
INSERT INTO admin_user (id, company_id, email, name) VALUES (1, 1, 'rivers.cuomo@xpto.com', 'rivers');
INSERT INTO admin_user (id, company_id, email, name) VALUES (2, 1, 'kim.deal@xpto.com', 'kim');
INSERT INTO admin_user (id, company_id, email, name) VALUES (3, 1, 'corin.tucker@xpto.com', 'corin');
INSERT INTO admin_user (id, company_id, email, name) VALUES (4, 1, 'jeff.magnum@xpto.com', 'jeff');

-- Tabela: category
CREATE TABLE IF NOT EXISTS category(
    id integer primary key,
    company_id integer,
    title text not null,
    active tinyint not null,
    foreign key (company_id) references company(id)
);
INSERT INTO category (id, company_id, title, active) VALUES (1, NULL, 'clothing', 1);
INSERT INTO category (id, company_id, title, active) VALUES (2, NULL, 'phone', 1);
INSERT INTO category (id, company_id, title, active) VALUES (3, NULL, 'computer', 1);
INSERT INTO category (id, company_id, title, active) VALUES (4, 1, 'furniture', 1);
INSERT INTO category (id, company_id, title, active) VALUES (5, 1, 'food', 1);
INSERT INTO category (id, company_id, title, active) VALUES (6, NULL, 'house', 1);

-- Tabela: company
CREATE TABLE IF NOT EXISTS company (
    id integer primary key,
    name text not null unique,
    active TINYINT not null
);
INSERT INTO company (id, name, active) VALUES (1, 'XPTO Ltda.', 1);

-- Tabela: product
CREATE TABLE IF NOT EXISTS product(
    id integer primary key,
    company_id integer not null,
    title text not null,
    price float,
    active tinyint not null,
    created_at datetime not null default current_timestamp,
    foreign key (company_id) references company(id)
);
INSERT INTO product (id, company_id, title, price, active, created_at) VALUES (1, 1, 'white shirt', 70.5, 1, '2023-12-20 21:05:48');
INSERT INTO product (id, company_id, title, price, active, created_at) VALUES (2, 1, 'blue trouser', 68.5, 1, '2023-12-20 21:05:48');
INSERT INTO product (id, company_id, title, price, active, created_at) VALUES (3, 1, 'brown hat', 20.7, 1, '2023-12-20 21:05:48');
INSERT INTO product (id, company_id, title, price, active, created_at) VALUES (4, 1, 'iphone 8', 20.0, 1, '2023-12-20 21:05:48');
INSERT INTO product (id, company_id, title, price, active, created_at) VALUES (5, 1, 'iphone 10', 2790.75, 1, '2023-12-20 21:05:48');
INSERT INTO product (id, company_id, title, price, active, created_at) VALUES (6, 1, 'dell vostro', 2450.5, 1, '2023-12-20 21:05:48');
INSERT INTO product (id, company_id, title, price, active, created_at) VALUES (7, 1, 'acer aspire', 1804.05, 1, '2023-12-20 21:05:48');
INSERT INTO product (id, company_id, title, price, active, created_at) VALUES (8, 1, 'pink sofa', 1396.5, 1, '2023-12-20 21:08:27');
INSERT INTO product (id, company_id, title, price, active, created_at) VALUES (9, 1, 'small wardrobe', 680.25, 1, '2023-12-20 21:08:27');
INSERT INTO product (id, company_id, title, price, active, created_at) VALUES (10, 1, 'king size bed', 4520.83, 1, '2023-12-20 21:08:27');
INSERT INTO product (id, company_id, title, price, active, created_at) VALUES (11, 1, 'big red couch', 2520.83, 0, '2023-12-20 21:08:27');
INSERT INTO product (id, company_id, title, price, active, created_at) VALUES (12, 1, 'chocolate snack', 20.0, 1, '2023-12-20 21:12:22');
INSERT INTO product (id, company_id, title, price, active, created_at) VALUES (13, 1, 'honey flavoured cookie', 10.21, 0, '2023-12-20 21:12:22');
INSERT INTO product (id, company_id, title, price, active, created_at) VALUES (14, 1, 'strawberry bubblegum', 4520.83, 1, '2023-12-20 21:12:22');
INSERT INTO product (id, company_id, title, price, active, created_at) VALUES (15, 1, 'muffin', 14.24, 1, '2023-12-20 21:12:22');
INSERT INTO product (id, company_id, title, price, active, created_at) VALUES (16, 1, 'coffee candy', 1.8, 0, '2023-12-20 21:12:22');
INSERT INTO product (id, company_id, title, price, active, created_at) VALUES (17, 1, 'air conditioning', 2700.0, 1, '2023-12-20 21:19:58');
INSERT INTO product (id, company_id, title, price, active, created_at) VALUES (18, 1, 'refrigerator', 680.5, 1, '2023-12-21 15:31:45');
INSERT INTO product (id, company_id, title, price, active, created_at) VALUES (19, 2, 'Zeradz 12', 396.0, 1, '2025-04-11 19:19:40');
INSERT INTO product (id, company_id, title, price, active, created_at) VALUES (20, 1, 'nome do produto', NULL, 1, '2025-04-11 19:21:18');
INSERT INTO product (id, company_id, title, price, active, created_at) VALUES (21, 1, 'nome do produto', NULL, 1, '2025-04-11 19:21:39');
INSERT INTO product (id, company_id, title, price, active, created_at) VALUES (22, 1, 'nome do produto', NULL, 1, '2025-04-11 19:22:21');
INSERT INTO product (id, company_id, title, price, active, created_at) VALUES (23, 1, 'Novo produto', NULL, 1, '2025-04-11 19:24:31');
INSERT INTO product (id, company_id, title, price, active, created_at) VALUES (24, 1, 'Reste produto', NULL, 1, '2025-04-11 19:27:59');
INSERT INTO product (id, company_id, title, price, active, created_at) VALUES (25, 1, 'TEste novo produto', NULL, 1, '2025-04-11 19:28:20');

-- Tabela: product_category
CREATE TABLE IF NOT EXISTS product_category(
    id integer primary key,
    cat_id integer not null,
    product_id integer not null,
    foreign key (cat_id) references category(id),
    foreign key (product_id) references product(id)
);
INSERT INTO product_category (id, cat_id, product_id) VALUES (1, 1, 1);
INSERT INTO product_category (id, cat_id, product_id) VALUES (2, 1, 2);
INSERT INTO product_category (id, cat_id, product_id) VALUES (3, 1, 3);
INSERT INTO product_category (id, cat_id, product_id) VALUES (4, 2, 4);
INSERT INTO product_category (id, cat_id, product_id) VALUES (5, 2, 5);
INSERT INTO product_category (id, cat_id, product_id) VALUES (6, 3, 6);
INSERT INTO product_category (id, cat_id, product_id) VALUES (7, 3, 7);
INSERT INTO product_category (id, cat_id, product_id) VALUES (8, 4, 8);
INSERT INTO product_category (id, cat_id, product_id) VALUES (9, 6, 8);
INSERT INTO product_category (id, cat_id, product_id) VALUES (10, 4, 9);
INSERT INTO product_category (id, cat_id, product_id) VALUES (11, 6, 9);
INSERT INTO product_category (id, cat_id, product_id) VALUES (12, 4, 10);
INSERT INTO product_category (id, cat_id, product_id) VALUES (13, 6, 10);
INSERT INTO product_category (id, cat_id, product_id) VALUES (14, 4, 11);
INSERT INTO product_category (id, cat_id, product_id) VALUES (15, 6, 11);
INSERT INTO product_category (id, cat_id, product_id) VALUES (16, 5, 12);
INSERT INTO product_category (id, cat_id, product_id) VALUES (17, 5, 13);
INSERT INTO product_category (id, cat_id, product_id) VALUES (18, 5, 14);
INSERT INTO product_category (id, cat_id, product_id) VALUES (19, 5, 15);
INSERT INTO product_category (id, cat_id, product_id) VALUES (20, 5, 16);
INSERT INTO product_category (id, cat_id, product_id) VALUES (21, 6, 17);
INSERT INTO product_category (id, cat_id, product_id) VALUES (22, 6, 18);
INSERT INTO product_category (id, cat_id, product_id) VALUES (23, 1, 19);
INSERT INTO product_category (id, cat_id, product_id) VALUES (24, 1, 20);
INSERT INTO product_category (id, cat_id, product_id) VALUES (25, 1, 21);
INSERT INTO product_category (id, cat_id, product_id) VALUES (26, 1, 22);
INSERT INTO product_category (id, cat_id, product_id) VALUES (27, 2, 23);
INSERT INTO product_category (id, cat_id, product_id) VALUES (28, 2, 24);
INSERT INTO product_category (id, cat_id, product_id) VALUES (29, 2, 25);

-- Tabela: product_log
CREATE TABLE IF NOT EXISTS product_log (id integer PRIMARY KEY, product_id integer NOT NULL, admin_user_id integer NOT NULL, action text NOT NULL, timestamp datetime NOT NULL DEFAULT CURRENT_TIMESTAMP, field TEXT, old_value TEXT, new_value TEXT, FOREIGN KEY (product_id) REFERENCES product (id), FOREIGN KEY (admin_user_id) REFERENCES admin_user (id));
INSERT INTO product_log (id, product_id, admin_user_id, action, timestamp, field, old_value, new_value) VALUES (1, 1, 1, 'create', '2023-12-20 21:32:22', NULL, NULL, NULL);
INSERT INTO product_log (id, product_id, admin_user_id, action, timestamp, field, old_value, new_value) VALUES (2, 1, 2, 'update', '2023-12-20 21:32:22', NULL, NULL, NULL);
INSERT INTO product_log (id, product_id, admin_user_id, action, timestamp, field, old_value, new_value) VALUES (3, 1, 3, 'update', '2023-12-20 21:32:22', NULL, NULL, NULL);
INSERT INTO product_log (id, product_id, admin_user_id, action, timestamp, field, old_value, new_value) VALUES (4, 11, 3, 'create', '2023-12-20 21:32:22', NULL, NULL, NULL);
INSERT INTO product_log (id, product_id, admin_user_id, action, timestamp, field, old_value, new_value) VALUES (5, 11, 1, 'update', '2023-12-20 21:32:22', NULL, NULL, NULL);
INSERT INTO product_log (id, product_id, admin_user_id, action, timestamp, field, old_value, new_value) VALUES (6, 11, 4, 'delete', '2023-12-20 21:32:22', NULL, NULL, NULL);
INSERT INTO product_log (id, product_id, admin_user_id, action, timestamp, field, old_value, new_value) VALUES (7, 2, 2, 'create', '2023-12-20 21:32:22', NULL, NULL, NULL);
INSERT INTO product_log (id, product_id, admin_user_id, action, timestamp, field, old_value, new_value) VALUES (8, 3, 3, 'create', '2023-12-20 21:32:22', NULL, NULL, NULL);
INSERT INTO product_log (id, product_id, admin_user_id, action, timestamp, field, old_value, new_value) VALUES (9, 4, 4, 'create', '2023-12-20 21:32:22', NULL, NULL, NULL);
INSERT INTO product_log (id, product_id, admin_user_id, action, timestamp, field, old_value, new_value) VALUES (10, 2, 5, 'create', '2023-12-20 21:32:22', NULL, NULL, NULL);
INSERT INTO product_log (id, product_id, admin_user_id, action, timestamp, field, old_value, new_value) VALUES (11, 4, 6, 'create', '2023-12-20 21:32:22', NULL, NULL, NULL);
INSERT INTO product_log (id, product_id, admin_user_id, action, timestamp, field, old_value, new_value) VALUES (12, 7, 1, 'create', '2023-12-20 21:32:22', NULL, NULL, NULL);
INSERT INTO product_log (id, product_id, admin_user_id, action, timestamp, field, old_value, new_value) VALUES (13, 8, 1, 'create', '2023-12-20 21:32:22', NULL, NULL, NULL);
INSERT INTO product_log (id, product_id, admin_user_id, action, timestamp, field, old_value, new_value) VALUES (14, 9, 1, 'create', '2023-12-20 21:32:22', NULL, NULL, NULL);
INSERT INTO product_log (id, product_id, admin_user_id, action, timestamp, field, old_value, new_value) VALUES (15, 10, 1, 'create', '2023-12-20 21:32:22', NULL, NULL, NULL);
INSERT INTO product_log (id, product_id, admin_user_id, action, timestamp, field, old_value, new_value) VALUES (16, 11, 1, 'create', '2023-12-20 21:32:22', NULL, NULL, NULL);
INSERT INTO product_log (id, product_id, admin_user_id, action, timestamp, field, old_value, new_value) VALUES (17, 12, 1, 'create', '2023-12-20 21:32:22', NULL, NULL, NULL);
INSERT INTO product_log (id, product_id, admin_user_id, action, timestamp, field, old_value, new_value) VALUES (18, 13, 1, 'create', '2023-12-20 21:32:22', NULL, NULL, NULL);
INSERT INTO product_log (id, product_id, admin_user_id, action, timestamp, field, old_value, new_value) VALUES (19, 14, 1, 'create', '2023-12-20 21:32:22', NULL, NULL, NULL);
INSERT INTO product_log (id, product_id, admin_user_id, action, timestamp, field, old_value, new_value) VALUES (20, 15, 1, 'create', '2023-12-20 21:32:22', NULL, NULL, NULL);
INSERT INTO product_log (id, product_id, admin_user_id, action, timestamp, field, old_value, new_value) VALUES (21, 16, 1, 'create', '2023-12-20 21:32:22', NULL, NULL, NULL);
INSERT INTO product_log (id, product_id, admin_user_id, action, timestamp, field, old_value, new_value) VALUES (22, 17, 1, 'create', '2023-12-20 21:32:22', NULL, NULL, NULL);
INSERT INTO product_log (id, product_id, admin_user_id, action, timestamp, field, old_value, new_value) VALUES (23, 18, 1, 'create', '2023-12-20 23:49:54', NULL, NULL, NULL);
INSERT INTO product_log (id, product_id, admin_user_id, action, timestamp, field, old_value, new_value) VALUES (24, 18, 1, 'update', '2023-12-20 23:52:58', NULL, NULL, NULL);
INSERT INTO product_log (id, product_id, admin_user_id, action, timestamp, field, old_value, new_value) VALUES (25, 18, 1, 'update', '2023-12-20 23:53:10', NULL, NULL, NULL);
INSERT INTO product_log (id, product_id, admin_user_id, action, timestamp, field, old_value, new_value) VALUES (26, 18, 1, 'update', '2023-12-21 00:03:55', NULL, NULL, NULL);
INSERT INTO product_log (id, product_id, admin_user_id, action, timestamp, field, old_value, new_value) VALUES (27, 18, 1, 'delete', '2023-12-21 00:04:35', NULL, NULL, NULL);
INSERT INTO product_log (id, product_id, admin_user_id, action, timestamp, field, old_value, new_value) VALUES (28, 18, 1, 'create', '2023-12-21 15:31:45', NULL, NULL, NULL);
INSERT INTO product_log (id, product_id, admin_user_id, action, timestamp, field, old_value, new_value) VALUES (29, 4, 1, 'update', '2023-12-22 18:08:12', NULL, NULL, NULL);
INSERT INTO product_log (id, product_id, admin_user_id, action, timestamp, field, old_value, new_value) VALUES (30, 4, 3, 'update', '2023-12-22 18:12:10', NULL, NULL, NULL);
INSERT INTO product_log (id, product_id, admin_user_id, action, timestamp, field, old_value, new_value) VALUES (31, 19, 1, 'create', '2024-01-04 02:44:37', NULL, NULL, NULL);
INSERT INTO product_log (id, product_id, admin_user_id, action, timestamp, field, old_value, new_value) VALUES (32, 19, 1, 'update', '2024-01-04 02:44:53', NULL, NULL, NULL);
INSERT INTO product_log (id, product_id, admin_user_id, action, timestamp, field, old_value, new_value) VALUES (33, 19, 1, 'delete', '2024-01-04 02:45:00', NULL, NULL, NULL);
INSERT INTO product_log (id, product_id, admin_user_id, action, timestamp, field, old_value, new_value) VALUES (34, 19, 1, 'delete', '2024-01-05 15:46:42', NULL, NULL, NULL);
INSERT INTO product_log (id, product_id, admin_user_id, action, timestamp, field, old_value, new_value) VALUES (35, 22, 1, 'create', '2025-04-11 19:22:21', 'all', NULL, NULL);
INSERT INTO product_log (id, product_id, admin_user_id, action, timestamp, field, old_value, new_value) VALUES (36, 22, 1, 'create', '2025-04-11 19:22:21', 'all', NULL, NULL);
INSERT INTO product_log (id, product_id, admin_user_id, action, timestamp, field, old_value, new_value) VALUES (37, 23, 1, 'create', '2025-04-11 19:24:31', 'all', NULL, NULL);
INSERT INTO product_log (id, product_id, admin_user_id, action, timestamp, field, old_value, new_value) VALUES (38, 23, 1, 'create', '2025-04-11 19:24:31', 'all', NULL, NULL);
INSERT INTO product_log (id, product_id, admin_user_id, action, timestamp, field, old_value, new_value) VALUES (39, 24, 1, 'create', '2025-04-11 19:27:59', 'all', NULL, NULL);
INSERT INTO product_log (id, product_id, admin_user_id, action, timestamp, field, old_value, new_value) VALUES (40, 24, 1, 'create', '2025-04-11 19:27:59', 'all', NULL, NULL);
INSERT INTO product_log (id, product_id, admin_user_id, action, timestamp, field, old_value, new_value) VALUES (41, 25, 1, 'create', '2025-04-11 19:28:20', 'all', NULL, NULL);
INSERT INTO product_log (id, product_id, admin_user_id, action, timestamp, field, old_value, new_value) VALUES (42, 26, 1, 'create', '2025-04-11 19:32:57', 'all', NULL, NULL);
INSERT INTO product_log (id, product_id, admin_user_id, action, timestamp, field, old_value, new_value) VALUES (43, 19, 1, 'update', '2025-04-11 19:41:14', 'title', 'nome do produto', 'atualizado');
INSERT INTO product_log (id, product_id, admin_user_id, action, timestamp, field, old_value, new_value) VALUES (44, 19, 1, 'update', '2025-04-11 19:41:14', 'price', '', '123.4');
INSERT INTO product_log (id, product_id, admin_user_id, action, timestamp, field, old_value, new_value) VALUES (45, 19, 1, 'update', '2025-04-11 19:42:26', 'price', '123.4', '123');
INSERT INTO product_log (id, product_id, admin_user_id, action, timestamp, field, old_value, new_value) VALUES (46, 19, 1, 'update', '2025-04-11 19:42:57', 'active', '1', '');
INSERT INTO product_log (id, product_id, admin_user_id, action, timestamp, field, old_value, new_value) VALUES (47, 19, 1, 'update', '2025-04-11 19:43:46', 'active', '0', '1');
INSERT INTO product_log (id, product_id, admin_user_id, action, timestamp, field, old_value, new_value) VALUES (48, 19, 1, 'update', '2025-04-11 19:44:04', 'active', '1', '');
INSERT INTO product_log (id, product_id, admin_user_id, action, timestamp, field, old_value, new_value) VALUES (49, 19, 1, 'update', '2025-04-11 19:44:22', 'price', '123', '345');
INSERT INTO product_log (id, product_id, admin_user_id, action, timestamp, field, old_value, new_value) VALUES (50, 19, 1, 'update', '2025-04-11 19:44:22', 'active', '0', '');
INSERT INTO product_log (id, product_id, admin_user_id, action, timestamp, field, old_value, new_value) VALUES (51, 19, 1, 'update', '2025-04-11 19:45:08', 'active', '0', '');
INSERT INTO product_log (id, product_id, admin_user_id, action, timestamp, field, old_value, new_value) VALUES (52, 19, 1, 'update', '2025-04-11 19:46:06', 'active', '0', '');
INSERT INTO product_log (id, product_id, admin_user_id, action, timestamp, field, old_value, new_value) VALUES (53, 19, 1, 'update', '2025-04-11 19:46:06', 'category_id', '', '1');
INSERT INTO product_log (id, product_id, admin_user_id, action, timestamp, field, old_value, new_value) VALUES (54, 19, 1, 'update', '2025-04-13 14:24:29', 'title', 'atualizado', 'Zerado');
INSERT INTO product_log (id, product_id, admin_user_id, action, timestamp, field, old_value, new_value) VALUES (55, 19, 1, 'update', '2025-04-13 14:24:29', 'active', '0', '');
INSERT INTO product_log (id, product_id, admin_user_id, action, timestamp, field, old_value, new_value) VALUES (56, 19, 1, 'update', '2025-04-13 14:24:29', 'category_id', '', '1');
INSERT INTO product_log (id, product_id, admin_user_id, action, timestamp, field, old_value, new_value) VALUES (57, 19, 1, 'update', '2025-04-13 14:25:40', 'title', 'Zerado', 'Zerado 2');
INSERT INTO product_log (id, product_id, admin_user_id, action, timestamp, field, old_value, new_value) VALUES (58, 19, 1, 'update', '2025-04-13 14:25:41', 'active', '0', '');
INSERT INTO product_log (id, product_id, admin_user_id, action, timestamp, field, old_value, new_value) VALUES (59, 19, 1, 'update', '2025-04-13 14:25:41', 'category_id', '', '1');
INSERT INTO product_log (id, product_id, admin_user_id, action, timestamp, field, old_value, new_value) VALUES (60, 19, 1, 'update', '2025-04-13 14:27:53', 'category_id', '', '1');
INSERT INTO product_log (id, product_id, admin_user_id, action, timestamp, field, old_value, new_value) VALUES (61, 19, 1, 'update', '2025-04-13 14:28:33', 'price', '345', '347');
INSERT INTO product_log (id, product_id, admin_user_id, action, timestamp, field, old_value, new_value) VALUES (62, 19, 1, 'update', '2025-04-13 14:28:33', 'category_id', '', '1');
INSERT INTO product_log (id, product_id, admin_user_id, action, timestamp, field, old_value, new_value) VALUES (63, 19, 1, 'update', '2025-04-13 14:29:27', 'price', '347', '349');
INSERT INTO product_log (id, product_id, admin_user_id, action, timestamp, field, old_value, new_value) VALUES (64, 19, 1, 'update', '2025-04-13 14:30:22', 'category_id', '1', '2');
INSERT INTO product_log (id, product_id, admin_user_id, action, timestamp, field, old_value, new_value) VALUES (65, 19, 1, 'update', '2025-04-13 14:31:04', 'active', '1', '');
INSERT INTO product_log (id, product_id, admin_user_id, action, timestamp, field, old_value, new_value) VALUES (66, 19, 1, 'update', '2025-04-13 14:31:20', 'title', 'Zerado 2', 'Zerado 00');
INSERT INTO product_log (id, product_id, admin_user_id, action, timestamp, field, old_value, new_value) VALUES (67, 19, 1, 'update', '2025-04-13 14:31:20', 'active', '0', '');
INSERT INTO product_log (id, product_id, admin_user_id, action, timestamp, field, old_value, new_value) VALUES (68, 19, 1, 'update', '2025-04-13 14:32:01', 'price', '349', '370');
INSERT INTO product_log (id, product_id, admin_user_id, action, timestamp, field, old_value, new_value) VALUES (69, 19, 1, 'update', '2025-04-13 14:32:01', 'active', '0', '');
INSERT INTO product_log (id, product_id, admin_user_id, action, timestamp, field, old_value, new_value) VALUES (70, 19, 1, 'update', '2025-04-13 14:34:19', 'price', '370', '376');
INSERT INTO product_log (id, product_id, admin_user_id, action, timestamp, field, old_value, new_value) VALUES (71, 19, 1, 'update', '2025-04-13 14:34:40', 'active', '0', '1');
INSERT INTO product_log (id, product_id, admin_user_id, action, timestamp, field, old_value, new_value) VALUES (72, 19, 1, 'update', '2025-04-13 14:34:58', 'category_id', '2', '1');
INSERT INTO product_log (id, product_id, admin_user_id, action, timestamp, field, old_value, new_value) VALUES (73, 19, 1, 'update', '2025-04-13 14:35:14', 'title', 'Zerado 00', 'Zeradz');
INSERT INTO product_log (id, product_id, admin_user_id, action, timestamp, field, old_value, new_value) VALUES (74, 19, 1, 'update', '2025-04-13 14:35:32', 'title', 'Zeradz', 'Zeradz 12');
INSERT INTO product_log (id, product_id, admin_user_id, action, timestamp, field, old_value, new_value) VALUES (75, 19, 1, 'update', '2025-04-13 14:35:32', 'price', '376', '396');
INSERT INTO product_log (id, product_id, admin_user_id, action, timestamp, field, old_value, new_value) VALUES (76, 26, 1, 'delete', '2025-04-13 14:39:29', 'all', '', '');
INSERT INTO product_log (id, product_id, admin_user_id, action, timestamp, field, old_value, new_value) VALUES (77, 4, 1, 'update', '2025-04-13 14:48:23', 'price', '18', '20');

COMMIT TRANSACTION;
PRAGMA foreign_keys = on;
