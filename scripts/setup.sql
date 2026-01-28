-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3307
-- Généré le : mer. 28 jan. 2026 à 15:25
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
-- Base de données : `service_desk_db`
--

DELIMITER $$
--
-- Procédures
--
DROP PROCEDURE IF EXISTS `stat_tickets_par_statut`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `stat_tickets_par_statut` (IN `type_statut` VARCHAR(20))   BEGIN
SELECT COUNT(*) FROM tickets AS t
WHERE
t.statut=type_statut;
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Structure de la table `categories`
--

DROP TABLE IF EXISTS `categories`;
CREATE TABLE `categories` (
  `id_categories` int(11) NOT NULL,
  `nom_categorie` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `categories`
--

INSERT INTO `categories` (`id_categories`, `nom_categorie`) VALUES
(1, 'Problème Matériel'),
(2, 'Accès Réseau & WiFi'),
(3, 'Installation Logiciel'),
(4, 'Sécurité & Mots de passe');

-- --------------------------------------------------------

--
-- Structure de la table `tickets`
--

DROP TABLE IF EXISTS `tickets`;
CREATE TABLE `tickets` (
  `id_tickets` int(11) NOT NULL,
  `titre` varchar(20) DEFAULT NULL,
  `description` varchar(50) DEFAULT NULL,
  `date` datetime DEFAULT current_timestamp(),
  `categorie_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `statut` enum('en_attente','en_cours','resolu') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `tickets`
--

INSERT INTO `tickets` (`id_tickets`, `titre`, `description`, `date`, `categorie_id`, `user_id`, `statut`) VALUES
(9, 'Écran noir au démarr', 'L\'écran secondaire ne s\'allume plus malgré le chan', '2026-01-27 13:31:19', 1, 2, 'en_cours'),
(10, 'Oubli de mot de pass', 'Impossible de se connecter au réseau interne depui', '2026-01-27 13:31:19', 2, 3, 'en_attente'),
(11, 'Demande licence Dock', 'Besoin d\'une licence pour le projet de migration c', '2026-01-27 13:31:19', 3, 2, 'resolu'),
(12, 'Lenteur WiFi OpenSpa', 'Le débit est très faible le matin vers 9h.', '2026-01-27 13:31:19', 2, 3, 'en_attente');

-- --------------------------------------------------------

--
-- Structure de la table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id_util` int(11) NOT NULL,
  `nom` varchar(20) NOT NULL,
  `Email` varchar(100) DEFAULT NULL,
  `role` enum('Client','Admin') DEFAULT 'Client'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `users`
--

INSERT INTO `users` (`id_util`, `nom`, `Email`, `role`) VALUES
(1, 'Duris Joan', 'joan.d@entreprise.com', 'Admin'),
(2, 'Alice Martin', 'a.martin@client.fr', 'Client'),
(3, 'Robert Durant', 'r.durant@gmail.com', 'Client');

--
-- Déclencheurs `users`
--
DROP TRIGGER IF EXISTS `avant_suppression_utilisateur`;
DELIMITER $$
CREATE TRIGGER `avant_suppression_utilisateur` BEFORE DELETE ON `users` FOR EACH ROW BEGIN
	DECLARE user_role varchar(20);
    SELECT role INTO user_role FROM users AS u
    WHERE u.role=OLD.role;
    IF user_role ='admin' THEN
    SIGNAL SQLSTATE '45000' 
        SET MESSAGE_TEXT = 'Erreur : Impossible de supprimer un compte Administrateur !';
    END IF;
   END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Doublure de structure pour la vue `vue_details_tickets`
-- (Voir ci-dessous la vue réelle)
--
DROP VIEW IF EXISTS `vue_details_tickets`;
CREATE TABLE `vue_details_tickets` (
`ticket_id` int(11)
,`titre` varchar(20)
,`statut` enum('en_attente','en_cours','resolu')
,`demandeur` varchar(20)
,`categorie` varchar(50)
);

-- --------------------------------------------------------

--
-- Structure de la vue `vue_details_tickets`
--
DROP TABLE IF EXISTS `vue_details_tickets`;

DROP VIEW IF EXISTS `vue_details_tickets`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vue_details_tickets`  AS SELECT `t`.`id_tickets` AS `ticket_id`, `t`.`titre` AS `titre`, `t`.`statut` AS `statut`, `u`.`nom` AS `demandeur`, `c`.`nom_categorie` AS `categorie` FROM ((`tickets` `t` join `users` `u` on(`t`.`user_id` = `u`.`id_util`)) join `categories` `c` on(`t`.`categorie_id` = `c`.`id_categories`)) ;

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id_categories`);

--
-- Index pour la table `tickets`
--
ALTER TABLE `tickets`
  ADD PRIMARY KEY (`id_tickets`),
  ADD KEY `fk_categories_tickets` (`categorie_id`),
  ADD KEY `fk_user_tickets` (`user_id`);

--
-- Index pour la table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id_util`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `categories`
--
ALTER TABLE `categories`
  MODIFY `id_categories` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT pour la table `tickets`
--
ALTER TABLE `tickets`
  MODIFY `id_tickets` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT pour la table `users`
--
ALTER TABLE `users`
  MODIFY `id_util` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `tickets`
--
ALTER TABLE `tickets`
  ADD CONSTRAINT `fk_categories_tickets` FOREIGN KEY (`categorie_id`) REFERENCES `categories` (`id_categories`),
  ADD CONSTRAINT `fk_user_tickets` FOREIGN KEY (`user_id`) REFERENCES `users` (`id_util`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
