# Dokumentasi Template Projek PHP Multi-Portal

Selamat datang di repositori template projek PHP Multi-Portal. Template ini dirancang untuk mempercepat pembuatan aplikasi web terpadu yang memisahkan akses pengguna publik/member dengan panel admin pusat secara mandiri.

---

## 💻 Fitur Utama Template
*   **Struktur Multi-Portal**: Memisahkan aplikasi admin (`admin/`) dan aplikasi client (`client/`) ke folder mandiri.
*   **Routing Dinamis**: URL otomatis dialihkan oleh `.htaccess` ke file pemroses utama (`home.php` / `index.php`) untuk me-require dokumen view secara otomatis tanpa library routing yang berat.
*   **Autentikasi Mandiri**: Sesi login terpisah antara admin (`AdminAuth`) dan client (`UserAuth`).
*   **Sistem Log Terintegrasi**: Pencatatan error sistem runtime PHP secara otomatis ke file log lokal.
*   **Keamanan Ekstensi**: Penanganan password, token API, dan data koneksi terpusat melalui file `.env`.

---

## 📁 Struktur Direktori Projek
*   [**`admin/`**](file:///c:/Data/Aplikasi/xampp/htdocs/Project_Toko_Madura/admin/) : Portal khusus manajemen administrator (Master/System Admin).
*   [**`client/`**](file:///c:/Data/Aplikasi/xampp/htdocs/Project_Toko_Madura/client/) : Portal khusus untuk member, investor, atau outlet (Customer Facing).
*   [**`config/`**](file:///c:/Data/Aplikasi/xampp/htdocs/Project_Toko_Madura/config/) : Pusat konfigurasi inti, model data (MVC), helper, library, dan log error.
*   [**`docs/`**](file:///c:/Data/Aplikasi/xampp/htdocs/Project_Toko_Madura/docs/) : Berkas panduan operasional dan petunjuk penggunaan template projek ini.
*   [**`database/`**](file:///c:/Data/Aplikasi/xampp/htdocs/Project_Toko_Madura/database/) : Berkas skema SQL untuk inisialisasi awal database lokal.
*   [**`sampah/`**](file:///c:/Data/Aplikasi/xampp/htdocs/Project_Toko_Madura/sampah/) : Folder cadangan tempat pembersihan berkas fitur tidak terpakai.

---

## 📖 Buku Panduan (Index Dokumentasi)
Silakan buka berkas-berkas berikut di dalam folder `docs/` untuk petunjuk teknis pengembangan:

1.  👉 [**`SETUP.md` (Panduan Instalasi Lokal)**](file:///c:/Data/Aplikasi/xampp/htdocs/Project_Toko_Madura/docs/SETUP.md): Cara menyalakan projek menggunakan XAMPP (localhost subfolder) dan Laragon (auto virtual hosts).
2.  👉 [**`USAGE.md` (Arsitektur & Pengembangan)**](file:///c:/Data/Aplikasi/xampp/htdocs/Project_Toko_Madura/docs/USAGE.md): Cara kerja routing URL, penulisan Model baru, pengiriman request form/AJAX, dan validasi sesi autentikasi.
3.  👉 [**`COLLABORATION.md` (Panduan Kolaborasi Tim)**](file:///c:/Data/Aplikasi/xampp/htdocs/Project_Toko_Madura/docs/COLLABORATION.md): Aturan main kolaborasi Git, penanganan berkas `.env` lokal, dan sinkronisasi database SQL.
