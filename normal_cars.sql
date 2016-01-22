-- Generate tables needed to normalize schema, include any primary and foreign key
-- constraints. Logical renaming of columns is allowed.

-- Normalization refers to a series of steps used to eliminate redundancy and reduce the
-- chances of data inconsistency in a database's schema.
DROP TABLE IF EXISTS normalized_make_code;
CREATE TABLE IF NOT EXISTS normalized_make_code
(
  "id" serial NOT NULL,
  PRIMARY KEY( "id" ),
  "MakeCode_id" varchar(125) NOT NULL
);

INSERT INTO normalized_make_code ( "MakeCode_id" )
  SELECT DISTINCT make_code FROM car_models ORDER BY make_code ASC;
-- count: 71

DROP TABLE IF EXISTS normalized_make_title;
CREATE TABLE IF NOT EXISTS normalized_make_title
(
  "id" serial NOT NULL,
  PRIMARY KEY( "id" ),
  "MakeTitle_id" varchar(125) NOT NULL
);

INSERT INTO normalized_make_title ( "MakeTitle_id" )
  SELECT DISTINCT make_title FROM car_models ORDER BY make_title ASC;
-- count: 71

DROP TABLE IF EXISTS normalized_model_code;
CREATE TABLE IF NOT EXISTS normalized_model_code
(
  "id" serial NOT NULL,
  PRIMARY KEY( "id" ),
  "ModelCode_id" varchar(125) NOT NULL
);

INSERT INTO normalized_model_code ( "ModelCode_id" )
  SELECT DISTINCT model_code FROM car_models ORDER BY model_code ASC;
-- count: 1309

DROP TABLE IF EXISTS normalized_model_title;
CREATE TABLE IF NOT EXISTS normalized_model_title
(
  "id" serial NOT NULL,
  PRIMARY KEY( "id" ),
  "ModelTitle_id" varchar(125) NOT NULL
);

INSERT INTO normalized_model_title ( "ModelTitle_id" )
  SELECT DISTINCT model_title FROM car_models ORDER BY model_title ASC;
-- count: 2540

DROP TABLE IF EXISTS normalized_year;
CREATE TABLE IF NOT EXISTS normalized_year
(
  "year_id" serial PRIMARY KEY NOT NULL,
  "Year_id" varchar(125) NOT NULL
);

INSERT INTO normalized_year ( "Year_id" )
  SELECT DISTINCT year FROM car_models ORDER BY year ASC;
-- count: 51

SELECT make_title FROM car_models;

SELECT model_title FROM car_models WHERE make_code = "VOLKS";

SELECT make_code, model_code, model_title, year FROM make_code = "LAM";

SELECT * FROM car_models WHERE year BETWEEN 2010 and 2015;


-- SELECT name, year FROM students s (<=== this "s" is an alias)
--   WHERE [table name].year = 2014;