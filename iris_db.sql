
CREATE TABLE iris (
    sepal_length FLOAT,
    sepal_width  FLOAT,
    petal_length FLOAT,
    petal_width  FLOAT,
    species VARCHAR(50)
);


-- PSQL Command used to import

\copy iris(sepal_length, sepal_width, petal_length, petal_width, species) FROM '<path>/iris.csv' DELIMITER ',' CSV HEADER;