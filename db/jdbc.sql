create schema school;
use schema school; -- or set

CREATE TABLE Lesson
(
    id int PRIMARY KEY AUTO_INCREMENT,
    name varchar(100) NOT NULL,
    code varchar(100) NOT NULL
);

CREATE TABLE Student
(
    id int PRIMARY KEY AUTO_INCREMENT,
    FIO varchar(100) NOT NULL,
    ball integer NOT NULL,
    lesson_id int NOT NULL,
    comment varchar(300) NULL,
    FOREIGN KEY(lesson_id) REFERENCES Lesson(id)
);

--alter table Student add foreign key (lesson_id) references Lesson(id);

Insert into Lesson values(null,'math','#ma');
Insert into Lesson values(null,'history','#hi');
Insert into Lesson values(null,'phisics','#ph');
Insert into Lesson values(null,'liter','#li');

Select * from Lesson;

Insert into Student values(null,'Sidorov AN', 'qwe', 1, 4);
Insert into Student values(null,'Sidorov AN', 'qwe', 2, 5);
Insert into Student values(null,'Sidorov AN', 'qwe', 3, 4);

Insert into Student values(null,'Ivanov SS', 'asd', 2, 3);
Insert into Student values(null,'Ivanov SS', 'asd', 3, 4);
Insert into Student values(null,'Ivanov SS', 'asd', 4, 3);

Insert into Student values(null,'Petrov SS', 'zxc', 1, 5);
Insert into Student values(null,'Petrov SS', 'zxc', 2, 4);
Insert into Student values(null,'Petrov SS', 'zxc', 3, 5);
Insert into Student values(null,'Petrov SS', 'zxc', 4, 2);

Select Student.*, Lesson.name as `Lesson Name`
From Student, Lesson
Where Student.lesson = Lesson.id;