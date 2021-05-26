<?php
    $connection = mysqli_connect('localhost', 'root', 'admin', 'cms_blogging_system');

    if (!$connection) {
        die("La connexion à la base de données a échoué");
    }

?>