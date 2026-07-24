<?php
use App\Models\Helper;
use Config\Core\Database;
use Config\Core\SystemInfo;

if (!$adminPermissionCore->hasPermission($authorizedPermission, "/outlet/delete")) {
    JsonResponse([
        'code'      => 200,
        'success'   => false,
        'message'   => "Anda tidak memiliki hak akses untuk menghapus cabang outlet",
        'data'      => []
    ]);
}

$data = Helper::getSafeInput($_POST);
$idOutlet = intval($data['id'] ?? 0);

if ($idOutlet <= 0) {
    JsonResponse([
        'code'      => 200,
        'success'   => false,
        'message'   => "ID Outlet tidak valid",
        'data'      => []
    ]);
}

$db->query("DELETE FROM outlet WHERE id_outlet = {$idOutlet}");

if ($db->affected_rows > 0) {
    JsonResponse([
        'code'      => 200,
        'success'   => true,
        'message'   => "Berhasil menghapus toko cabang outlet",
        'data'      => [
            'redirect' => SystemInfo::app('ADMIN_URL') . "/outlet/view"
        ]
    ]);
} else {
    JsonResponse([
        'code'      => 200,
        'success'   => false,
        'message'   => "Gagal menghapus cabang outlet atau data tidak ditemukan",
        'data'      => []
    ]);
}
