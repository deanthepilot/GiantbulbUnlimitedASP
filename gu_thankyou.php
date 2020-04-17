<!DOCTYPE html>
<!-- 

Original Author: Joshua Novikoff
Date Created: 1/27/2020
Version: 1.0
Date Last Modified: 2/7/2020
Modified by: Joshua Novikoff
Modification log: Added require of database.php & call to getDB();

				  
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
    $error_message = null;
    $inquiryName = filter_input(INPUT_POST, 'Name');
    $inquiryEmail = filter_input(INPUT_POST, 'contactEmail');
    $inquiryPhone = filter_input(INPUT_POST, 'contactPhone');
    $inquiryPrice = filter_input(INPUT_POST, 'cost');
    $inquiryMsg = filter_input(INPUT_POST, 'comment');
    $employeeID = mt_rand(1, 20);
    /* echo "Fields: " . $inquiryName . $inquiryEmail . $inquiryPhone . $inquiryPrice . $inquiryMsg;  */
    
    // Validate inputs
    if ($inquiryName == null || $inquiryEmail == null || $inquiryPhone == null ||
        $inquiryPrice == null || $inquiryMsg == null) {
        $error = "Invalid input data. Check all fields and try again.";
        /* include('error.php'); */
        echo "Form Data Error: " . $error; 
        exit();
        } else {
//            $dsn = 'mysql:host=localhost;dbname=gusystem';
//            $username = 'root';
//            $password = 'Pa$$w0rd';

            try {
                //$db = new PDO($dsn, $username, $password);
                $db = Database::getDB();

            } catch (PDOException $e) {
                $error_message = $e->getMessage();
                /* include('database_error.php'); */
                echo "DB Error: " . $error_message; 
                exit();
            }
        if (!$error_message){
            // Add the product to the database  
            $query = 'INSERT INTO inquiry
                         (inquiryName, inquiryEmail, inquiryPhone, inquiryPrice, inquiryMsg, employeeID)
                      VALUES
                         (:inquiryName, :inquiryEmail, :inquiryPhone, :inquiryPrice, :inquiryMsg, :employeeID)';
            $statement = $db->prepare($query);
            $statement->bindValue(':inquiryName', $inquiryName);
            $statement->bindValue(':inquiryEmail', $inquiryEmail);
            $statement->bindValue(':inquiryPhone', $inquiryPhone);
            $statement->bindValue(':inquiryPrice', $inquiryPrice);
            $statement->bindValue(':inquiryMsg', $inquiryMsg);
            $statement->bindValue(':employeeID', $employeeID);
            try {
                $count= $statement->execute();
            } catch (Exception $ex) {
                $error_message = "We are experiencing technical difficulties. Please try again later.";
            }
            $statement->closeCursor();
            /* echo "Fields: " . $inquiryName . $inquiryEmail . $inquiryPhone . $inquiryPrice . $inquiryMsg; */
            
            if ($count < 1){
                $error_message = "We are experiencing technical difficulties. Please try again later.";
            } else {
                $error_message = "Thank you, $inquiryName for contacting me! I will get back to you shortly.";
            }
        }
            
}
?>
<nav>
<a href="gu_index.html"><img src="images/gu_logo.png" alt="logo"></a>
<ul>
	<li><a href="gu_index.html">Home</a></li>
	<li><a href="gu_about.html">About</a></li>
	<li><a href="gu_pricing.html">Pricing</a></li>
	<li><a href="gu_examples.html">Examples</a></li>
	<li><a href="gu_contact.html">Contact</a></li>        
        <li><a href="gu_login.php">Admin</a></li>
</ul>
</nav>
<main>
<h1><?php echo $error_message; ?></h1>
</main>

<footer>
Giantbulb Unlimited &#8226; 57814 Loower Moor Dr, New York NY
</footer>

</body>
</html>