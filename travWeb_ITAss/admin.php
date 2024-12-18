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
        $selectedTable = isset($_GET['table_name']) ? $_GET['table_name'] : 'personal_data';;
        
    // Fetch column names of the selected table
        $query = $pdo->query("DESCRIBE $selectedTable");
        $columns = $query->fetchAll(PDO::FETCH_COLUMN);

    // [READ] Fetch the data [rows] of the selected table
        $dataQuery = $pdo->query("SELECT * FROM $selectedTable");
        $rows = $dataQuery->fetchAll(PDO::FETCH_ASSOC);
?>

<!--[CREATE] again 90% chatgpt algorithm 10% mine :< -->

<?php
    if (isset($_POST['submit'])) {

    // Initialize arrays for columns and placeholders
        $columnsArray = [];
        $placeholdersArray = [];
        $values = [];
        
        foreach ($columns as $column) {
            if ($column !== 'id') { // Skip 'id' if it's auto-increment
                $columnsArray[] = $column; // Add column name
                $placeholdersArray[] = ":$column"; // Add placeholder
                $values[$column] = $_POST[$column] ?? null; // Check if POST value exists
            }
        }  

        // Build the SQL query dynamically
        $columnsString = implode(", ", $columnsArray);
        $placeholdersString = implode(", ", $placeholdersArray);
        $sql = "INSERT INTO $selectedTable ($columnsString) VALUES ($placeholdersString)";

        try {
            $stmt = $pdo->prepare($sql);
            $stmt->execute($values);
            echo "<p>Data successfully added to the table '$selectedTable'.</p>";
            
            // Reload the page to show updated data
            header("Location: ?table_name=" . urlencode($selectedTable));
            exit;
        } catch (PDOException $e) {
            echo "<p>Error inserting data: " . $e->getMessage() . "</p>";
        }
    }
?>

<!-- [DELETE] -->
<?php
    if (isset($_GET['del'])) {
        $code = $_GET['del']; 
        $sql = "DELETE FROM $selectedTable WHERE id = :id"; 
        $stmt = $pdo->prepare($sql);
        $stmt->execute(['id' => $code]); 
        echo "<br>Data deleted successfully!<hr>"; 

        // remain in the same table
        header("Location: ?table_name=" . urlencode($selectedTable)); 
        exit;
    }
?>

<!-- [UPDATE] -->
<?php
    // code for update
?>

<!-- [DROP BUTTON] start drop down tables-->

    <form class="drop-button"method="GET">
        <select name="table_name" onchange="this.form.submit()">

            <!--generate all the table options from the database in the drop down button-->
            <?php foreach ($tables as $table): ?>
                <option value="<?= htmlspecialchars($table); ?>" <?= $selectedTable === $table ? 'selected' : '' ?>><?= htmlspecialchars($table); ?></option>
            <?php endforeach;?>
        </select>
    </form>
<!-- [DROP BUTTON] end drop down table -->

<!-- [DISPLAY] start table -->
    <div class="table-container">
        <table class="display-table">
            <thead>
                <tr class="display-table">
                    <!--create number of columns identical to the number of columns of the table + the action column-->
                    <?php foreach ($columns as $column): ?>
                        <?php if ($column !== 'id'): ?> <!-- Skip the 'id' column -->
                            <th class="display-table"><?= htmlspecialchars($column); ?></th>
                        <?php endif; ?>
                    <?php endforeach; ?>
                    <th class="display-table"> Action </th>
                </tr>
            </thead>

            <tbody>
            <!-- if there is not fetched data, just display "No data"-->
                <?php if (empty($rows)): ?> 
                    <tr class="display-table">
                        <td class="display-table" colspan=100% style="text-align:center; width:100%;">No Data</td>
                    </tr>

                <?php else: ?>
                <!-- display the fetched data using for loops -->
                    <?php foreach ($rows as $row): ?>
                        <tr class="display-table">
                            <?php foreach ($columns as $column): ?>
                                <?php if ($column !== 'id'): ?> <!-- Skip the 'id' column -->
                                    <td class="display-table"><?= htmlspecialchars($row[$column]); ?></td>
                                <?php endif; ?>
                            <?php endforeach; ?>
                            <td class="display-table">
                                <a href="?table_name=<?= urlencode($selectedTable); ?>&edit=<?= $row['id']; ?>">Edit</a> |
                                <a href="?table_name=<?= urlencode($selectedTable); ?>&del=<?= $row['id']; ?>">Delete</a>
                            </td>
                        </tr>
                    <?php endforeach; ?>
                <!-- end of for loop -->
                <?php endif; ?>
            </tbody>
        </table>
    </div>
<!-- [DISPLAY] end table    -->

<br><br>

<!--Forms... -->
<div class="form-container">
    <form method="POST" action="admin.php?table_name=<?= urlencode($selectedTable); ?>"> <!-- HIGHLIGHT: IMPORTANT SCRIPT TO PASS THE DATA...-->
        <table class="form-table">
            <tr class="form-table">
                <th class="form-table">Columns</th>
                <th class="form-table">Input</th>
            </tr>

            <!-- Dynamically create input fields based on columns -->
            <?php foreach ($columns as $column): ?>
                
                <?php if ($column !== 'id'): ?> <!-- Skip the 'id' column -->
                    <tr class="form-table">
                        <td class="display-table">
                            <label for="<?= htmlspecialchars($column); ?>"><?= ucfirst(str_replace('_', ' ', $column)); ?>:</label>
                        </td>
                        <td class="form-table">
                            <input 
                                type="text" 
                                id="<?= htmlspecialchars($column); ?>" 
                                name="<?= htmlspecialchars($column); ?>"
                                placeholder="Enter <?= htmlspecialchars($column); ?>" 
                                required>
                        </td>
                    </tr>
                <?php endif; ?>
            <?php endforeach; ?>

            <tr class="form-table">
                <td colspan="2" style="text-align: center;">
                    <br>
                    <input type="submit" name="submit" value="Submit">
                </td>
            </tr>
        </table>
    </form>

</div>

<style>
    .table-container {
        max-height: 50%;
        overflow-y: auto; 
        width: 90%; 
        margin: auto;
        margin-top: 25px;
    }

    .form-container{
        width: 90%; 
        margin: auto;
    }

    table.form-table{
        border-collapse: collapse;
        width: 100%;
        table-layout: fixed;
    }

    th.form-table, td.form-table{
        border: 1px solid black;
        padding: 5px;
    }

    tr.display-table:nth-child(even) {
        background-color: #D6EEEE;
    }

    th.display-table, td.display-table{
        border: 1px solid black;
        padding: 5px;
        width: calc(100% / (<?= count($columns) ?> - 1)); /* Dynamic width for other columns */
    }

    table.display-table{
        border-collapse: collapse;
        margin: auto;
        width: 100%;
        table-layout: fixed;
    }

    th{
        background-color: lightgray;
        padding: 10px;
    }

    form.drop-button{
        margin-left: 5%
    }

    td.display-table:last-child, th.display-table:last-child {
        width: 150px;
        position: sticky;
        right: 0;
        background-color: white;
        text-align: center;
    }
    
</style>