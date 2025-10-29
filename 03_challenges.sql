-- Challenge #1: Find 5 oldest users
SELECT * FROM users
ORDER BY created_at
LIMIT 5;

-- Challenge #2: Most active days
SELECT 
    DAYNAME(created_at) AS day,
    COUNT(*) AS total
FROM users
GROUP BY day
ORDER BY total DESC
LIMIT 2;

-- Challenge #3: Users without photos
SELECT username
FROM users
LEFT JOIN photos
    ON users.id = photos.user_id
WHERE photos.id IS NULL;

-- Challenge #4: Most liked photo
SELECT 
    username,
    photos.id,
    photos.image_url, 
    COUNT(*) AS total_likes
FROM photos
INNER JOIN likes ON likes.photo_id = photos.id
INNER JOIN users ON photos.user_id = users.id
GROUP BY photos.id
ORDER BY total_likes DESC
LIMIT 1;

-- Challenge #5: Average number of photos per user
SELECT 
    (SELECT COUNT(*) FROM photos) / 
    (SELECT COUNT(*) FROM users) AS avg_photos_per_user;

-- Challenge #6: Most used tags
SELECT 
    tags.tag_name, 
    COUNT(*) AS total
FROM photo_tags
JOIN tags ON photo_tags.tag_id = tags.id
GROUP BY tags.id
ORDER BY total DESC
LIMIT 5;

-- Challenge #7: Users who liked all photos
SELECT username, COUNT(*) AS num_likes
FROM users
INNER JOIN likes ON users.id = likes.user_id
GROUP BY likes.user_id
HAVING num_likes = (SELECT COUNT(*) FROM photos);
