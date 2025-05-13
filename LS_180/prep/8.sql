CREATE TABLE example(
	some_num int,
	some_text text CHECK (some_text > 0)
);

INSERT INTO example (some_num)
	VALUES (11);