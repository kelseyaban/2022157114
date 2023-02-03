DROP TABLE IF EXISTS employees;

CREATE TABLE employees(
    employee_id serial PRIMARY KEY,
    name text NOT NULL,
    job text NOT NULL,
    salary int NOT NULL
);

INSERT INTO employees(name,job,salary)
VALUES ('Ana','Dentist', 6000),
       ('Javier','Teacher', 3000),
       ('Sara','Doctor', 6000),
       ('Alin','Nurse', 1000),
       ('Helen', 'Teacher', 3000);