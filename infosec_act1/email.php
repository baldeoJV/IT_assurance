<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Send Email</title>
    <style>

        .form-container {
            background: #ffffff;
            padding: 20px 30px;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            width: 100%;
            max-width: 400px;
        }

        .form-container h1 {
            font-size: 1.5rem;
            margin-bottom: 20px;
            color: #333;
            text-align: center;
        }

        .form-container label {
            display: block;
            font-size: 0.9rem;
            color: #555;
            margin-bottom: 5px;
        }

        .form-container input,
        .form-container textarea,
        .form-container button {
            width: 100%;
            padding: 10px;
            margin-bottom: 15px;
            border: 1px solid #ddd;
            border-radius: 5px;
            font-size: 0.9rem;
        }

        .form-container input:focus,
        .form-container textarea:focus {
            outline: none;
            border-color: #007BFF;
            box-shadow: 0 0 5px rgba(0, 123, 255, 0.5);
        }

        .form-container button {
            background: #007BFF;
            color: #ffffff;
            font-size: 1rem;
            font-weight: bold;
            border: none;
            cursor: pointer;
            transition: background 0.3s ease;
        }

        .form-container button:hover {
            background: #0056b3;
        }
    </style>
</head>
<body>
    
<button onclick="window.location.href='index.php'" 
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
                                    Back
                            </button>
    <div class="html">
        <?php include htmlspecialchars($_GET['city']).'.html'; ?>
    <div>
    <br><br>
    
    <center>
    <div class="form-container">
        <h1>Send Email</h1>

        <form action="send.php" method="POST">

            <!-- // $cityname = htmlspecialchars($_GET['city']); -->
            <input type="hidden" name="attachment" value="<?= htmlspecialchars($_GET['city']); ?>.html">

            <label for="email">Recipient Email:</label>
            <input type="email" name="email" id="email" placeholder="Enter recipient's email" required>

            <label for="subject">Subject:</label>
            <input type="text" name="subject" id="subject" placeholder="Enter email subject" required>

            <label for="message">Message:</label>
            <textarea name="message" id="message" rows="5" placeholder="Type your message here" required></textarea>

            <button type="submit" name="send">Send Email</button>
        </form>
    </div>
    </center>
</body>
</html>