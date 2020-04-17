<!--/********************************************************************************************************************************/
/*  Date	Name	Description                                 																*/
/*  ----------------------------------------------------------------------------------------------------------------------------*/
/*                                                                  															*/
/*  2/7/2020  JNovikoff   Initial Deployment 													*/
/********************************************************************************************************************************/-->
<?php
class Database {
    private static $dsn = 'mysql:host=localhost;dbname=gusystem';
    private static $username = 'root';
    private static $password = 'Pa$$w0rd';
    private static $db;

    private function __construct() {}

    public static function getDB () {
        if (!isset(self::$db)) {
            try {
                self::$db = new PDO(self::$dsn,
                                     self::$username,
                                     self::$password);
            } catch (PDOException $e) {
                $error_message = $e->getMessage();
                //return $error_message;
                include('./database_error.php');
                exit();
            }
        }
        return self::$db;
    }
}
?>

