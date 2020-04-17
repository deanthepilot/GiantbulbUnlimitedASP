<!--/********************************************************************************************************************************/
/*  Date	Name	Description                                 																*/
/*  ----------------------------------------------------------------------------------------------------------------------------*/
/*                                                                  															*/
/*  2/7/2020  JNovikoff   Initial deployment. Script to create GU database   													*/
/********************************************************************************************************************************/-->

<?php    
    function getEmployee(){
        global $db;
        $query = 'SELECT employeeID, firstName FROM employee ORDER BY employeeID';                         
                $statement = $db->prepare($query);            
                $statement->execute();
                $employees = $statement;
                return $employees;
    }
?>