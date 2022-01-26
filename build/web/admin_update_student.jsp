<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="DBConnection.DBConnection"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Update Student Details</title>
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
<!--Enter Student HT No.-->
<form action="admin_update_student.jsp" method="post">
        <div class="row">
            <div class="offset-sm-4 col-sm-4">
				<input type="text" class="form-control" name="htno" placeholder="Enter Hall Ticket No." required="">		
            </div>
            <div class="col-sm-3">
                <center><input type="submit" class="btn btn-success" name="submit" required=""></center>
            </div>
        </div>
</form><br/>
<!--Update Student-->
<div class="container padding">
    <h2 class="col-12 register text-center">Update Student Details</h2>
	<div class="col-12 jumbotron">
		<div class="container-fluid">
<%
String htno = request.getParameter("htno");
Connection conn = DBConnection.getConnection();
PreparedStatement ps = conn.prepareStatement("select * from student where htno='"+htno+"'");
ResultSet rs = ps.executeQuery();
if(rs.next()){
%>
        <form action="UpdateStudentDetails" method="post" enctype="multipart/form-data">  
<div class="container">
    <div class="row">
        <div class="container">
        
        <div class="row">
            <div class="col-sm-6">
                Student Name* (as per 10th Memo)
                <input type="text" class="form-control" value="<%=rs.getString("sname")%>" name="sname" required="">
            </div>
            <div class="col-sm-6">
                Aadhar Number*
                <input pattern="^[1-9]\d{11}$" class="form-control" value="<%=rs.getString("aadhar")%>" name="aadhar" required="">
            </div>                        
        </div><br/>
        <div class="row">
            <div class="col-sm-6">
                Father Name* (as per 10th Memo)
                <input type="text" class="form-control" value="<%=rs.getString("fname")%>" name="fname" required="">
            </div>            
            <div class="col-sm-6">
                Occupation*
                <input type="text" class="form-control" value="<%=rs.getString("foccup")%>" name="foccup" required="">
            </div>
            </div><br/>
        <div class="row">
            <div class="col-sm-6">
                Mother Name* (as per 10th Memo)
                <input type="text" class="form-control" value="<%=rs.getString("mname")%>" name="mname" required="">
            </div>            
            <div class="col-sm-6">
                Occupation*
                <input type="text" class="form-control" value="<%=rs.getString("moccup")%>" name="moccup" required="">
            </div>   
        </div><br/>
        <div class="row">
                <div class="col-sm-6">                
                    Category* &emsp;&emsp;<input type="radio" class="form-check-input" id="radio2" name="caste" value="OC">OC
                    &emsp;&emsp;<input type="radio" class="form-check-input" name="caste" value="BC">BC
                    &emsp;&emsp;<input type="radio" class="form-check-input" name="caste" value="SC">SC
                    &emsp;&emsp;<input type="radio" class="form-check-input" name="caste" value="ST">ST
                    &emsp;&emsp;<input type="radio" class="form-check-input" name="caste" value="Minority">Minority
                </div>
                <div class="col-sm-6">                
                    <input type="radio" class="form-check-input" id="radio" name="stype" value="Management">Management
                    &emsp;&emsp;<input type="radio" class="form-check-input" name="stype" value="Fee Reimbursement">Fee Reimbursement
                    &emsp;&emsp;<input type="radio" class="form-check-input" name="htype" value="CAH">CAH
                    &emsp;&emsp;<input type="radio" class="form-check-input" name="htype" value="SMH">SMH
                    &emsp;&emsp;<input type="radio" class="form-check-input" name="htype" value="DS">DS
                </div>
            </div><br/>
        <div class="row">            
            <div class="col-sm-4">
                CET Rank*
                <input type="text" class="form-control" value="<%=rs.getString("cet")%>" name="cet">
            </div>
            <div class="col-sm-4">
                Date of Birth*
                <input type="date" class="form-control" placeholder="" name="dob" required="">
            </div>
            <div class="col-sm-4">
                Blood Group*
                <select class="form-control" name="blood" required="">
                    <option>Select Option</option>
                    <option>O +ve</option>
                    <option>O -ve</option>
                    <option>A +ve</option>
                    <option>A -ve</option>
                    <option>B +ve</option>
                    <option>B -ve</option>
                    <option>AB +ve</option>
                    <option>AB -ve</option>
                </select>
            </div>
        </div><br/>
        <div class="row">            
            <div class="col-sm-4">
                PRESENT ADDRESS*
                <textarea class="form-control" rows="5" id="comment" name="caddr" required=""><%=rs.getString("caddr")%></textarea>
            </div>
            <div class="col-sm-4">
                PERMANENT ADDRESS*
                <textarea class="form-control" rows="5" id="comment" name="paddr" required=""><%=rs.getString("paddr")%></textarea>
            </div>
            <div class="col-sm-4">
                <img id="myimage" height="150" width="150">
				Photo*<input type='file' class="form-control-file" name='photo' placeholder='Select Profile Pic' onchange="onFileSelected(event)">
			</div>	
           </div> 

        <div class="row">
            <div class="col-sm-4">
                Student Cell Number*
                <input pattern="^[6-9]\d{9}$" class="form-control" value="<%=rs.getString("smno")%>" name="smno" required="">
            </div>            
            <div class="col-sm-4">
                Parents Cell No*
                <input pattern="^[6-9]\d{9}$" class="form-control" value="<%=rs.getString("pmno")%>" name="pmno" required="">
            </div>
            <div class="col-sm-4">
                Parents Alternative Number*
                <input pattern="^[6-9]\d{9}$" class="form-control" value="<%=rs.getString("plno")%>" name="plno">
            </div>           
        </div><br/>
        <div class="row">            
            <div class="col-sm-6">
                Student Email*
                <input type="email" class="form-control" value="<%=rs.getString("semail")%>" name="semail" required="">
            </div>
            <div class="col-sm-6">
                Parent Email*
                <input type="email" class="form-control" value="<%=rs.getString("pemail")%>" name="pemail">
            </div>
            
        </div><br/>       
        </div>
    </div>

    <div class="container">
        <h4>Education Qualification</h4><hr>
        <div class="table-responsive-sm">
            <table class="table table-bordered text-center">
        <thead>
            <tr>
                <th>S.NO</th>
                <th>Qualification</th>
                <th>Institution</th>
                <th>Year of Passing</th>
                <th>% of Marks</th>
            </tr>
        </thead>
            <tr>
                <td>1</td>
                <td>S.S.C<input type="hidden" name="ssc" value="SSC"></td>
                <td><input type="text" class="form-control" value="<%=rs.getString("inst1")%>" name="inst1" required=""></td>
                <td><input type="text" class="form-control" value="<%=rs.getString("yop1")%>" name="yop1"  required=""></td>
                <td><input type="text" class="form-control" value="<%=rs.getString("marks1")%>" name="marks1" required=""></td>
            </tr>
            <!--
            <tr>
                <td>2</td>
                <td>Intermediate<input type="hidden" name="inter" value="Inter"></td>
                <td><input type="text" class="form-control" value="<%=rs.getString("inst2")%>" name="inst2" required=""></td>
                <td><input type="text" class="form-control" value="<%=rs.getString("yop2")%>" name="yop2" required=""></td>
                <td><input type="text" class="form-control" value="<%=rs.getString("marks2")%>" name="marks2" required=""></td>
            </tr>
            -->
            <tr>
                <td>3</td>
                <td>Intermediate or Diploma<input type="text" class="form-control" value="<%=rs.getString("other")%>" name="other"></td>
                <td><input type="text" class="form-control" value="<%=rs.getString("inst3")%>" name="inst3"></td>
                <td><input type="text" class="form-control" value="<%=rs.getString("yop3")%>" name="yop3"></td>
                <td><input type="text" class="form-control" value="<%=rs.getString("marks3")%>" name="marks3"></td>
            </tr>
        </table>
            
        </div>

    </div>
    <div class="container">
        <h4>Admission Details</h4><hr>
        <div class="row">
            <div class="col-sm-4">
                Course*
                <select id="Course" name="course" class="form-control" size="1" required="">
                    <option value="" selected="selected">-- Select Course --</option>
                </select>
            </div>
            <div class="col-sm-4">
                Branch*
                <select id="Branch" name="branch" class="form-control" size="1" required="">
                    <option value="" selected="selected">-- Select Branch--</option>
                </select>
            </div>
            <div class="col-sm-4">    
                Year*
                <select id="Year" name="year" class="form-control" size="1" required="">
                    <option value="" selected="selected">-- Select Year--</option>
                </select>
            </div>
            
        </div><br/>
        <div class="row">
            <div class="col-sm-4">
                Semester*
                <select id="Semester" name="sem" class="form-control" size="1" required="">
                    <option value="" selected="selected">-- Select Semester--</option>
                </select>  
               
            </div>
            <div class="col-sm-4">
                University Hall Ticket Number* 
                <input type="text" class="form-control" value="<%=rs.getString("htno")%>" name="htno" readonly required="">
            </div>
            <div class="col-sm-4">
                Regulation* 
                <select class="form-control" name="regul" required="">
                    <option>---Select Regulation---</option>
                    <option>R16</option>
                    <option>R19</option>
                    <option>R22</option>
                    <option>R25</option>                    
                </select>                
            </div>            
        </div><br/>
    </div>            
     <center><input type="submit" class=" btn r btn-primary" value="Submit"/></center>
</form><%}%>
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
var courseinfo = {"BTech": {"CSE": {"I": ["I", "II"],"II": ["I", "II"],"III": ["I", "II"],"IV": ["I", "II"]},
		"ECE": {"I": ["I", "II"],"II": ["I", "II"],"III": ["I", "II"],"IV": ["I", "II"]},
                "EEE": {"I": ["I", "II"],"II": ["I", "II"],"III": ["I", "II"],"IV": ["I", "II"]},
                "CIVIL": {"I": ["I", "II"],"II": ["I", "II"],"III": ["I", "II"],"IV": ["I", "II"]},
                "MECH": {"I": ["I", "II"],"II": ["I", "II"],"III": ["I", "II"],"IV": ["I", "II"]},
                "AGRI": {"I": ["I", "II"],"II": ["I", "II"],"III": ["I", "II"],"IV": ["I", "II"]},}}


