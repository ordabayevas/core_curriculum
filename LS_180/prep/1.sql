CREATE TABLE students (
	id serial PRIMARY KEY,
	name text
);

CREATE TABLE classes (
	id serial PRIMARY KEY,
	name text,
	student_id int REFERENCES students (id)
);

INSERT INTO students (name) VALUES ('Johny'), ('Edd');
INSERT INTO classes (name, student_id) 
	VALUES ('Math', 1), ('Art', NULL), ('Geography', 1);