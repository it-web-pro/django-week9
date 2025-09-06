-- -------------------------------------------------------------
-- TablePlus 6.6.8(632)
--
-- https://tableplus.com/
--
-- Database: kmitl
-- Generation Time: 2568-08-09 00:29:42.8040
-- -------------------------------------------------------------


INSERT INTO "public"."registration_faculty" ("name", "code") VALUES
('Faculty of Engineering', '01'),
('Faculty of Information Technology', '07'),
('Faculty of Science', '05');

INSERT INTO "public"."registration_professor" ("first_name", "last_name", "faculty_id") VALUES
('John', 'Smith', 1),
('Mary', 'Jane', 1),
('Peter', 'Jones', 2),
('Susan', 'Miller', 2),
('David', 'Wilson', 3),
('Linda', 'Garcia', 3);

INSERT INTO "public"."registration_course" ("course_code", "course_name", "credits") VALUES
('01006011', 'General Chemistry', 3),
('04006001', 'Calculus I', 3),
('01076001', 'Computer Programming', 3),
('01076113', 'Data Structures and Algorithms', 3),
('01076032', 'Digital Circuit and Logic Design', 3),
('06016301', 'Introduction to Information Technology', 3),
('06016311', 'Object-Oriented Programming', 3),
('04006002', 'Calculus II', 3),
('04026001', 'General Physics I', 3),
('01076114', 'Database Systems', 3);

INSERT INTO "public"."registration_section" ("section_number", "semester", "day_of_week", "start_time", "end_time", "capacity", "course_id", "professor_id") VALUES
('101', '1/2568', 'MON', '09:00:00', '12:00:00', 60, 1, 5),
('101', '1/2568', 'TUE', '09:00:00', '12:00:00', 70, 2, 6),
('102', '1/2568', 'THU', '13:00:00', '16:00:00', 70, 2, 6),
('101', '1/2568', 'WED', '13:00:00', '16:00:00', 50, 3, 1),
('101', '1/2568', 'FRI', '09:00:00', '12:00:00', 50, 5, 2),
('101', '1/2568', 'MON', '13:00:00', '16:00:00', 60, 9, 5),
('201', '1/2568', 'MON', '09:00:00', '12:00:00', 80, 6, 3),
('201', '1/2568', 'TUE', '13:00:00', '16:00:00', 80, 7, 4),
('202', '1/2568', 'FRI', '09:00:00', '12:00:00', 80, 7, 4),
('201', '1/2568', 'WED', '09:00:00', '12:00:00', 60, 4, 3),
('201', '1/2568', 'THU', '09:00:00', '12:00:00', 60, 10, 4);

INSERT INTO "public"."registration_student" ("student_id", "first_name", "last_name", "faculty_id") VALUES
('67010111', 'Somchai', 'Lertprasert', 1),
('67010112', 'Areeya', 'Charoensuk', 1),
('67070221', 'Anucha', 'Saetang', 2),
('67070222', 'Pornthip', 'Wongsuwan', 2),
('66010331', 'Preecha', 'Boonmee', 1),
('66010332', 'Sunee', 'Kittipong', 1),
('66070441', 'Thanakorn', 'Sae-lim', 2),
('66070442', 'Kanokwan', 'Promsorn', 2),
('65010551', 'Chatchai', 'Ratanaporn', 1),
('65070661', 'Siriporn', 'Jirawat', 2),
('67011001', 'Nattapong', 'Phromma', 1),
('67011002', 'Jiraporn', 'Sae-heng', 1),
('67072101', 'Apisit', 'Chaiyo', 2),
('67072102', 'Waraporn', 'Srisuk', 2),
('66050123', 'Wichai', 'Sangthong', 3),
('67050456', 'Kanjana', 'Saeli', 3),
('67011234', 'Ekkachai', 'Sribut', 1),
('67074321', 'Chutima', 'Boonruang', 2),
('66017890', 'Sakda', 'Ngamdee', 1),
('66079876', 'Wanna', 'Jaroen', 2);

INSERT INTO "public"."registration_student_enrolled_sections" ("student_id", "section_id") VALUES
(1, 2),
(1, 4),
(1, 6),
(2, 2),
(2, 5),
(2, 6),
(5, 1),
(5, 3),
(5, 5),
(6, 1),
(6, 3),
(6, 4),
(9, 1),
(9, 2),
(11, 1),
(11, 4),
(11, 6),
(12, 2),
(12, 5),
(12, 6),
(17, 3),
(17, 4),
(19, 1),
(19, 5),
(3, 7),
(3, 8),
(3, 10),
(4, 7),
(4, 9),
(4, 11),
(7, 7),
(7, 8),
(7, 11),
(8, 7),
(8, 9),
(8, 10),
(10, 7),
(10, 8),
(13, 7),
(13, 10),
(13, 11),
(14, 7),
(14, 9),
(18, 8),
(18, 10),
(18, 11),
(20, 7),
(20, 9),
(20, 11);

INSERT INTO "public"."registration_studentprofile" ("student_id", "email", "phone_number", "address") VALUES
(1, '67010111@kmitl.ac.th', '0811111111', '123 Rama IV Rd, Bangkok'),
(2, '67010112@kmitl.ac.th', '0812222222', '456 Sukhumvit Rd, Bangkok'),
(3, '67070221@kmitl.ac.th', '0813333333', '789 Silom Rd, Bangkok'),
(4, '67070222@kmitl.ac.th', '0814444444', '101 Phayathai Rd, Bangkok'),
(5, '66010331@kmitl.ac.th', '0815555555', '212 Ratchadaphisek Rd, Bangkok'),
(6, '66010332@kmitl.ac.th', '0816666666', '333 Ladprao Rd, Bangkok'),
(7, '66070441@kmitl.ac.th', '0817777777', '444 Phetkasem Rd, Bangkok'),
(8, '66070442@kmitl.ac.th', '0818888888', '555 Vibhavadi Rangsit Rd, Bangkok'),
(9, '65010551@kmitl.ac.th', '0819999999', '666 Ramkhamhaeng Rd, Bangkok'),
(10, '65070661@kmitl.ac.th', '0810000000', '777 Chaengwattana Rd, Bangkok'),
(11, '67011001@kmitl.ac.th', '0821111111', '111 Main St, Bangkok'),
(12, '67011002@kmitl.ac.th', '0822222222', '222 Park Ave, Bangkok'),
(13, '67072101@kmitl.ac.th', '0823333333', '333 Elm St, Bangkok'),
(14, '67072102@kmitl.ac.th', '0824444444', '444 Oak St, Bangkok'),
(15, '66050123@kmitl.ac.th', '0825555555', '555 Pine St, Bangkok'),
(16, '67050456@kmitl.ac.th', '0826666666', '666 Maple St, Bangkok'),
(17, '67011234@kmitl.ac.th', '0827777777', '777 Birch St, Bangkok'),
(18, '67074321@kmitl.ac.th', '0828888888', '888 Cedar St, Bangkok'),
(19, '66017890@kmitl.ac.th', '0829999999', '999 Walnut St, Bangkok'),
(20, '66079876@kmitl.ac.th', '0820000000', '100 Cherry St, Bangkok');

