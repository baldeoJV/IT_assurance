<?php
use PHPMailer\PHPMailer\PHPMailer;
use PHPMailer\PHPMailer\Exception;

require 'phpmailer/src/Exception.php';
require 'phpmailer/src/PHPMailer.php';
require 'phpmailer/src/SMTP.php';

if (isset($_POST['send'])) {
    $email = $_POST['email'];
    $subject = $_POST['subject'];
    $message = $_POST['message'];
    $attachmentFileName = $_POST['attachment'];

    // Build the file path
    $attachment = 'htmlFiles/' . $attachmentFileName;

    // Check if the file exists
    if (!file_exists($attachment)) {
        echo "Error: The file does not exist.";
        exit;
    }

    // Create a new PHPMailer instance
    $mail = new PHPMailer(true);

    try {
        // Server settings
        $mail->isSMTP();
        $mail->Host = 'smtp.gmail.com';
        $mail->SMTPAuth = true;
        $mail->Username = 'trav.web.temp@gmail.com';
        $mail->Password = 'woyo zjnn pnlp tzce'; 
        $mail->SMTPSecure = 'ssl';
        $mail->Port = 465;

        // Recipients
        $mail->setFrom('trav.web.temp@gmail.com', 'Tester');
        $mail->addAddress($email);

        // Content
        $mail->isHTML(true);
        $mail->Subject = $subject;
        $mail->Body = nl2br($message);

        // Add attachment
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
