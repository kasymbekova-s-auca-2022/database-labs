# Backup and Recovery Strategy

## Overview
This project uses a simple and reliable backup and recovery strategy based on
PostgreSQL built-in tools. The goal is to ensure data safety and the ability to
restore the database in case of data loss or system failure.

## Backup Strategy
Database backups are created using the pg_dump utility. This tool allows
exporting the entire database schema and data into a single backup file.

Example backup command:
```
pg_dump -Fc farmdb > farmdb_backup.dump
```
The backup file contains:
- database schema (tables, constraints, indexes)
- stored data
- relationships between entities

Backups can be performed manually or scheduled periodically if needed.

## Recovery Strategy
Database recovery is performed using the pg_restore utility.

Example recovery command:
```
pg_restore -d farmdb farmdb_backup.dump
```
This command restores the database schema and data from the backup file.

## Conclusion
The described backup and recovery strategy ensures basic data protection and
allows full restoration of the database. This approach is sufficient for an
educational project and demonstrates understanding of database maintenance
principles.
