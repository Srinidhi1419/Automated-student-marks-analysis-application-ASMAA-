<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="javafx.scene.control.Alert"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="DBConnection.DBConnection"%>
<%@page import="java.sql.Connection"%>
<!DOCTYPE html>
<html>
<head>
<title>Update Non Teaching Staff</title>
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

<form action="admin_update_nonteach.jsp" method="post">
        <div class="row">
            <div class="offset-sm-4 col-sm-4">
				<input type="text" class="form-control" name="empid" placeholder="Enter Hall Ticket No." required="">		
            </div>
            <div class="col-sm-3">
                <center><input type="submit" class="btn btn-success" name="submit" required=""></center>
            </div>
        </div>
</form><br/>
<!--Add Teaching Staff-->
<div class="container padding">
    <h2 class="col-12 register text-center">Non Teaching Staff Registration Form</h2>
	<div class="col-12 jumbotron">
		<div class="container-fluid">

        <form action="UpdateNonFaculty" method="post" enctype="multipart/form-data">  
<div class="container">
    <div class="row">
        <div class="container">
        <div class="container">
        <div class="row">
              <%
        String empid = request.getParameter("empid");
    Connection conn = DBConnection.getConnection();
                PreparedStatement ps = conn.prepareStatement("select * from nonfaculty where empid='"+empid+"'");
                ResultSet rs = ps.executeQuery();
                if(rs.next()){
    %>
            <div class="col-sm-4">
                Employee ID*
                <input type="text" class="form-control" placeholder="" name="empid" value="<%=rs.getString("empid")%>" required=""><br/>
                Date of Birth*
                <input type="date" class="form-control" placeholder="" name="dob" value="<%=rs.getString("dob")%>" required="">
                <br/>
                Contact Number*
                <input type="text" class="form-control" placeholder="" name="emno" value="<%=rs.getString("emno")%>" required="">
                <br/>
                Email*
                <input type="email" class="form-control" placeholder="" name="email" value="<%=rs.getString("email")%>" required="">
            </div>
            
            <div class="col-sm-4">
                Employee Name* (as per 10th Memo)
                <input type="text" class="form-control" placeholder="" name="ename" value="<%=rs.getString("ename")%>" required="">
                    
                <br/>
                Aadhar Number*
                <input type="text" class="form-control" placeholder="" name="aadhar" value="<%=rs.getString("aadhar")%>" required="">
                <br/>
                Gender*
                <select class="form-control" name="gender" value="<%=rs.getString("gender")%>" required="">
                    <option>Select Option</option>
                    <option>Male</option>
                    <option>Female</option>                   
                </select>
                <br/>
                Date of Joining*
                <input type="date" class="form-control" placeholder="" name="doj" value="<%=rs.getString("doj")%>" required="">                 
			</div>
            
            <div class="col-sm-4">              
                <img id="myimage" height="170" width="170"><br/>Photo*
		<input type='file' class="form-control-file" name='photo' placeholder='Select Profile Pic' onchange="onFileSelected(event)">
	    <br/>
            Qualification*
                    <select class="form-control" name="qual" value="<%=rs.getString("qual")%>" required="">
                    <option>Select Option</option>
                    <option>Proffessor</option>
                    <option>Associate Proffessor</option>
                    <option>Assistant Proffessor</option>
                    </select>
            </div>
            </div>
            <br/>
            <div class="row">
               <div class="col-sm-4">
                Designation*
                <input type="text" name="design" class="form-control" placeholder="" value="<%=rs.getString("designation")%>" required="" />
            </div>
                <div class="col-sm-4">
                Course*
                <select id="Course" name="course" class="form-control" size="1" value="<%=rs.getString("course")%>" required="">
                    <option value="" selected="selected">-- Select Course --</option>
                </select>
            </div>
            <div class="col-sm-4">
                Department*
                <select id="Branch" name="dept" class="form-control" size="1" value="<%=rs.getString("dept")%>" required="">
                    <option value="" selected="selected">-- Select Branch--</option>
                </select>
            </div>
            </div>
        </div><center><input type="submit" class=" btn r btn-primary" value="Submit"/></center>
            <%}%> 
        </div><br/>
         

    </div>
</div><br/></form>
    
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

