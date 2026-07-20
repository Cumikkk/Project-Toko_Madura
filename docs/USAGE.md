# Panduan Teknis & Penggunaan Arsitektur Template Projek

Dokumen ini menjelaskan alur pemrograman, cara kerja perutean (routing), penanganan form AJAX, dan tata cara menulis kode model/controller pada arsitektur template PHP ini.

---

## 1. Mekanisme Routing Halaman (Dinamis)
Template ini memisahkan area tamu (*guest/login*) dengan area terautentikasi (*dashboard*) secara teratur.

### Halaman Tamu/Login (`index.php`)
Ketika user mengakses root portal (`/admin/` atau `/client/`), server akan memuat berkas `index.php`. 
*   `index.php` membaca parameter `a` dari URL (default: `signin`).
*   Sistem kemudian memuat file tampilan dari subfolder `auth/` (contoh: `auth/signin.php`).
*   Aturan rewrite di `.htaccess` secara otomatis mengubah `client/signin` menjadi `client/index.php?a=signin`.

### Halaman Dashboard / Halaman Dalam (`home.php`)
Ketika user sudah login dan mengakses halaman dalam, server memprosesnya melalui `home.php`.
*   `.htaccess` menangkap semua URL setelah domain dan melemparkannya sebagai parameter `a`, `b`, `c`, `d`, `e` ke `home.php`.
*   *Contoh:* Akses ke `/client/dashboard/setting` diterjemahkan menjadi `home.php?a=dashboard&b=setting`.
*   Di dalam `home.php`, sistem memvalidasi session login aktif, kemudian me-require berkas view secara dinamis dari folder `doc/` (contoh: `doc/dashboard/setting.php` atau `doc/dashboard/index.php`).

---

## 2. Penanganan Form & Request AJAX
Seluruh interaksi pengiriman form (seperti login, registrasi, tambah data, update data) dilakukan secara asinkronus (AJAX) menggunakan jQuery agar halaman tidak perlu dimuat ulang (*reload*).

### Router AJAX Terpusat (`appPost.php`)
*   Setiap form HTML mengirimkan request POST ke alamat router AJAX: `/ajax/post/[kategori]/[fitur]`.
*   Router di `ajax/appPost.php` akan memproses dan mengarahkannya secara otomatis ke file handler di dalam folder `ajax/postdata/[kategori]/[fitur].php`.
*   **Format Standard Respon AJAX (JSON):**
    ```php
    JsonResponse([
        'code'    => 200,     // Kode status HTTP
        'success' => true,    // Status berhasil/gagal
        'message' => 'Pesan pemberitahuan',
        'alert'   => [        // Konfigurasi alert popup SweetAlert2
            'title' => 'Sukses!',
            'text'  => 'Operasi Anda berhasil dijalankan.',
            'icon'  => 'success'
        ]
    ]);
    ```

---

## 3. Cara Menulis Model Baru
Model bertindak sebagai jembatan untuk memanipulasi database dan diletakkan di dalam folder `config/models/`.

### Aturan Penulisan Model:
1.  Gunakan nama kelas berformat PascalCase dan simpan dengan nama file yang sama (contoh: `config/models/Investor.php` berisi `class Investor`).
2.  Tentukan namespace `namespace App\Models;`.
3.  Gunakan wrapper koneksi database static bawaan dengan memanggil `Config\Core\Database`.

### Contoh Struktur Model Template:
```php
<?php
namespace App\Models;

use Config\Core\Database;
use Exception;

class Investor {
    
    // Contoh method static untuk mengambil data dari database
    public static function getAll(): array {
        try {
            $db = Database::connect();
            $sql = $db->query("SELECT * FROM users WHERE role = 'investor'");
            return $sql->fetch_all(MYSQLI_ASSOC);
        } catch (Exception $e) {
            // Log error ditangani oleh handler global di setting.php
            return [];
        }
    }
}
```

---

## 4. Akses Koneksi Database di View/Handler
Untuk menjalankan query database di luar file Model (misalnya di handler AJAX atau berkas view PHP), Anda dapat memanggil variabel global `$db` yang telah terhubung otomatis:

```php
global $db;

// Contoh query sql langsung
$query = $db->query("SELECT * FROM users WHERE status = 'aktif'");
$activeUsers = $query->fetch_all(MYSQLI_ASSOC);
```

---

## 5. Pemeriksaan Sesi Login (Authentication)
*   **Hak Akses Portal Client (Member/User):**
    Periksa menggunakan method `App\Models\User::user()`. Method ini akan mengembalikan array data profil user aktif jika sesi valid, atau `false` jika tidak valid.
*   **Hak Akses Portal Admin (Master/Admin):**
    Periksa menggunakan method `App\Models\Admin::authentication()`.
