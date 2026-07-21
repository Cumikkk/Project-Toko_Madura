<?php
use Config\Core\Database;
use Config\Core\SystemInfo;

$db = Database::connect();

// Fetch statistics
$investorCount = $db->query("SELECT COUNT(*) as total FROM investor")->fetch_assoc()['total'] ?? 0;
$outletCount = $db->query("SELECT COUNT(*) as total FROM outlet")->fetch_assoc()['total'] ?? 0;

$omzetSumResult = $db->query("SELECT SUM(omzet) as total FROM laporan_omzet")->fetch_assoc();
$totalOmzet = $omzetSumResult['total'] ?? 0;

$bagiHasilResult = $db->query("SELECT SUM(hak_investor + hak_outlet) as total FROM rekap_bagi_hasil")->fetch_assoc();
$totalBagiHasil = $bagiHasilResult['total'] ?? 0;

// Fetch recent omzet
$recentOmzet = $db->query("
    SELECT o.nama_outlet, lo.periode_laporan, lo.omzet, lo.waktu_input 
    FROM laporan_omzet lo
    JOIN outlet o ON (o.id_outlet = lo.id_outlet)
    ORDER BY lo.waktu_input DESC LIMIT 5
");
?>

<div class="page-header">
    <div>
        <h2 class="main-content-title tx-24 mg-b-5">Dashboard Admin</h2>
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="#">Home</a></li>
            <li class="breadcrumb-item active" aria-current="page">Dashboard</li>
        </ol>
    </div>
</div>

<!-- ROW-1 -->
<div class="row row-sm">
    <div class="col-sm-12 col-md-6 col-lg-6 col-xl-3">
        <div class="card custom-card">
            <div class="card-body">
                <div class="card-item">
                    <div class="card-item-icon card-icon">
                        <i class="ti-user text-primary" style="font-size: 24px;"></i>
                    </div>
                    <div class="card-item-title double-line-height">
                        <label class="main-content-label tx-13 mg-b-2">Total Investor</label>
                        <span class="d-block tx-12 text-muted">Investor Terdaftar</span>
                    </div>
                    <div class="card-item-number ms-auto">
                        <h2 class="font-weight-bold"><?= $investorCount ?></h2>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="col-sm-12 col-md-6 col-lg-6 col-xl-3">
        <div class="card custom-card">
            <div class="card-body">
                <div class="card-item">
                    <div class="card-item-icon card-icon">
                        <i class="ti-shopping-cart text-success" style="font-size: 24px;"></i>
                    </div>
                    <div class="card-item-title double-line-height">
                        <label class="main-content-label tx-13 mg-b-2">Total Outlet</label>
                        <span class="d-block tx-12 text-muted">Outlet Toko Madura</span>
                    </div>
                    <div class="card-item-number ms-auto">
                        <h2 class="font-weight-bold"><?= $outletCount ?></h2>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="col-sm-12 col-md-6 col-lg-6 col-xl-3">
        <div class="card custom-card">
            <div class="card-body">
                <div class="card-item">
                    <div class="card-item-icon card-icon">
                        <i class="ti-money text-warning" style="font-size: 24px;"></i>
                    </div>
                    <div class="card-item-title double-line-height">
                        <label class="main-content-label tx-13 mg-b-2">Total Omzet</label>
                        <span class="d-block tx-12 text-muted">Seluruh Periode</span>
                    </div>
                    <div class="card-item-number ms-auto">
                        <h5 class="font-weight-bold text-warning">Rp <?= number_format($totalOmzet, 0, ',', '.') ?></h5>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="col-sm-12 col-md-6 col-lg-6 col-xl-3">
        <div class="card custom-card">
            <div class="card-body">
                <div class="card-item">
                    <div class="card-item-icon card-icon">
                        <i class="ti-stats-up text-info" style="font-size: 24px;"></i>
                    </div>
                    <div class="card-item-title double-line-height">
                        <label class="main-content-label tx-13 mg-b-2">Bagi Hasil</label>
                        <span class="d-block tx-12 text-muted">Telah Direkap</span>
                    </div>
                    <div class="card-item-number ms-auto">
                        <h5 class="font-weight-bold text-info">Rp <?= number_format($totalBagiHasil, 0, ',', '.') ?></h5>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- END ROW-1 -->

<!-- ROW-2 -->
<div class="row row-sm">
    <div class="col-lg-12">
        <div class="card custom-card">
            <div class="card-header">
                <h6 class="main-content-label mb-1">Input Omzet Terbaru</h6>
                <p class="text-muted card-sub-title">Daftar 5 omzet terakhir yang dimasukkan oleh outlet.</p>
            </div>
            <div class="card-body">
                <div class="table-responsive">
                    <table class="table table-bordered table-striped">
                        <thead>
                            <tr>
                                <th>No</th>
                                <th>Nama Outlet</th>
                                <th>Periode Laporan</th>
                                <th>Omzet</th>
                                <th>Waktu Input</th>
                            </tr>
                        </thead>
                        <tbody>
                            <?php if ($recentOmzet && $recentOmzet->num_rows > 0) : ?>
                                <?php $no = 1; while ($row = $recentOmzet->fetch_assoc()) : ?>
                                    <tr>
                                        <td><?= $no++ ?></td>
                                        <td><?= htmlspecialchars($row['nama_outlet']) ?></td>
                                        <td><?= date("F Y", strtotime($row['periode_laporan'])) ?></td>
                                        <td>Rp <?= number_format($row['omzet'], 0, ',', '.') ?></td>
                                        <td><?= $row['waktu_input'] ?></td>
                                    </tr>
                                <?php endwhile; ?>
                            <?php else : ?>
                                <tr>
                                    <td colspan="5" class="text-center text-muted">Belum ada data laporan omzet masuk.</td>
                                </tr>
                            <?php endif; ?>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- END ROW-2 -->
