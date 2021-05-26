<!-- Connection -->
<?php include "includes/db.php" ?>

<!-- Header -->
<?php include "includes/header.php" ?>

<!-- Functions -->
<?php include "admin/functions.php" ?>

<?php

    if (isset($_POST['submit'])) {
        $username = mysqli_real_escape_string($connection, $_POST['username']);
        $email = mysqli_real_escape_string($connection, $_POST['email']);
        $password = mysqli_real_escape_string($connection, $_POST['password']);

        if (!empty($username) && !empty($email) && !empty($password)) {

            $query = "INSERT INTO users(username, user_email, user_password, 
            user_role) VALUES ('$username', '$email', '$password', 'subscriber')";
            $register_result = mysqli_query($connection, $query);
            confirm($register_result);

            $message = "Inscription terminée";
        } else {
            $message = "Le champ ne peut être vide";
        }
    } else {
        $message = "";
    }

?>

    <!-- Navigation -->
    
    <?php include "includes/navigation.php" ?>    

    <!-- Page Content -->
    <div class="container">
    
        <section id="login">
            <div class="container">
                <div class="row">
                    <div class="col-xs-6 col-xs-offset-3">
                        <div class="form-wrap">
                        <h1>Inscription</h1>
                            <form role="form" action="registration.php" method="post" id="login-form" autocomplete="off">
                                <div class="form-group">
                                    <label for="username" class="sr-only">identifiant</label>
                                    <input type="text" name="username" id="username" class="form-control" placeholder="Entrer un identifiant">
                                </div>
                                <div class="form-group">
                                    <label for="email" class="sr-only">Email</label>
                                    <input type="email" name="email" id="email" class="form-control" placeholder="lorem@ipsum.com">
                                </div>
                                <div class="form-group">
                                    <label for="password" class="sr-only">Mot de passe</label>
                                    <input type="password" name="password" id="key" class="form-control" placeholder="Mot de passe">
                                </div>
                        
                                <input type="submit" name="submit" id="btn-login" class="btn btn-custom btn-lg btn-block" value="S'inscrire">
                            </form>
                            <h5 class="text-center"><?php
                                echo $message;
                            ?></h5>
                        </div>
                    </div> <!-- /.col-xs-12 -->
                </div> <!-- /.row -->
            </div> <!-- /.container -->
        </section>

        <hr>

<?php include "includes/footer.php" ?>
