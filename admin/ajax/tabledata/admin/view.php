<?php
$dt->query("
    SELECT
        username as ADM_USER,
        nama_lengkap as ADM_NAME,
        role as ADMROLE_NAME,
        1 as ADM_STS,
        id_users as ID_ADM,
        id_users as ADM_ID
    FROM users
    WHERE role = 'master'
");

$dt->hide('ID_ADM');
$dt->edit('ADM_STS', function($data) {
    return "<span class='badge bg-success'>Active</span>";
});

$dt->edit('ADM_ID', function ($data) {
    return "<div class='action d-flex justify-content-center gap-2' data-id='".$data['ID_ADM']."'></div>";
});

echo $dt->generate()->toJson();