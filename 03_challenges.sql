USE ig_clone;

-- 1) Five oldest users (najstarsi wg created_at)
SELECT *
FROM users
ORDER BY created_at
LIMIT 5;

-- 2) Dwa najczęstsze dni rejestracji
SELECT DAYNAME(created_at) AS day, COUNT(*) AS total
FROM users
GROUP BY day
ORDER BY total DESC
LIMIT 2;

-- 3) Użytkownicy bez żadnego zdjęcia
SELECT u.username
FROM users u
LEFT JOIN photos p ON u.id = p.user_id
WHERE p.id IS NULL;

-- 4) Najbardziej lajkowane zdjęcie (autor, id, url, liczba lajków)
SELECT u.username, p.id, p.image_url, COUNT(*) AS total
FROM photos p
JOIN likes  l ON l.photo_id = p.id
JOIN users  u ON p.user_id = u.id
GROUP BY p.id
ORDER BY total DESC
LIMIT 1;

-- 5) Średnia liczba zdjęć na użytkownika (agregacje z podzapytań)
SELECT
  (SELECT COUNT(*) FROM photos) / (SELECT COUNT(*) FROM users) AS avg_photos_per_user;

-- 6) TOP 5 tagów
SELECT t.tag_name, COUNT(*) AS total
FROM photo_tags pt
JOIN tags t ON pt.tag_id = t.id
GROUP BY t.id
ORDER BY total DESC
LIMIT 5;

-- 7) Użytkownicy, którzy polubili wszystkie zdjęcia
-- (działa dzięki PK (user_id, photo_id) w likes -> każdy like unikalny)
SELECT u.username, COUNT(*) AS num_likes
FROM users u
JOIN likes l ON u.id = l.user_id
GROUP BY l.user_id
HAVING num_likes = (SELECT COUNT(*) FROM photos);
