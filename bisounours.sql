-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : mar. 25 mars 2025 à 07:20
-- Version du serveur : 10.4.32-MariaDB
-- Version de PHP : 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `bisounours`
--

-- --------------------------------------------------------

--
-- Structure de la table `fiche`
--

CREATE TABLE `fiche` (
  `id_fiche` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `date` date NOT NULL,
  `commentaire` text DEFAULT NULL,
  `status` enum('Traité','Non Traité') NOT NULL DEFAULT 'Non Traité',
  `etat` enum('Validée','Refusée','En attente') DEFAULT 'En attente',
  `commentaireComptable` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `fiche`
--

INSERT INTO `fiche` (`id_fiche`, `id_user`, `date`, `commentaire`, `status`, `etat`, `commentaireComptable`) VALUES
(3, 6, '2024-12-11', 'aaaaah', 'Traité', 'En attente', NULL),
(5, 6, '2024-11-12', NULL, 'Traité', 'En attente', NULL),
(6, 6, '2024-12-11', 'VAS te faire bz arthur ', 'Traité', 'En attente', NULL),
(7, 6, '2000-12-11', NULL, 'Traité', 'En attente', NULL),
(8, 6, '2025-02-12', 'alo', 'Traité', 'En attente', NULL),
(9, 6, '2024-12-12', 'HELLO WORLD', 'Traité', 'En attente', NULL),
(10, 6, '2024-12-12', NULL, 'Traité', 'En attente', NULL),
(11, 6, '2024-12-12', NULL, 'Traité', 'En attente', NULL),
(12, 6, '2026-12-12', 'haaaaaa', '', 'En attente', NULL),
(13, 6, '2026-12-12', 'haaaaaa', '', 'En attente', NULL),
(14, 6, '2026-12-12', 'haaaaaa', '', 'En attente', NULL),
(15, 6, '2026-12-12', 'haaaaaa', '', 'En attente', NULL),
(16, 6, '2200-11-12', 'miaou miaou', 'Traité', 'En attente', 'help'),
(17, 6, '2022-12-12', '11111', '', 'En attente', 'non'),
(18, 6, '2027-12-12', 'caton', 'Traité', '', 'con'),
(19, 6, '2022-05-12', 'blabla', 'Traité', 'Validée', 'non');

-- --------------------------------------------------------

--
-- Structure de la table `ligne_frais`
--

CREATE TABLE `ligne_frais` (
  `id_lf` int(11) NOT NULL,
  `id_fiche` int(11) NOT NULL,
  `id_typefrais` int(11) NOT NULL,
  `prix_unitaire` decimal(10,2) DEFAULT 0.00,
  `quantite` int(11) NOT NULL,
  `date_depense` date NOT NULL,
  `justificatif` varchar(255) DEFAULT NULL,
  `total_frais` decimal(10,2) GENERATED ALWAYS AS (`quantite` * `prix_unitaire`) STORED
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `ligne_frais`
--

INSERT INTO `ligne_frais` (`id_lf`, `id_fiche`, `id_typefrais`, `prix_unitaire`, `quantite`, `date_depense`, `justificatif`) VALUES
(9, 3, 1, 150.00, 1, '2024-12-11', NULL),
(10, 3, 2, 1.00, 1, '2024-12-11', NULL),
(11, 3, 3, 12.00, 1, '2024-12-11', NULL),
(12, 3, 5, 1215.00, 1, '2024-12-11', NULL),
(17, 5, 1, 150.00, 1, '2024-11-12', NULL),
(18, 5, 2, 30.00, 1, '2024-11-12', NULL),
(19, 5, 3, 15.00, 1, '2024-11-12', NULL),
(20, 5, 5, 200.00, 1, '2024-11-12', NULL),
(21, 6, 1, 1500.00, 1, '2024-12-11', NULL),
(22, 6, 2, 1.00, 1, '2024-12-11', NULL),
(23, 6, 3, 2.00, 1, '2024-12-11', NULL),
(24, 6, 5, 600.00, 1, '2024-12-11', NULL),
(25, 8, 1, 10.00, 2, '2025-02-12', NULL),
(26, 8, 2, 5.00, 50, '2025-02-12', NULL),
(27, 8, 3, 50.00, 1, '2025-02-12', 'TP - Construire un API REST en PHP.pdf'),
(28, 9, 1, 150.00, 3, '2024-12-12', NULL),
(29, 9, 2, 100.00, 6, '2024-12-12', NULL),
(30, 9, 3, 50.00, 5, '2024-12-12', NULL),
(31, 10, 1, 150.00, 3, '2024-12-12', 'Synthese sujet juridique.pdf'),
(32, 10, 2, 5.00, 1, '2024-12-12', NULL),
(33, 11, 1, 150.00, 3, '2024-12-12', 'uploads/Synthese sujet juridique.pdf'),
(34, 11, 2, 5.00, 1, '2024-12-12', NULL),
(35, 12, 1, 150.00, 1, '2026-12-12', 'uploads/Synthese sujet juridique.pdf'),
(36, 12, 2, 50.00, 2, '2026-12-12', NULL),
(37, 13, 1, 150.00, 1, '2026-12-12', 'uploads/Synthese sujet juridique.pdf'),
(38, 13, 2, 50.00, 2, '2026-12-12', NULL),
(39, 14, 1, 150.00, 1, '2026-12-12', 'uploads/Synthese sujet juridique.pdf'),
(40, 14, 2, 50.00, 2, '2026-12-12', NULL),
(41, 15, 1, 150.00, 1, '2026-12-12', 'uploads/Synthese sujet juridique.pdf'),
(42, 15, 2, 50.00, 2, '2026-12-12', NULL),
(43, 16, 1, 150.00, 2, '2200-11-12', NULL),
(44, 16, 2, 150.00, 2, '2200-11-12', NULL),
(45, 16, 3, 150.00, 5, '2200-11-12', NULL),
(46, 16, 5, 150.00, 1, '2200-11-12', NULL),
(47, 17, 1, 150.00, 1, '2022-12-12', NULL),
(48, 17, 2, 150.00, 1, '2022-12-12', NULL),
(49, 17, 3, 300.00, 1, '2022-12-12', NULL),
(50, 17, 5, 300.00, 1, '2022-12-12', NULL),
(51, 18, 1, 5.00, 1, '2027-12-12', NULL),
(52, 18, 2, 5.00, 1, '2027-12-12', NULL),
(53, 18, 3, 5.00, 1, '2027-12-12', NULL),
(54, 19, 1, 150.00, 1, '2022-05-12', NULL),
(55, 19, 2, 150.00, 56, '2022-05-12', NULL),
(56, 19, 3, 150.00, 1, '2022-05-12', NULL),
(57, 19, 5, 150.00, 1, '2022-05-12', NULL);

-- --------------------------------------------------------

--
-- Structure de la table `role`
--

CREATE TABLE `role` (
  `id_role` int(11) NOT NULL,
  `role` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `role`
--

INSERT INTO `role` (`id_role`, `role`) VALUES
(1, 'Visiteur'),
(2, 'Comptable'),
(3, 'Administrateur');

-- --------------------------------------------------------

--
-- Structure de la table `type_frais`
--

CREATE TABLE `type_frais` (
  `id_lf` int(11) NOT NULL,
  `type` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `type_frais`
--

INSERT INTO `type_frais` (`id_lf`, `type`) VALUES
(1, 'Hebergement'),
(2, 'Transport'),
(3, 'Dejeuner'),
(4, 'Diner'),
(5, 'Hors forfait');

-- --------------------------------------------------------

--
-- Structure de la table `user`
--

CREATE TABLE `user` (
  `id_user` int(11) NOT NULL,
  `fname` varchar(50) NOT NULL,
  `lname` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `user`
--

INSERT INTO `user` (`id_user`, `fname`, `lname`, `email`, `password`, `role`) VALUES
(3, 'brasko', 'feitan', 'feitan@gmail.com', '$2y$10$73feBqpVAorFwDcGANNorOgdBf81HyH.IMc4f0uXt5OVAA4iblMUe', 2),
(6, 'RahimEmpereurdAfrique69000', 'Pomme', 'a@b.com', '$2y$10$ihfY8LtCN3P5fVLJwGrBYun51qeZkkLl2bn7../4J.eqAj/jsJbyS', 1),
(7, 'a', 'a', 'b@b.com', '$2y$10$6c.zrtYkoZpGNxE2nCsRiewSuF1ac1nBghwgBE4zWsqTcftdNzxm2', 3);

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `fiche`
--
ALTER TABLE `fiche`
  ADD PRIMARY KEY (`id_fiche`),
  ADD KEY `id_user` (`id_user`);

--
-- Index pour la table `ligne_frais`
--
ALTER TABLE `ligne_frais`
  ADD PRIMARY KEY (`id_lf`),
  ADD KEY `id_fiche` (`id_fiche`),
  ADD KEY `id_typefrais` (`id_typefrais`);

--
-- Index pour la table `role`
--
ALTER TABLE `role`
  ADD PRIMARY KEY (`id_role`);

--
-- Index pour la table `type_frais`
--
ALTER TABLE `type_frais`
  ADD PRIMARY KEY (`id_lf`);

--
-- Index pour la table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id_user`),
  ADD UNIQUE KEY `email` (`email`),
  ADD KEY `role` (`role`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `fiche`
--
ALTER TABLE `fiche`
  MODIFY `id_fiche` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT pour la table `ligne_frais`
--
ALTER TABLE `ligne_frais`
  MODIFY `id_lf` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=58;

--
-- AUTO_INCREMENT pour la table `role`
--
ALTER TABLE `role`
  MODIFY `id_role` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pour la table `type_frais`
--
ALTER TABLE `type_frais`
  MODIFY `id_lf` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT pour la table `user`
--
ALTER TABLE `user`
  MODIFY `id_user` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `fiche`
--
ALTER TABLE `fiche`
  ADD CONSTRAINT `fiche_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `user` (`id_user`) ON DELETE CASCADE;

--
-- Contraintes pour la table `ligne_frais`
--
ALTER TABLE `ligne_frais`
  ADD CONSTRAINT `ligne_frais_ibfk_1` FOREIGN KEY (`id_fiche`) REFERENCES `fiche` (`id_fiche`) ON DELETE CASCADE,
  ADD CONSTRAINT `ligne_frais_ibfk_2` FOREIGN KEY (`id_typefrais`) REFERENCES `type_frais` (`id_lf`) ON DELETE CASCADE;

--
-- Contraintes pour la table `user`
--
ALTER TABLE `user`
  ADD CONSTRAINT `user_ibfk_1` FOREIGN KEY (`role`) REFERENCES `role` (`id_role`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
