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

<!-- [EDIT, SUBMIT & DELETE] -->
<?php

// Initialize arrays for columns and placeholders
    $columnsArray = [];
    $placeholdersArray = [];
    $values = [];
    $dataID = "";
    
    foreach ($columns as $column) {
        if ($column !== 'id') { // Skip 'id' if it's auto-increment
            $columnsArray[] = $column; // Add column name
            $placeholdersArray[] = ":$column"; // Add placeholder
            $values[$column] = $_POST[$column] ?? null; // Check if POST value exists
        }
    }  

// [CREATE]
    if (isset($_POST['submit'])) {

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

// [UPDATE]  

    //fetch the data from table to text field
    if (isset($_GET['edit'])) { 
        $ed = $_GET['edit']; 
    
        // Build the SQL query dynamically
        $columnsString = implode(", ", $columns); // Use the existing $columns array
        $sql = "SELECT * FROM $selectedTable WHERE id = :id";
    
        // Prepare and execute the statement
        $stmt = $pdo->prepare($sql);
        $stmt->execute(['id' => $ed]);
        $rowToEdit = $stmt->fetch(PDO::FETCH_ASSOC);
    
        // Populate the text fields with fetched data
        if ($rowToEdit) {
            foreach ($columns as $column) {
                if ($column !== 'id') { // Skip the 'id' column
                    // Pre-fill the text fields with data
                    echo "<script>
                        document.getElementById('$column').value = " . json_encode($rowToEdit[$column]) . ";
                    </script>";
                }
            }
        }
    }

    // update the record
    if (isset($_POST['update'])) {
        // Get the ID from the hidden input
        if (isset($_POST['id'])) {
            $updateId = $_POST['id'];  // Get the ID from the form
        } else {
            echo "<p>No ID provided for update.</p>";
            exit;
        }

        // Prepare the columns and their updated values
        $updateColumns = [];
        $updateValues = [];
        
        foreach ($columns as $column) {
            if ($column !== 'id') { // Skip 'id' column
                // Add column and its new value from POST data
                $updateColumns[] = "$column = :$column";
                $updateValues[$column] = $_POST[$column] ?? null; // Use form data
            }
        }

        // Build the SQL query to update the record
        $setString = implode(", ", $updateColumns); // Prepare the SET part of the query
        $sql = "UPDATE $selectedTable SET $setString WHERE id = :id";

        // Add the ID of the record to the values array
        $updateValues['id'] = $updateId;

        try {
            // Execute the prepared statement
            $stmt = $pdo->prepare($sql);
            $stmt->execute($updateValues);

            // Provide feedback to the user
            echo "<p>Data successfully updated in the table '$selectedTable'.</p>";

            // Redirect to the same page to show the updated data
            header("Location: ?table_name=" . urlencode($selectedTable));
            exit;
        } catch (PDOException $e) {
            echo "<p>Error updating data: " . $e->getMessage() . "</p>";
        }
    }

// [DELETE]
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
                                <a href="?table_name=<?= urlencode($selectedTable); ?>&edit=<?= $row['id']; ?>" onclick="toggleButtons()">Edit</a> |
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

<h2><center>Submit Form</center></h2>

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
                        <td class="form-table">
                            <label for="<?= htmlspecialchars($column); ?>"><?= ucfirst(str_replace('_', ' ', $column)); ?>:</label>
                        </td>
                        <td class="form-table">
                            <input 
                                type="text" 
                                id="<?= htmlspecialchars($column); ?>" 
                                name="<?= htmlspecialchars($column); ?>"
                                value="<?php 
                                    if (isset($rowToEdit[$column])) {
                                        echo htmlspecialchars($rowToEdit[$column]);
                                    }
                                ?>"
                                placeholder="Enter <?= htmlspecialchars($column); ?>" 
                                style="width: 100%;"
                                required>
                        </td>
                    </tr>
                <?php endif; ?>
            <?php endforeach; ?>

            <!-- Hidden input for the ID: Use to access the ID when Updating the database -->
            <?php if (isset($rowToEdit['id'])): ?>
                <input type="hidden" name="id" value="<?= htmlspecialchars($rowToEdit['id']); ?>">
            <?php endif; ?>

            <tr class="form-table">
                <td colspan="2" style="text-align: center;">
                    <br>

                    <!-- Submit button (Visible by default) -->
                    <input 
                        type="submit" 
                        id="submit-button" 
                        name="submit" 
                        value="Submit">

                    <!-- Update button (Hidden by default) -->
                    <input 
                        type="submit" 
                        id="update-button" 
                        name="update" 
                        value="Update" 
                        style="display: none;">

                    <!-- Cancel button (go back to default)-->
                    <button 
                        type="button" 
                        id="cancel-button" 
                        onclick="resetForm()"
                        style="display: none;">
                        Cancel
                    </button>

                </td>
            </tr>
        </table>
    </form>

</div>


<!-- [STYLES] -->

<style>
    .table-container {
        height: 50%;
        overflow-y: auto; 
        width: 90%; 
        margin: auto;
        margin-top: 25px;
    }

    .form-container{
        width: 50%; 
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

    thead {
        position: sticky; /* Keep the header fixed */
        top: 0; /* Align the sticky header to the top */
        z-index: 2; /* Ensure it stays above table content */
    }

    tr.display-table:hover {
        background-color: lightyellow !important; /* Light gray color when hovered */
        font-weight: bold;
    }

    .drop-button select {
        font-size: 16px; /* Increases the font size */
        padding: 10px;   /* Adds more space inside the dropdown */
        width: 200px;    /* Sets a wider dropdown width */
        height: 50px;    /* Sets a taller dropdown height */
        border-radius: 8px; /* Optional: Rounds the corners */
        border: 2px solid #ccc; /* Optional: Adds a border for better visibility */
    }

    input[type="submit"], #cancel-button {
    font-size: 16px; /* Makes the text larger */
    padding: 10px 20px; /* Adds more space inside the button */
    width: auto; /* Allows the button to size dynamically based on the text */
    height: auto; /* Sets a specific height */
    border-radius: 8px; /* Optional: Rounds the corners */
    background-color: #4CAF50; /* Optional: Sets a background color */
    color: white; /* Sets the text color */
    border: none; /* Removes the default border */
    cursor: pointer; /* Changes the cursor to a pointer on hover */
    }

    input[type="submit"]:hover {
        background-color: #45a049; /* Changes the background color on hover */
        font-weight: bold; /* Makes the text bold on hover */
        transform: scale(1.1); /* Slightly enlarges the button on hover */
    }

    a {
        color: #007bff; /* Set the color of the link */
        text-decoration: none; /* Optional: Remove underline */
    }

    a:visited {
        color: #007bff; /* Keep the same color as normal state after visiting */
    }
    
</style>


<!-- [SCRIPTS] -->

<script>
    // Function to toggle buttons to "Edit" mode
    function toggleButtons() {
        const submitButton = document.getElementById('submit-button');
        const updateButton = document.getElementById('update-button');
        const cancelButton = document.getElementById('cancel-button');

        // Hide the submit button, show the update and cancel buttons
        submitButton.style.display = 'none';
        updateButton.style.display = 'inline-block';
        cancelButton.style.display = 'inline-block';
    }

    // Function to reset the form and toggle buttons to the default state
    function resetForm() {
        const submitButton = document.getElementById('submit-button');
        const updateButton = document.getElementById('update-button');
        const cancelButton = document.getElementById('cancel-button');

        // Reset form fields
        document.querySelector('form').reset();

        // Reset button visibility
        submitButton.style.display = 'inline-block';
        updateButton.style.display = 'none';
        cancelButton.style.display = 'none';

        // Remove the "edit" parameter from the URL
        const url = new URL(window.location.href);
        url.searchParams.delete('edit');
        window.history.replaceState({}, document.title, url);
    }

    // Automatically toggle buttons to "Edit" mode if the URL contains 'edit'
    document.addEventListener('DOMContentLoaded', function() {
        const urlParams = new URLSearchParams(window.location.search);
        if (urlParams.has('edit')) {
            toggleButtons();
        }
    });
    
</script>