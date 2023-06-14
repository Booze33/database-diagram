CREATE TABLE patients (
  id INT GENERATED ALWAYS AS IDENTITY,
  name VARCHAR(255) NOT NULL,
  date_of_birth DATE,
  PRIMARY KEY (id)
);

CREATE TABLE medical_histories (
  id INT GENERATED ALWAYS AS IDENTITY,
  admitted_at TIMESTAMP,
  patient_id INT REFERENCES patients(id) ON DELETE CASCADE,
  status VARCHAR(255) NOT NULL
);

CREATE TABLE invoices (
  id INT GENERATED ALWAYS AS IDENTITY,
  total_amount DECIMAL,
  generated_at TIMESTAMP NOT NULL,
  payed_at TIMESTAMP NOT NULL,
  medical_history_id INT REFERENCES medical_histories(id)
);

CREATE TABLE treatments (
  id INT REFERENCES medical_histories(id) ON DELETE CASCADE,
  type VARCHAR(255) NOT NULL,
  name VARCHAR(255) NOT NULL
)

CREATE TABLE invoice_item (
  id INT GENERATED ALWAYS AS IDENTITY,
  unit_price DECIMAL NOT NULL,
  quantity INT, total_price DECIMAL NOT NULL,
  invoice_id INT REFERENCES invoices(id) ON DELETE CASCADE,
  treatment_id INT REFERENCES treatments(id) ON DELETE CASCADE
);

CREATE TABLE medical_histories_has_treatments (
  medical_histories_id INT REFERENCES medical_histories(id),
  treatments_id INT REFERENCES treatments(id),
  PRIMARY KEY(medical_histories_id, treatments_id)
);
