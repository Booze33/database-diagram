# database-diagram

CREATE TABLE treatments (
  id INT REFERENCES medical_histories(id) ON DELETE CASCADE,
  type VARCHAR(255) NOT NULL,
  name VARCHAR(255) NOT NULL
)

CREATE TABLE invoice_item (
  id INT GENERATED ALWAYS AS IDENTITY,
  unit_price DECIMAL NOT NULL,
  quantity INT,
  total_price DECIMAL NOT NULL,
  invoice_id INT REFERENCES invoices(id) ON DELETE CASCADE,
  treatment_id INT REFERENCES treatments(id) ON DELETE CASCADE
);