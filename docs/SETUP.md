# Panduan Setup Lokal Template Projek PHP

Dokumen ini menjelaskan langkah-langkah inisialisasi awal dan konfigurasi agar template projek PHP Multi-Portal ini dapat berjalan di komputer lokal Anda menggunakan **XAMPP** atau **Laragon**.

---

## 1. Persiapan Awal (Untuk Semua Developer)
Setelah melakukan `git clone` atau `git pull` pertama kali, folder library pihak ketiga (`vendor/`) tidak akan ada karena di-ignore oleh Git. Anda harus memasangnya secara manual.

### Pasang Library PHP (Composer)
1. Buka terminal (CMD / PowerShell / Terminal Laragon).
2. Masuk ke direktori `config/` dalam projek:
   ```bash
   cd config
   ```
3. Jalankan perintah berikut untuk mengunduh dependencies secara aman:
   ```bash
   composer install --ignore-platform-reqs
   ```

### Salin Berkas Environment (`.env`)
1. Di dalam folder `config/`, buat salinan dari berkas `.example_env` dan ganti namanya menjadi `.env`.
2. Biarkan baris `CLIENT_URL`, `ADMIN_URL`, dan `API_URL` dalam keadaan mati (dikomentari dengan tanda `#`). Sistem secara otomatis akan mendeteksi domain server lokal Anda secara dinamis.
3. Sesuaikan setingan database default (biasanya user: `root` dan password kosong `""`):
   ```env
   DB_HOST=127.0.0.1
   DB_USER=root
   DB_PASS=""
   DB_NAME=toko_madura
   DB_PORT=3306
   ```

---

## 2. Cara Menjalankan Menggunakan XAMPP (Localhost Subfolder)
Cara ini paling cepat karena tidak membutuhkan hak akses administrator Windows untuk mengedit domain lokal.

1. Buka **XAMPP Control Panel**, lalu klik **Start** pada modul **Apache** dan **MySQL**.
2. Pastikan projek Anda diletakkan di dalam folder `C:\xampp\htdocs\Project_Toko_Madura`.
3. Buka browser dan akses halaman melalui tautan berikut:
   *   **Portal Admin (Master):** [http://localhost/Project_Toko_Madura/admin/](http://localhost/Project_Toko_Madura/admin/)
   *   **Portal Client:** [http://localhost/Project_Toko_Madura/client/](http://localhost/Project_Toko_Madura/client/)

---

## 3. Cara Menjalankan Menggunakan Laragon (Auto Virtual Hosts)
Laragon otomatis memetakan folder di dalam `C:\laragon\www\` menjadi domain lokal berakhiran `.test`.

1. Buka aplikasi **Laragon**, lalu klik **Start All** (modul Apache & MySQL akan berjalan).
2. Pastikan folder projek Anda diletakkan di dalam `C:\laragon\www\Project_Toko_Madura`.
3. Buka browser dan akses halaman melalui domain otomatis berikut:
   *   **Portal Admin (Master):** `http://project_toko_madura.test/admin/`
   *   **Portal Client:** `http://project_toko_madura.test/client/`

---

## 4. Inisialisasi Database Lokal
1. Buka menu database manager lokal Anda (misalnya **phpMyAdmin** di `http://localhost/phpmyadmin/`).
2. Buat database baru dengan nama sesuai nilai `DB_NAME` di file `.env` Anda (contoh: `toko_madura`).
3. Impor berkas SQL yang ada di direktori `database/` projek ke dalam database baru tersebut.
