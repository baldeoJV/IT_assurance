<?php
// Database connection
$servername = "localhost";
$username = "root";
$password = "";
$dbname = "travel_db";

// Create connection
$conn = new mysqli($servername, $username, $password, $dbname);

// Check connection
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

// Function to sanitize input
function sanitize_input($data) {
    $data = trim($data);
    $data = stripslashes($data);
    $data = htmlspecialchars($data);
    return $data;
}

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    // Process form submission
    $results = null;
    $all_results1 = [];
    $all_results2 = [];

    // Get and sanitize form inputs
    error_reporting(0);
    $vacation_preference = sanitize_input($_POST['vacation_preference_q1']);
    $activity_preference = sanitize_input($_POST['activity_preference_q2']);
    $trip_pace = sanitize_input($_POST['trip_pace_q3']);
    $accommodation_budget = sanitize_input($_POST['accommodation_budget_q4']);
    $activity_budget = sanitize_input($_POST['activity_budget_q5']);
    $environment_preference = sanitize_input($_POST['environment_preference_q6']);
    $location_preference = sanitize_input($_POST['location_preference_q7']);
    $transport_preference = sanitize_input($_POST['transport_preference_q8']); 

    $cities = array("palawanattractions", "cebuattractions", "boholattractions", "davaoattractions", "boracayattractions");

    foreach ($cities as $city) {

        // Build the SQL query with filters
        $sql = "WITH city_accomodation_union AS (
            SELECT $city.AttractionID, accomodations.City, $city.Municipality, $city.Attraction, $city.PopularSecluded, $city.Budget, accomodations.Cost, accomodations.Type
            FROM $city
            JOIN accomodations
            ON $city.Municipality = accomodations.Municipality
            )

            SELECT city_accomodation_union.AttractionID, city_accomodation_union.City, city_accomodation_union.Municipality, city_accomodation_union.Attraction, city_accomodation_union.PopularSecluded, city_accomodation_union.Type,
                activities.ActivityName, activities.Profile, activities.TravelerPreference, activities.Pacing, activities.Environment, activities.Transportation, activities.Fee, city_accomodation_union.Cost
            FROM city_accomodation_union
            JOIN activities
            ON city_accomodation_union.AttractionID = activities.AttractionID
            WHERE 1=1";

        //Q1 Profile (activities)
        if ($vacation_preference) {
            $sql .= " AND activities.Profile LIKE '%$vacation_preference%'";
        }
        
        // Q2 Travel Preference (activities)
        if ($activity_preference) {
            $sql .= " AND activities.TravelerPreference LIKE '%$activity_preference%'";
        }
    
        // Q3 Pacing (activities)
        if ($trip_pace) {
            $sql .= " AND activities.Pacing LIKE '%$trip_pace%'";
        }

        // Q4 Accommodation Budget (attractions)
        if ($accommodation_budget) {
            $sql .= " AND city_accomodation_union.Type LIKE '%$accommodation_budget%'";
        }

        // Q5: Convert activity budget to price ranges
        $max_fee = 0;
        switch($activity_budget) {
            case 'Very budget friendly':
                $max_fee = 1000;
                break;
            case 'Moderate':
                $max_fee = 2500;
                break;
            case 'Higher end':
                $max_fee = 999999;
                break;
        }

        if ($max_fee > 0) {
            $sql .= " AND activities.Fee <= $max_fee";
        }

        // Q6: Environment (activities)
        if ($environment_preference) {
            $sql .= " AND activities.Environment LIKE '%$environment_preference%'";
        }
    
        // Q7: Popularity (city)
        if ($location_preference) {
            $sql .= " AND city_accomodation_union.PopularSecluded LIKE '%$location_preference%'";
        }

        // Q8: Transportation (activities)
        if ($transport_preference) {
            $sql .= " AND activities.Transportation LIKE '%$transport_preference%'";
        }

        $sql .= " ORDER BY RAND() LIMIT 10";

        // Execute query
        $results = $conn->query($sql);
        // print_r($results);

        if ($results && $results->num_rows > 0) {
            while ($row = $results->fetch_assoc()) {
                $all_results1[] = $row; // Store all rows from all cities
            }
        }      
    } 
    
    // if no results are found, try to find activities that might pique the user's interest
    if (empty($all_result1)) {

        foreach ($cities as $city) {
    
            // Build the SQL query with filters
            $sql = "WITH city_accomodation_union AS (
                SELECT $city.AttractionID, accomodations.City, $city.Municipality, $city.Attraction, $city.PopularSecluded, $city.Budget, accomodations.Cost, accomodations.Type
                FROM $city
                JOIN accomodations
                ON $city.Municipality = accomodations.Municipality
                )
    
                SELECT city_accomodation_union.AttractionID, city_accomodation_union.City, city_accomodation_union.Municipality, city_accomodation_union.Attraction, city_accomodation_union.PopularSecluded, city_accomodation_union.Type,
                    activities.ActivityName, activities.Profile, activities.TravelerPreference, activities.Pacing, activities.Environment, activities.Transportation, activities.Fee, city_accomodation_union.Cost
                FROM city_accomodation_union
                JOIN activities
                ON city_accomodation_union.AttractionID = activities.AttractionID
                WHERE 1=1";
    
            //Q1 Profile (activities)
            if ($vacation_preference) {
                $sql .= " AND activities.Profile LIKE '%$vacation_preference%'";
            }
            
        
            // Q7: Popularity (city)
            if ($location_preference) {
                $sql .= " AND city_accomodation_union.PopularSecluded LIKE '%$location_preference%'";
            }
    
            $sql .= " ORDER BY RAND() LIMIT 10";

            // Execute query
            $results = $conn->query($sql);
            // print_r($results);
    
            if ($results && $results->num_rows > 0) {
                while ($row = $results->fetch_assoc()) {
                    $all_results2[] = $row; // Store all rows from all cities
                }
            }      
        } 
    }
}
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Travel Preferences</title>
    <link rel="stylesheet">
    <link href='https://fonts.googleapis.com/css?family=Yeseva One' rel='stylesheet'>

    <script type="text/javascript" src="https://cdn.jsdelivr.net/jquery/latest/jquery.min.js"></script>
    <script type="text/javascript" src="https://cdn.jsdelivr.net/momentjs/latest/moment.min.js"></script>
    <script type="text/javascript" src="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.min.js"></script>
    <link href="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.css" rel="stylesheet" type="text/css" />
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" />
    <link rel="stylesheet" href="styles.css">

    <style>
        /* This selector establishes the whole basis of the website */

        /* date style */

        [type="text"] {
            background:#fff url(https://cdn1.iconfinder.com/data/icons/cc_mono_icon_set/blacks/16x16/calendar_2.png)  97% 50% no-repeat ;
        }
        [type="text"]::-webkit-inner-spin-button {
            display: none;
        }
        [type="text"]::-webkit-calendar-picker-indicator {
            opacity: 0;
        }

    </style>

