-- Active: 1681689372957@@127.0.0.1@3306
-- Active: 1675556550542@@127.0.0.1@3306
CREATE TABLE users (
    id TEXT PRIMARY KEY UNIQUE NOT NULL,
    nick_name TEXT NOT NULL,
    email TEXT UNIQUE NOT NULL,
    password TEXT NOT NULL,
    role TEXT DEFAULT "NORMAL" NOT NULL,
    created_at TEXT DEFAULT (DATETIME()) NOT NULL
);

CREATE TABLE posts (
    id TEXT PRIMARY KEY UNIQUE NOT NULL,
    creator_id TEXT NOT NULL,
    content TEXT NOT NULL,
    likes INTEGER DEFAULT(0) NOT NULL,
    dislikes INTEGER DEFAULT(0) NOT NULL,
    replies INTEGER DEFAULT(0) NOT NULL,
    created_at TEXT DEFAULT (DATETIME()) NOT NULL,
    updated_at TEXT NOT NULL,
    FOREIGN KEY (creator_id) REFERENCES users(id)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

CREATE TABLE likes_dislikes_post (
    user_id TEXT NOT NULL,
    post_id TEXT NOT NULL,
    like INTEGER NOT NULL,
    FOREIGN KEY (user_id) REFERENCES users(id)
        ON DELETE CASCADE
        ON UPDATE CASCADE,
    FOREIGN KEY (post_id) REFERENCES posts(id)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

CREATE TABLE comments (
    id TEXT PRIMARY KEY UNIQUE NOT NULL,
    creator_id TEXT NOT NULL,
    post_id TEXT NOT NULL,
    content TEXT NOT NULL,
    likes INTEGER DEFAULT(0) NOT NULL,
    dislikes INTEGER DEFAULT(0) NOT NULL,
    created_at TEXT DEFAULT (DATETIME()) NOT NULL,
    updated_at TEXT NOT NULL,
    FOREIGN KEY (creator_id) REFERENCES users(id)
        ON DELETE CASCADE
        ON UPDATE CASCADE
    FOREIGN KEY (post_id) REFERENCES posts(id)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

CREATE TABLE likes_dislikes_post_comment (
    user_id TEXT NOT NULL,
    comment_id TEXT NOT NULL,
    like INTEGER NOT NULL,
    FOREIGN KEY (user_id) REFERENCES users(id)
        ON DELETE CASCADE
        ON UPDATE CASCADE,
    FOREIGN KEY (comment_id) REFERENCES comments(id)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

INSERT INTO users (id, nick_name, email, password, created_at, role)
VALUES
	("9bdafd65-66d9-4882-b61d-846c41aa9bda", "Elton Limeira", "elton@email.com", "$2a$12$NTrObGyH2quuPg.AZA66Eem8IifO2vSsD2IiWC.mn.dCI4R9jKn9a","2023-02-17T23:50:32.000Z", "ADMIN"),
	("bc4ce447-3f9d-4421-ad0d-9b7eaeb1581a", "CR7", "omilior@email.com", "$2a$12$0wlW.erEi6DFHV1DTKMxYOS4BnfLbhbVIb8oq8OkL2lJZ9eyIUmFa", "2023-02-17T23:50:32.000Z", "NORMAL"),
    ("5e5152c3-3b96-42f6-be5f-763715fdbf30", "Heisenberg", "walterwhite@email.com", "$2a$12$B9zbJbJlSIgjimJWbrz1Ke7R2kt0OqmGXVJmHb2dWs/8fDIXg1vnq", "2023-02-17T23:50:32.000Z", "NORMAL"),
    ("6b6773fb-14ef-4e05-81e0-71a6ae8b8c40", "Thomas Shelby", "thomas@email.com", "$2a$12$D/oiOiufSM8/pBtdK0rZiObGt1Q4NlTcomNjLLhnworuUB7Q9Iziy", "2023-02-17T23:50:32.000Z", "NORMAL");

INSERT INTO posts (id, creator_id, content, likes, dislikes, replies, created_at, updated_at)
VALUES
	("320555ad-fc3b-4ce8-995b-d6b109fe7411", "9bdafd65-66d9-4882-b61d-846c41aa9bda", "Gosto muito de Backend", 0, 0, 1, "2023-02-17T23:50:32.000Z", "2023-02-17T23:50:32.000Z"),
	("b2c7919d-2334-4f29-aaef-75e8f5718d87", "bc4ce447-3f9d-4421-ad0d-9b7eaeb1581a", "POO é muito bacana mas complicado!.", 0, 1, 1, "2023-02-17T23:50:32.000Z", "2023-02-17T23:50:32.000Z"),
	("86d69c57-d22d-4df0-a0b2-0db7c7349d08", "5e5152c3-3b96-42f6-be5f-763715fdbf30", "Saudades CSS", 3, 1, 1, "2023-02-17T23:50:32.000Z", "2023-02-17T23:50:32.000Z"),
	("9feaf731-0cc4-4dde-86bc-6b9a8c72a127", "6b6773fb-14ef-4e05-81e0-71a6ae8b8c40", "Quando voltamos pro Frontend ?", 1, 0, 1, "2023-02-17T23:50:32.000Z", "2023-02-17T23:50:32.000Z");

INSERT INTO likes_dislikes_post (user_id, post_id, like)
VALUES
	("9bdafd65-66d9-4882-b61d-846c41aa9bda", "b2c7919d-2334-4f29-aaef-75e8f5718d87", 0),
	("bc4ce447-3f9d-4421-ad0d-9b7eaeb1581a", "86d69c57-d22d-4df0-a0b2-0db7c7349d08", 0),
	("9bdafd65-66d9-4882-b61d-846c41aa9bda", "86d69c57-d22d-4df0-a0b2-0db7c7349d08", 1),
	("5e5152c3-3b96-42f6-be5f-763715fdbf30", "86d69c57-d22d-4df0-a0b2-0db7c7349d08", 1),
	("6b6773fb-14ef-4e05-81e0-71a6ae8b8c40", "86d69c57-d22d-4df0-a0b2-0db7c7349d08", 1),
	("5e5152c3-3b96-42f6-be5f-763715fdbf30", "9feaf731-0cc4-4dde-86bc-6b9a8c72a127", 1);

INSERT INTO comments (id, creator_id, post_id, content, likes, dislikes, created_at, updated_at)
VALUES
	("ce6382d4-9f35-466e-8303-65f505203f95", "bc4ce447-3f9d-4421-ad0d-9b7eaeb1581a", "320555ad-fc3b-4ce8-995b-d6b109fe7411", "Realmente!", 1, 0, "2023-02-17T23:50:32.000Z", "2023-02-17T23:50:32.000Z"),
	("5eddacf3-9d12-4cf4-ba8e-e421c5ea65e3", "9bdafd65-66d9-4882-b61d-846c41aa9bda", "b2c7919d-2334-4f29-aaef-75e8f5718d87", "Mete as caras!", 1, 0, "2023-02-17T23:50:32.000Z", "2023-02-17T23:50:32.000Z"),
	("084ee454-0a9f-4644-a52f-c6c89a99c6ae", "5e5152c3-3b96-42f6-be5f-763715fdbf30", "86d69c57-d22d-4df0-a0b2-0db7c7349d08", "Para com isso cara", 1, 0, "2023-02-17T23:50:32.000Z", "2023-02-17T23:50:32.000Z"),
	("52007331-caa2-4466-972f-49463d49313d", "6b6773fb-14ef-4e05-81e0-71a6ae8b8c40", "9feaf731-0cc4-4dde-86bc-6b9a8c72a127", "HAHAHAHAHA", 1, 0, "2023-02-17T23:50:32.000Z", "2023-02-17T23:50:32.000Z");

INSERT INTO likes_dislikes_post_comment (user_id, comment_id, like)
VALUES
	("9bdafd65-66d9-4882-b61d-846c41aa9bda", "ce6382d4-9f35-466e-8303-65f505203f95", 1),
	("bc4ce447-3f9d-4421-ad0d-9b7eaeb1581a", "5eddacf3-9d12-4cf4-ba8e-e421c5ea65e3", 1),
	("9bdafd65-66d9-4882-b61d-846c41aa9bda", "084ee454-0a9f-4644-a52f-c6c89a99c6ae", 1),
	("5e5152c3-3b96-42f6-be5f-763715fdbf30", "52007331-caa2-4466-972f-49463d49313d", 1);
	
SELECT * FROM users;
SELECT * FROM posts;
SELECT * FROM comments;
SELECT * FROM likes_dislikes_post;
SELECT * FROM likes_dislikes_post_comment;

DROP TABLE users;
DROP TABLE posts;
DROP TABLE likes_dislikes_post;
DROP TABLE likes_dislikes_post_comment;
DROP TABLE comments;

UPDATE posts
SET creator_id = "bc4ce447-3f9d-4421-ad0d-9b7eaeb1581a"
WHERE id = "b2c7919d-2334-4f29-aaef-75e8f5718d87";

SELECT * FROM posts
INNER JOIN comments
ON posts.id = comments.post_id;