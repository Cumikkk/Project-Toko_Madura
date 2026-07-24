<?php
use App\Models\Helper;
use Config\Core\Database;

$idInvestor = intval($data['id_investor'] ?? ($data['id'] ?? 0));

if ($idInvestor <= 0) {
    JsonResponse([
        'code'      => 200,
        'success'   => false,
        'message'   => "ID Investor tidak valid",
        'data'      => []
    ]);
}

$resInv = $db->query("SELECT id_users FROM investor WHERE id_investor = {$idInvestor} LIMIT 1");
if (!$resInv || $resInv->num_rows == 0) {
    JsonResponse([
        'code'      => 200,
        'success'   => false,
        'message'   => "Data investor tidak ditemukan",
        'data'      => []
    ]);
}

$userId = intval($resInv->fetch_assoc()['id_users']);

// Delete investor record
$db->query("DELETE FROM investor WHERE id_investor = {$idInvestor}");
// Delete user record
$db->query("DELETE FROM users WHERE id_users = {$userId}");

JsonResponse([
    'code'      => 200,
    'success'   => true,
    'message'   => "Data investor berhasil dihapus",
    'data'      => []
]);
