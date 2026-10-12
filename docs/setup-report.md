# CampusHub setup report

Recorded on 12 October 2026.

## Task 1 — Toolchain

```text
node --version
v24.21.0

npm --version
11.19.0

git --version
git version 2.56.0.windows.2

Get-Service MySQL80 | Select-Object Name, Status
Name     Status
MySQL80  Running

git config --global --list (required settings)
user.name=Raad Ibrahim
user.email=sccs10323@su.edu.krd
init.defaultbranch=main
core.autocrlf=input
```

## Task 2 — Repository

```text
git remote -v
origin  https://github.com/raadibrahim/fullstack-capstone.git (fetch)
origin  https://github.com/raadibrahim/fullstack-capstone.git (push)

Get-ChildItem -Force
.git
.gitattributes
.gitignore
client
db
docs
server
README.md
```

## Task 5 — Database

Run the following after applying `db/schema.sql`:

```text
mysql -u campushub -p campushub -e "SHOW TABLES; DESCRIBE events;"

Tables_in_campushub
events
users

Field         Type          Null  Key  Default            Extra
id            int           NO    PRI  NULL               auto_increment
title         varchar(200)  NO         NULL
description   text          YES        NULL
category      varchar(60)   NO         NULL
venue         varchar(160)  NO         NULL
startsAt      datetime      NO         NULL
capacity      int           NO         NULL
organiserId   int           NO    MUL  NULL
published     tinyint(1)    NO         0
```

The schema creates the `campushub` database, the application account, and the `users` and `events` tables. The seed file adds one organiser and three events.
