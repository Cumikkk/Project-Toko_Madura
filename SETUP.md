# Panduan Setup Projek Toko Madura (XAMPP Lokal)

Panduan ini menjelaskan langkah-langkah setup dari awal untuk membersihkan template dan menjalankan projek Toko Madura menggunakan XAMPP di lingkungan lokal (Windows).

---

## 1. Pembersihan Template (Langkah Pertama)
Template ini awalnya berasal dari platform trading Forex, sehingga perlu dibersihkan agar fokus pada alur bisnis Toko Madura. Seluruh berkas tidak terpakai telah dipindahkan ke folder `sampah/` di root projek, meliputi:
- **Models & Factory Trading**: Berkas-berkas konektor MT5, verifikasi wajah/liveness, referral MLM, dan deposit/withdrawal.
- **Views & Modals**: Halaman client dan admin yang memuat grafik, tiket bantuan, formulir persetujuan broker, serta dokumen hukum pendaftaran nasabah.
- **Ajax Handlers**: Penanganan postdata & tabel data transaksi broker forex.
- **Berkas Pengujian**: Tes otomatisasi Playwright dan CekatAI.

*Catatan: Folder database (`database/`) dibiarkan tetap di tempatnya.*

---

## 2. Cara Menjalankan Projek di XAMPP (Tanpa Setup Ribet)
Anda bisa langsung mengakses projek menggunakan subdirectory localhost standar XAMPP.

### A. Aktifkan XAMPP
1. Buka **XAMPP Control Panel**.
2. Klik tombol **Start** pada modul **Apache** dan **MySQL**.

### B. Konfigurasi Environment (`config/.env`)
Buat file bernama `.env` di dalam folder `config/` dan isi dengan konfigurasi lokal berikut:
```env
# App info
APP_NAME="Toko Madura"
APP_DEV_PASS=
APP_MODE=development
APP_EMAILER=smtp

# URL Konfigurasi Lokal XAMPP Subfolder
CLIENT_URL="http://localhost/Project-Toko Madura/client"
ADMIN_URL="http://localhost/Project-Toko Madura/admin"
API_URL="http://localhost/Project-Toko Madura/api"

# Database Kredensial Default XAMPP
DB_HOST=127.0.0.1
DB_USER=root
DB_PASS=
DB_NAME=toko_madura
DB_PORT=3306
```

### C. Akses di Browser
Buka browser Anda dan akses tautan berikut:
- **Portal Master/Admin:** [http://localhost/Project-Toko Madura/admin/](http://localhost/Project-Toko Madura/admin/)
- **Portal Investor & Outlet:** [http://localhost/Project-Toko Madura/client/](http://localhost/Project-Toko Madura/client/)

---

## 3. Cara Menjalankan Menggunakan Domain Kustom (Virtual Hosts - Direkomendasikan)
Jika ingin menggunakan domain kustom agar URL terlihat lebih profesional dan rapi (misal: `admin.tokomadura.local`), ikuti langkah ini:

### A. Daftarkan Domain di Windows Hosts
1. Buka **Notepad** dengan **Run as Administrator**.
2. Buka berkas `C:\Windows\System32\drivers\etc\hosts`.
3. Tambahkan baris ini di paling bawah, lalu simpan:
   ```text
   127.0.0.1 admin.tokomadura.local
   127.0.0.1 client.tokomadura.local
   ```

### B. Atur Apache Virtual Hosts di XAMPP
1. Buka berkas `C:\xampp\apache\conf\extra\httpd-vhosts.conf`.
2. Tambahkan baris konfigurasi berikut di paling bawah, lalu simpan:
   ```apache
   # Virtual Host untuk Portal Master (Admin)
   <VirtualHost *:80>
       DocumentRoot "C:/xampp/htdocs/Project-Toko Madura/admin"
       ServerName admin.tokomadura.local
       <Directory "C:/xampp/htdocs/Project-Toko Madura/admin">
           AllowOverride All
           Require all granted
       </Directory>
   </VirtualHost>

   # Virtual Host untuk Portal Investor & Outlet (Client)
   <VirtualHost *:80>
       DocumentRoot "C:/xampp/htdocs/Project-Toko Madura/client"
       ServerName client.tokomadura.local
       <Directory "C:/xampp/htdocs/Project-Toko Madura/client">
           AllowOverride All
           Require all granted
       </Directory>
   </VirtualHost>
   ```

### C. Sesuaikan Kembali `.env`
Buka file `config/.env` dan ubah URL menjadi:
```env
CLIENT_URL="http://client.tokomadura.local"
ADMIN_URL="http://admin.tokomadura.local"
API_URL="http://api.tokomadura.local"
```

### D. Restart Apache
Klik **Stop** lalu **Start** kembali pada modul Apache di XAMPP Control Panel.
Akses website melalui:
- **Admin:** `http://admin.tokomadura.local`
- **Client:** `http://client.tokomadura.local`

---

## 4. Setup Database (Langkah Berikutnya)
Ketika Anda siap membangun database:
1. Buka phpMyAdmin (`http://localhost/phpmyadmin/`).
2. Buat database baru bernama `toko_madura`.
3. Impor file [database/toko_madura.sql](database/toko_madura.sql) ke dalam database tersebut.
4. Login menggunakan akun Master dummy default:
   - **Username:** `master`
   - **Password:** `123456`
