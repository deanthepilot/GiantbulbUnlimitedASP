<!--/********************************************************************************************************************************/
/*  Date	Name	Description                                 																*/
/*  ----------------------------------------------------------------------------------------------------------------------------*/
/*                                                                  															*/
/*  2/7/2020  JNovikoff   Initial deployment.   													*/
/********************************************************************************************************************************/-->

<?php
function getInquiry(){
    global $db;
    if (!isset($employee_id)) {
    $employee_id = filter_input(INPUT_GET, 'employee_id', 
            FILTER_VALIDATE_INT);
    if ($employee_id == NULL || $employee_id == FALSE) {
        $employee_id = 1;
    }
	}
$query2 = 'SELECT * FROM inquiry WHERE employeeID = :employeeID '
				. 'ORDER BY inquiryEmail';                         
            $statement2 = $db->prepare($query2); 
            $statement2->bindValue(":employeeID", $employee_id);
            $statement2->execute();
            $inquiries = $statement2;
            return $inquiries;
}
?>