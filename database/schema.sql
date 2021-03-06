﻿CREATE TABLE IF NOT EXISTS hosts (
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    zabbixId INT NOT NULL
) ENGINE=InnoDB;

CREATE TABLE IF NOT EXISTS graphs (
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    zabbixId INT NOT NULL,
    host_id INT NOT NULL,
    FOREIGN KEY(host_id) REFERENCES hosts(id)
        ON DELETE CASCADE
) ENGINE=InnoDB;

CREATE TABLE IF NOT EXISTS reports (
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    stime DATETIME,
    period INTEGER NOT NULL,
    width INTEGER,
    height INTEGER
) ENGINE=InnoDB;

CREATE TABLE IF NOT EXISTS reports_hosts (
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    report_id INT,
    host_id INT,
    FOREIGN KEY(report_id) REFERENCES reports(id)
        ON DELETE CASCADE,
    FOREIGN KEY(host_id) REFERENCES hosts(id)
        ON DELETE CASCADE
) ENGINE=InnoDB;
