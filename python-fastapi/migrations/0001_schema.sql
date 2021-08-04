-- Some demo data.
DROP TABLE IF EXISTS users;
CREATE TABLE IF NOT EXISTS users (
    user_id BIGSERIAL,
    username TEXT UNIQUE NOT NULL
);

INSERT INTO users (username) VALUES ('foo'), ('bar'), ('admin');

