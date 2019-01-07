<?php
    /**
     * Created by PhpStorm.
     * User: Steph
     * Date: 04/12/18
     * Time: 7:51 PM
     */
    
    //importing required script
    require_once 'DbOperation.php';
    
    $response = array();
    
    if ($_SERVER['REQUEST_METHOD'] == 'POST') {
        if (!verifyRequiredParams(array('username', 'password'))) {
            //getting values
            $username = $_POST['username'];
            $password = $_POST['password'];
            
            //creating db operation object
            $db = new DbOperation();
            
            //adding user to database
            $result = $db->connectUser($username, $password);
            
            //making the response accordingly
            if ($result == USER_CONNECTED) {
                $response['error'] = false;
                $response['message'] = 'User connected successfully';
            } elseif ($result == USER_NOT_CONNECTED) {
                $response['error'] = true;
                $response['message'] = 'Some error occurred';
            }
        } else {
            $response['error'] = true;
            $response['message'] = 'Required parameters are missing';
        }
    } else {
        $response['error'] = true;
        $response['message'] = 'Invalid request';
    }
    
    //function to validate the required parameter in request
    function verifyRequiredParams($required_fields)
    {
        
        //Getting the request parameters
        $request_params = $_REQUEST;
        
        //Looping through all the parameters
        foreach ($required_fields as $field) {
            //if any requred parameter is missing
            if (!isset($request_params[$field]) || strlen(trim($request_params[$field])) <= 0) {
                
                //returning true;
                return true;
            }
        }
        return false;
    }
    
    echo json_encode($response);
    ?>
