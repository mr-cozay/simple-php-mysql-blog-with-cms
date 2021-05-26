<?php
    $connection = mysqli_connect('localhost', 'root', 'admin', 'simple_php_mysql_blog_with_cms');

    if (!$connection) {
        die("La connexion à la base de données a échoué");
    }

?>