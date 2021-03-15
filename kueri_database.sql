-- Membuat Database dengan nama namadepan_latihanusk, ubah sesuai dengan nama kamu ya
CREATE DATABASE IF NOT EXISTS willi_latihanusk;

-- Membuat table usk_pengguna, untuk menyimpan data pengguna
CREATE TABLE IF NOT EXISTS usk_pengguna (
  id_pengguna INT AUTO_INCREMENT PRIMARY KEY,
  nama_pengguna VARCHAR(100) NOT NULL,
  username VARCHAR(100) NOT NULL,
  password VARCHAR(100) NOT NULL,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
  ON UPDATE CURRENT_TIMESTAMP
);

-- Membuat table usk_kategori untuk menyimpan data kategori barang
CREATE TABLE IF NOT EXISTS usk_kategori (
  id_kategori INT AUTO_INCREMENT PRIMARY KEY,
  nama_kategori VARCHAR(100) NOT NULL,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
  ON UPDATE CURRENT_TIMESTAMP
);

-- Membuat table usk_barang untuk menyimpan data barang
CREATE TABLE IF NOT EXISTS usk_barang(
  id_barang INT AUTO_INCREMENT PRIMARY KEY,
  nama_barang VARCHAR(100) NOT NULL,
  harga_barang INT NOT NULL,
  id_kategori INT,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
  ON UPDATE CURRENT_TIMESTAMP,
  CONSTRAINT fk_kategori
  FOREIGN KEY (id_kategori)
  	REFERENCES usk_kategori(id_kategori)
);

-- Menyimpan usk_transaksi untuk menyimpan data transaksi
CREATE TABLE IF NOT EXISTS usk_transaksi(
  id_transaksi INT AUTO_INCREMENT PRIMARY KEY,
  id_barang INT NOT NULL,
  qty INT NOT NULL,
  total_bayar INT NOT NULL,
  tgl_transaksi DATETIME,
  id_pengguna INT NOT NULL,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
  ON UPDATE CURRENT_TIMESTAMP,
  CONSTRAINT fk_barang
  FOREIGN KEY (id_barang)
  	REFERENCES usk_barang(id_barang),
  CONSTRAINT fk_pengguna
  FOREIGN KEY (id_pengguna)
  	REFERENCES usk_pengguna(id_pengguna)
);

-- Menginput data pengguna ke table usk_pengguna
INSERT INTO usk_pengguna(nama_pengguna, username, password)
VALUES
("willi hanugrah","willi","willi"),
("putra maulana","putra","putra")
;

-- Menginput data kategori ke table usk_kategori
INSERT INTO usk_kategori(nama_kategori)
VALUES
("kebutuhan rumah tangga"),
("makanan"),
("minuman")
;

-- Menginput data barang ke table usk_barang
INSERT INTO usk_barang(nama_barang, harga_barang, id_kategori)
VALUES
("pantene anti ketombe 130 ml","23000","1"),
("lifeboy body wash 900 ml","35000","1"),
("orep biskuit chocolate cream 133 gr","6900","2"),
("chitato sapi panggang 120 gr","22400","2"),
("bengbeng drink","2000","3"),
("ultra milk full cream 250 ml","6200","3")
;
