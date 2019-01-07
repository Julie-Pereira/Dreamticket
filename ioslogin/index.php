<?php
    /**
     * Created by PhpStorm.
     * User: sumo stephane
     * Date: 17/01/2018
     * Time: 15:03
     */
    ?>
<?php
    session_start();
    //header("Content-type: application/json");//pour dire que ce n'est plus un fichier php, mais json
    //Connexion à la base de données
    $dsn = 'mysql:dbname=aje;host=127.0.0.1';
    $hote = 'localhost';
    $user = 'root';
    $password = '';
    
    try{
        $dbh = new PDO($dsn,$user,$password);
        $titre = "Connexion";
    } catch (PDOException $e){
        echo 'Connexion échouée : ' . $e->getMessage();
    }

?>

