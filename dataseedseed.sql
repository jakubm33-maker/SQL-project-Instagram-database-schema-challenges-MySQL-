USE ig_clone;

-- USERS (5)
INSERT INTO users (username, created_at) VALUES
('alice','2016-06-24 09:36:30'),
('bob','2016-08-07 16:25:48'),
('carol','2017-01-19 01:34:14'),
('dave','2017-02-06 22:05:43'),
('eve','2017-04-18 02:32:43');

-- PHOTOS (4)
INSERT INTO photos (image_url, user_id, created_at) VALUES
('img/p1.jpg',1,'2017-05-01 10:00:00'),
('img/p2.jpg',2,'2017-05-02 11:00:00'),
('img/p3.jpg',1,'2017-05-03 12:00:00'),
('img/p4.jpg',3,'2017-05-04 13:00:00');

-- COMMENTS
INSERT INTO comments (comment_text, photo_id, user_id, created_at) VALUES
('nice!',1,2,'2017-05-01 10:05:00'),
('wow',1,3,'2017-05-01 10:06:00'),
('cool',3,4,'2017-05-03 12:05:00');

-- LIKES (bob lubi wszystkie zdjęcia)
INSERT INTO likes (user_id, photo_id, created_at) VALUES
(2,1,'2017-05-01 10:07:00'),
(2,2,'2017-05-02 11:07:00'),
(2,3,'2017-05-03 12:07:00'),
(2,4,'2017-05-04 13:07:00'),
(1,2,'2017-05-02 11:08:00'),
(3,2,'2017-05-02 11:09:00'),
(4,1,'2017-05-01 10:08:00'),
(5,4,'2017-05-04 13:08:00');

-- FOLLOWS
INSERT INTO follows (follower_id, followee_id, created_at) VALUES
(1,2,'2017-05-01 09:00:00'),
(2,1,'2017-05-01 09:01:00'),
(1,3,'2017-05-01 09:02:00');

-- TAGS
INSERT INTO tags (tag_name, created_at) VALUES
('sunset','2017-05-01 09:10:00'),
('food','2017-05-01 09:10:05'),
('travel','2017-05-01 09:10:10');

-- PHOTO_TAGS
INSERT INTO photo_tags (photo_id, tag_id) VALUES
(1,1),(1,3),
(2,2),
(3,1),(3,2),
(4,3);