</head>
    <body>
        <div class="parallax-content baner-content" id="home">
            <div class="first-content-container">
                <div class="first-content-header">
                    <div></div>
                    <button onclick="window.location.href='admin.php'">Admin</button>
                </div>

                <div class="first-content">
                    <div class="first-content-left">
                        <h1>Love the Philippines</h1>
                        <span>Tara na sa pilipinas!</span>
                    </div>
                    
                    <div class="first-content-right">
                        <div class="box-container">
                            <div class="box">
                                <p>Palawan <br> <strong>Philippines</strong></p>
                            </div>
                            <p class="description">Palawan is a stunning province in the Philippines that offers visitors a chance to explore some of the most beautiful natural wonders in the world.</p>
                        </div>

                        <div class="box-container">
                            <div class="box">
                                <p>Bohol <br> <strong>Philippines</strong></p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- Question Section Start -->
        <div class="form-container">
            <form method="POST" action="<?php echo htmlspecialchars($_SERVER["PHP_SELF"]); ?>">

            <!-- Question 1 -->
                <div class="question-box">
                    <h3>Question 1</h3>
                    <p>How do you prefer to spend your vacation?</p>
                    <div class="options-container">
                        <div class="option">
                            <input type="radio" id="q1-adventure" name="vacation_preference_q1" value="Adventure and activities">
                            <label for="q1-adventure">Adventure and activities (e.g. hiking, scuba diving)</label>
                        </div>
                        <div class="option">
                            <input type="radio" id="q1-relax" name="vacation_preference_q1" value="Relaxing">
                            <label for="q1-relax">Relaxing on the beach/spa</label>
                        </div>
                        <div class="option">
                            <input type="radio" id="q1-culture" name="vacation_preference_q1" value="Cultural experiences">
                            <label for="q1-culture">Cultural experiences</label>
                        </div>
                        <div class="option">
                            <input type="radio" id="q1-city" name="vacation_preference_q1" value="City exploration">
                            <label for="q1-city">City exploration</label>
                        </div>
                    </div>
                </div>

                <!-- Question 2 -->
                <div class="question-box">
                    <h3>Question 2</h3>
                    <p>How do you feel about trying new and challenging activities?</p>

                    <div class="options-container">
                        <div class="option">
                            <input type="radio" id="q2-open" name="activity_preference_q2" value="Very open, the more exciting the better">
                            <label for="q2-open">Very open, the more exciting the better</label>
                        </div>

                        <div class="option">
                            <input type="radio" id="q2-moderate" name="activity_preference_q2" value="I prefer moderate activities, nothing too extreme">
                            <label for="q2-moderate">I prefer moderate activities, nothing too extreme</label>
                        </div>

                        <div class="option">
                            <input type="radio" id="q2-relaxed" name="activity_preference_q2" value="I prefer laid back, relaxing experience">
                            <label for="q2-relaxed">I prefer laid back, relaxing experience</label>
                        </div>
                    </div>
                </div> 

                <!-- Question 3 -->
                <div class="question-box">
                    <h3>Question 3</h3>
                    <p>What pace would you prefer for your trip?</p>

                    <div class="options-container">
                        <div class="option">
                            <input type="radio" id="q3-fast" name="trip_pace_q3" value="Fast">
                            <label for="q3-fast">Fast paced, exploring as much as possible</label>
                        </div>

                        <div class="option">
                            <input type="radio" id="q3-balanced" name="trip_pace_q3" value="Balanced">
                            <label for="q3-balanced">Balanced, mixing sightseeing with relaxation</label>
                        </div>

                        <div class="option">
                            <input type="radio" id="q3-slow" name="trip_pace_q3" value="Slow-paced">
                            <label for="q3-slow">Slow-paced, taking time to enjoy each place</label>
                        </div>
                    </div>
                </div>

                <!-- Question 4 -->
                <div class="question-box">
                    <h3>Question 4</h3>
                    <p>What is your preferred budget for accommodation?</p>

                    <div class="options-container">
                        <div class="option">
                            <input type="radio" id="q4-budget" name="accommodation_budget_q4" value="Budget">
                            <label for="q4-budget">Budget (hostels, budget hotels, cabins, glamping tents)</label>
                        </div>

                        <div class="option">
                            <input type="radio" id="q4-midrange" name="accommodation_budget_q4" value="Mid">
                            <label for="q4-midrange">Mid-range (3 star hotel, local guest house)</label>
                        </div>

                        <div class="option">
                            <input type="radio" id="q4-luxury" name="accommodation_budget_q4" value="Luxury">
                            <label for="q4-luxury">Luxury (4-5 star hotel / resorts)</label>
                        </div>
                    </div>
                </div>

                <!-- Question 5 -->
                <div class="question-box">
                    <h3>Question 5</h3>
                    <p>What is your ideal budget for activities?</p>

                    <div class="options-container">
                        <div class="option">
                            <input type="radio" id="q5-budget" name="activity_budget_q5" value="Very budget friendly">
                            <label for="q5-budget">Very budget friendly (mostly free or low cost activities)</label>
                        </div>

                        <div class="option">
                            <input type="radio" id="q5-moderate" name="activity_budget_q5" value="Moderate">
                            <label for="q5-moderate">Moderate (mix of free, low cost and a few paid activities)</label>
                        </div>

                        <div class="option">
                            <input type="radio" id="q5-luxury" name="activity_budget_q5" value="Higher end">
                            <label for="q5-luxury">Higher end (luxury activities and experience)</label>
                        </div>
                    </div>
                </div>

                <!-- Question 6 -->
                <div class="question-box">
                    <h3>Question 6</h3>
                    <p>What kind of environment do you prefer?</p>

                    <div class="options-container">

                        <div class="option">
                            <input type="radio" id="q6-urban" name="environment_preference_q6" value="Urban">
                            <label for="q6-urban">Urban (cities, shopping, nightlife)</label>
                        </div>

                        <div class="option">
                            <input type="radio" id="q6-historical" name="environment_preference_q6" value="Historical">
                            <label for="q6-historical">Historical (heritage sites, museums)</label> 
                        </div>                    

                        <div class="option">
                            <input type="radio" id="q6-nature" name="environment_preference_q6" value="Nature and Outdoors">
                            <label for="q6-nature">Nature & outdoors (mountains, beaches, national parks)</label>
                        </div>  
                    </div>
                </div>

                <!-- Question 7 -->
                <div class="question-box">
                    <h3>Question 7</h3>
                    <p>Do you prefer a more touristy or secluded location?</p>

                    <div class="options-container">
                        <div class="option">
                            <input type="radio" id="q7-popular" name="location_preference_q7" value="Popular">
                            <label for="q7-popular">Popular</label>
                        </div>

                        <div class="option">
                            <input type="radio" id="q7-secluded" name="location_preference_q7" value="Secluded">
                            <label for="q7-secluded">Secluded</label>
                        </div>
                    </div>
                </div>

                <!-- Question 8 -->
                <div class="question-box">
                    <h3>Question 8</h3>
                    <p>How do you prefer to get around the destination?</p>

                    <div class="options-container">
                        <div class="option">
                            <input type="radio" id="q8-car" name="transport_preference_q8" value="Rent a car or motorbike">
                            <label for="q8-car">Rent a car or motorbike</label>
                        </div>

                        <div class="option">
                            <input type="radio" id="q8-public" name="transport_preference_q8" value="Public transport">
                            <label for="q8-public">Public transport</label>
                        </div>

                        <div class="option">
                            <input type="radio" id="q8-private" name="transport_preference_q8" value="Private transfers">
                            <label for="q8-private">Private transfers</label>
                        </div>
                    </div>
                </div>



                <!-- Date Picker -->
                    <input type="hidden" name="startDate" class="startDate">
                    <input type="hidden" name="endDate" class="endDate">
                    <center>
                        <h1>Pick a Date Range:</h1>
                        <div class="inline">
                            <div class="input-icons">
                                <div class="search-container">
                                    <span style="margin-right:10px;">
                                        <input class="startDate input-field" name="datefilter" type="text" value="mm/dd/yyyy" style="text-align: center;"/> 
                                    </span> 
                                    <span> 
                                        <input class="endDate input-field" name="datefilter" type="text" value="mm/dd/yyyy" style="text-align: center;"/> 
                                    </span>
                                </div>
                            </div>
                        </div>
                    </center>

                    <script type="text/javascript">
                        $(function () {
                            var startDate = null; 
                            var endDate = null;

                            $('input[name="datefilter"]').daterangepicker({
                                autoUpdateInput: false,
                                locale: {
                                    cancelLabel: 'Clear'
                                }
                            });

                            $('input[name="datefilter"], .fa-calendar').on('apply.daterangepicker', function (ev, picker) {
                                startDate = picker.startDate.format('MM/DD/YYYY');
                                endDate = picker.endDate.format('MM/DD/YYYY');

                                // Update hidden inputs
                                $('.startDate').val(startDate);
                                $('.endDate').val(endDate);
                            });

                            $('input[name="datefilter"], .fa-calendar').on('cancel.daterangepicker', function (ev, picker) {
                                startDate = null;
                                endDate = null;

                                // Clear hidden inputs
                                $('.startDate').val('');
                                $('.endDate').val('');
                            });
                        });
                    </script>
                <!--end Date Picker -->

                <!-- Submit Button -->

                <button class="submit-button" role="submit">Submit</button>
            </form>
        </div>

        <!-- Result Section -->
        <?php 
        ob_start();
        ?>

        <?php if ($_SERVER["REQUEST_METHOD"] == "POST"): ?>
           
            <div class="results-section">
                <?php 
                $results_to_display = !empty($all_results1) ? $all_results1 : $all_results2;
                $message = !empty($all_results1) 
                    ? "Recommended Activities Based on Your Preferences" 
                    : "Sorry we couldn't find activities that would best suit your preferences. But we found some that might pique your interest";
                ?>
                <h1 style="margin: 1%;"><?php echo $message; ?></h1>
                <?php 
                $grouped_results = [];
                foreach ($results_to_display as $row) {
                    $grouped_results[$row['City']][] = $row;
                }

                // Date range picker input
                $start_date = isset($_POST['startDate']) ? $_POST['startDate'] : null;
                $end_date = isset($_POST['endDate']) ? $_POST['endDate'] : null;

                // Calculate the number of days between the selected dates
                if ($start_date && $end_date) {
                    echo 'date received';
                    $start_timestamp = strtotime($start_date);
                    $end_timestamp = strtotime($end_date);
                    $days = ceil(($end_timestamp - $start_timestamp) / (60 * 60 * 24)) + 1; // Inclusive of start and end date
                } else {
                    echo 'no date received';
                    $days = 5; // Default to 5 days if no range is selected
                }

                // Ensure at least 2 days for activities and rest
                $days = max(2, $days);

                foreach ($grouped_results as $city_place => $results): 
                    ob_start(); // Start output buffering for each city
                    ?>
                    <div class="city-results">
                        <center>
                            <button id="<?php echo preg_replace('/[^a-zA-Z0-9]/', '_', $city_place); ?>" 
                                    onclick="window.location.href='email.php?city=<?php echo urlencode($city_place); ?>'" 
                                    class="city_button" 
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
                                        margin: auto; /* Center the button */
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
                        </center>
                        
                        <div style="display: grid; grid-template-columns: repeat(auto-fill, minmax(300px, 1fr)); gap: 20px; padding: 20px; margin-top: 30px;">
                            <?php 
                            
                        // Scheduling Algorithm with Municipality Grouping and Consecutive-Day Assignment
