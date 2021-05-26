<?php

    global $connection;
    if (isset($_POST['create_post'])) {
        $post_title = $_POST['title'];
        $post_author = $_POST['author'];
        $post_category_id = $_POST['post_category'];
        $post_status = $_POST['post_status'];
        $post_image = $_FILES['image']['name'];
        $post_image_temp = $_FILES['image']['tmp_name'];
        $post_tags = $_POST['post_tags'];
        $post_content = $_POST['post_content'];
        $post_date = date('d-m-y HH:mm:ss');

        move_uploaded_file($post_image_temp, "../images/$post_image");
        $query = "INSERT INTO posts(post_category_id, post_title, post_author, post_date
        , post_image, post_content, post_tags, post_status) ";
        $query .= "VALUES($post_category_id, '$post_title', '$post_author', now(), '$post_image', 
        '$post_content', '$post_tags', '$post_status')";

        $result = mysqli_query($connection, $query);
        confirm($result);
    }
?>

<form action="" method="post" enctype="multipart/form-data">

    <div class="form-group">
        <label for="title">Titre</label>
        <input type="text" class="form-control" name="title">
    </div>

    <div class="form-group">
        <label for="category_id">Catégorie</label>
        <br>
        <select name="post_category" id="">
            <?php
                $query = "SELECT * FROM categories";
                $result = mysqli_query($connection, $query);
                if (!$result) {
                    die('La requête a échoué ' . mysqli_error($connection));
                }
                
                while ($row = mysqli_fetch_assoc($result)) {
                    $cat_id = $row['cat_id'];
                    $cat_title = $row['cat_title'];
                    echo "<option value='$cat_id'>$cat_title</option>";
                }
            ?>
        </select>
    </div>

    <div class="form-group">
        <label for="author">Auteur</label>
        <input type="text" class="form-control" name="author">
    </div>

    <div class="form-group">
        <label for="status">Statut</label>
        <select name="post_status">
            <option value="draft">Brouillon</option>
            <option value="published">Publié</option>
        </select>
    </div>

    <div class="form-group">
        <label for="image">Photo</label>
        <input type="file" name="image">
    </div>

    <div class="form-group">
        <label for="post_tags">Tags</label>
        <input type="text" class="form-control" name="post_tags">
    </div>

    <div class="form-group">
        <label for="post_content">Contenu</label>
        <textarea class="form-control" name="post_content" id="" cols="30" rows="10">
        </textarea>
    </div>

    <div class="form-group">
        <input type="submit" class="btn btn-primary" name="create_post" value="Publier">
    </div>

</form>

<?php
    if (isset($_POST['create_post'])) {
        if ($result) {
            echo "<h4>L'article a été publié avec succès</h4>";
        }
    }
?>