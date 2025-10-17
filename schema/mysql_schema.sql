
-- MySQL DDL for Vertical Film Cost Tracking (normalized schema)
CREATE DATABASE IF NOT EXISTS vertical_films;
USE vertical_films;

CREATE TABLE IF NOT EXISTS clients (
  client_id INT PRIMARY KEY,
  client_name VARCHAR(200),
  contact_email VARCHAR(200),
  initial_payment DECIMAL(12,2)
);

CREATE TABLE IF NOT EXISTS films (
  film_id INT PRIMARY KEY,
  client_id INT,
  film_title VARCHAR(200),
  total_budget DECIMAL(12,2),
  start_date DATE,
  end_date DATE,
  FOREIGN KEY (client_id) REFERENCES clients(client_id)
);

CREATE TABLE IF NOT EXISTS people (
  person_id INT PRIMARY KEY,
  name VARCHAR(200),
  sag_status VARCHAR(50),
  base_rate_type VARCHAR(20),
  base_rate_amount DECIMAL(12,2)
);

CREATE TABLE IF NOT EXISTS roles (
  role_id INT PRIMARY KEY,
  role_name VARCHAR(100),
  department VARCHAR(50)
);

CREATE TABLE IF NOT EXISTS film_personnel (
  film_personnel_id INT PRIMARY KEY,
  film_id INT,
  person_id INT,
  role_id INT,
  days_worked INT,
  FOREIGN KEY (film_id) REFERENCES films(film_id),
  FOREIGN KEY (person_id) REFERENCES people(person_id),
  FOREIGN KEY (role_id) REFERENCES roles(role_id)
);

CREATE TABLE IF NOT EXISTS expenses (
  expense_id INT PRIMARY KEY,
  film_id INT,
  film_personnel_id INT,
  category VARCHAR(100),
  description VARCHAR(255),
  phase VARCHAR(50),
  cost DECIMAL(12,2),
  date_paid DATE,
  FOREIGN KEY (film_id) REFERENCES films(film_id),
  FOREIGN KEY (film_personnel_id) REFERENCES film_personnel(film_personnel_id)
);
