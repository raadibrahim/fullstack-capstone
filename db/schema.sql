CREATE DATABASE IF NOT EXISTS campushub
  CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

CREATE USER IF NOT EXISTS 'campushub'@'localhost'
  IDENTIFIED BY 'change-me';
GRANT ALL PRIVILEGES ON campushub.* TO 'campushub'@'localhost';

USE campushub;

CREATE TABLE IF NOT EXISTS users (
  id        INT AUTO_INCREMENT PRIMARY KEY,
  name      VARCHAR(120)  NOT NULL,
  email     VARCHAR(190)  NOT NULL UNIQUE,
  password  VARCHAR(255)  NOT NULL,
  role      ENUM('user','organiser','admin') NOT NULL DEFAULT 'user',
  createdAt TIMESTAMP     NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB;

CREATE TABLE IF NOT EXISTS events (
  id          INT AUTO_INCREMENT PRIMARY KEY,
  title       VARCHAR(200) NOT NULL,
  description TEXT,
  category    VARCHAR(60)  NOT NULL,
  venue       VARCHAR(160) NOT NULL,
  startsAt    DATETIME     NOT NULL,
  capacity    INT          NOT NULL,
  organiserId INT          NOT NULL,
  published   BOOLEAN      NOT NULL DEFAULT FALSE,
  CONSTRAINT fk_events_organiser
    FOREIGN KEY (organiserId) REFERENCES users(id)
) ENGINE=InnoDB;
