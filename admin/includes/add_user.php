<?php
    if (isset($_POST['create_user'])) {
        $user_firstname = $_POST['user_firstname'];
        $user_lastname = $_POST['user_lastname'];
        $user_role = $_POST['user_role'];
        $username = $_POST['username'];
        $user_email = $_POST['user_email'];
        $user_password = $_POST['user_password'];

        $query = "INSERT INTO users(username, user_password, user_firstname, 
        user_lastname, user_email, user_role) ";
        $query .= "VALUES('$username', '$user_password', '$user_firstname', 
        '$user_lastname', '$user_email', '$user_role')";

        $add_user_result = mysqli_query($connection, $query);
        confirm($add_user_result);
    }
?>

<form action="" method="post" enctype="multipart/form-data">

    <div class="form-group">
        <label for="title">Prénom(s)</label>
        <input type="text" class="form-control" name="user_firstname">
    </div>
    
    <div class="form-group">
        <label for="title">Nom(s)</label>
        <input type="text" class="form-control" name="user_lastname">
    </div>

    <div class="form-group">
        <select name="user_role">
            <option value="subscriber">Choisir rôle</option>
            <option value="admin">Admin</option>
            <option value="subscriber">Abonné</option>
        </select>
    </div>

    <div class="form-group">
        <label for="author">Identifiant</label>
        <input type="text" class="form-control" name="username">
    </div>

    <div class="form-group">
        <label for="status">Email</label>
        <input type="email" class="form-control" name="user_email">
    </div>

    <div class="form-group">
        <label for="post_tags">Mot de passe</label>
        <input type="password" class="form-control" name="user_password">
    </div>

    <div class="form-group">
        <input type="submit" class="btn btn-primary" name="create_user" value="Créer l'utilisateur">
    </div>

</form>

<?php
    if (isset($_POST['create_user'])) {
        if ($add_user_result) {
            echo "<h4>Utilisateur crée avec succès</h4>";
        }
    }
?>