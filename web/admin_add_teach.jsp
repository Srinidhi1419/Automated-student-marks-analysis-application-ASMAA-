<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Add Teaching Staff</title>
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
					<a class="dropdown-item" href="admin_add_student.jsp">Add Student</a>
					<a class="dropdown-item" href="admin_update_student.jsp">Update Student Details</a>
					<a class="dropdown-item" href="admin_promote_student.jsp">Student Promotion</a>
					<a class="dropdown-item" href="admin_delete_student.jsp">Delete Student</a>
                                        <a class="dropdown-item" href="admin_view_single_student.jsp">View Single Student</a>
                                        <a class="dropdown-item" href="admin_view_student.jsp">View Students</a>					
					<a class="dropdown-item" href="admin_view_deleted_student.jsp">View Deleted Students</a>
				</div>
			</li>
			<li class="nav-item dropdown"><a class="nav-link py-0 dropdown-toggle text-white" href="" data-toggle="dropdown">Staff</a>
				<div class="dropdown-menu">
					<a class="dropdown-item" href="admin_add_teach.jsp">Add Teaching Staff</a>
					<a class="dropdown-item" href="admin_add_nonteach.jsp">Add Non-Teaching Staff</a>
					<a class="dropdown-item" href="admin_view_single_staff.jsp">View Single Staff</a>
					<a class="dropdown-item" href="admin_view_dept_staff.jsp">View Department-wise Staff</a>
					<a class="dropdown-item" href="admin_view_course_staff.jsp">View Course-wise Staff</a>
					<a class="dropdown-item" href="admin_update_teach.jsp">Update Staff Details</a>
                                        <a class="dropdown-item" href="admin_update_nonteach.jsp">Update Non-Teaching Staff Details</a>
					<a class="dropdown-item" href="admin_delete_staff.jsp">Delete Staff</a>
					<a class="dropdown-item" href="admin_view_deleted_staff.jsp">View Deleted Staff</a>
				</div>
			</li>
                        <li class="nav-item last"><a class="nav-link py-0 text-white" href="Logout.jsp">Logout</a></li>
		</ul>
	</div>	
</div>
</nav>
<br/>
<!--Add Teaching Staff-->
<div class="container padding">
    <h2 class="col-12 register text-center">Teaching Staff Registration Form</h2>
	<div class="col-12 jumbotron">
		<div class="container-fluid">

        <form action="AddFaculty" method="post" enctype="multipart/form-data">  
<div class="container">
    <div class="row">
        <div class="container">
        <div class="container">
        <div class="row">
            
            <div class="col-sm-4">
                Employee ID*
                <input type="text" class="form-control" placeholder="" name="empid" required=""><br/>
                Date of Birth*
                <input type="date" class="form-control" placeholder="" name="dob" required="">
                <br/>
                Contact Number*
                <input type="text" class="form-control" placeholder="" name="emno" required="">
                <br/>
                Email*
                <input type="email" class="form-control" placeholder="" name="email" required="">
            </div>
            
            <div class="col-sm-4">
                Employee Name* (as per 10th Memo)
                <input type="text" class="form-control" placeholder="" name="ename" required="">
                    
                <br/>
                Aadhar Number*
                <input type="text" class="form-control" placeholder="" name="aadhar" required="">
                <br/>
                Gender*
                <select class="form-control" name="gender" required="">
                    <option>Select Option</option>
                    <option>Male</option>
                    <option>Female</option>                   
                </select>
                <br/>
                Date of Joining*
                <input type="date" class="form-control" placeholder="" name="doj" required="">                 
			</div>
            
            <div class="col-sm-4">              
                <img id="myimage" height="170" width="170"><br/>Photo*
		<input type='file' class="form-control-file" name='photo' placeholder='Select Profile Pic' onchange="onFileSelected(event)">
	    <br/>
            Qualification*
                    <select class="form-control" name="qual" required="">
                    <option>Select Option</option>
                    <option>Proffessor</option>
                    <option>Associate Proffessor</option>
                    <option>Assistant Proffessor</option>
                    </select>
            </div>
            </div>
            <br/>
            <div class="row">
                <div class="col-sm-6"><br/>Designation* &emsp;                
                    <div class="form-check-inline">
                        <label class="form-check-label">
                            <input type="checkbox" class="form-check-input" name="design1" value="Faculty">Faculty
                        </label>
                    </div>
                    <div class="form-check-inline">
                        <label class="form-check-label">
                            <input type="checkbox" class="form-check-input"  name="design2" value="HOD">HOD
                        </label>
                    </div>
                    <div class="form-check-inline">
                        <label class="form-check-label">
                            <input type="checkbox" class="form-check-input"  name="design3" value="Dean">Dean
                        </label>
                    </div>
                    <div class="form-check-inline">
                        <label class="form-check-label">
                            <input type="checkbox" class="form-check-input"  name="design4" value="Principal">Principal
                        </label>
                    </div>

                </div>
                <div class="col-sm-3">
                Course*
                <select id="Course" name="course" class="form-control" size="1" required="">
                    <option value="" selected="selected">-- Select Course --</option>
                </select>
            </div>
            <div class="col-sm-3">
                Department*
                <select id="Branch" name="dept" class="form-control" size="1" required="">
                    <option value="" selected="selected">-- Select Branch--</option>
                </select>
            </div>
            </div>
        </div>
            
        </div><br/>
    </div>
