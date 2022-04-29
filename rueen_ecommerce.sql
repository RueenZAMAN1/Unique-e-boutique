-- phpMyAdmin SQL Dump
-- version 5.1.3
-- https://www.phpmyadmin.net/
--
-- Hôte : localhost
-- Généré le : jeu. 28 avr. 2022 à 19:25
-- Version du serveur : 10.4.17-MariaDB-1:10.4.17+maria~stretch
-- Version de PHP : 8.1.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `rueen_ecommerce`
--

-- --------------------------------------------------------

--
-- Structure de la table `article`
--

CREATE TABLE `article` (
  `id` int(11) NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `price` int(11) NOT NULL,
  `category` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `quantity` int(11) NOT NULL,
  `imageFile` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `file_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `article`
--

INSERT INTO `article` (`id`, `title`, `description`, `price`, `category`, `quantity`, `imageFile`, `file_name`, `updated_at`) VALUES
(1, 'Luxury Wholesale', 'Luxury Wholesale Custom Logo PU Leather Gift Jewellery Organizer Small Travel Necklace Ring Earring Jewelry Storage Box Women\r\nrgrt', 3, '0', 2, '0', NULL, NULL),
(2, 'Homme Bomber', 'Extended Sizes Homme Bomber à applique lettre à imprimé football à ourlet à rayures', 15, '1', 1, '0', NULL, NULL),
(3, 'Tableau en verre', 'Ne laissez pas votre mur nu, habillez-le de ce joli tableau en verre représentant un escalier.\r\nCouleur principale: photo.\r\nDélai de livraison: 3 à 5 semaines.', 6, '2', 1, '0', NULL, NULL),
(4, 'Porte manteau arbre - Bois', 'Apportez une allure contemporaine et du style dans votre entrée ou une chambre avec ce portemanteau en bambou. Vous serez séduit par ses différentes articulations !', 25, '2', 1, '0', NULL, NULL),
(5, 'Vivian Mask', 'Sentez-vous sensuelle et prête à séduire avec ce magnifique masque noir de la collection EasyToys ! Ce masque est disponible en différentes formes et conceptions.', 15, '1', 1, '0', NULL, NULL),
(6, 'Maillot third FC Barcelone', 'Maillot third du FC Barcelone 21/22. Le résultat d\'une création artistique avec de jeunes talents de Barcelone qui fait une réinterprétation créative des rayures traditionnelles du Barça. Inscriptions latérales avec le message “Nuestro Barça” (Notre Barça', 14, '1', 2, '0', NULL, NULL),
(7, 'Carré miroir autocollants', '4 pièces en forme de carré miroir autocollants\r\nMatériau:Acrylique\r\nQuantité:4pièces\r\nType:Décors muraux\r\nRoom:Chambre de séjour,salle de bains', 10, '2', 1, '0', NULL, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `article_category`
--

CREATE TABLE `article_category` (
  `article_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `category`
--

CREATE TABLE `category` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `command`
--

CREATE TABLE `command` (
  `id` int(11) NOT NULL,
  `article_name_id` int(11) DEFAULT NULL,
  `order_number_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `command`
--

INSERT INTO `command` (`id`, `article_name_id`, `order_number_id`, `quantity`) VALUES
(1, 1, 1, 1),
(2, 5, 2, 1),
(3, 7, 3, 1),
(4, 3, 4, 2),
(5, 1, 5, 1);

-- --------------------------------------------------------

--
-- Structure de la table `doctrine_migration_versions`
--

CREATE TABLE `doctrine_migration_versions` (
  `version` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `executed_at` datetime DEFAULT NULL,
  `execution_time` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Déchargement des données de la table `doctrine_migration_versions`
--

INSERT INTO `doctrine_migration_versions` (`version`, `executed_at`, `execution_time`) VALUES
('DoctrineMigrations\\Version20210308143020', '2022-02-11 10:56:01', 71),
('DoctrineMigrations\\Version20210308183204', '2022-02-11 10:56:01', 32),
('DoctrineMigrations\\Version20210308183429', '2022-02-11 10:56:01', 26),
('DoctrineMigrations\\Version20210309133842', '2022-02-11 10:56:01', 25),
('DoctrineMigrations\\Version20210310123148', '2022-02-11 10:56:01', 21),
('DoctrineMigrations\\Version20210330134333', '2022-02-11 10:56:01', 12),
('DoctrineMigrations\\Version20210330135935', '2022-02-11 10:56:01', 14),
('DoctrineMigrations\\Version20210330140035', '2022-02-11 10:56:01', 30),
('DoctrineMigrations\\Version20210411170047', '2022-02-11 10:56:01', 48),
('DoctrineMigrations\\Version20210411173047', '2022-02-11 10:56:01', 24);

-- --------------------------------------------------------

--
-- Structure de la table `orders`
--

CREATE TABLE `orders` (
  `id` int(11) NOT NULL,
  `username_id` int(11) DEFAULT NULL,
  `valid` tinyint(1) NOT NULL,
  `ordered_at` datetime NOT NULL,
  `order_number` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `orders`
--

INSERT INTO `orders` (`id`, `username_id`, `valid`, `ordered_at`, `order_number`) VALUES
(1, 1, 1, '2022-02-24 23:27:52', 2022022459),
(2, 1, 1, '2022-03-08 13:45:40', 2022030848),
(3, 7, 1, '2022-03-16 14:21:17', 2022031698),
(4, 8, 1, '2022-04-28 17:24:48', 2022042872),
(5, 8, 1, '2022-04-28 17:28:01', 2022042854);

-- --------------------------------------------------------

--
-- Structure de la table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `username` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_verified` tinyint(1) NOT NULL,
  `roles` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`roles`))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `user`
