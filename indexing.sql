DROP USER IF EXISTS indexed_cars_user;

CREATE USER indexed_cars_user;

DROP DATABASE IF EXISTS indexed_cars;

CREATE DATABASE indexed_cars OWNER indexed_cars_user;

-- DROP TABLE IF EXISTS car_models;

\c indexed_cars;

\i './scripts/car_models.sql'

\i './scripts/car_model_data.sql'
\i './scripts/car_model_data.sql'
\i './scripts/car_model_data.sql'
\i './scripts/car_model_data.sql'
\i './scripts/car_model_data.sql'
\i './scripts/car_model_data.sql'
\i './scripts/car_model_data.sql'
\i './scripts/car_model_data.sql'
\i './scripts/car_model_data.sql'
\i './scripts/car_model_data.sql'

\timing

CREATE INDEX make_code_index ON car_models(make_code);
CREATE INDEX model_code_index ON car_models(model_code);
CREATE INDEX year ON car_models(year);


SELECT DISTINCT make_title FROM car_models
  WHERE make_code = 'LAM';

-- 28.048ms
-- after indexing: 1.395ms

SELECT DISTINCT model_title FROM car_models
  WHERE make_code = 'NISSAN'
    AND model_code = 'GT-R';

-- 21.687ms
-- after indexing both: 1.560ms

SELECT make_code, model_code, model_title, year
  FROM car_models
  WHERE make_code = 'LAM';

-- 23.314ms
-- after indexing 1.790ms

SELECT * FROM car_models
  WHERE year BETWEEN 2010 AND 2015;

--70.235ms
-- after indexing 57.001ms

SELECT * FROM car_models
  WHERE year = 2010;

-- 38.418ms
-- after indexing 13.429ms