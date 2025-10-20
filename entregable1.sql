
DROP TABLE IF EXISTS likes;
DROP TABLE IF EXISTS posts;
DROP TABLE IF EXISTS users;

-- --------------------------------------------------------
-- DDL: CREACIÓN DE TABLAS (Data Definition Language)
-- --------------------------------------------------------

-- 2. CREACIÓN DE LA TABLA 'users'
CREATE TABLE users (
    id INT PRIMARY KEY NOT NULL,
    username VARCHAR(50) NOT NULL UNIQUE,
    email VARCHAR(100) NOT NULL UNIQUE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- 3. CREACIÓN DE LA TABLA 'posts'
-- user_id es una clave foránea que enlaza a users.id
CREATE TABLE posts (
    id INT PRIMARY KEY NOT NULL,
    user_id INT NOT NULL,
    title VARCHAR(255) NOT NULL,
    content TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(id)
);

-- 4. CREACIÓN DE LA TABLA 'likes'
-- post_id y user_id son claves foráneas.
-- UNIQUE (post_id, user_id) asegura que un usuario solo pueda dar 1 "Me Gusta" por post.
CREATE TABLE likes (
    id INT PRIMARY KEY NOT NULL,
    post_id INT NOT NULL,
    user_id INT NOT NULL,
    liked_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    UNIQUE (post_id, user_id),
    FOREIGN KEY (post_id) REFERENCES posts(id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

-- --------------------------------------------------------
-- DML: INSERCIÓN DE DATOS DE EJEMPLO (Data Manipulation Language)
-- --------------------------------------------------------

-- 5. INSERCIÓN DE DATOS EN 'users'
INSERT INTO users (id, username, email) VALUES
(101, 'luna_dev', 'luna@example.com'),
(102, 'sol_coder', 'sol@example.com'),
(103, 'mar_designer', 'mar@example.com');

-- 6. INSERCIÓN DE DATOS EN 'posts'
INSERT INTO posts (id, user_id, title, content) VALUES
(1001, 101, 'Mi Primer Algoritmo', 'Hoy completé mi primer árbol binario de búsqueda. ¡Qué emoción!'),
(1002, 102, 'Reflexión de Diseño UX', 'La simplicidad es clave para la retención. ¡Menos es más!'),
(1003, 101, 'Actualización de Proyecto', 'El backend está casi listo para producción. ¡Ya casi llegamos!'),
(1004, 103, 'Inspiración de Color', 'Explorando paletas de colores cálidos para el nuevo sitio.'),
(1005, 102, 'Recomendaciones de Libros', 'Recomiendo "Clean Code" a todos los que inician. ¡Es una joya!');

-- 7. INSERCIÓN DE DATOS EN 'likes'
INSERT INTO likes (id, post_id, user_id) VALUES
(501, 1001, 102), -- Sol le dio like a post 1001
(502, 1001, 103), -- Mar le dio like a post 1001
(503, 1002, 101), -- Luna le dio like a post 1002
(504, 1003, 103), -- Mar le dio like a post 1003
(505, 1005, 101); -- Luna le dio like a post 1005
