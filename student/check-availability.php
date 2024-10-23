<?php
    require_once("../includes/dbconn.php");
    if(!empty($_POST["emailid"])) {
        $email= $_POST["emailid"];
        if (filter_var($email, FILTER_VALIDATE_EMAIL)===false) {

            echo "error : You did not enter a valid email.";
        } else {
            $result ="SELECT count(*) FROM userRegistration WHERE email=?";
            $stmt = $mysqli->prepare($result);
            $stmt->bind_param('s',$email);
            $stmt->execute();
    $stmt->bind_result($count);
    $stmt->fetch();
    $stmt->close();
    if($count>0){
    echo "<span style='color:red'> Email already exist! Try using new one.</span>";
        } else {
            echo "<span style='color:green'> Email available for registration!!</span>";
        }
     }
    }

    if(!empty($_POST["oldpassword"])) {
    $pass=$_POST["oldpassword"];
    $pass=md5($pass);
    $result ="SELECT password FROM userregistration WHERE password=?";
    $stmt = $mysqli->prepare($result);
    $stmt->bind_param('s',$pass);
    $stmt->execute();
    $stmt -> bind_result($result);
    $stmt -> fetch();
    $opass=$result;
    if($opass==$pass) 
    echo "<span style='color:green'> Password  matched.</span>";
    else echo "<span style='color:red'>Password doesnot match!</span>";
    }


    if (!empty($_POST["roomno"])) {
        $roomno = $_POST["roomno"];
    
        // First, count how many bookings there are for the room
        $result = "SELECT COUNT(*) FROM registration WHERE roomno=?";
        $stmt = $mysqli->prepare($result);
        $stmt->bind_param('i', $roomno);  // Bind the room number as an integer
        $stmt->execute();
        $stmt->bind_result($count);  // Bind the result to the $count variable
        $stmt->fetch();
        $stmt->close();
    
        // Now fetch the seater value for the room
        $query = "SELECT seater FROM rooms WHERE room_no=?";
        $stmt2 = $mysqli->prepare($query);
        $stmt2->bind_param('i', $roomno);  // Bind the room number again
        $stmt2->execute();
        $stmt2->bind_result($seater);  // Bind the result to the $seater variable
        $stmt2->fetch();
        $stmt2->close();
        $ressss = $seater - $count;
    
        // Compare the count of booked seats with the seater value
        if ($count >= $seater) {
            echo "<span style='color:red'>Seats are already full.</span>";
        } else {
            echo "<span style='color:green'>$ressss seats are available</span>";
        }
    }
?>