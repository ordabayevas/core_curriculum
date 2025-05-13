CREATE TABLE bidders (
  id serial,
  name varchar(50),
  PRIMARY KEY(id)
);

COPY bidders FROM '/Users/ordabayeva/Documents/core_curriculum/LS_180/lesson_3/bidders.csv' WITH (FORMAT csv, HEADER);