</div><br/>
            <div class="container">
        <h4>Education Qualification</h4><hr>
        <div class="table-responsive-sm">
            <table class="table table-bordered text-center">
        <thead>
            <tr>
                <th>S.NO</th>
                <th>Reg.NO</th>
                <th>Qualification</th>
                <th>Institution</th>
                <th>Year of Passing</th>
                <th>% of Marks</th>
            </tr>
        </thead>
            <tr>
                <td>1</td>
                <td><input type="text" class="form-control" name="reg1" required=""></td>
                <td><input type="text" class="form-control" name="qual1" required=""></td>
                <td><input type="text" class="form-control" name="inst1" required=""></td>
                <td><input type="text" class="form-control" name="yop1" required=""></td>
                <td><input type="text" class="form-control" name="marks1" required=""></td>
            </tr>
            <tr>
                <td>2</td>
                <td><input type="text" class="form-control" name="reg2" required=""></td>
                <td><input type="text" class="form-control" name="qual2" required=""></td>
                <td><input type="text" class="form-control" name="inst2" required=""></td>
                <td><input type="text" class="form-control" name="yop2" required=""></td>
                <td><input type="text" class="form-control" name="marks2" required=""></td>
            </tr>
            <tr>
                <td>3</td>
                <td><input type="text" class="form-control" name="reg3" required=""></td>
                <td><input type="text" class="form-control" name="qual3" required=""></td>
                <td><input type="text" class="form-control" name="inst3" required=""></td>
                <td><input type="text" class="form-control" name="yop3" required=""></td>
                <td><input type="text" class="form-control" name="marks3" required=""></td>
            </tr>
            <tr>
                <td>4</td>
                <td><input type="text" class="form-control" name="reg4"></td>
                <td><input type="text" class="form-control" name="qual4"></td>
                <td><input type="text" class="form-control" name="inst4"></td>
                <td><input type="text" class="form-control" name="yop4"></td>
                <td><input type="text" class="form-control" name="marks4"></td>
            </tr>
            <tr>
                <td>5</td>
                <td><input type="text" class="form-control" name="reg5"></td>
                <td><input type="text" class="form-control" name="qual5"></td>
                <td><input type="text" class="form-control" name="inst5"></td>
                <td><input type="text" class="form-control" name="yop5"></td>
                <td><input type="text" class="form-control" name="marks5"></td>
            </tr>
        </table>
            
        </div>

    </div>
     <center><input type="submit" class=" btn r btn-primary" value="Submit"/></center>
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
var courseinfo = {"BTech": ["CSE","ECE","EEE","CIVIL","MECH","AGRI"]}


window.onload = function () {
	
	//Get html elements
	var Course = document.getElementById("Course");
	var Branch = document.getElementById("Branch");	
	
	//Load countries
	for (var course in courseinfo) {
		Course.options[Course.options.length] = new Option(course, course);
	}
	
	Course.onchange = function () {
		Branch.length = 1; // remove all options bar first
		
		if (this.selectedIndex < 1)
			return; // done
		
		var branch = courseinfo[this.value];
		for (var i = 0; i < branch.length; i++) {
			Branch.options[Branch.options.length] = new Option(branch[i], branch[i]);
		}
	}	
}
</script>
<script>
  function onFileSelected(event) {
  var selectedFile = event.target.files[0];
  var reader = new FileReader();

  var imgtag = document.getElementById("myimage");
  imgtag.title = selectedFile.name;

  reader.onload = function(event) {
    imgtag.src = event.target.result;
  };

  reader.readAsDataURL(selectedFile);
}

</script>
</html>

