<!DOCTYPE html>
<!-- 

Original Author: Joshua Novikoff
Date Created: 1/27/2020
Version: 1.0
Date Last Modified: 1/27/2020
Modified by: Joshua Novikoff
Modification log: Initial deployment

				  
-->
<html lang="en">

<head>
<meta charset="utf-8">
<meta name="description" content="Thank you for your inquiry">
<meta name="keywords" content="computers, technology, delivery, web design">
<meta name="author" content="Joshua Novikoff">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Giantbulb Unlimited||Thank You</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
<link rel="stylesheet" href="css/styles.css">
<link href="https://fonts.googleapis.com/css?family=Lexend+Deca|Open+Sans+Condensed:300&display=swap" rel="stylesheet">
<link rel="shortcut icon" type="image/png" href="images/gu_favicon.png"

</head>

<body>
<?php
    require('./model/database.php');
    try {
                //$db = new PDO($dsn, $username, $password);
                $db = Database::getDB();
                

            } catch (PDOException $e) {
                $error_message = $e->getMessage();
                /* include('database_error.php'); */
                echo "DB Error: " . $error_message; 
                exit();
            }
//    class Database {
//    private static $dsn = 'mysql:host=localhost;dbname=gusystem';
//    private static $username = 'root';
//    private static $password = 'Pa$$w0rd';
//    private static $db;
//
//    private function __construct() {}
//
//    public static function getDB () {
//        if (!isset(self::$db)) {
//            try {
//                self::$db = new PDO(self::$dsn,
//                                     self::$username,
//                                     self::$password);
//            } catch (PDOException $e) {
//                $error_message = $e->getMessage();
//                //include('../errors/database_error.php');
//                echo '</br>' . $error_message; 
//                exit();
//            }
//        }
//        return self::$db;
//    }
//}

class Employee {
    private $id;
    private $first_name;
    private $last_name;

    public function __construct($id, $first_name, $last_name) {
        $this->id = $id;
        $this->first_name = $first_name;
        $this->last_name = $last_name;
    }

    public function getID() {
        return $this->id;
    }

    public function setID($value) {
        $this->id = $value;
    }

    public function getFirstName() {
        return $this->first_name;
    }

    public function setFirstName($value) {
        $this->first_name = $value;
    }
    public function getLastName() {
        return $this->last_name;
    }
    public function setLastName($value) {
        $this->last_name = $value;
    }
}
class EmployeeDB {
    public static function getEmployees() {
        $db = Database::getDB();
        $query = 'SELECT * FROM employee
                  ORDER BY lastName';
        $statement = $db->prepare($query);
        $statement->execute();
        
        $employees = array();
        foreach ($statement as $row) {
            $employee = new Employee($row['employeeID'],
                                     $row['firstName'],
                                     $row['lastName']);
            $employees[] = $employee;
        }
        return $employees;
    }
}
$employees = EmployeeDB::getEmployees();
?>
<nav>
<a href="gu_index.html"><img src="images/gu_logo.png" alt="logo"></a>
<ul>
	<li><a href="gu_index.html">Home</a></li>
	<li><a href="gu_about.html">About</a></li>
	<li><a href="gu_pricing.html">Pricing</a></li>
	<li><a href="gu_examples.html">Examples</a></li>
	<li><a href="gu_contact.html">Contact</a></li>
</ul>
</nav>
<main>
    <h1>Employees</h1>
</main>
    <section>
        <ul>
            <?php foreach($employees as $employee) : ?>
            <li>
                <?php echo $employee->getLastName(). ', ' . $employee->getFirstName();?>
            </li>         
            <?php endforeach; ?>
        </ul>
    </section>
<footer>
Giantbulb Unlimited &#8226; 57814 Loower Moor Dr, New York NY
</footer>

</body>
</html>