// Scheduling Algorithm with Municipality Grouping and Consecutive-Day Assignment
$activity_days = $days - 1; // Reserve the last day for rest
$day_schedule = array_fill(1, $activity_days, []); // Initialize schedule for activity days

// Group activities by Municipality
$municipality_groups = [];
foreach ($results as $activity) {
    $municipality_groups[$activity['Municipality']][] = $activity;
}

// Assign each municipality to consecutive days
$day_index = 1;
foreach ($municipality_groups as $municipality => $activities) {
    $remaining_activities = count($activities);

    while ($remaining_activities > 0) {
        // Determine the number of slots available for this day
        $current_day_slots = ceil(count($results) / $activity_days) - count($day_schedule[$day_index]);

        // Add as many activities as can fit into the current day
        $to_add = array_slice($activities, 0, $current_day_slots);
        $day_schedule[$day_index] = array_merge($day_schedule[$day_index], $to_add);

        // Remove scheduled activities from the municipality's list
        $activities = array_slice($activities, count($to_add));
        $remaining_activities -= count($to_add);

        // If there are still activities left for this municipality, move to the next day
        if ($remaining_activities > 0) {
            $day_index++;
            if ($day_index > $activity_days) {
                $day_index = 1; // Wrap around to the first day if we exceed the last activity day
            }
        }
    }
}

