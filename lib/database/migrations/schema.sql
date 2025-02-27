CREATE TABLE IF NOT EXISTS favourites (
  area VARCHAR(10),
  smallholding VARCHAR(10),
  name VARCHAR(50) NOT NULL UNIQUE,

  PRIMARY KEY (area, smallholding)
);