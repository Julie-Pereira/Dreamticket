<?php
    
    /**
     * Created by PhpStorm.
     * User: Steph
     * Date: 04/12/18
     * Time: 7:51 PM
     */
    class DbOperation
    {
        private $conn;
        
        //Constructor
        function __construct()
        {
            require_once dirname(__FILE__) . '/Constants.php';
            require_once dirname(__FILE__) . '/DbConnect.php';
            // opening db connection
            $db = new DbConnect();
            $this->conn = $db->connect();
        }
        
        public function connectUser($username, $pass){
            if(isset($username) and isset($pass)) {
                $req = $this->conn->prepare("SELECT * FROM users WHERE username = ? AND password = ?");
                $req->execute([$username, md5($pass)]);
                
                $d = $req->fetch();
                
                if(isset($d['username'])) {
                    $_SESSION['utilisateur-connecte'] = $d['username'];
                    
                    return USER_CONNECTED;
                    //header('Location: index.php?pseudo='.$_SESSION['utilisateur-connecte']);
                }
                else{
                    echo "mauvais mot de passe ou mauvais identifiant";
                    
                    return USER_NOT_CONNECTED;
                }
            }
        }
        //Function to create a new user
        public function createUser($username, $pass, $email, $name, $phone, $address)
        {
            if (!$this->isUserExist($username, $email, $phone)) {
                $password = md5($pass);
                $stmt = $this->conn->prepare("INSERT INTO users (username, password, email, name, phone, address) VALUES (?, ?, ?, ?, ?, ?)");
                $stmt->bind_param("ssssss", $username, $password, $email, $name, $phone, $address);
                if ($stmt->execute()) {
                    return USER_CREATED;
                } else {
                    return USER_NOT_CREATED;
                }
            } else {
                return USER_ALREADY_EXIST;
            }
        }
        
        
        private function isUserExist($username, $email, $phone)
        {
            $stmt = $this->conn->prepare("SELECT id FROM users WHERE username = ? OR email = ? OR phone = ?");
            $stmt->bind_param("sss", $username, $email, $phone);
            $stmt->execute();
            $stmt->store_result();
            return $stmt->num_rows > 0;
        }
        
        //Function to create a new ticket
        public function createTicket($name, $type, $price)
        {
            if (!$this->isTicketExist($name, $type, $price)) {
        
                $stmt = $this->conn->prepare("INSERT INTO tickets (name, type, price) VALUES (?, ?, ?)");
                $stmt->bind_param("sss", $name, $type, $type);
                if ($stmt->execute()) {
                    return TICKET_CREATED;
                } else {
                    return TICKET_NOT_CREATED;
                }
            } else {
                return TICKET_ALREADY_EXIST;
            }
        }
        
        private function isTicketExist($name, $type, $price)
        {
            $stmt = $this->conn->prepare("SELECT id FROM tickets WHERE name = ? OR type = ? OR price = ?");
            $stmt->bind_param("sss", $name, $type, $price);
            $stmt->execute();
            $stmt->store_result();
            return $stmt->num_rows > 0;
        }
    }
?>
