\# 🛠️ Service-Desk Cloud Dashboard



\### 📝 Présentation

Ce projet est une application de gestion de tickets d'assistance technique entièrement conteneurisée. Il a été conçu pour démontrer la maîtrise de l'orchestration de services avec \*\*Docker Compose\*\* et la gestion d'une base de données relationnelle complexe.



\### 🚀 Fonctionnalités Clés

\- \*\*Infrastructure Immutable\*\* : Déploiement complet (Web + DB + Admin) en une seule commande.

\- \*\*Base de Données Intelligente\*\* :

&nbsp;   - Utilisation de \*\*Vues SQL\*\* pour simplifier l'affichage des données.

&nbsp;   - Mise en place de \*\*Triggers\*\* pour garantir l'intégrité (sécurité sur la suppression des Admins).

&nbsp;   - \*\*Procédures stockées\*\* pour les statistiques de tickets.

\- \*\*Dashboard Dynamique\*\* : Interface PHP connectée en temps réel au service MySQL.



\### 🏗️ Architecture Docker

Le projet s'appuie sur trois services interconnectés dans un réseau privé :

1\. \*\*`db\_stage`\*\* (MySQL 8.0) : Stockage et logique métier SQL.

2\. \*\*`web\_stage`\*\* (Apache/PHP 8.2) : Serveur d'application.

3\. \*\*`pma\_stage`\*\* (phpMyAdmin) : Interface d'administration de la base de données.



\### 🛠️ Installation et Lancement

1\. \*\*Cloner le projet\*\* :

&nbsp;  ```bash

&nbsp;  git clone <ton-lien-github>

&nbsp;  cd <Mini\_cloud>

