<?php
session_start();
include('includes/dbconn.php');

if (isset($_POST['login'])) {
    $email = $_POST['email'];
    $password = $_POST['password'];
    $password = md5($password);

    // Prepare statement to prevent SQL Injection
    $stmt = $mysqli->prepare("SELECT email, password, id, gender FROM userregistration WHERE email=? and password=?");
    $stmt->bind_param('ss', $email, $password);
    $stmt->execute();
    $stmt->bind_result($email, $password, $id, $gender);
    $rs = $stmt->fetch();
    $stmt->close();
    
    if ($rs) {
        $_SESSION['id'] = $id;
        $_SESSION['login'] = $email;
        $_SESSION['gender'] = $gender;
        $uip = $_SERVER['REMOTE_ADDR']; // Fetching the remote IP address
        $ldate = date('d/m/Y h:i:s', time());

        // Geolocation
        $ip = $_SERVER['REMOTE_ADDR'];
        $geopluginURL = 'http://www.geoplugin.net/php.gp?ip=' . $ip;
        $addrDetailsArr = unserialize(file_get_contents($geopluginURL));
        $city = $addrDetailsArr['geoplugin_city'];
        $country = $addrDetailsArr['geoplugin_countryName'];

        // Log the login details
        $log = "INSERT INTO userLog (userId, userEmail, userIp, city, country) VALUES ('$id', '$email', '$ip', '$city', '$country')";
        $mysqli->query($log);

        if ($log) {
            header("location:student/dashboard.php");
        }
    } else {
        
        
        echo "<script>alert('Sorry, Invalid Username/Email or Password!');</script>";
        echo "<script>window.location = '" . $_SERVER['PHP_SELF'] . "';</script>";
        
        
    }
}
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Student Login | KANYA RAASI HOSTELS</title>
    <link rel="stylesheet" href="login_page.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Poppins">
    <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>
    <div class="main-dabba">
        <div class="left-box">
            <h1 style="text-align: center;"><b>Student Login</b></h1>
            <h3 style="text-align: center; padding-top: 50px;font-size: 50px;">KANYA RAASI HOSTELS</h3>
            <div style="display:flex; background-color: alice-blue; padding-top: 50px; ">
                <svg xmlns="http://www.w3.org/2000/svg" width="18" height="17" fill="currentColor" class="bi-telephone-fill" viewBox="0 0 16 16">
                    <path fill-rule="evenodd" d="M1.885.511a1.745 1.745 0 0 1 2.61.163L6.29 2.98c.329.423.445.974.315 1.494l-.547 2.19a.68.68 0 0 0 .178.643l2.457 2.457a.68.68 0 0 0 .644.178l2.189-.547a1.75 1.75 0 0 1 1.494.315l2.306 1.794c.829.645.905 1.87.163 2.611l-1.034 1.034c-.74.74-1.846 1.065-2.877.702a18.6 18.6 0 0 1-7.01-4.42 18.6 18.6 0 0 1-4.42-7.009c-.362-1.03-.037-2.137.703-2.877z"/>
                </svg>
           

            <p class="phno" style="padding-left: 15px;" >+91 7981-788-271</p>
            </div>

            
            <div style="display:flex; ">
                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-house-door-fill" viewBox="0 0 16 16">
                    <path d="M6.5 14.5v-3.505c0-.245.25-.495.5-.495h2c.25 0 .5.25.5.5v3.5a.5.5 0 0 0 .5.5h4a.5.5 0 0 0 .5-.5v-7a.5.5 0 0 0-.146-.354L13 5.793V2.5a.5.5 0 0 0-.5-.5h-1a.5.5 0 0 0-.5.5v1.293L8.354 1.146a.5.5 0 0 0-.708 0l-6 6A.5.5 0 0 0 1.5 7.5v7a.5.5 0 0 0 .5.5h4a.5.5 0 0 0 .5-.5"/>
                </svg>
           
            <p class="addr" style="padding-left: 20px;bottom:50px;">Pala, Kottayam, Kerala</p>
            </div>
        </div>

        <div class="left-dabba">
            <form method="POST" action="">
            
                <h1><b>Login</b></h1>
                <div class="input-dabba">
                    <input type="email" name="email" required><i class='bx bxs-user'></i>
                    <label>Email</label>
                </div>
                
                <div class="input-dabba">
                    <input type="password" name="password" required><i class='bx bxs-lock-alt'></i>
                    <label>Password</label>
                </div>

                <div class="rem-forgot" style="display:flex;">
                    <input type="checkbox"> <label style="padding-right:80px;padding-top: 8px;">Remember me</label>
                </div>

                <div class="butn">
                    <button class="login_butt" type="submit" name="login"><b>Login</b></button>
                </div>

                <div class="reg">
                    <p>Don't have an account?</p>
                    <p style="padding-left: 19px;">Contact the <a href="admin/index.php">Admin</a></p>
                </div>
            </form>
        </div>
    </div>
</body>
</html>
