-- PostgreSQL initialization script
-- Runs automatically when the container starts for the first time.

-- Extensions
CREATE EXTENSION IF NOT EXISTS "uuid-ossp";
CREATE EXTENSION IF NOT EXISTS "pgcrypto";

-- Load schema files (executed in sorted order by the entrypoint)
