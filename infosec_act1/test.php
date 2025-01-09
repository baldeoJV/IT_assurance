<?php 
ob_start();
?>
<?php if ($_SERVER["REQUEST_METHOD"] == "POST"): ?>
    <div class="results-section">
        <h2>Recommended Activities Based on Your Preferences</h2>
        <?php if (!empty($all_results)): ?>
            <?php 
            $grouped_results = [];
            foreach ($all_results as $row) {
                $grouped_results[$row['City']][] = $row;
            }

            foreach ($grouped_results as $city_place => $results): 
                ob_start(); // Start output buffering for each city
            ?>
                <div class="city-results">
                    <!-- button for each city -->
                    <button onclick="window.location.href='email.php'" 
                        style="
                            align-items: center;
                            background-color: #fff;
                            border-radius: 12px;
                            border: 1px solid #121212 !important;
                            box-shadow: transparent 0 0 0 3px, rgba(18, 18, 18, .1) 0 6px 20px;
                            box-sizing: border-box;
                            color: #121212;
                            cursor: pointer;
                            display: inline-flex;
                            flex: 1 1 auto;
                            font-family: Inter, sans-serif;
                            font-size: 1.2rem;
                            font-weight: 700;
                            justify-content: center;
                            line-height: 1;
                            margin: 0;
                            outline: none;
                            padding: 1rem 1.2rem;
                            text-align: center;
                            text-decoration: none;
                            transition: box-shadow .2s, -webkit-box-shadow .2s;
                            white-space: nowrap;
                            border: 0;
                            user-select: none;
                            -webkit-user-select: none;
                            touch-action: manipulation;">
                            <?php echo $city_place; ?>
                        </button>

                    <!-- results container for each city -->
                    <div style="display: grid; grid-template-columns: repeat(auto-fill, minmax(300px, 1fr)); gap: 20px; padding: 20px; margin-top: 30px;">
                        <?php foreach ($results as $row): ?>
                            <div style="border: 1px solid #ddd; border-radius: 8px; padding: 15px; background-color: #f9f9f9;">
                                <h3 style="margin: 0; font-size: 18px; color: #333;"><?php echo $row['ActivityName']; ?></h3>
                                <p style="margin: 5px 0;"><strong>Location:</strong> 
                                    <?php echo ($row['Municipality'] ? $row['Municipality'] . " - " . $row['Attraction'] : "Various locations"); ?>
                                </p>
                                <p style="margin: 5px 0;"><strong>Type:</strong> <?php echo $row['Profile']; ?></p>
                                <p style="margin: 5px 0;"><strong>Environment:</strong> <?php echo $row['Environment']; ?></p>
                                <p style="margin: 5px 0;"><strong>Pace:</strong> <?php echo $row['Pacing']; ?></p>
                                <p style="margin: 5px 0;"><strong>Transportation:</strong> <?php echo $row['Transportation']; ?></p>
                                <p style="margin: 5px 0;"><strong>Fee:</strong> PHP <?php echo number_format($row['Fee'], 2); ?></p>
                                <p style="margin: 5px 0;"><strong>Accommodation Type:</strong> <?php echo $row['Type']; ?></p>
                                <p style="margin: 5px 0;"><strong>Accommodation Cost:</strong> PHP <?php echo number_format($row['Cost'], 2); ?></p>
                            </div>
                        <?php endforeach; ?>
                    </div>
                </div>

                <hr>
            <?php 
                // Capture the HTML for this iteration
                $cityHtmlContent = ob_get_clean();

                // Generate a unique file name for this city
                $fileName = 'results_' . preg_replace('/[^a-zA-Z0-9]/', '_', $city_place) . '.html';

                // Save the HTML content to the file
                file_put_contents($fileName, $cityHtmlContent);

                // Output the content to the browser as well
                echo $cityHtmlContent;
            endforeach; 
            ?>
        <?php else: ?>
            <div class="no-results">
                <p>There are no matching results for your preferences.</p>
                <p>You might like these instead.</p>
            </div>
        <?php endif; ?>
    </div>
<?php endif; ?>
