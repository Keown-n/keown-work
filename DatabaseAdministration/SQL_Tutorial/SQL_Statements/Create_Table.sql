
/* Table 1 - Pokemon*/
CREATE TABLE production.pokemon(
	id INT IDENTITY(1,1) PRIMARY KEY,
	name VARCHAR(225) NOT NULL,
	phone VARCHAR(25),
	email VARCHAR(255),
);
/* Table 2 - Trainer (FK)*/

CREATE TABLE production.trainer(
	id INT IDENTITY(1,1) PRIMARY KEY,
	name VARCHAR(50) NOT NULL,
	surname VARCHAR(50) NOT NULL,
	email VARCHAR(255) NOT NULL UNIQUE,
	phone VARCHAR(25) NOT NULL,
	poke_id INT NOT NULL,
	FOREIGN KEY (poke_id)
		REFERENCES production.pokemon (id)
		ON DELETE CASCADE ON UPDATE CASCADE
);