--

INSERT INTO `user` (`id`, `username`, `password`, `email`, `address`, `is_verified`, `roles`) VALUES
(1, 'Zr', '$2y$12$UkPKgm/SYPmCL2QOOSnNBu3pCGVo1IPWTwJg1uqo9.hIN8.4SBJsi', 'zr@gmail.com', '4 rue de s', 0, '[\"ROLE_ADMIN\"]'),
(5, 'ZAMAN', '$2y$12$wDKVjMmsIDOH0btPj01Ep.YOlxM4OkO3ZzW.MKrMAI02mspqePoFO', 'zaman@yahoo.com', '52 rue anselme', 0, '[\"ROLE_USER\"]'),
(6, 'RR', '$2y$12$947s2ssRjhkv0W1bNATMKe98vFLmZjmTDMSh0S6owSuVqBQpfxuzW', 'rr@gmail.com', '2 rue d', 0, '[\"ROLE_USER\"]'),
(7, 'rueen', '$2y$12$nuk9S6wQYDlhc/4CTh.FCOn3o6SxDGbKtWSYdFIdCtW8oHVIjUidi', 'rueen@yahoo.com', '34 rue d', 0, '[\"ROLE_USER\"]'),
(8, 'titi', '$2y$12$EOJGKJS9Zb0z1UDYI5O3lOdYt/TFLISobbFvUx98u/rNnykUFIdQu', 'titi@titi.fr', 'tititoto', 0, '[\"ROLE_USER\"]'),
(9, 'hello', '$2y$12$V8XeE268usycESJ2w5swyOjIoO77LfluM5xTK1TERRTjeft89/Yb2', 'hello@hh.fr', '12', 0, '[\"ROLE_USER\"]');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `article`
--
ALTER TABLE `article`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `article_category`
--
ALTER TABLE `article_category`
  ADD PRIMARY KEY (`article_id`,`category_id`),
  ADD KEY `IDX_53A4EDAA7294869C` (`article_id`),
  ADD KEY `IDX_53A4EDAA12469DE2` (`category_id`);

--
-- Index pour la table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `command`
--
ALTER TABLE `command`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_8ECAEAD49CC5D861` (`article_name_id`),
  ADD KEY `IDX_8ECAEAD48C26A5E8` (`order_number_id`);

--
-- Index pour la table `doctrine_migration_versions`
--
ALTER TABLE `doctrine_migration_versions`
  ADD PRIMARY KEY (`version`);

--
-- Index pour la table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_E52FFDEEED766068` (`username_id`);

--
-- Index pour la table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `article`
--
ALTER TABLE `article`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT pour la table `category`
--
ALTER TABLE `category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `command`
--
ALTER TABLE `command`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT pour la table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT pour la table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `article_category`
--
ALTER TABLE `article_category`
  ADD CONSTRAINT `FK_53A4EDAA12469DE2` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_53A4EDAA7294869C` FOREIGN KEY (`article_id`) REFERENCES `article` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `command`
--
ALTER TABLE `command`
  ADD CONSTRAINT `FK_8ECAEAD48C26A5E8` FOREIGN KEY (`order_number_id`) REFERENCES `orders` (`id`),
  ADD CONSTRAINT `FK_8ECAEAD49CC5D861` FOREIGN KEY (`article_name_id`) REFERENCES `article` (`id`);

--
-- Contraintes pour la table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `FK_E52FFDEEED766068` FOREIGN KEY (`username_id`) REFERENCES `user` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
