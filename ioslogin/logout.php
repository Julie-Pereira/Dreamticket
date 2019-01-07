<?php
    $title="Logout";
    require("DbConnect.php");
    session_destroy();
    echo "Vous êtes à présent déconnecté";
?>
