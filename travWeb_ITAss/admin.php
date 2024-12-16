<?php
    $host = 'localhost';
    $db = 'hipolito';   //change this to the name of your db
    $user = 'root';
    $pass = '';
    $charset = 'utf8mb4';

    // Establishing the PDO connection
    try {
        $dsn = "mysql:host=$host;dbname=$db;charset=$charset";
        $pdo = new PDO($dsn, $user, $pass);
    } catch (PDOException $e) {
        echo "Connection failed: " . $e->getMessage();
    }

    //fetch table names from the database
        $query = $pdo->query("SHOW TABLES");
        $tables = $query->fetchAll(PDO::FETCH_COLUMN);

    //select a table on the drop down (form)
    $tableName = isset($_GET['table_name']) ? $_GET['table_name'] : 'personal_data';
        
    // Fetch column names of the selected table
        $query = $pdo->query("DESCRIBE $tableName");
        $columns = $query->fetchAll(PDO::FETCH_COLUMN);

    // [READ] Fetch the data [rows] of the selected table
        $dataQuery = $pdo->query("SELECT * FROM $tableName");
        $rows = $dataQuery->fetchAll(PDO::FETCH_ASSOC);

?>

<!-- [DELETE] -->
<?php
    if (isset($_GET['del'])) {
        $code = $_GET['del']; 
        $sql = "DELETE FROM $tableName WHERE id = :id"; 
        $stmt = $pdo->prepare($sql);
        $stmt->execute(['id' => $code]); 
        echo "<br>Data deleted successfully!<hr>"; 

        // remain in the same table
        header("Location: ?table_name=" . urlencode($tableName)); 
        exit;
    }
?>

<!-- [UPDATE] -->
<?php
    // code for update
?>

<style>
    tr:nth-child(even) {
        background-color: #D6EEEE;
    }
    table, th, td{
        border: 1px solid black;
    }
    table{
        border-collapse: collapse;
        width: 90%;
        margin: auto;
        margin-top: 25px;
    }
    th{
        background-color: lightgray;
        padding: 10px;
    }
    form{
        margin-left: 5%
    }


</style>

<!-- [DROP BUTTON] start drop down tables
    still tring to improve the drop down ()-->

    <form method="GET">
        <select name="table_name" onchange="this.form.submit()">

            <!--generate all the table options from the database in the drop down button-->
            <?php foreach ($tables as $table): ?>
                <option value="<?= htmlspecialchars($table); ?>" <?= $tableName === $table ? 'selected' : '' ?>><?= htmlspecialchars($table); ?></option>
            <?php endforeach; ?>

        </select>
    </form>
<!-- [DROP BUTTON] end drop down table -->

<!-- [DISPLAY] start table -->
    <table>
        <thead>
            <tr>
                <!--create number of columns identical to the number of columns of the table + the action column-->
                <?php foreach ($columns as $column): ?>
                    <?php if ($column !== 'id'): ?> <!-- Skip the 'id' column -->
                        <th><?= htmlspecialchars($column); ?></th>
                    <?php endif; ?>
                <?php endforeach; ?>
                <th> Action </th>
            </tr>
        </thead>

        <tbody>
        <!-- if there is not fetched data, just display "No data"-->
            <?php if (empty($rows)): ?> 
                <tr>
                    <td colspan=100% style="text-align:center">No Data</td>
                </tr>

            <?php else: ?>
            <!-- display the fetched data using for loops -->
                <?php foreach ($rows as $row): ?>
                    <tr>
                        <?php foreach ($columns as $column): ?>
                            <?php if ($column !== 'id'): ?> <!-- Skip the 'id' column -->
                                <td><?= htmlspecialchars($row[$column]); ?></td>
                            <?php endif; ?>
                        <?php endforeach; ?>
                        <td>
                            <a href="?table_name=<?= urlencode($tableName); ?>&edit=<?= $row['id']; ?>">Edit</a> |
                            <a href="?table_name=<?= urlencode($tableName); ?>&del=<?= $row['id']; ?>">Delete</a>
                        </td>
                    </tr>
                <?php endforeach; ?>
            <!-- end of for loop -->
            <?php endif; ?>
        </tbody>
    </table>
<!-- [DISPLAY] end table    -->

<!--Forms... -->