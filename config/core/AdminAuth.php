<?php 
namespace Config\Core;

use Exception;

class AdminAuth {

    public static string $sessionAuthName = "token";

    public static function logout() {
        if (session_status() === PHP_SESSION_NONE) {
            session_start();
        }
        $_SESSION = [];
        session_destroy();
        return true;
    }

    public static function setSessionData(array $data): bool {
        if (session_status() === PHP_SESSION_NONE) {
            session_start();
        }
        if(empty($data['token'])) {
            return false;
        }

        $_SESSION[ self::$sessionAuthName ] = $data['token'];
        return true;
    }

    public static function getSessionData(): array|bool {
        if (session_status() === PHP_SESSION_NONE) {
            session_start();
        }
        $token = $_SESSION[ self::$sessionAuthName ] ?? "";
        if(empty($token)) {
            return false;
        }

        return [
            'token' => $token
        ];
    }

    public static function authentication() {
        try {
            global $db;
            $authData = self::getSessionData();
            if(!$authData) {
                return false;
            }

            if(empty($db)) {
                $db = Database::connect();
            }

            if (session_status() === PHP_SESSION_NONE) {
                session_start();
            }
            $userId = $_SESSION['user_id'] ?? null;
            if (!$userId) {
                return false;
            }

            $sqlCheck = $db->query("
                SELECT * FROM users 
                WHERE id = {$userId} AND role = 'master' AND status = 'aktif'
                LIMIT 1
            ");

            if($sqlCheck->num_rows != 1) {
                return false;
            }

            $rawUser = $sqlCheck->fetch_assoc(); 

            // Map keys for backward compatibility with RRFX template admin
            $user = [
                'ID_ADM' => $rawUser['id'],
                'ADM_ID' => $rawUser['id'],
                'ADM_NAME' => $rawUser['nama'],
                'ADM_USER' => $rawUser['username'],
                'ADM_EMAIL' => $rawUser['email'],
                'ADM_LEVEL' => 1, // master level
                'ADM_STS' => 1,
                'role' => $rawUser['role']
            ];
            
            return $user;

        } catch (Exception $e) {
            if(SystemInfo::isDevelopment()) {
                throw $e;
            }

            return false;
        }
    }
}