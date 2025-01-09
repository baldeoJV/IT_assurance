
<?php
// Include PHPMailer classes
use PHPMailer\PHPMailer\PHPMailer;
use PHPMailer\PHPMailer\Exception;

// Autoload files (if installed via Composer)
// require 'vendor/autoload.php';

// Include manually downloaded PHPMailer files
require 'phpmailer/src/Exception.php';
require 'phpmailer/src/PHPMailer.php';
require 'phpmailer/src/SMTP.php';

if (isset($_POST['send'])) {
    $email = $_POST['email'];
    $subject = $_POST['subject'];
    $message = $_POST['message'];
    $attachment = $_POST['attachment'];

    // Create a new PHPMailer instance
    $mail = new PHPMailer(true);

    try {
        // Server settings
        $mail->isSMTP();
        $mail->Host = 'smtp.gmail.com'; // Gmail SMTP server
        $mail->SMTPAuth = true;
        $mail->Username = 'trav.web.temp@gmail.com'; // Your Gmail address
        $mail->Password = 'woyo zjnn pnlp tzce'; // Your Gmail app password
        $mail->SMTPSecure = 'ssl'; // Encryption type (SSL)
        $mail->Port = 465; // Gmail SMTP port

        // Recipients
        $mail->setFrom('trav.web.temp@gmail.com', 'Tester'); // Sender info
        $mail->addAddress($email); // Recipient's email

        // Content
        $mail->isHTML(true); // Enable HTML
        $mail->Subject = $subject;
        $mail->Body = nl2br($message); // Converts line breaks to <br> tags for HTML emails

        // Add attachments
        $mail->addAttachment($attachment);

        // Send the email
        $mail->send();

        echo "<script>
            alert('Email sent successfully!');
            window.location.href = 'index.php';
        </script>";
    } catch (Exception $e) {
        echo "Message could not be sent. Error: {$mail->ErrorInfo}";
    }
}
?>

