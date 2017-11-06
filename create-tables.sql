CREATE TABLE challenges(
  id SERIAL PRIMARY KEY,
  type VARCHAR(50) NOT NULL,
  question TEXT UNIQUE NOT NULL,
  answer TEXT NOT NULL
);

CREATE TABLE users(
  id SERIAL PRIMARY KEY,
  username VARCHAR(50) UNIQUE NOT NULL,
  score INT
);

INSERT INTO challenges(type, question, answer) VALUES('article','What is the article of Bier?','Das Bier');
INSERT INTO challenges(type, question, answer) VALUES('article','What is the article of Buch?','Das Buch');
INSERT INTO challenges(type, question, answer) VALUES('article','What is the article of Frau?','Die Frau');
INSERT INTO challenges(type, question, answer) VALUES('article','What is the article of Wasser?','Das Wasser');
INSERT INTO challenges(type, question, answer) VALUES('plural','What is the plural of Der Man?','Die Männer');
INSERT INTO challenges(type, question, answer) VALUES('plural','What is the plural of Das Buch?','Die Bücher');
INSERT INTO challenges(type, question, answer) VALUES('plural','What is the plural of Die Frau?','Die Frauen');
INSERT INTO challenges(type, question, answer) VALUES('plural','What is the plural of Der Computer?','Die Computer');
INSERT INTO challenges(type, question, answer) VALUES('word','How do you say man?','Der Man');
INSERT INTO challenges(type, question, answer) VALUES('word','How do you say woman?','Die Frau');
INSERT INTO challenges(type, question, answer) VALUES('word','How do you say water?','Das Wasser');
INSERT INTO challenges(type, question, answer) VALUES('word','How do you say computer?','Der Computer');

