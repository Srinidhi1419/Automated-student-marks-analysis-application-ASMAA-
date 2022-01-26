<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Examination Cell Dashboard</title>
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
<!--Sem Wise Result Analysis-->
<div class="modal fade" id="semresult" role="dialog">
	<div class="modal-dialog">
		<div class="modal-content" class="text-capitalize">
			<div class="modal-header">
				<h3>Result Analysis</h3>
				<button class="btn" data-dismiss="modal">&times;</button>
			</div>
		 		<div class="modal-body">
				<form action="" method="post" class="text-capitalize">
				<div class="form-group">
					<label for="year" class="text-center">Year</label>
					<select name="year">
						<option value="">--Select Year--</option>
						<option value="first">I</option>
						<option value="second">II</option>
						<option value="third">III</option>
						<option value="fourth">IV</option>
					</select>
				</div>
				<div class="form-group">
					<label for="semester" class="text-center">Semester</label>
					<select name="semester">
						<option value="">--Select Sem--</option>
						<option value="first">I</option>
						<option value="second">II</option>
					</select>
				</div>
				<div class="form-group">
					<label for="branch" class="text-center">Branch</label>
					<select name="branch">
						<option value="">--Select Branch--</option>
						<option value="Agri">Agri</option>
						<option value="civil">Civil</option>
						<option value="EEE">EEE</option>
						<option value="ECE">ECE</option>
						<option value="Mech">Mech</option>
						<option value="CSE">CSE</option>
						<option value="M.Tech">M.Tech</option>
						<option value="MBA">MBA</option>
						<option value="D.Agri">D.Agri</option>
						<option value="DEEE">DEEE</option>
						<option value="DECE">DECE</option>
						<option value="DME">DME</option>
					</select>
				</div>
				<div class="form-group">
					<label for="batch" class="text-center">Batch</label>
					<select name="batch">
						<option value="">--Select Batch--</option>
						<option value="2011-15">2011-15</option>
						<option value="2012-16">2011-16</option>	
					</select>
				</div>
				<div class="form-group">
					<label for="exam" class="text-center">Exam</label>
					<select name="exam">
						<option value="">--Select Exam--</option>
						<option value="semester">Semester</option>
						<option value="mid 1">Mid I</option>	
						<option value="mid 2">Mid II</option>	
					</select>
				</div>
				<div class="form-group">
				<input type="submit" name="submit" id="submit" class="btn btn-success" value="SUBMIT"/>
				</div>
				</form>
				</div>
		<div class="modal-footer">
			<button  class="btn btn-danger" data-dismiss="modal">close</button>
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

</html>
