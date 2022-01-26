<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Add Non Teaching Staff</title>
<link href="bootstrap/bootstrap.css" rel="stylesheet"/>
<link href="css/style.css" rel="stylesheet"/>
<script src="jquery/jquery-3.4.1.min.js"></script>
<script src="bootstrap/bootstrap.js"></script>
<script src="jquery/jquery.validate.min.js"></script>
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
			<li class="nav-item dropdown"><a class="nav-link py-0 dropdown-toggle text-white" href="" data-toggle="dropdown">Student</a>
				<div class="dropdown-menu">
					<a class="dropdown-item" href="hod_view_single_student.jsp">View Single Student</a>
					<a class="dropdown-item" href="hod_view_year_student.jsp">View Year-wise Students</a>
				</div>
			</li>
			<li class="nav-item dropdown"><a class="nav-link py-0 dropdown-toggle text-white" href="" data-toggle="dropdown">Staff</a>
				<div class="dropdown-menu">
					<a class="dropdown-item" href="hod_view_single_staff.jsp">View Single Staff</a>
					<a class="dropdown-item" href="hod_view_teach.jsp">View Teaching-wise Staff</a>
					<a class="dropdown-item" href="hod_view_nonteach.jsp">View Non-Teaching-wise Staff</a>
                                        <a class="dropdown-item" href="hod_add_subject.jsp">Add Subject</a>
                                        <a class="dropdown-item" href="hod_view_subject.jsp">View All Subjects</a>
					<a class="dropdown-item" href="hod_allocate_subject.jsp">Allocate Subject</a>
					<a class="dropdown-item" href="hod_view_subject_allocation.jsp">View Subject Allocation</a>
					<a class="dropdown-item" href="hod_set_incharge.jsp">Set Class Incharge</a>
					<a class="dropdown-item" href="hod_view_incharge.jsp">View Class Incharge</a>
				</div>
			</li>
			<li class="nav-item dropdown"><a class="nav-link py-0 dropdown-toggle text-white" href="" data-toggle="dropdown">Remarks</a>
				<div class="dropdown-menu">
					<a class="dropdown-item" href="hod_remarks.jsp">HOD Remarks </a>
					<a class="dropdown-item" href="hod_view_remarks.jsp">View Remarks</a>
				</div>
			</li>
			<li class="nav-item"><a class="nav-link active py-0 text-white" href="" data-target="#" data-toggle="modal">Attendance</a></li>
                        <li class="nav-item last"><a class="nav-link py-0 text-white" href="Logout.jsp">Logout</a></li>
		</ul>
	</div>	
</div>
</nav>
<br/>
<!--Add Teaching Staff-->
<div class="container padding">
    <h2 class="col-12 register text-center">Add Subjects</h2>
	<div class="col-12 jumbotron">
		<div class="container-fluid">

        <form action="Add_Subject.jsp" method="post">  
<div class="container">
    <div class="row">
        <div class="container">
             <div class="row">               
               <div class="col-sm-3">    
                Year*
                <select id="Year" name="year" class="form-control" size="1" required="">
                    <option value="" selected="selected">-- Select Year--</option>
                </select>
            </div>
            <div class="col-sm-3">
                Semester*
                <select id="Semester" name="sem" class="form-control" size="1" required="">
                    <option value="" selected="selected">-- Select Semester--</option>
                </select>
            </div>
            <div class="col-sm-3">
                Enter Subject Code*
                <input type="text" name="scode" class="form-control" placeholder="" required="" />
            </div>
            <div class="col-sm-3">
                Enter Subject Name*
                <input type="text" name="subject" class="form-control" placeholder="" required="" />
            </div>
            </div>
                  
        </div><br/>
    </div>
</div><br/>
     <center><input type="submit" class=" btn r btn-primary" value="Add Subject"/></center>
</form>
<br/>
</div>
	</div>
	</div>
	</div>

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
<script>
var courseinfo = {"I": ["I", "II"],"II": ["I", "II"],"III": ["I", "II"],"IV": ["I", "II"]}


window.onload = function () {
	
	//Get html elements
	
	var Year = document.getElementById("Year");
	var Semester = document.getElementById("Semester");
	
	//Load countries
	for (var year in courseinfo) {
		Year.options[Year.options.length] = new Option(year, year);
	}
	
	
	//City Changed
	Year.onchange = function () {
		Semester.length = 1; // remove all options bar first
		
		if (this.selectedIndex < 1)
			return; // done
		
		var semester = courseinfo[this.value];
		for (var i = 0; i < semester.length; i++) {
			Semester.options[Semester.options.length] = new Option(semester[i], semester[i]);
		}
	}	
}
</script>
</html>

