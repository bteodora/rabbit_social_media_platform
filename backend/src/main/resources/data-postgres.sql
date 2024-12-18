/*insert into student (index_number, first_name, last_name) values ('5', 'Marko', 'Marković');
insert into student (index_number, first_name, last_name) values ('ra2-2014', 'Milan', 'Milanović');
insert into student (index_number, first_name, last_name) values ('ra3-2014', 'Ivana', 'Ivanović');
insert into student (index_number, first_name, last_name) values ('ra4-2014', 'Bojan', 'Bojanović');
insert into student (index_number, first_name, last_name) values ('ra5-2014', 'Pera', 'Perić');
insert into student (index_number, first_name, last_name) values ('ra6-2014', 'Zoran', 'Zoranović');
insert into student (index_number, first_name, last_name) values ('ra7-2014', 'Bojana', 'Bojanović');
insert into student (index_number, first_name, last_name) values ('ra8-2014', 'Milana', 'Milanović');
insert into student (index_number, first_name, last_name) values ('ra9-2014', 'Jovana', 'Jovanić');

insert into course (name) values ('Matematika');
insert into course (name) values ('Osnove programiranja');
insert into course (name) values ('Objektno programiranje');

insert into teacher (first_name, last_name, deleted) values ('Strahinja', 'Simić', false);
insert into teacher (first_name, last_name, deleted) values ('Marina', 'Antić', false);
insert into teacher (first_name, last_name, deleted) values ('Siniša', 'Branković', false);

insert into teaching (course_id, teacher_id) values (1, 1);
insert into teaching (course_id, teacher_id) values (1, 2);
insert into teaching (course_id, teacher_id) values (2, 2);
insert into teaching (course_id, teacher_id) values (3, 3);

insert into exam (student_id, course_id, date, grade) values (1, 1, '2016-02-01', 9);
insert into exam (student_id, course_id, date, grade) values (1, 2, '2016-04-19', 8);
insert into exam (student_id, course_id, date, grade) values (2, 1, '2016-02-01', 10);
insert into exam (student_id, course_id, date, grade) values (2, 2, '2016-04-19', 10);


-- Inserting data into Profile
INSERT INTO profile (email, username, password, name, surname, deleted, role, last_password_reset_date, address) VALUES
                                                                                                                     ('marko@example.com', 'marko', 'password123', 'Marko', 'Marković', false, 'User', CURRENT_TIMESTAMP, NULL),
                                                                                                                     ('milan@example.com', 'milan', 'password456', 'Milan', 'Milanović', false, 'User', CURRENT_TIMESTAMP, NULL),
                                                                                                                     ('ivana@example.com', 'ivana', 'password789', 'Ivana', 'Ivanović', false, 'Administrator', CURRENT_TIMESTAMP, NULL),
                                                                                                                     ('bojan@example.com', 'bojan', 'password101', 'Bojan', 'Bojanović', false, 'Administrator', CURRENT_TIMESTAMP, NULL),
                                                                                                                     ('jane@example.com', 'jane', 'password202', 'Jane', 'Doe', false, 'User', CURRENT_TIMESTAMP, NULL),
                                                                                                                     ('alex@example.com', 'alex', 'password303', 'Alex', 'Smith', false, 'User', CURRENT_TIMESTAMP, NULL),
                                                                                                                     ('lisa@example.com', 'lisa', 'password404', 'Lisa', 'Johnson', false, 'User', CURRENT_TIMESTAMP, NULL),
                                                                                                                     ('john@example.com', 'john', 'password505', 'John', 'Doe', false, 'User', CURRENT_TIMESTAMP, NULL),
                                                                                                                     ('anna@example.com', 'anna', 'password606', 'Anna', 'Taylor', false, 'Administrator', CURRENT_TIMESTAMP, NULL),
                                                                                                                     ('james@example.com', 'james', 'password707', 'James', 'Brown', false, 'User', CURRENT_TIMESTAMP, NULL);


-- Inserting data into Post
INSERT INTO post (description, picture, deleted, posted_time, profile_id) VALUES
                                                                                           ('This is my first post!', 'pic1.jpg', false, NOW(), 1),
                                                                                           ('Beautiful day at the park!', 'pic2.jpeg', false, NOW(), 1),
                                                                                           ('Loving the city lights.', 'pic3.jpg', false, NOW(), 2),
                                                                                           ('Foodie adventures!', 'pic4.jpg', false, NOW(), 3),
                                                                                           ('Just finished a run, feeling great!', 'pic5.jpg', false, NOW(), 4),
                                                                                           ('Sunset at the beach.', 'pic6.jpg', false, NOW(), 5),
                                                                                           ('Exploring the countryside.', 'pic7.jpg', false, NOW(), 6),
                                                                                           ('Weekend getaway in the mountains.', 'pic8.jpg', false, NOW(), 7),
                                                                                           ('Cozy evening by the fire.', 'pic9.jpg', false, NOW(), 8),
                                                                                           ('Delicious homemade dinner.', 'pic10.jpg', false, NOW(), 9);

-- Inserting data into Comment
INSERT INTO comment (text, profile_id, post_id, commented_time, deleted) VALUES
                                                                             ('Great post, Marko!', 2, 1, NOW(), false),
                                                                             ('I love this picture!', 3, 1, NOW(), false),
                                                                             ('Nice place!', 1, 2, NOW(), false),
                                                                             ('Looks delicious!', 1, 4, NOW(), false),
                                                                             ('What a beautiful sunset!', 4, 6, NOW(), false),
                                                                             ('Amazing view!', 5, 7, NOW(), false),
                                                                             ('This looks so relaxing.', 6, 8, NOW(), false),
                                                                             ('Yum! I need this recipe!', 7, 10, NOW(), false),
                                                                             ('So peaceful!', 8, 9, NOW(), false),
                                                                             ('What an adventure!', 9, 5, NOW(), false);

-- Inserting data into Likes (assumed the same as likedPosts)
INSERT INTO likes (profile_id, post_id) VALUES
                                            (1, 1),
                                            (1, 2),
                                            (2, 3),
                                            (3, 4),
                                            (1, 5),
                                            (2, 6),
                                            (3, 7),
                                            (4, 8),
                                            (5, 9),
                                            (6, 10);

-- Inserting data into Profile Following
INSERT INTO profile_following (profile_id, followed_profile_id) VALUES
                                                                    (1, 2),  -- Marko is following Milan
                                                                    (1, 3),  -- Marko is following Ivana
                                                                    (2, 3),  -- Milan is following Ivana
                                                                    (3, 4),  -- Ivana is following Bojan
                                                                    (1, 4),  -- Marko is following Bojan
                                                                    (4, 5),  -- Bojan is following Jane
                                                                    (5, 6),  -- Jane is following Alex
                                                                    (6, 7),  -- Alex is following Lisa
                                                                    (7, 8),  -- Lisa is following John
                                                                    (8, 9),  -- John is following Anna
                                                                    (9, 1),  -- Anna is following Marko
                                                                    (10, 3), -- James is following Ivana
                                                                    (3, 2),  -- Ivana is following Milan
                                                                    (5, 4);  -- Jane is following Bojan
*/