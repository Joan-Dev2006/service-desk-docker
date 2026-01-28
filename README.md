🛠️ Service-Desk Cloud Dashboard
📝 Présentation
Ce projet est une application de gestion de tickets d'assistance technique entièrement conteneurisée. Il démontre la maîtrise de l'orchestration de services avec Docker Compose et la gestion d'une base de données relationnelle complexe intégrant de la logique métier avancée.
🚀 Fonctionnalités Clés
•	Infrastructure Immutable : Déploiement complet (Web + DB + Admin) en une seule commande.
•	Base de Données Intelligente :
o	Vues SQL : Simplification de l'affichage des données complexes.
o	Triggers : Sécurité applicative pour l'intégrité des administrateurs.
o	Procédures Stockées : Calcul automatique des statistiques de tickets.
•	Dashboard Dynamique : Interface PHP 8.2 connectée en temps réel au service MySQL.
________________________________________
🏗️ Architecture Docker
Le projet s'appuie sur trois services isolés dans un réseau privé virtuel :
1.	db_stage (MySQL 8.0) : Moteur de stockage et logique SQL.
2.	web_stage (Apache/PHP 8.2) : Serveur d'application.
3.	pma_stage (phpMyAdmin) : Interface d'administration graphique.
________________________________________
🌐 Accès aux Services
Une fois l'infrastructure démarrée, les services sont disponibles aux adresses suivantes :
Service	URL	Port	Identifiants
🚀 Dashboard	http://localhost:9999
9999	Accès libre
🔧 phpMyAdmin	http://localhost:8081
8081	root / secure_stage_2026
________________________________________
🛠️ Installation et Lancement
Prérequis : Avoir installé Docker et Docker Compose.
1.	Cloner le projet :
Bash
git clone https://github.com/Joan-Dev2006/Mini_cloud.git
cd Mini_cloud
2.	Démarrer l'infrastructure :
Bash
docker-compose -f cloud.yml up -d --build
3.	Arrêter le projet :
Bash
docker-compose -f cloud.yml down
________________________________________
Projet réalisé par Joan-Dev2006 - 2026

