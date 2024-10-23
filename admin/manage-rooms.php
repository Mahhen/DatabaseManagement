<?php
session_start();
include('../includes/dbconn.php');
include('../includes/check-login.php');
check_login();

if (isset($_GET['del'])) {
    $id = intval($_GET['del']);
    $adn = "DELETE from rooms where id=?";
    $stmt = $mysqli->prepare($adn);
    $stmt->bind_param('i', $id);
    $stmt->execute();
    $stmt->close();
    echo "<script>alert('Record has been deleted');</script>";
}

// Fetch hostels to populate the dropdown
$hostelQuery = "SELECT * FROM hostel";
$hostelStmt = $mysqli->prepare($hostelQuery);
$hostelStmt->execute();
$hostels = $hostelStmt->get_result();
?>

<!DOCTYPE html>
<html dir="ltr" lang="en">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="icon" type="image/png" sizes="16x16" href="../assets/images/favicon.png">
    <title>Hostel Management System</title>
    <link href="../assets/extra-libs/c3/c3.min.css" rel="stylesheet">
    <link href="../assets/libs/chartist/dist/chartist.min.css" rel="stylesheet">
    <link href="../assets/extra-libs/datatables.net-bs4/css/dataTables.bootstrap4.css" rel="stylesheet">
    <link href="../dist/css/style.min.css" rel="stylesheet">
</head>

<body>
    <div class="preloader">
        <div class="lds-ripple">
            <div class="lds-pos"></div>
            <div class="lds-pos"></div>
        </div>
    </div>

    <div id="main-wrapper" data-theme="light" data-layout="vertical" data-navbarbg="skin6" data-sidebartype="full"
        data-sidebar-position="fixed" data-header-position="fixed" data-boxed-layout="full">
        
        <header class="topbar" data-navbarbg="skin6">
            <?php include 'includes/navigation.php'?>
        </header>
        
        <aside class="left-sidebar" data-sidebarbg="skin6">
            <div class="scroll-sidebar" data-sidebarbg="skin6">
                <?php include 'includes/sidebar.php'?>
            </div>
        </aside>
        
        <div class="page-wrapper">
            
            <div class="page-breadcrumb">
                <div class="row">
                    <div class="col-7 align-self-center">
                        <h4 class="page-title text-truncate text-dark font-weight-medium mb-1">Rooms Management</h4>
                        <br>
                        
                        <!-- Filter Form -->
                        <h6 class="page-title text-truncate text-dark font-weight-medium mb-1">Hostel Name</h6>
                        <form method="GET" action="manage-rooms.php">
                            <select class="custom-select mr-sm-2" id="hostel_id" name="hostel_id" required>
                                <option value="" selected disabled>Choose...</option>
                                <?php while ($hostel = $hostels->fetch_object()) { ?>
                                    <option value="<?php echo $hostel->id; ?>"
                                        <?php if (isset($_GET['hostel_id']) && $_GET['hostel_id'] == $hostel->id) echo 'selected'; ?>>
                                        <?php echo $hostel->hostel_name; ?>
                                    </option>
                                <?php } ?>
                            </select>
                            <button type="submit" class="btn btn-primary">Filter Rooms</button>
                        </form>
                    </div>
                </div>
            </div>
            
            <div class="container-fluid">
                
                <!-- Table Starts -->
                <div class="row">
                    <div class="col-12">
                        <div class="card">
                            <div class="card-body">
                                <a href="add-rooms.php"><button type="button" class="btn btn-block btn-md btn-success">Add New Room Details</button></a>
                                <hr>
                                <div class="table-responsive">
                                    <table id="zero_config" class="table table-striped table-hover table-bordered no-wrap">
                                        <thead class="thead-dark">
                                            <tr>
                                                <th>#</th>
                                                <th>Room No.</th>
                                                <th>Seater</th>
                                                <th>Fees Per Month</th>
                                                <th>Published On</th>
                                                <th>Actions</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <?php
                                            if (isset($_GET['hostel_id'])) {
                                                $hostel_id = intval($_GET['hostel_id']);
                                                // Fetch rooms based on the selected hostel
                                                $ret = "SELECT * from rooms WHERE hostel_id=?";
                                                $stmt = $mysqli->prepare($ret);
                                                $stmt->bind_param('i', $hostel_id);
                                                $stmt->execute();
                                                $res = $stmt->get_result();
                                                $cnt = 1;
                                                while ($row = $res->fetch_object()) {
                                                    ?>
                                                    <tr>
                                                        <td><?php echo $cnt; ?></td>
                                                        <td><?php echo $row->room_no; ?></td>
                                                        <td><?php echo $row->seater; ?></td>
                                                        <td>$<?php echo $row->fees; ?></td>
                                                        <td><?php echo $row->posting_date; ?></td>
                                                        <td>
                                                            <a href="edit-room.php?id=<?php echo $row->id; ?>" title="Edit"><i class="icon-note"></i></a>&nbsp;&nbsp;
                                                            <a href="manage-rooms.php?del=<?php echo $row->id; ?>" title="Delete" onclick="return confirm('Do you want to delete this record?');"><i class="icon-close" style="color:red;"></i></a>
                                                        </td>
                                                    </tr>
                                                    <?php
                                                    $cnt++;
                                                }
                                            } else {
                                                // Default message when no hostel is selected
                                                echo "<tr><td colspan='6'>Please select a hostel to see room details.</td></tr>";
                                            }
                                            ?>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- Table Ends -->
                
            </div>
            
            <?php include '../includes/footer.php' ?>
        </div>
    </div>

    <script src="../assets/libs/jquery/dist/jquery.min.js"></script>
    <script src="../assets/libs/popper.js/dist/umd/popper.min.js"></script>
    <script src="../assets/libs/bootstrap/dist/js/bootstrap.min.js"></script>
    <script src="../dist/js/app-style-switcher.js"></script>
    <script src="../dist/js/feather.min.js"></script>
    <script src="../assets/libs/perfect-scrollbar/dist/perfect-scrollbar.jquery.min.js"></script>
    <script src="../dist/js/sidebarmenu.js"></script>
    <script src="../dist/js/custom.min.js"></script>
    <script src="../assets/extra-libs/datatables.net/js/jquery.dataTables.min.js"></script>
    <script src="../dist/js/pages/datatable/datatable-basic.init.js"></script>

</body>
</html>
