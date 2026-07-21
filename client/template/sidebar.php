<?php
use Config\Core\SystemInfo;
$role = $user['role'] ?? '';
?>

<!-- main sidebar start -->
<div class="main-sidebar">
    <div class="main-menu">
        <ul class="sidebar-menu scrollable">
            <ul class="sidebar-item">
                <li class="sidebar-dropdown-item">
                    <a href="<?= SystemInfo::app('CLIENT_URL') ?>/dashboard" class="sidebar-link">
                        <span class="nav-icon"><i class="fa-light fa-home"></i></span> 
                        <span class="sidebar-txt">Dashboard</span>
                    </a>
                </li>
            </ul>

            <?php if($role === 'investor') : ?>
                <li class="sidebar-item">
                    <a role="button" class="sidebar-link-group-title has-sub">Investor Menu</a>
                    <ul class="sidebar-link-group">
                        <li class="sidebar-dropdown-item">
                            <a href="<?= SystemInfo::app('CLIENT_URL') ?>/outlet" class="sidebar-link">
                                <span class="nav-icon"><i class="fa-light fa-store"></i></span> 
                                <span class="sidebar-txt">Daftar Outlet</span>
                            </a>
                        </li>
                    </ul>
                </li>
            <?php elseif($role === 'outlet') : ?>
                <li class="sidebar-item">
                    <a role="button" class="sidebar-link-group-title has-sub">Outlet Menu</a>
                    <ul class="sidebar-link-group">
                        <li class="sidebar-dropdown-item">
                            <a href="<?= SystemInfo::app('CLIENT_URL') ?>/omzet" class="sidebar-link">
                                <span class="nav-icon"><i class="fa-light fa-money-bill-trend-up"></i></span> 
                                <span class="sidebar-txt">Input Omzet</span>
                            </a>
                        </li>
                    </ul>
                </li>
            <?php endif; ?>
        </ul>
    </div>
</div>