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
                $(function() {

                    $('input[name="datefilter"]').daterangepicker({
                        autoUpdateInput: false,
                        locale: {
                            cancelLabel: 'Clear'
                        }
                    });

                    $('input[name="datefilter"], .fa-calendar').on('apply.daterangepicker', function(ev, picker) {
                        $('.startDate').val(picker.startDate.format('MM/DD/YYYY'));
                        $('.endDate').val(picker.endDate.format('MM/DD/YYYY'));
                    });

                    $('input[name="datefilter"], .fa-calendar').on('cancel.daterangepicker', function(ev, picker) {
                        $(this).val('');
                    });

                });
            </script>

            <!-- Submit Button -->
            <button class="submit-button" role="submit">Submit</button>
        </form>
    </div>


    <!-- Results Section -->

    <?php 
    ob_start();
    ?>
    <?php if ($_SERVER["REQUEST_METHOD"] == "POST"): ?>
        <div class="results-section">
        <?php 
        $results_to_display = !empty($all_results1) ? $all_results1 : $all_results2;
        $message = !empty($all_results1) ? "Recommended Activities Based on Your Preferences" : "Sorry we couldn't find activities that would best suit your preferences. But we found some that might pique your interest";
        ?>
        <h1 style="margin: 1%;"><?php echo $message; ?></h1>
        <?php 
        $grouped_results = [];
        foreach ($results_to_display as $row) {
            $grouped_results[$row['City']][] = $row;
        }

        foreach ($grouped_results as $city_place => $results): 
            ob_start(); // Start output buffering for each city
        ?>
            <div class="city-results">
            <center>
                <button id="<?php echo preg_replace('/[^a-zA-Z0-9]/', '_', $city_place); ?>" onclick="window.location.href='email.php?city=<?php echo urlencode($city_place); ?>'" class="city_button"
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
                //variables for the algorithm
                $day = 1;
                
                foreach ($results as $row): ?>
                
                <div style="border: 1px solid #ddd; border-radius: 8px; padding: 15px; background-color: #f9f9f9;">
                    <h1 style="margin: 0; font-size: 24px; color: #333; text-align: center;">Day
                        <?php
                        //insert algorithm here...
                            echo $day;
                            $day++;
                        ?>
                    </h1><hr>
                    <h3 style="margin: 0; font-size: 18px; color: #333;"><?php echo $row['ActivityName']; ?></h3><br>
                    <p style="margin: 5px 0;"><strong>Location:</strong> <?php echo ($row['Municipality'] ? $row['Municipality'] . " - " . $row['Attraction'] : "Various locations"); ?></p>
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