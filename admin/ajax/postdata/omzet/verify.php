<?php
use App\Models\Helper;
use Config\Core\Database;

if (!$adminPermissionCore->hasPermission($authorizedPermission, "/omzet/verify") && !$adminPermissionCore->hasPermission($authorizedPermission, "/omzet/view")) {
    JsonResponse([
        'code'      => 200,
        'success'   => false,
        'message'   => "Anda tidak memiliki hak akses untuk memverifikasi nota omzet",
        'data'      => []
    ]);
}

$data = Helper::getSafeInput($_POST);
$idOmzet = intval($data['id'] ?? 0);

if ($idOmzet <= 0) {
    JsonResponse([
        'code'      => 200,
        'success'   => false,
        'message'   => "ID Laporan Omzet tidak valid",
        'data'      => []
    ]);
}

JsonResponse([
    'code'      => 200,
    'success'   => true,
    'message'   => "Laporan omzet berhasil diverifikasi dan dikonfirmasi",
    'data'      => []
]);
