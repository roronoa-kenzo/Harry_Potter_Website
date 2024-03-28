-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Hôte : localhost:8889
-- Généré le : mar. 17 oct. 2023 à 08:22
-- Version du serveur : 5.7.39
-- Version de PHP : 7.4.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `WizardingWorld`
--

-- --------------------------------------------------------

--
-- Structure de la table `article`
--

CREATE TABLE `article` (
  `id_article` int(11) NOT NULL,
  `image` varchar(230) NOT NULL,
  `titre` varchar(230) NOT NULL,
  `description` varchar(230) NOT NULL,
  `prix` float NOT NULL,
  `id_categorie` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `article`
--

INSERT INTO `article` (`id_article`, `image`, `titre`, `description`, `prix`, `id_categorie`) VALUES
(1, 'elderwand.png', 'The Elder Wand', '', 19.99, 1),
(2, 'vetement1.png', 'Hogwart T-Shirt', '', 15.99, 2),
(3, 'harrywand.png', 'Harry Wand', '', 19.99, 1),
(4, 'voldemortwand.png', 'Voldemort Wand', '', 19.99, 1),
(5, 'gryffondor-robe.png', 'Gryffindor Dress', '', 59.99, 2),
(6, 'HarryGlasses.png', 'Harry Glasses', '', 6.99, 2);

-- --------------------------------------------------------

--
-- Structure de la table `categorie`
--

CREATE TABLE `categorie` (
  `id_categorie` int(11) NOT NULL,
  `nom_categorie` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `categorie`
--

INSERT INTO `categorie` (`id_categorie`, `nom_categorie`) VALUES
(1, 'Baguette'),
(2, 'Vêtement');

-- --------------------------------------------------------

--
-- Structure de la table `commentaires`
--

CREATE TABLE `commentaires` (
  `idPost` int(11) NOT NULL,
  `PostTexte` varchar(230) DEFAULT NULL,
  `PostImg` varchar(255) DEFAULT NULL,
  `PostDate` date DEFAULT NULL,
  `idUser` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `dislikes`
--

CREATE TABLE `dislikes` (
  `idDislike` int(11) NOT NULL,
  `UserDislike` int(11) DEFAULT NULL,
  `PostDislike` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `likes`
--

CREATE TABLE `likes` (
  `idLike` int(11) NOT NULL,
  `UserLike` int(11) DEFAULT NULL,
  `PostLike` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `maison`
--

CREATE TABLE `maison` (
  `id_maison` int(11) NOT NULL,
  `name` varchar(30) NOT NULL,
  `color` varchar(100) NOT NULL,
  `color2` varchar(100) NOT NULL,
  `description` text NOT NULL,
  `logo` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `maison`
--

INSERT INTO `maison` (`id_maison`, `name`, `color`, `color2`, `description`, `logo`) VALUES
(1, 'Gryffindor', '#740001', '#ae0001', 'If you go to Gryffindor, you will join the brave, the boldest and the strongest gathered there.', 'gryffindor.png'),
(2, 'Slyterin', '#1a472a', '#2a623d', '“There is no good or evil, only power and those who are too weak to take it.”', 'slytherin.png'),
(3, 'Hufflepuff', '#ecb939', '#f0c75e', 'If you go to Hufflepuff, like them, you will be fair and loyal', 'hufflepuff.jpg'),
(4, 'Ravenclaw', '#0e1a40', '#222f5b', 'Wit beyond measure is man\'s greatest treasure\"', 'ravenclaw.png');

-- --------------------------------------------------------

--
-- Structure de la table `messagedislikes`
--

CREATE TABLE `messagedislikes` (
  `idDislike` int(11) NOT NULL,
  `UserDislike` int(11) DEFAULT NULL,
  `MessageDislike` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `messagelikes`
--

CREATE TABLE `messagelikes` (
  `idLike` int(11) NOT NULL,
  `UserLike` int(11) DEFAULT NULL,
  `MessageLike` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `messages`
--

CREATE TABLE `messages` (
  `idMessage` int(11) NOT NULL,
  `MessageText` varchar(230) DEFAULT NULL,
  `MessageDate` date DEFAULT NULL,
  `idUser` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `news`
--

CREATE TABLE `news` (
  `id_news` int(11) NOT NULL,
  `image` varchar(250) NOT NULL,
  `titre` text NOT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `news`
--

INSERT INTO `news` (`id_news`, `image`, `titre`, `description`) VALUES
(1, 'hogwart.jpg', 'Hogwart Legacy is now available !', 'Entrer dans le RPG Harry Potter nouvelle génération crée par Avalanche Software et Warner Games.'),
(2, 'universal.jpg', 'Hogwart in Universal Orlando Resort !', 'This magical place really exists, and it is called the Wizarding World of Harry Potter. It is located in the Universal Orlando park, in the heart of Florida.');

-- --------------------------------------------------------

--
-- Structure de la table `panier`
--

CREATE TABLE `panier` (
  `id_panier` int(11) NOT NULL,
  `id_article` int(11) NOT NULL,
  `prix_total` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `user`
--

CREATE TABLE `user` (
  `idUser` int(11) NOT NULL,
  `UserName` varchar(45) NOT NULL,
  `UserEmail` varchar(150) NOT NULL,
  `UserPassword` varchar(150) NOT NULL,
  `UserProfileImage` varchar(255) DEFAULT NULL,
  `UserRoles` varchar(45) DEFAULT NULL,
  `id_maison` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `user`
--

INSERT INTO `user` (`idUser`, `UserName`, `UserEmail`, `UserPassword`, `UserProfileImage`, `UserRoles`, `id_maison`) VALUES
(16, 'Kenzo', 'splatoon92000@gmail.com', '$2a$08$MYH18cUQovZzPYqkSsC9xe2RvZt8/8zvV1uwbVIGh/ULPDPpGGqG.', '1696929010327-jAfUC.jpeg', 'admin', NULL),
(19, 'Aymerick', 'Aymerick92000@gmail.com', '$2a$08$jSPTR2GWFI7VgIuiCPbs0eDuM9K/iS6IzXR0SrC8LgbHmX2qPnaGO', 'defaultimg.png', NULL, NULL);

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `article`
--
ALTER TABLE `article`
  ADD PRIMARY KEY (`id_article`),
  ADD KEY `id_categorie` (`id_categorie`);

--
-- Index pour la table `categorie`
--
ALTER TABLE `categorie`
  ADD PRIMARY KEY (`id_categorie`);

--
-- Index pour la table `commentaires`
--
ALTER TABLE `commentaires`
  ADD PRIMARY KEY (`idPost`),
  ADD KEY `idUser_idx` (`idUser`);

--
-- Index pour la table `dislikes`
--
ALTER TABLE `dislikes`
  ADD PRIMARY KEY (`idDislike`),
  ADD KEY `UserDislike_idx` (`UserDislike`),
  ADD KEY `PostDislike_idx` (`PostDislike`);

--
-- Index pour la table `likes`
--
ALTER TABLE `likes`
  ADD PRIMARY KEY (`idLike`),
  ADD KEY `UserLike_idx` (`UserLike`),
  ADD KEY `PostLike_idx` (`PostLike`);

--
-- Index pour la table `maison`
--
ALTER TABLE `maison`
  ADD PRIMARY KEY (`id_maison`);

--
-- Index pour la table `messagedislikes`
--
ALTER TABLE `messagedislikes`
  ADD PRIMARY KEY (`idDislike`),
  ADD KEY `UserDislike_idx` (`UserDislike`),
  ADD KEY `MessageDislike_idx` (`MessageDislike`);

--
-- Index pour la table `messagelikes`
--
ALTER TABLE `messagelikes`
  ADD PRIMARY KEY (`idLike`),
  ADD KEY `UserLike_idx` (`UserLike`),
  ADD KEY `MessageLike_idx` (`MessageLike`);

--
-- Index pour la table `messages`
--
ALTER TABLE `messages`
  ADD PRIMARY KEY (`idMessage`),
  ADD KEY `idUser_idx` (`idUser`);

--
-- Index pour la table `news`
--
ALTER TABLE `news`
  ADD PRIMARY KEY (`id_news`);

--
-- Index pour la table `panier`
--
ALTER TABLE `panier`
  ADD PRIMARY KEY (`id_panier`),
  ADD KEY `id_article` (`id_article`);

--
-- Index pour la table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`idUser`),
  ADD UNIQUE KEY `UserEmail_UNIQUE` (`UserEmail`),
  ADD KEY `FK_id_maison` (`id_maison`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `article`
--
ALTER TABLE `article`
  MODIFY `id_article` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT pour la table `categorie`
--
ALTER TABLE `categorie`
  MODIFY `id_categorie` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pour la table `commentaires`
--
ALTER TABLE `commentaires`
  MODIFY `idPost` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `dislikes`
--
ALTER TABLE `dislikes`
  MODIFY `idDislike` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `likes`
--
ALTER TABLE `likes`
  MODIFY `idLike` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `maison`
--
ALTER TABLE `maison`
  MODIFY `id_maison` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT pour la table `messagedislikes`
--
ALTER TABLE `messagedislikes`
  MODIFY `idDislike` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `messagelikes`
--
ALTER TABLE `messagelikes`
  MODIFY `idLike` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `messages`
--
ALTER TABLE `messages`
  MODIFY `idMessage` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `news`
--
ALTER TABLE `news`
  MODIFY `id_news` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pour la table `panier`
--
ALTER TABLE `panier`
  MODIFY `id_panier` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `user`
--
ALTER TABLE `user`
  MODIFY `idUser` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `article`
--
ALTER TABLE `article`
  ADD CONSTRAINT `article_ibfk_1` FOREIGN KEY (`id_categorie`) REFERENCES `categorie` (`id_categorie`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `commentaires`
--
ALTER TABLE `commentaires`
  ADD CONSTRAINT `fk_Commentaires_User` FOREIGN KEY (`idUser`) REFERENCES `user` (`idUser`) ON DELETE CASCADE;

--
-- Contraintes pour la table `dislikes`
--
ALTER TABLE `dislikes`
  ADD CONSTRAINT `fk_Dislikes_Commentaires` FOREIGN KEY (`PostDislike`) REFERENCES `commentaires` (`idPost`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_Dislikes_User` FOREIGN KEY (`UserDislike`) REFERENCES `user` (`idUser`) ON DELETE CASCADE;

--
-- Contraintes pour la table `likes`
--
ALTER TABLE `likes`
  ADD CONSTRAINT `fk_Likes_Commentaires` FOREIGN KEY (`PostLike`) REFERENCES `commentaires` (`idPost`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_Likes_User` FOREIGN KEY (`UserLike`) REFERENCES `user` (`idUser`) ON DELETE CASCADE;

--
-- Contraintes pour la table `messagedislikes`
--
ALTER TABLE `messagedislikes`
  ADD CONSTRAINT `fk_MessageDislikes_Messages` FOREIGN KEY (`MessageDislike`) REFERENCES `messages` (`idMessage`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_MessageDislikes_User` FOREIGN KEY (`UserDislike`) REFERENCES `user` (`idUser`) ON DELETE CASCADE;

--
-- Contraintes pour la table `messagelikes`
--
ALTER TABLE `messagelikes`
  ADD CONSTRAINT `fk_MessageLikes_Messages` FOREIGN KEY (`MessageLike`) REFERENCES `messages` (`idMessage`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_MessageLikes_User` FOREIGN KEY (`UserLike`) REFERENCES `user` (`idUser`) ON DELETE CASCADE;

--
-- Contraintes pour la table `messages`
--
ALTER TABLE `messages`
  ADD CONSTRAINT `fk_Messages_User` FOREIGN KEY (`idUser`) REFERENCES `user` (`idUser`) ON DELETE CASCADE;

--
-- Contraintes pour la table `panier`
--
ALTER TABLE `panier`
  ADD CONSTRAINT `panier_ibfk_1` FOREIGN KEY (`id_article`) REFERENCES `article` (`id_article`);

--
-- Contraintes pour la table `user`
--
ALTER TABLE `user`
  ADD CONSTRAINT `FK_id_maison` FOREIGN KEY (`id_maison`) REFERENCES `maison` (`id_maison`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
