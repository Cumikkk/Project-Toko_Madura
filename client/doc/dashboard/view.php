<?php
use Config\Core\Database;
use App\Models\User;
use Config\Core\SystemInfo;

$user = User::user();
$db = Database::connect();
$role = strtolower($user['role'] ?? 'investor');
$userId = (int)($user['MBR_ID'] ?? $user['id_users'] ?? 0);

if ($role === 'investor') {
    // 1. Fetch Investor Metrics
    $resInv = $db->query("SELECT id_investor, persen_bagian_investor FROM investor WHERE id_users = {$userId} LIMIT 1");
    $investorId = 0;
    $persenInvestor = 50.00;
    if ($resInv && $resInv->num_rows > 0) {
        $rowInv = $resInv->fetch_assoc();
        $investorId = (int)$rowInv['id_investor'];
        $persenInvestor = (float)$rowInv['persen_bagian_investor'];
    }

    $resOutletCount = $db->query("SELECT COUNT(*) as total FROM outlet WHERE id_investor = {$investorId}")->fetch_assoc()['total'] ?? 0;
    $resOmzetTot = $db->query("
        SELECT IFNULL(SUM(lo.omzet), 0) as total_omzet, IFNULL(SUM(lo.nominal_potongan), 0) as total_potongan
        FROM laporan_omzet lo
        JOIN outlet o ON o.id_outlet = lo.id_outlet
        WHERE o.id_investor = {$investorId}
    ")->fetch_assoc();

    $totalOmzet = (float)($resOmzetTot['total_omzet'] ?? 0);
    $totalPotongan = (float)($resOmzetTot['total_potongan'] ?? 0);
    $omzetBersih = $totalOmzet - $totalPotongan;
    $hakInvestor = $omzetBersih * ($persenInvestor / 100.0);

    // Recent 5 Omzet Reports
    $resRecent = $db->query("
        SELECT o.nama_outlet, o.kode_outlet, lo.periode_laporan, lo.omzet, lo.nominal_potongan, lo.waktu_input
        FROM laporan_omzet lo
        JOIN outlet o ON o.id_outlet = lo.id_outlet
        WHERE o.id_investor = {$investorId}
        ORDER BY lo.waktu_input DESC LIMIT 5
    ");
} else {
    // 2. Fetch Outlet Metrics
    $resOut = $db->query("SELECT id_outlet, kode_outlet, nama_outlet FROM outlet WHERE id_users = {$userId} LIMIT 1")->fetch_assoc();
    $outletId = (int)($resOut['id_outlet'] ?? 0);

    $resOutletOmzet = $db->query("
        SELECT COUNT(*) as total_laporan, IFNULL(SUM(omzet), 0) as total_omzet, IFNULL(SUM(nominal_potongan), 0) as total_potongan
        FROM laporan_omzet WHERE id_outlet = {$outletId}
    ")->fetch_assoc();

    $totalLaporan = (int)($resOutletOmzet['total_laporan'] ?? 0);
    $totalOmzet = (float)($resOutletOmzet['total_omzet'] ?? 0);
    $totalPotongan = (float)($resOutletOmzet['total_potongan'] ?? 0);

    // Recent 5 Omzet Reports
    $resRecent = $db->query("
        SELECT periode_laporan, omzet, presentase_potongan, nominal_potongan, waktu_input
        FROM laporan_omzet WHERE id_outlet = {$outletId}
        ORDER BY waktu_input DESC LIMIT 5
    ");
}
?>

<div class="main-content-inner py-4">
    <!-- Welcome Header Card -->
    <div class="row mb-4">
        <div class="col-12">
            <div class="card border-0 shadow-sm" style="border-radius: 16px; background: linear-gradient(135deg, #7D0A0A 0%, #3D0708 100%); color: #fff;">
                <div class="card-body p-4 p-md-5">
                    <div class="row align-items-center g-3">
                        <div class="col-lg-8 col-md-7">
                            <span class="badge bg-white text-danger fw-bold px-3 py-2 rounded-pill mb-2 text-uppercase" style="font-size: 11px; letter-spacing: 0.5px;">
                                <i class="fa-solid fa-shop me-1"></i> Toko Madura Client Portal
                            </span>
                            <h2 class="fw-bold mb-2 text-white">Selamat Datang, <?= htmlspecialchars($user['MBR_NAME'] ?? 'Pengguna'); ?>!</h2>
                            <p class="text-white-50 fs-6 mb-0">Anda masuk sebagai <strong><?= strtoupper($role); ?></strong>. Pantau rekapitulasi omzet, bagi hasil, dan performa toko secara real-time.</p>
                        </div>
                        <div class="col-lg-4 col-md-5 text-md-end text-start">
                            <div class="bg-white bg-opacity-10 p-3 rounded-4 border border-white border-opacity-10 d-inline-block text-start text-md-end">
                                <span class="text-white-50 small d-block">Status Akun Login</span>
                                <span class="fw-bold text-warning fs-6"><i class="fa-solid fa-circle-check text-success me-1"></i> Terverifikasi Aktif</span>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Summary Metrics Cards -->
    <div class="row g-3 mb-4">
        <?php if ($role === 'investor') : ?>
            <div class="col-12 col-sm-6 col-xl-3">
                <div class="card border-0 shadow-sm h-100" style="border-radius: 14px;">
                    <div class="card-body p-3 p-md-4 d-flex align-items-center gap-3">
                        <div class="rounded-3 p-3 text-white d-flex align-items-center justify-content-center" style="width: 52px; height: 52px; background: linear-gradient(135deg, #7D0A0A 0%, #580608 100%);">
                            <i class="fa-light fa-store fs-4"></i>
                        </div>
                        <div>
                            <div class="text-muted small fw-semibold">Total Outlet Milik Anda</div>
                            <div class="fs-4 fw-bold text-dark"><?= number_format($resOutletCount, 0, ',', '.'); ?> <span class="fs-6 fw-normal text-muted">Cabang</span></div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-12 col-sm-6 col-xl-3">
                <div class="card border-0 shadow-sm h-100" style="border-radius: 14px;">
                    <div class="card-body p-3 p-md-4 d-flex align-items-center gap-3">
                        <div class="rounded-3 p-3 text-white d-flex align-items-center justify-content-center" style="width: 52px; height: 52px; background: linear-gradient(135deg, #0d6efd 0%, #0a58ca 100%);">
                            <i class="fa-light fa-money-bill-trend-up fs-4"></i>
                        </div>
                        <div>
                            <div class="text-muted small fw-semibold">Total Omzet Keseluruhan</div>
                            <div class="fs-5 fw-bold text-primary">Rp <?= number_format($totalOmzet, 0, ',', '.'); ?></div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-12 col-sm-6 col-xl-3">
                <div class="card border-0 shadow-sm h-100" style="border-radius: 14px;">
                    <div class="card-body p-3 p-md-4 d-flex align-items-center gap-3">
                        <div class="rounded-3 p-3 text-white d-flex align-items-center justify-content-center" style="width: 52px; height: 52px; background: linear-gradient(135deg, #dc3545 0%, #b02a37 100%);">
                            <i class="fa-light fa-hand-holding-dollar fs-4"></i>
                        </div>
                        <div>
                            <div class="text-muted small fw-semibold">Komisi Platform</div>
                            <div class="fs-5 fw-bold text-danger">Rp <?= number_format($totalPotongan, 0, ',', '.'); ?></div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-12 col-sm-6 col-xl-3">
                <div class="card border-0 shadow-sm h-100" style="border-radius: 14px;">
                    <div class="card-body p-3 p-md-4 d-flex align-items-center gap-3">
                        <div class="rounded-3 p-3 text-white d-flex align-items-center justify-content-center" style="width: 52px; height: 52px; background: linear-gradient(135deg, #198754 0%, #146c43 100%);">
                            <i class="fa-light fa-vault fs-4"></i>
                        </div>
                        <div>
                            <div class="text-muted small fw-semibold">Hak Investor (<?= number_format($persenInvestor, 0); ?>%)</div>
                            <div class="fs-5 fw-bold text-success">Rp <?= number_format($hakInvestor, 0, ',', '.'); ?></div>
                        </div>
                    </div>
                </div>
            </div>
        <?php else : ?>
            <div class="col-12 col-sm-6 col-xl-4">
                <div class="card border-0 shadow-sm h-100" style="border-radius: 14px;">
                    <div class="card-body p-3 p-md-4 d-flex align-items-center gap-3">
                        <div class="rounded-3 p-3 text-white d-flex align-items-center justify-content-center" style="width: 52px; height: 52px; background: linear-gradient(135deg, #7D0A0A 0%, #580608 100%);">
                            <i class="fa-light fa-file-invoice fs-4"></i>
                        </div>
                        <div>
                            <div class="text-muted small fw-semibold">Total Laporan Inputed</div>
                            <div class="fs-4 fw-bold text-dark"><?= number_format($totalLaporan, 0, ',', '.'); ?> <span class="fs-6 fw-normal text-muted">Laporan</span></div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-12 col-sm-6 col-xl-4">
                <div class="card border-0 shadow-sm h-100" style="border-radius: 14px;">
                    <div class="card-body p-3 p-md-4 d-flex align-items-center gap-3">
                        <div class="rounded-3 p-3 text-white d-flex align-items-center justify-content-center" style="width: 52px; height: 52px; background: linear-gradient(135deg, #198754 0%, #146c43 100%);">
                            <i class="fa-light fa-money-bill-trend-up fs-4"></i>
                        </div>
                        <div>
                            <div class="text-muted small fw-semibold">Total Omzet Laporkan</div>
                            <div class="fs-4 fw-bold text-success">Rp <?= number_format($totalOmzet, 0, ',', '.'); ?></div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-12 col-sm-6 col-xl-4">
                <div class="card border-0 shadow-sm h-100" style="border-radius: 14px;">
                    <div class="card-body p-3 p-md-4 d-flex align-items-center gap-3">
                        <div class="rounded-3 p-3 text-white d-flex align-items-center justify-content-center" style="width: 52px; height: 52px; background: linear-gradient(135deg, #dc3545 0%, #b02a37 100%);">
                            <i class="fa-light fa-percent fs-4"></i>
                        </div>
                        <div>
                            <div class="text-muted small fw-semibold">Total Potongan Komisi</div>
                            <div class="fs-4 fw-bold text-danger">Rp <?= number_format($totalPotongan, 0, ',', '.'); ?></div>
                        </div>
                    </div>
                </div>
            </div>
        <?php endif; ?>
    </div>

    <!-- Recent Laporan Omzet Table -->
    <div class="card border-0 shadow-sm rounded-4 overflow-hidden">
        <div class="card-header bg-white py-3 px-4 d-flex align-items-center justify-content-between border-bottom">
            <h5 class="fw-bold text-dark mb-0 fs-6">5 Laporan Omzet Terbaru</h5>
            <?php if ($role === 'investor') : ?>
                <a href="<?= SystemInfo::app('CLIENT_URL') ?>/outlet" class="btn btn-sm btn-outline-danger rounded-pill fw-bold">Lihat Semua Outlet</a>
            <?php else : ?>
                <a href="<?= SystemInfo::app('CLIENT_URL') ?>/omzet" class="btn btn-sm btn-outline-danger rounded-pill fw-bold">+ Input Omzet Baru</a>
            <?php endif; ?>
        </div>
        <div class="card-body p-0">
            <div class="table-responsive">
                <table class="table table-hover align-middle mb-0">
                    <thead class="bg-light text-secondary border-bottom">
                        <tr>
                            <th class="py-3 px-4 text-center fw-bold text-dark">No</th>
                            <?php if ($role === 'investor') : ?>
                                <th class="py-3 px-3 fw-bold text-dark">Outlet Toko</th>
                            <?php endif; ?>
                            <th class="py-3 px-3 fw-bold text-dark">Periode Laporan</th>
                            <th class="py-3 px-3 text-end fw-bold text-dark">Omzet (Rp)</th>
                            <th class="py-3 px-3 text-end fw-bold text-danger">Potongan Komisi</th>
                            <th class="py-3 px-4 text-center fw-bold text-dark">Waktu Input</th>
                        </tr>
                    </thead>
                    <tbody class="border-0">
                        <?php if ($resRecent && $resRecent->num_rows > 0) : ?>
                            <?php $no = 1; while ($r = $resRecent->fetch_assoc()) : ?>
                                <tr>
                                    <td class="py-3 px-4 text-center text-muted font-monospace"><?= $no++; ?></td>
                                    <?php if ($role === 'investor') : ?>
                                        <td class="py-3 px-3">
                                            <div class="fw-bold text-dark"><?= htmlspecialchars($r['nama_outlet']); ?></div>
                                            <small class="text-muted font-monospace"><?= htmlspecialchars($r['kode_outlet']); ?></small>
                                        </td>
                                    <?php endif; ?>
                                    <td class="py-3 px-3 fw-semibold text-dark"><?= date('d M Y', strtotime($r['periode_laporan'])); ?></td>
                                    <td class="py-3 px-3 text-end fw-bold text-success">Rp <?= number_format($r['omzet'], 0, ',', '.'); ?></td>
                                    <td class="py-3 px-3 text-end fw-semibold text-danger">Rp <?= number_format($r['nominal_potongan'], 0, ',', '.'); ?></td>
                                    <td class="py-3 px-4 text-center text-muted small"><?= date('d/m/Y H:i', strtotime($r['waktu_input'])); ?></td>
                                </tr>
                            <?php endwhile; ?>
                        <?php else : ?>
                            <tr>
                                <td colspan="<?= ($role === 'investor') ? '6' : '5'; ?>" class="text-center text-muted py-4">Belum ada laporan omzet yang dimasukkan.</td>
                            </tr>
                        <?php endif; ?>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>
