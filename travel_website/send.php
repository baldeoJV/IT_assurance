<?php
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    // Retrieve form data
    $to = $_POST['email']; // Recipient's email
    $subject = $_POST['subject']; // Email subject
    $message = $_POST['message']; // Email body
    $attachment = $_POST['attachment']; // Attachment file name

    // Path to the folder where the HTML files are stored
    $folderPath = 'htmlFiles/';
    $filePath = $folderPath . $attachment;

    // Validate file existence
    if (!file_exists($filePath)) {
        echo "Error: Attachment file does not exist. File path: $filePath";
        exit;
    }

    // Read the file content
    $file_content = file_get_contents($filePath);
    if ($file_content === false) {
        echo "Error: Failed to read the attachment file.";
        exit;
    }
    $file_content = chunk_split(base64_encode($file_content));
    $file_name = basename($filePath);

    // Generate a boundary
    $boundary = md5(time());

    // Headers
    $headers = "From: trav.web.temp@gmail.com\r\n"; // Replace with your "From" email
    $headers .= "Reply-To: no-reply@example.com\r\n";
    $headers .= "MIME-Version: 1.0\r\n";
    $headers .= "Content-Type: multipart/mixed; boundary=\"$boundary\"\r\n";

    // Email body
    $email_body = "--$boundary\r\n";
    $email_body .= "Content-Type: text/plain; charset=\"UTF-8\"\r\n";
    $email_body .= "Content-Transfer-Encoding: 7bit\r\n";
    $email_body .= "\r\n";
    $email_body .= "$message\r\n";
    $email_body .= "--$boundary\r\n";
    $email_body .= "Content-Type: text/html; name=\"$file_name\"\r\n";
    $email_body .= "Content-Transfer-Encoding: base64\r\n";
    $email_body .= "Content-Disposition: attachment; filename=\"$file_name\"\r\n";
    $email_body .= "\r\n";
    $email_body .= "$file_content\r\n";
    $email_body .= "--$boundary--";

    // Try sending the email
    try {
        if (mail($to, $subject, $email_body, $headers)) {
            echo "Email sent successfully to $to.";
        } else {
            echo "Error: Failed to send the email. Check your server's mail configuration.";
        }
    } catch (Exception $e) {
        echo "Exception: " . $e->getMessage();
    }
} else {
    echo "Error: Invalid request method. Only POST is allowed.";
}
?>
