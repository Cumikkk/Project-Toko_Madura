# Panduan Kolaborasi Tim & Standardisasi Git

Dokumen ini berisi panduan kolaborasi tim saat mengembangkan projek berbasis template PHP ini secara bersama-sama menggunakan Git, khususnya dalam menangani perbedaan lingkungan lokal (seperti XAMPP vs Laragon).

---

## 1. Menjaga Keamanan Berkas Lokal (`.env`)
Berkas `.env` digunakan untuk menyimpan kredensial database lokal, mode aplikasi, dan informasi konfigurasi yang unik di tiap komputer developer.
*   **Aturan Utama:** File `config/.env` **tidak boleh di-push** ke GitHub dan harus selalu terdaftar di `.gitignore`.
*   **Penyelarasan URL Lokal:** Baris `CLIENT_URL`, `ADMIN_URL`, dan `API_URL` di file `.env` wajib dimatikan (diberi tanda `#`). Ini memungkinkan deteksi dinamis otomatis bekerja sehingga projek Anda bisa dibuka di komputer siapa pun menggunakan alamat lokal masing-masing secara instan.

---

## 2. Mengatasi Error Class Not Found (`vendor/`)
Karena folder dependencies `vendor/` diabaikan oleh Git untuk menghemat ruang penyimpanan, setiap kali Anda melakukan `git pull` dan ada penambahan pustaka/library baru, Anda akan mendapatkan fatal error.

*   **Solusi:**
    Jalankan perintah ini di dalam folder `config/` setiap kali Anda memperbarui kode dari repositori:
    ```bash
    composer install --ignore-platform-reqs
    ```
    *Catatan: `--ignore-platform-reqs` memastikan instalasi tidak gagal meskipun versi ekstensi PHP lokal Anda dan rekan Anda sedikit berbeda.*

---

## 3. Sinkronisasi Database (Skema SQL)
Karena sistem database MySQL berjalan di lokal masing-masing (XAMPP/Laragon):
1.  **Gunakan File Dump Bersama:**
    Letakkan skema database SQL terbaru di dalam folder `database/` (contoh: `database/toko_madura.sql`).
2.  **Perbarui File SQL Saat Ada Perubahan Tabel:**
    Jika Anda membuat tabel baru, kolom baru, atau mengubah tipe data, ekspor database lokal Anda dan timpa file SQL di folder `database/`, lalu lakukan commit & push.
3.  **Rekan Tim Mengimpor Ulang:**
    Ketika rekan tim melakukan pull dan melihat file SQL berubah, mereka harus mengimpor kembali file SQL tersebut ke phpMyAdmin lokalnya masing-masing.

---

## 4. Alur Git & Branching Strategy
Hindari konflik pengeditan kode (*merge conflict*) dengan aturan sederhana berikut:
*   **Jangan Kerja di Branch Utama (`main`/`master`):** Selalu buat branch baru untuk setiap fitur yang dikerjakan (contoh: `feature/tambah-investor`, `feature/login-page`).
*   **Lakukan Pull Sebelum Bekerja:** Sebelum mulai menulis kode hari ini, lakukan `git pull origin main` agar basis kode lokal Anda selalu yang terbaru.
*   **Gunakan Pull Request (PR):** Push branch fitur Anda ke GitHub, lalu buat Pull Request agar rekan tim dapat mereview kode Anda sebelum disatukan ke branch utama.