window.onload = function () {
	
	//Get html elements
	var Course = document.getElementById("Course");
	var Branch = document.getElementById("Branch");	
	var Year = document.getElementById("Year");
	var Semester = document.getElementById("Semester");
	
	//Load countries
	for (var course in courseinfo) {
		Course.options[Course.options.length] = new Option(course, course);
	}
	
	//County Changed
	Course.onchange = function () {
		 
		 Branch.length = 1; // remove all options bar first
		 Year.length = 1; // remove all options bar first
		 Semester.length = 1; // remove all options bar first
		 
		 if (this.selectedIndex < 1)
			 return; // done
		 
		 for (var branch in courseinfo[this.value]) {
			 Branch.options[Branch.options.length] = new Option(branch, branch);
		 }
	}
	
	//State Changed
	Branch.onchange = function () {		 
		 
		 Year.length = 1; // remove all options bar first
		 Semester.length = 1; // remove all options bar first
		 
		 if (this.selectedIndex < 1)
			 return; // done
		 
		 for (var year in courseinfo[Course.value][this.value]) {
			 Year.options[Year.options.length] = new Option(year, year);
		 }
	}
	
	//City Changed
	Year.onchange = function () {
		Semester.length = 1; // remove all options bar first
		
		if (this.selectedIndex < 1)
			return; // done
		
		var semester = courseinfo[Course.value][Branch.value][this.value];
		for (var i = 0; i < semester.length; i++) {
			Semester.options[Semester.options.length] = new Option(semester[i], semester[i]);
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
<script>
  function onFileSelected1(event) {
  var selectedFile = event.target.files[0];
  var reader = new FileReader();

  var imgtag = document.getElementById("myimage1");
  imgtag.title = selectedFile.name;

  reader.onload = function(event) {
    imgtag.src = event.target.result;
  };

  reader.readAsDataURL(selectedFile);
}
</script>
</html>
