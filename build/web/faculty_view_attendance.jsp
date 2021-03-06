<html>
<head>
<title>View Attendance</title>
<link href="bootstrap/bootstrap.css" rel="stylesheet"/>
<link href="css/style.css" rel="stylesheet"/>
<script src="jquery/jquery-3.4.1.min.js"></script>
<script src="bootstrap/bootstrap.js"></script>
<script src="jquery/jquery.validate.min.js"></script>
<link href="datatables/jquery.dataTables.min.css" rel="stylesheet"/>
<script src="datatables/jquery.dataTables.min.js"></script>

<style>		
</style>
</head>
<body>
<!--Top-->
<div class="container-fluid">
<div class="row">
<div class="col-12">
<img src="images/slide.png" width="100%"/>
</div>
</div>
</div>
<!--Menu -->
<nav class="navbar navbar-expand-md sticky-top padding navbar-dark bg-dark">
<div class="container-fluid">
    <a class="navbar-brand"></a>
	<button class="navbar-toggler" type="button" data-target="#navmenu" data-toggle="collapse"><span class="navbar-toggler-icon"></span></button>
	<div class="collapse navbar-collapse justify-content-center" id="navmenu">
		<ul class="navbar-nav">
			<li class="nav-item"><a class="nav-link active py-0 text-white" href="faculty_submit_attendance.html">Submit Attendance</a></li>
			<li class="nav-item"><a class="nav-link active py-0 text-white" href="faculty_view_attendance.html">View Attendance</a></li>
                        <li class="nav-item last"><a class="nav-link py-0 text-white" href="Logout.jsp">Logout</a></li>
		</ul>
	</div>	
</div>
</nav>
</br>
<!--Submit Attendance--->
<div class="container">
<h2 class="text-center text-primary">View Attendance</h2>
        <div class="row">
            <div class="col-sm-3">
                <select id="Course" name="course" class="form-control" size="1" required="">
                    <option value="" selected="selected">-- Select Course --</option>
                </select>
            </div>
			<div class="col-sm-3">
                <select id="Dept" name="Dept" class="form-control" size="1" required="">
                    <option value="" selected="selected">-- Select Department--</option>
                </select>
            </div>
			<div class="col-sm-3">
                <select id="Section" name="Section" class="form-control" size="1" required="">
                    <option value="" selected="selected">-- Select Section--</option>
                </select>
            </div>
			<div class="col-sm-3">
                <center><input type="submit" class="btn btn-success" name="submit" required=""></center>
            </div>
        </div>
<div class="row">
<div class="col-md-12">
<form action="">
<table id="example" class="display table table-bordered table-responsive-sm"  style="width:100%;">
                <thead>
            <tr>
                <th>S.No</th>
				<th>Hall Ticket Number</th>
                <th>Name of Student</th>
                <th>Present</th>
                <th>Absent</th>
                <th>Remarks</th>
            </tr>
        </thead>
        <tbody>
           <tr>
                <td>1122111231</td>
                <td>15351A0227</td>
                <td>611124234344</td>
                <td>hm</td>
                <td>jkj</td>
                <td>u8</td>
            </tr>
			
        </tbody>
    </table>
</form>	
</div>
</div>
</div>
<script>
$(document).ready(function() {
    $('#example').DataTable();
} );
</script>
<!--Footer-->
<div class="container-fluid padding bg-dark footer">
<div class="row welcome text-center">
<div class="col-xs-12 col-sm-12 col-md-6">
	<h4  class="text-secondary">Address</h4>
	<p></p>
</div>
<div class="col-xs-12 col-sm-12 col-md-6">
	<h4  class="text-secondary">Follow Us</h4>
	<p></p>
</div>
</div>
</div>

</body>

</html>
