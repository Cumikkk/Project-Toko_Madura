<?php
use App\Models\Helper;
use Config\Core\Database;
use Config\Core\SystemInfo;

$data = Helper::getSafeInput($_POST);
$idOutlet = intval($data['id_outlet'] ?? 0);
$isEdit = ($idOutlet > 0);

$requiredPerm = $isEdit ? "/outlet/update" : "/outlet/create";
if (!$adminPermissionCore->hasPermission($authorizedPermission, $requiredPerm) && !$adminPermissionCore->hasPermission($authorizedPermission, "/outlet/create")) {
    JsonResponse([
        'code'      => 200,
        'success'   => false,
        'message'   => "Anda tidak memiliki hak akses untuk mengubah/menambah outlet toko",
        'data'      => []
    ]);
}

$kode_outlet   = trim($data['kode_outlet'] ?? '');
$nama_outlet   = trim($data['nama_outlet'] ?? '');
$id_users      = intval($data['id_users'] ?? 0);
$id_investor   = intval($data['id_investor'] ?? 0);
$alamat_outlet = trim($data['alamat_outlet'] ?? '');

if (empty($kode_outlet) || empty($nama_outlet) || empty($id_users) || empty($id_investor)) {
    JsonResponse([
        'code'      => 200,
        'success'   => false,
        'message'   => "Semua kolom utama (Kode, Nama Toko, Pengelola, Investor) wajib diisi",
        'data'      => []
    ]);
}

if ($isEdit) {
    // 1. Edit Mode
    $resOut = $db->query("SELECT id_outlet FROM outlet WHERE id_outlet = {$idOutlet} LIMIT 1");
    if (!$resOut || $resOut->num_rows == 0) {
        JsonResponse([
            'code'      => 200,
            'success'   => false,
            'message'   => "Data cabang toko tidak ditemukan",
            'data'      => []
        ]);
    }

    // Check kode_outlet uniqueness excluding current outlet
    $sql_check = $db->query("SELECT id_outlet FROM outlet WHERE LOWER(kode_outlet) = LOWER('".$db->real_escape_string($kode_outlet)."') AND id_outlet != {$idOutlet} LIMIT 1");
    if ($sql_check && $sql_check->num_rows > 0) {
        JsonResponse([
            'code'      => 200,
            'success'   => false,
            'message'   => "Kode outlet '{$kode_outlet}' sudah digunakan oleh cabang lain",
            'data'      => []
        ]);
    }

    $namaSafe   = $db->real_escape_string($nama_outlet);
    $kodeSafe   = $db->real_escape_string($kode_outlet);
    $alamatSafe = $db->real_escape_string($alamat_outlet);

    $db->query("UPDATE outlet SET kode_outlet = '{$kodeSafe}', nama_outlet = '{$namaSafe}', id_users = {$id_users}, id_investor = {$id_investor}, alamat_outlet = '{$alamatSafe}' WHERE id_outlet = {$idOutlet}");

    JsonResponse([
        'code'      => 200,
        'success'   => true,
        'message'   => "Berhasil memperbarui data outlet cabang: {$nama_outlet}",
        'data'      => [
            'redirect' => SystemInfo::app('ADMIN_URL') . "/outlet/view"
        ]
    ]);

} else {
    // 2. Create Mode
    $sql_check = $db->query("SELECT id_outlet FROM outlet WHERE LOWER(kode_outlet) = LOWER('".$db->real_escape_string($kode_outlet)."') LIMIT 1");
    if ($sql_check && $sql_check->num_rows > 0) {
        JsonResponse([
            'code'      => 200,
            'success'   => false,
            'message'   => "Kode outlet '{$kode_outlet}' sudah terdaftar, silakan pilih kode lain",
            'data'      => []
        ]);
    }

    $namaSafe   = $db->real_escape_string($nama_outlet);
    $kodeSafe   = $db->real_escape_string($kode_outlet);
    $alamatSafe = $db->real_escape_string($alamat_outlet);

    $db->query("INSERT INTO outlet (id_users, id_investor, kode_outlet, nama_outlet, alamat_outlet) VALUES ({$id_users}, {$id_investor}, '{$kodeSafe}', '{$namaSafe}', '{$alamatSafe}')");

    if ($db->affected_rows < 1) {
        JsonResponse([
            'code'      => 200,
            'success'   => false,
            'message'   => "Gagal mendaftarkan cabang outlet baru: " . $db->error,
            'data'      => []
        ]);
    }

    JsonResponse([
        'code'      => 200,
        'success'   => true,
        'message'   => "Berhasil mendaftarkan toko cabang baru: {$nama_outlet}",
        'data'      => [
            'redirect' => SystemInfo::app('ADMIN_URL') . "/outlet/view"
        ]
    ]);
}
