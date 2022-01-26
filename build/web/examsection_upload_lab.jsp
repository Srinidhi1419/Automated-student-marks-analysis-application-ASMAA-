<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Upload Lab Marks</title>
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
			<li class="nav-item dropdown"><a class="nav-link py-0 dropdown-toggle text-white" href="" data-toggle="dropdown">Upload Marks</a>
				<div class="dropdown-menu">
					<a class="dropdown-item" href="examsection_upload_mid1.jsp">Mid-I Marks</a>
					<a class="dropdown-item" href="examsection_upload_mid2.jsp">Mid-II Marks</a>
					<a class="dropdown-item" href="examsection_upload_lab.jsp">Lab Marks</a>
					<a class="dropdown-item" href="examsection_upload_sem.jsp">Sem Marks</a>
				</div>
			</li>
                        <li class="nav-item dropdown"><a class="nav-link py-0 dropdown-toggle text-white" href="" data-toggle="dropdown">View Marks</a>
                        <div class="dropdown-menu">
					<a class="dropdown-item" href="examsection_view_mid1.jsp">Mid-I Marks</a>
					<a class="dropdown-item" href="examsection_view_mid2.jsp">Mid-II Marks</a>
					<a class="dropdown-item" href="examsection_view_lab.jsp">Lab Marks</a>
					<a class="dropdown-item" href="examsection_view_sem.jsp">Sem Marks</a>
				</div>
                        </li>
			<li class="nav-item dropdown"><a class="nav-link py-0 text-white" href="" data-toggle="dropdown">Result Analysis</a>
                        <div class="dropdown-menu">
					<a class="dropdown-item" href="examsection_resultanalysis_mid1.jsp">Mid-I Marks</a>
					<a class="dropdown-item" href="examsection_resultanalysis_mid2.jsp">Mid-II Marks</a>
					<a class="dropdown-item" href="examsection_resultanalysis_lab.jsp">Lab Marks</a>
					<a class="dropdown-item" href="examsection_resultanalysis_sem.jsp">Sem Marks</a>
				</div>
                        </li>
                        <li class="nav-item last"><a class="nav-link py-0 text-white" href="Logout.jsp">Logout</a></li>
		</ul>
	</div>	
</div>
</nav>
<br/>
<!--Upload Sem Marks-->
<div class="container">
<div class="row">
<div class="col-12 jumbotron">
<form action="LabUpload" method="post" enctype="multipart/form-data" class="text-capitalize">
    <div class="container">
        <h4>Upload Lab Marks</h4><hr>
        <div class="row">
            <div class="col-sm-4">
                Course*
                <select id="Course" name="course" class="form-control" size="1" required="">
                    <option value="" selected="selected">-- Select Course --</option>
                </select>
            </div>
            
            <div class="col-sm-4">    
                Year*
                <select id="Year" name="year" class="form-control" size="1" required="">
                    <option value="" selected="selected">-- Select Year--</option>
                </select>
            </div>
            <div class="col-sm-4">
                Semester*
                <select id="Semester" name="sem" class="form-control" size="1" required="">
                    <option value="" selected="selected">-- Select Semester--</option>
                </select>  
               
            </div>
        </div><br/>
        <div class="row">
            
            
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
            <div class="col-sm-4">    
                Upload Lab Marks*
                <input type="file" class="form-control" name="file" id="lab" required="required"/>
            </div>				
        </div><br/>
    </div> 
	<center><input type="submit" class=" btn btn-primary" value="Submit"/></center>
</form>
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
var courseinfo = {"BTech": {"I": ["I", "II"],"II": ["I", "II"],"III": ["I", "II"],"IV": ["I", "II"],
		"I": ["I", "II"],"II": ["I", "II"],"III": ["I", "II"],"IV": ["I", "II"],
                "I": ["I", "II"],"II": ["I", "II"],"III": ["I", "II"],"IV": ["I", "II"],
                "I": ["I", "II"],"II": ["I", "II"],"III": ["I", "II"],"IV": ["I", "II"],
                "I": ["I", "II"],"II": ["I", "II"],"III": ["I", "II"],"IV": ["I", "II"]}
        }

window.onload = function () {
	
	//Get html elements
	var Course = document.getElementById("Course");
	var Year = document.getElementById("Year");
	var Semester = document.getElementById("Semester");

	for (var course in courseinfo) {
		Course.options[Course.options.length] = new Option(course, course);
	}

	Course.onchange = function () {		 
		 
		 Year.length = 1; // remove all options bar first
		 Semester.length = 1; // remove all options bar first
		 
		 if (this.selectedIndex < 1)
			 return; // done
		 
		 for (var year in courseinfo[this.value]) {
			 Year.options[Year.options.length] = new Option(year, year);
		 }
	}
	
	Year.onchange = function () {
		Semester.length = 1; // remove all options bar first
		
		if (this.selectedIndex < 1)
			return; // done
		
		var semester = courseinfo[Course.value][this.value];
		for (var i = 0; i < semester.length; i++) {
			Semester.options[Semester.options.length] = new Option(semester[i], semester[i]);
		}
	}	
}
</script>
</html>
