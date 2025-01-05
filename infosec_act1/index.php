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
    $all_results = [];

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

    // Debug: Print sanitized input values
    // echo "<br><br>";
    // echo "Vacation Preference: $vacation_preference<br>";
    // echo "Activity Preference: $activity_preference<br>";
    // echo "Trip Pace: $trip_pace<br>";
    // echo "Accommodation Budget: $accommodation_budget<br>";
    // echo "Activity Budget: $activity_budget<br>";
    // echo "Environment Preference: $environment_preference<br>";
    // echo "Location Preference: $location_preference<br>";
    // echo "Transport Preference: $transport_preference<br><br>";

    $cities = array("palawanattractions", "cebuattractions", "boholattractions", "davaoattractions", "boracayattractions");

    foreach ($cities as $city) {
        // print_r($city);
        // echo "<br>";
        // echo "<br>";

        // Build the SQL query with filters
        $sql = "WITH city_accomodation_union AS (
            SELECT $city.AttractionID, $city.Municipality, $city.Attraction, $city.PopularSecluded, $city.Budget, accomodations.Cost, accomodations.Type
            FROM $city
            JOIN accomodations
            ON $city.Municipality = accomodations.Municipality
            )

            SELECT city_accomodation_union.AttractionID, city_accomodation_union.Municipality, city_accomodation_union.Attraction, city_accomodation_union.PopularSecluded, city_accomodation_union.Type,
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


        // Debug: Print the SQL query
        // echo "SQL Query: " . $sql . "<br><br>";

        // Execute query
        $results = $conn->query($sql);
        // print_r($results);

        if ($results && $results->num_rows > 0) {
            while ($row = $results->fetch_assoc()) {
                $all_results[] = $row; // Store all rows from all cities
            }
        }      
        
        // print_r(count($all_results));  
        // echo "<br>";
        // echo "<br>";
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
    <style>
        /* This selector establishes the whole basis of the website */
        body {
            background-color: #b7e2ed;
            font-family: 'Roboto', sans-serif;
            margin: 0;
            padding: 0;
            width: 100%;
            height: 100%;
            box-sizing: border-box;
        }

        .option-header {
            background-color: beige;
            height: 40px;
            width: 100%;

            display: flex;
            padding: 10px;
        }

        .option-header button {
            margin-left: 20px;
            width: 100px;;
        }

        /* Header Section Start */
        .header-container {
            position: relative;
            width: 100%;
            height: 1000px;
        }

        .header-img-1 {
            position: absolute;
            width: 100%;
            height: 100%;

            background-image: url('https://drive.google.com/thumbnail?id=1oU6cfc6Va2v-OlZxGscb5KUDrJETwf_Y&sz=w2000');
            background-size: cover;
            background-position: center;
            background-repeat: no-repeat; /* Prevent the image from repeating */
        }

        .header-img-2 {
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;

            background-image: url('https://drive.google.com/thumbnail?id=12YclM2AtxHncjE0IWFGLIqQ1cCmTtbiP&sz=w2000');
            background-size: cover;
            background-position: center;
        }

        .header-title h1 {
            font-family: 'Yeseva One';
            font-size: 220px;
            color: #5c4941;
            padding-left: 52px;
            margin: 0px;
            animation: 1s ease-out 0s 1 slideInFromLeft;
        }

        @keyframes slideInFromLeft {
            0% {
            transform: translateX(-100%);
            }
            100% {
            transform: translateX(0);
            }
        }
        
        .header-title h1:nth-child(2) {
            position: relative;
            top: -40px;
        }
        /* Header Section End */

        /* Question Section Start */
        .form-container {
            display: flex;
            flex-direction: column;
            align-content: center;

            padding: 50px;
        }

        .form-container form {
            display: flex;
            flex-direction: column;
            gap: 15px;
        }

        .question-box {
            position: relative;
            display: flex;
            justify-content: center;
            align-items: center;

            border: 1px solid black;
            background-color: lightgreen;
            border-radius: 12px;
            height: 100px;
            margin: 12px;
            transition: height 0.5s;
        }

        /* This selector makes the background image for all the question-box darker */
        .question-box::before {
            content: ''; /* Required for pseudo-element */
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            border-radius: 12px;
            background-color: rgba(0, 0, 0, 0.5); /* Black overlay with 50% opacity */
            z-index: 1; /* Place the overlay above the background image */
        }

        /* Separates text from the darkened background so that the text wont be darkened */
        .question-box > * {
            position: relative;
            z-index: 2; /* Ensure content is above the overlay */
        }

        .question-box:nth-child(1) {
            background-image: url('https://drive.google.com/thumbnail?id=1KOGICHqO5PeXc0SGMTS0y6pHwx1jr8CD&sz=w2000');
            background-size: cover;
            background-position: center;
        }

        .question-box:nth-child(2) {
            background-image: url('https://drive.google.com/thumbnail?id=1TuwRXx1VayI-oICv0yjUft6CvLlYrqAo&sz=w2000');
            background-size: cover;
            background-position: center;
        }

        .question-box:nth-child(3) {
            background-image: url('https://drive.google.com/thumbnail?id=1u7NLrbpOJn7q9IdNxLryOhHWjylgYOCu&sz=w2000');
            background-size: cover;
            background-position: center;
        }

        .question-box:nth-child(4) {
            background-image: url('https://drive.google.com/thumbnail?id=1fe6qmgl-2ZUwjEPu5diKIkd7iTFnHuwv&sz=w2000');
            background-size: cover;
            background-position: center;
        }

        .question-box:nth-child(5) {
            background-image: url('https://drive.google.com/thumbnail?id=19arzVkZLd_ckJhUIHO3Jo7idPegkRzoq&sz=w2000');
            background-size: cover;
            background-position: center;
        }

        .question-box:nth-child(6) {
            background-image: url('https://drive.google.com/thumbnail?id=1-RaH6rdHT1TtyDd931D0SQgwh1G9GtNs&sz=w2000');
            background-size: cover;
            background-position: center;
        }

        .question-box:nth-child(7) {
            background-image: url('https://drive.google.com/thumbnail?id=1Ez_k7X-510_A188o4TWukMZXIg78Y1Yo&sz=w2000');
            background-size: cover;
            background-position: center;
        }

        .question-box:nth-child(8) {
            background-image: url('https://drive.google.com/thumbnail?id=1OvaZvdynqbDisdLEagyiA5C9GdIHHvEv&sz=w2000');
            background-size: cover;
            background-position: center;
        }

        .question-box h3 {
            color: #fff;
            font-size: 20px;
            margin: 0;
            
            transition: top 0.5s, left 0.5s, opacity 0.5s;
        }

        .question-box p {
            position: absolute;
            top: 0px;
            left: 0px;

            color: #fff;
            font-size: 40px;
            margin: 0;
            opacity: 0;
            transition: top 0.5s, left 0.5s, opacity 0.25s;
        }

        .question-box .options-container {
            position: absolute;
            top: 50px;
            left: 0px;

            display: flex;
            
            color: #fff;
            font-size: 20px;
            margin: 0;
            opacity: 0;
            gap: 12px;
            transition: top 0.5s, left 0.5s, opacity 0.25s;
        }

        .question-box:hover {
            height: 500px;
            cursor: pointer;
        }

        .question-box:hover h3{
            opacity: 0;
        }

        .question-box:hover p {
            opacity: 1;
            top: 50px;
            left: 50px;
        }

        .question-box:hover .options-container {
            opacity: 1;
            top: 40%;
            left: 75px;
            flex-direction: column;
            gap: 16px;
        }
        /* Question Section End */

        .results-container {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(300px, 1fr));
            gap: 20px;
            padding: 20px;
            margin-top: 30px;
        }

        .activity-card {
            border: 1px solid #ddd;
            border-radius: 8px;
            padding: 15px;
            background-color: #fff;
            box-shadow: 0 2px 4px rgba(0,0,0,0.1);
        }

        .activity-card h3 {
            color: #333;
            margin-top: 0;
            margin-bottom: 10px;
        }

        .activity-card p {
            margin: 5px 0;
            color: #666;
        }

        .activity-card strong {
            color: #333;
        }

        .results-section {
            margin-top: 30px;
            padding: 20px;
            background-color: #f9f9f9;
        }

        .no-results {
            text-align: center;
            padding: 20px;
            color: #666;
        }

    </style>
