CREATE DATABASE IF NOT EXISTS toko_madura;
USE toko_madura;

CREATE TABLE users (
    id INT(10) UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    nama VARCHAR(100) NOT NULL,
    username VARCHAR(50) NOT NULL UNIQUE,
    email VARCHAR(100) DEFAULT NULL UNIQUE,
    password VARCHAR(255) NOT NULL,
    foto_profil VARCHAR(255) DEFAULT NULL,
    no_hp VARCHAR(20) DEFAULT NULL,
    role ENUM('master', 'investor', 'outlet') NOT NULL,
    status ENUM('aktif', 'nonaktif') DEFAULT 'aktif',
    otp_code VARCHAR(6) DEFAULT NULL,
    otp_expires_at DATETIME DEFAULT NULL,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE investor_detail (
    id_investor INT(10) UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    id_user INT(10) UNSIGNED NOT NULL UNIQUE,
    id_master INT(10) UNSIGNED NOT NULL,
    alamat TEXT DEFAULT NULL,
    persen_bagian_investor DECIMAL(5,2) NOT NULL DEFAULT 50.00,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (id_user) REFERENCES users(id) ON DELETE CASCADE,
    FOREIGN KEY (id_master) REFERENCES users(id) ON DELETE RESTRICT
);

CREATE TABLE outlet (
    id_outlet INT(10) UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    id_user INT(10) UNSIGNED NOT NULL UNIQUE,
    id_investor INT(10) UNSIGNED NOT NULL,
    kode_outlet VARCHAR(20) NOT NULL UNIQUE,
    nama_outlet VARCHAR(100) NOT NULL,
    alamat TEXT DEFAULT NULL,
    status ENUM('aktif', 'tutup') DEFAULT 'aktif',
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (id_user) REFERENCES users(id) ON DELETE CASCADE,
    FOREIGN KEY (id_investor) REFERENCES investor_detail(id_investor) ON DELETE RESTRICT
);

CREATE TABLE laporan_omzet (
    id_laporan INT(10) UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    id_outlet INT(10) UNSIGNED NOT NULL,
    periode_laporan DATE NOT NULL,
    omzet DECIMAL(15,2) NOT NULL DEFAULT 0.00,
    presentase_potongan DECIMAL(5,2) NOT NULL,
    nominal_potongan DECIMAL(15,2) NOT NULL,
    waktu_input DATETIME DEFAULT CURRENT_TIMESTAMP,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (id_outlet) REFERENCES outlet(id_outlet) ON DELETE RESTRICT,
    INDEX idx_laporan_periode (periode_laporan)
);

CREATE TABLE rekap_bagi_hasil (
    id_rekap INT(10) UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    id_investor INT(10) UNSIGNED NOT NULL,
    periode_rekap VARCHAR(20) NOT NULL,
    akumulasi_omzet DECIMAL(15,2) NOT NULL DEFAULT 0.00,
    akumulasi_potongan DECIMAL(15,2) NOT NULL DEFAULT 0.00,
    hak_investor DECIMAL(15,2) NOT NULL DEFAULT 0.00,
    hak_outlet DECIMAL(15,2) NOT NULL DEFAULT 0.00,
    status_pembayaran ENUM('pending', 'lunas') DEFAULT 'pending',
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (id_investor) REFERENCES investor_detail(id_investor) ON DELETE RESTRICT,
    INDEX idx_rekap_periode (periode_rekap)
);

CREATE TABLE pengaturan_sistem (
    id_pengaturan INT(10) UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    nama_pengaturan VARCHAR(50) NOT NULL UNIQUE,
    nilai DECIMAL(5,2) NOT NULL,
    updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);