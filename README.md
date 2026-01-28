# 🛠️ Service-Desk Cloud Dashboard

![Docker](https://img.shields.io/badge/Docker-2496ED?style=for-the-badge&logo=docker&logoColor=white) ![MySQL](https://img.shields.io/badge/MySQL-4479A1?style=for-the-badge&logo=mysql&logoColor=white) ![PHP](https://img.shields.io/badge/PHP-777BB4?style=for-the-badge&logo=php&logoColor=white)

### 📝 Présentation
Ce projet est une application de gestion de tickets d'assistance technique **entièrement conteneurisée**. Il démontre la maîtrise de l'orchestration de services avec **Docker Compose** et la gestion d'une base de données relationnelle complexe intégrant de la logique métier avancée.

---

### 🚀 Fonctionnalités Clés
* **Infrastructure Immutable** : Déploiement complet (Web + DB + Admin) en une seule commande.
* **Base de Données Intelligente** :
    * **Vues SQL** : Simplification de l'affichage des données complexes.
    * **Triggers** : Sécurité applicative pour l'intégrité des administrateurs.
    * **Procédures Stockées** : Calcul automatique des statistiques de tickets.
* **Dashboard Dynamique** : Interface PHP 8.2 connectée en temps réel au service MySQL.

---

### 🏗️ Architecture Docker
Le projet s'appuie sur trois services isolés dans un réseau privé virtuel :
1.  **db_stage** (MySQL 8.0) : Moteur de stockage et logique SQL.
2.  **web_stage** (Apache/PHP 8.2) : Serveur d'application.
3.  **pma_stage** (phpMyAdmin) : Interface d'administration graphique.

---

### 🌐 Accès aux Services
Une fois l'infrastructure démarrée, les services sont disponibles aux adresses suivantes :

| Service | URL | Port | Identifiants |
| :--- | :--- | :--- | :--- |
| 🚀 **Dashboard** | [http://localhost:9999](http://localhost:9999) | `9999` | Accès libre |
| 🔧 **phpMyAdmin** | [http://localhost:8081](http://localhost:8081) | `8081` | `root` / `secure_stage_2026` |

---

### 🛠️ Installation et Lancement
> **Prérequis** : Avoir installé Docker et Docker Compose.

1. **Cloner le projet** :
   ```bash
   git clone [https://github.com/Joan-Dev2006/service-desk-docker.git](https://github.com/Joan-Dev2006/service-desk-docker.git)
   cd Mini_cloud

   Démarrer l'infrastructure :
   docker-compose -f cloud.yml up -d --build

   Projet réalisé par Joan-Dev2006 - 2026
