<?php
    $host = 'localhost';
    $db = 'baldeo';
    $user = 'root';
    $pass = '';
    $charset = 'utf8mb4';

    // Establishing the PDO connection
    try {
        $dsn = "mysql:host=$host;dbname=$db;charset=$charset";
        $pdo = new PDO($dsn, $user, $pass);
        echo "Connected";
    } catch (PDOException $e) {
        echo "Connection failed: " . $e->getMessage();
    }
?>


<?php
    if (isset($_POST['lastname'])) {
        $ln = $_POST['lastname'];
        $fn = $_POST['firstname'];
        $mn=$_POST['middlename'];

        echo "$ln, $fn $mn";
        // Insert the data into the database
        $sql = "INSERT INTO personal_data (lastname, firstname, middlename) VALUES (:ln, :fn, :mn)";
        $stmt = $pdo->prepare($sql);
        $stmt->execute(['ln' => $ln, 'fn' => $fn, 'mn' => $mn]);
        echo "<br>Data inserted successfully!<hr>";
    }
 ?>

<?php 
    $sql = "SELECT id, lastname, firstname, middlename FROM personal_data"; 
    $stmt = $pdo->query($sql); 
    $rows = $stmt->fetchAll(); 

    if (isset($_GET['del'])) {
        $code = $_GET['del']; 
        $sql = "DELETE FROM personal_data WHERE id = :id"; 
        $stmt = $pdo->prepare($sql);
        $stmt->execute(['id' => $code]); 
        echo "<br>Data deleted successfully!<hr>"; 
    }
?>

<?php
    $ln = $fn = $mn = " "; 
    if (isset($_GET['edit'])) { 
        $ed = $_GET['edit']; 

        $sql = "SELECT id, firstname, middlename, lastname FROM personal_data WHERE id = :id"; 
        $stmt = $pdo->prepare($sql); 
        $stmt->execute(['id' => $ed]); 
        $rows1 = $stmt->fetchAll(); 
        foreach ($rows1 as $row2) { 
            $ln = $row2['lastname']; 
            $fn = $row2['firstname']; 
            $mn=$row2['middlename']; 
        } 
    }

?>

<style>
	.container {
		display: grid; /* Enables Grid Layout */
		grid-template-columns: 2fr 2fr; /* Two equal columns */
		gap: 10px; /* Adds space between the divs */
	}
	.box {
		padding: 20px;
		background-color: white;
		text-align: center;
	}
</style>

	<div class = "container">

		<div class="box">

            <form method="post" action="index.php">

                LastName: <input type="text" name="lastname" value="<?php if (isset($_GET['edit'])) { echo $ln; } ?>">
                <br><br>

                FirstName: <input type="text" name="firstname" value="<?php if (isset($_GET['edit'])) { echo $fn; } ?>">
                <br><br>

                MiddleName: <input type="text" name="middlename" value="<?php if (isset($_GET['edit'])) { echo $mn; } ?>">
                <br><br>
                
                <input type="submit" name="submit" value="Submit">  
                <a href=”index.php”><button type=”button”>New Submission</button></a>
            </form>
                
            <!-- <button type="submit">Submit</button>  -->
             
		</div>


		<div class="box">
			
            <table style="width:100%" border="1" style="margin: 20px">
                <tr>
                    <th>LN</th>
                    <th>FN</th>
                    <th>MN</th>
                    <th>Action</th>
                </tr>

                <?php foreach ($rows as $row): ?> 
                    <tr> 
                        <td><?= $row['lastname']; ?></td> 
                        <td><?= $row['firstname']; ?></td> 
                        <td><?= $row['middlename']; ?></td> 
                        <td><a href="?edit=<?= $row['id']; ?>">EDIT</a> | <a href="?del=<?= $row['id']; ?>">DELETE</a></td> 

                    </tr> 
                <?php endforeach; ?>
            </table>    

		</div>

	</div>
   