// Display activities as a styled table
?>
<style>
    table {
        width: 100%;
        border-collapse: collapse;
        margin: 20px 0;
        font-size: 16px;
        text-align: left;
        background-color: #f9f9f9;
    }
    table thead {
        background-color: #333;
        color: #fff;
    }
    table th, table td {
        border: 1px solid #ddd;
        padding: 10px;
    }
    table th {
        text-align: center;
    }
    table tbody tr:nth-child(even) {
        background-color: #f2f2f2;
    }
    table tbody tr:hover {
        background-color: #f1f1f1;
    }
    .rest-day {
        background-color: #fffae6;
        font-style: italic;
        text-align: center;
    }
</style>
<table>
    <thead>
        <tr>
            <th>Day</th>
            <th>Activity Name</th>
            <th>Start Time</th>
            <th>Municipality</th>
            <th>Attraction</th>
            <th>Type</th>
            <th>Environment</th>
            <th>Pace</th>
            <th>Transportation</th>
            <th>Fee</th>
            <th>Accommodation Type</th>
            <th>Accommodation Cost</th>
        </tr>
    </thead>
    <tbody>
        <?php
        for ($day = 1; $day <= $days; $day++):
            if ($day < $days): // Activity days
                $start_time = strtotime("08:00 AM"); // Starting time for the day's activities
                $duration_per_activity = 2 * 60 * 60; // Duration for each activity in seconds (2 hours)

                foreach ($day_schedule[$day] as $activity):
                    $formatted_time = date("h:i A", $start_time); // Format the time as HH:MM AM/PM
                    ?>
                    <tr>
                        <td style="text-align: center;"><?php echo "Day $day"; ?></td>
                        <td><?php echo htmlspecialchars($activity['ActivityName']); ?></td>
                        <td><?php echo $formatted_time; ?></td>
                        <td><?php echo htmlspecialchars($activity['Municipality']); ?></td>
                        <td><?php echo htmlspecialchars($activity['Attraction']); ?></td>
                        <td><?php echo htmlspecialchars($activity['Profile']); ?></td>
                        <td><?php echo htmlspecialchars($activity['Environment']); ?></td>
                        <td><?php echo htmlspecialchars($activity['Pacing']); ?></td>
                        <td><?php echo htmlspecialchars($activity['Transportation']); ?></td>
                        <td>PHP <?php echo number_format($activity['Fee'], 2); ?></td>
                        <td><?php echo htmlspecialchars($activity['Type']); ?></td>
                        <td>PHP <?php echo number_format($activity['Cost'], 2); ?></td>
                    </tr>
                    <?php
                    $start_time += $duration_per_activity; // Increment the start time
                endforeach;
            else: // Rest day
                ?>
                <tr class="rest-day">
                    <td colspan="12"><?php echo "Day $day (Rest Day)"; ?> - Take a break and recharge for your next adventure!</td>
                </tr>
                <?php
            endif;
        endfor;
        ?>
    </tbody>
</table>

                        </div>
                    </div>
                    <hr>
                    <?php 
                        $cityHtmlContent = ob_get_clean();
                        $fileName = preg_replace('/[^a-zA-Z0-9]/', '_', $city_place) . '.html';
                        
                        // Specify the folder where the HTML files will be stored
                        $folderPath = 'htmlFiles/'; // Ensure this folder exists
                        
                        // Correctly construct the file path
                        $filePath = $folderPath . $fileName;
                        
                        // Save the file in the specified folder
                        file_put_contents($filePath, $cityHtmlContent);
                    echo $cityHtmlContent;
                endforeach; 
                ?>
            </div>
        <?php endif; ?>

    </body>
</html>

<?php
// Close the database connection
$conn->close();
?>


<script> 
    $('input[name="dates"]').daterangepicker(); 
</script>