</head>
<body>
    <!-- Moving Header -->
    <div class="option-header">
        <button onclick="window.location.href='admin.php'">Admin</button>
    </div>

    <!-- Header Section Start -->
    <div class="header-container">
        <div class="header-img-1">
            <div class="header-title">
                <h1>Travel</h1>
                <h1>Preferences</h1>
            </div>
        </div>
        <div class="header-img-2"></div>
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

            <!-- Submit Button -->
            <button type="submit">Submit</button>
        </form>
    </div>

  <!-- Results Section -->
  <?php if ($_SERVER["REQUEST_METHOD"] == "POST"): ?>
    <div class="results-section">
        <h2>Recommended Activities Based on Your Preferences</h2>
        <?php if (!empty($all_results)): ?>
            <div class="results-container">
                <?php foreach ($all_results as $row): ?>
                    <div class="activity-card">
                        <h3><?php echo $row['ActivityName']; ?></h3>
                        <p><strong>Location:</strong> <?php echo ($row['Municipality'] ? $row['Municipality'] . " - " . $row['Attraction'] : "Various locations"); ?></p>
                        <p><strong>Type:</strong> <?php echo $row['Profile']; ?></p>
                        <p><strong>Environment:</strong> <?php echo $row['Environment']; ?></p>
                        <p><strong>Pace:</strong> <?php echo $row['Pacing']; ?></p>
                        <p><strong>Transportation:</strong> <?php echo $row['Transportation']; ?></p>
                        <p><strong>Fee:</strong> PHP <?php echo number_format($row['Fee'], 2); ?></p>
                        <p><strong>Accommodation Type:</strong> <?php echo $row['Type']; ?></p>
                        <p><strong>Accommodation Cost:</strong> PHP <?php echo number_format($row['Cost'], 2); ?></p>
                    </div>
                <?php endforeach; ?>
            </div>
        <?php else: ?>
            <div class="no-results">
                <p>No activities found matching your preferences. Please try adjusting your filters.</p>
            </div>
        <?php endif; ?>
    </div>
    <?php endif; ?>

</body>
</html>

<?php
// Close the database connection
$conn->close();
?>
