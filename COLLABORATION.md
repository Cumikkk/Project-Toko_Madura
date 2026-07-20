# Panduan Kolaborasi Projek: XAMPP vs Laragon (Toko Madura)

Panduan ini berisi aturan main dan tutorial langkah demi langkah agar kolaborasi pengembangan projek Toko Madura antara pengguna **XAMPP** dan **Laragon** berjalan lancar tanpa mengalami error sinkronisasi.

---

## 1. Aturan Emas File `.env` (Environment)
*   **Aturan:** File `.env` **TIDAK BOLEH** di-commit atau di-push ke Git. File ini harus tetap berada di `.gitignore`.
*   **Kenapa?** Karena port, domain, dan kredensial database lokal XAMPP vs Laragon bisa berbeda.
*   **Cara Setup Bagi Anggota Baru:**
    1. Copy file `config/.example_env` menjadi `config/.env`.
    2. Jangan isi baris `CLIENT_URL`, `ADMIN_URL`, dan `API_URL` (biarkan dikomentari dengan tanda `#`). Sistem secara otomatis akan mendeteksi domain server lokal Anda (baik XAMPP maupun Laragon).

---

## 2. Sinkronisasi Library (Composer)
Setiap kali ada anggota tim yang menambahkan library baru (mengupdate file `composer.json` atau `composer.lock`), anggota tim yang melakukan *pull* akan mengalami error *Class Not Found*.

*   **Solusi:**
    Setiap kali setelah melakukan `git pull`, selalu jalankan perintah berikut di terminal folder `config/`:
    ```bash
    cd config
    composer install --ignore-platform-reqs
    ```
    *Catatan: Parameter `--ignore-platform-reqs` wajib ditambahkan agar Composer tidak error jika versi PHP atau ekstensi (seperti `sodium`) di komputer Anda sedikit berbeda.*

---

## 3. Sinkronisasi Struktur Database (SQL)
Jika Anda menambah tabel baru, mengubah kolom, atau menambah kolom baru di database lokal Anda:
1.  **Ekspor Struktur Database Terbaru:**
    Ekspor database Anda melalui phpMyAdmin menjadi file SQL, lalu timpa file SQL yang ada di folder [database/toko_madura.sql](database/toko_madura.sql).
2.  **Commit & Push Berkas SQL Tersebut:**
    Kirim file SQL terbaru tersebut ke Git agar teman Anda dapat mengimpor ulang database di komputernya.
3.  **Teman Anda Mengimpor Ulang:**
    Setelah melakukan `git pull`, teman Anda harus mengimpor file [database/toko_madura.sql](database/toko_madura.sql) terbaru tersebut ke phpMyAdmin lokalnya.

---

## 4. Alur Kerja Git (Workflows)
Agar tidak terjadi konflik saat mengedit file yang sama (*merge conflict*):
1.  **Gunakan Branch Berbeda:**
    Jangan bekerja langsung di branch `main` atau `master`. Buatlah branch baru untuk setiap fitur yang dikerjakan:
    *   Contoh: `git checkout -b feature/login-master`
2.  **Lakukan Pull Sebelum Bekerja:**
    Sebelum mulai menulis kode, biasakan selalu melakukan pull untuk mendapatkan kode terbaru dari repositori utama:
    ```bash
    git pull origin main
    ```
3.  **Lakukan Push dan Merge via Pull Request:**
    Setelah fitur selesai dibuat di branch Anda, push branch tersebut lalu lakukan merge ke branch `main` setelah disetujui bersama.
