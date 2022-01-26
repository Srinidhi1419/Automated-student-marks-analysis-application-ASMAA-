<%@page import="DBConnection.DBConnection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<html>
<head>
<title>Student Details</title>
<link href="css/style.css" rel="stylesheet" />
<link href="bootstrap/bootstrap.css" rel="stylesheet"/>
<link href="http://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css"/>
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
			<li class="nav-item last" ><a class="nav-link py-0 text-white" href="" data-target="#slogin" data-toggle="modal">Student</a></li>
		</ul>
	</div>	
</div>
</nav>
<br/>
<!-- Student Login-->
<div class="modal fade" id="slogin" role="dialog">
	<div class="modal-dialog">
		<div class="modal-content" class="text-capitalize">
			<div class="modal-header">
				<h3>Student Login</h3>
				<button class="btn" data-dismiss="modal">&times;</button>
			</div>
		 		<div class="modal-body">
				<form action="student_index.html" method="post" class="text-capitalize" target="_blank">
				<div class="form-group">
					<label for="username">Username</label>
					<input type="text" class="form-control" name="admin" id="admin" required="required"/>
				</div>
				<div class="form-group">
					<label for="pass" class="text-center">Password</label>
					<input type="password" class="form-control" name="pass" id="pass" required="required"/>
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
<!--Student Data Card-->
<div class="container padding">
<div class="row">
<div class="col-12">
<h2 class="text-center">VIKAS INSTITUTIONS,NUNNA</h2>
<h3 class="text-center text-underline"><em style="text-decoration:underline">STUDENT DATA CARD</em></h3>
<div class="row">
    
<table class="table">
     <%
    Connection conn = DBConnection.getConnection();
                PreparedStatement ps = conn.prepareStatement("select * from student where htno='16NQ1A0589'");
                ResultSet rs = ps.executeQuery();
                if(rs.next()){
    %>
<tr>
     <th>Branch:</th><td><%= rs.getString("Branch") %></td>
     <th>University HT Number:</th><td><%= rs.getString("htno")%></td>
</tr>
</table>
<table class="table">
			
            <tr>
                <th>1.Name of the Student:</th><td><%= rs.getString("sname") %></td>
            </tr>
            <tr>
                            <th>2.Father's Name & Occupation:<p>(if employee,give details)</p></th><td><%= rs.getString("fname") %>&emsp;<%= rs.getString("foccup") %></td>
            </tr>
			<tr>
                <th>3.Mother's Name & Occupation:<p>(if employee,give details)</p></th><td><%= rs.getString("mname") %>&emsp;<%= rs.getString("moccup") %></td>
            </tr>
			<tr>
                            <th>4.Category</th><td><%= rs.getString("caste") %> &emsp; <%= rs.getString("stype") %>&emsp; <%= rs.getString("htype") %></td>
            </tr>
			
			<tr>
                <th>5.EAMCET/ECET/ICET/CEEP Rank</th><td><%= rs.getString("cet") %></td>
            </tr><tr>
                <th>6.Date of Birth</th><td><%= rs.getString("dob") %></td>
            </tr>
			<tr>
                <th>7.Blood Group</th><td><%= rs.getString("blood") %></td>
            </tr>
</table>
<table class="table">
<tr>
     <th></th><th>PRSESENT</th><th>PERMANENT</th>
</tr>
<tr>
    <th>8.Address:</th><td><%= rs.getString("caddr") %></td><th></th><td><%= rs.getString("paddr") %></td>
</tr>

</table>
<table class="table">
<tr>
    <th>9.Contact Numbers:&emsp;&emsp;&emsp;Student:</th><td><%= rs.getString("smno") %><th>Parent Cell No:</th><td><%= rs.getString("pmno") %></td>
</tr>
<tr>     
	 <th></th><th></th><th>Parent Land No:</th><td><%= rs.getString("plno") %></td>
</tr>
<tr>
     <th>10.Email:&nbsp;&nbsp;&nbsp;Student:</th><td><%= rs.getString("semail") %></td><th>Parent:</th><td><%= rs.getString("pemail") %></td>
</tr>
</table>
 <table class="table table-bordered table-responsive-sm" >
			<tr><th colspan=5>11.Past Academic Record</th></tr>
            <tr>
                <th>S.NO</th>
                <th>Qualification</th>
                <th>Institution</th>
                <th>Year of Passing</th>
                <th>% of Marks</th>
            </tr>
            <tr>
                <td>1</td>
                <td><%= rs.getString("ssc") %></td>
                <td><%= rs.getString("inst1") %></td>
                <td><%= rs.getString("yop1") %></td>
                <td><%= rs.getString("marks1") %> %</td>
            </tr>
            <tr>
                <td>2</td>
                <td><%= rs.getString("inter") %>
                </td><td><%= rs.getString("inst2") %></td>
                <td><%= rs.getString("yop2") %></td>
                <td><%= rs.getString("marks2") %> %</td>
            </tr>
            <tr>
                <td>3</td>
                <td><%= rs.getString("other") %></td>
                <td><%= rs.getString("inst3") %></td>
                <td><%= rs.getString("yop3") %></td>
                <td><%= rs.getString("marks3") %> %</td>
            </tr>
            <%}%>
        </table>
<table class="table table-bordered table-responsive-sm text-center">
			<tr><th colspan=7>Academic Record</th></tr>
            <tr>
                <th>Class</th>
                <th>Sem</th>
                <th>Year of Study</th>
                <th>Final(%)Attendance</th>
                <th>Total Marks and %</th>
                <th>Subjects Failed if any</th>
                <th>Principal / HOD Initials</th>
            </tr>
           <tr>
				<td rowspan=2>I</td>
				<td>I</td>
				<td></td>
                                <td></td>
                                <td>
                <%float sum1=0,total1=0;
                PreparedStatement ps1 = conn.prepareStatement("select * from semester where htno='16NQ1A0589' AND year='I' AND sem='I'");
                ResultSet rs1 = ps1.executeQuery();
                while(rs1.next()){
                String grade = rs1.getString("grade");                
                if(grade.equals("O")){
                    int grade1 = 10;
                    int credit = rs1.getInt("credits");
                    total1 = total1+credit;
                    sum1 = sum1+(grade1*credit);
                }else if(grade.equals("S")){
                    int grade1 = 9;
                    int credit = rs1.getInt("credits");
                    total1 = total1+credit;
                    sum1 = sum1+(grade1*credit);
                }else if(grade.equals("A")){
                    int grade1 = 8;
                    int credit = rs1.getInt("credits");
                    total1 = total1+credit;
                    sum1 = sum1+(grade1*credit);
                }else if(grade.equals("B")){
                    int grade1 = 7;
                    int credit = rs1.getInt("credits");
                    total1 = total1+credit;
                    sum1 = sum1+(grade1*credit);
                }else if(grade.equals("C")){
                    int grade1 = 6;
                    int credit = rs1.getInt("credits");
                    total1 = total1+credit;
                    sum1 = sum1+(grade1*credit);
                }else if(grade.equals("D")){
                    int grade1 = 5;
                    int credit = rs1.getInt("credits");
                    total1 = total1+credit;
                    sum1 = sum1+(grade1*credit);
                }else{
                    int grade1 = 0;
                    int credit = rs1.getInt("credits");
                    total1 = total1+credit;
                    sum1 = sum1+(grade1*credit);
                } }float s = sum1/total1;
             String strDouble = String.format("%.2f", s);
                                    %><%= strDouble%>
                                </td>
                                <td>
				<%
                PreparedStatement ps2 = conn.prepareStatement("select * from semester where htno='16NQ1A0589' AND year='I' AND sem='I'");
                ResultSet rs2 = ps2.executeQuery();
                while(rs2.next()){
                    if(rs2.getString("grade").equals("F")){
                out.println(rs2.getString("sname")+",");              
                }}
            %>
                                </td><td></td>
			</tr>
                        <tr>
				<td>II</td>
				<td></td>
                                <td></td>
                                <td>
                <%float sum12=0,total12=0;
                PreparedStatement ps12 = conn.prepareStatement("select * from semester where htno='16NQ1A0589' AND year='I' AND sem='II'");
                ResultSet rs12 = ps12.executeQuery();
                while(rs12.next()){
                String grade = rs12.getString("grade");                
                if(grade.equals("O")){
                    int grade1 = 10;
                    int credit = rs12.getInt("credits");
                    total12 = total12+credit;
                    sum12 = sum12+(grade1*credit);
                }else if(grade.equals("S")){
                    int grade1 = 9;
                    int credit = rs12.getInt("credits");
                    total12 = total12+credit;
                    sum12 = sum12+(grade1*credit);
                }else if(grade.equals("A")){
                    int grade1 = 8;
                    int credit = rs12.getInt("credits");
                    total12 = total12+credit;
                    sum12 = sum12+(grade1*credit);
                }else if(grade.equals("B")){
                    int grade1 = 7;
                    int credit = rs12.getInt("credits");
                    total12 = total12+credit;
                    sum12 = sum12+(grade1*credit);
                }else if(grade.equals("C")){
                    int grade1 = 6;
                    int credit = rs12.getInt("credits");
                    total12 = total12+credit;
                    sum12 = sum12+(grade1*credit);
                }else if(grade.equals("D")){
                    int grade1 = 5;
                    int credit = rs12.getInt("credits");
                    total12 = total12+credit;
                    sum12 = sum12+(grade1*credit);
                }else{
                    int grade1 = 0;
                    int credit = rs12.getInt("credits");
                    total1 = total1+credit;
                    sum12 = sum12+(grade1*credit);
                } }float s12 = sum12/total12;
             String strDouble12 = String.format("%.2f", s12);
                                    %><%= strDouble12%>
                                </td>
                                <td>
				<%
                PreparedStatement ps121 = conn.prepareStatement("select * from semester where htno='16NQ1A0589' AND year='I' AND sem='I'");
                ResultSet rs121 = ps121.executeQuery();
                while(rs121.next()){
                    if(rs121.getString("grade").equals("F")){
                out.println(rs121.getString("sname")+",");              
                }}
            %>
                                </td><td></td>
			</tr>
                        <tr>
                            <td rowspan=2>II</td>
				<td>I</td>
				<td></td>
                                <td></td>
                                <td>
                <%float sum21=0,total21=0;
                PreparedStatement ps21 = conn.prepareStatement("select * from semester where htno='16NQ1A0589' AND year='II' AND sem='I'");
                ResultSet rs21 = ps21.executeQuery();
                while(rs21.next()){
                String grade = rs21.getString("grade");                
                if(grade.equals("O")){
                    int grade1 = 10;
                    int credit = rs21.getInt("credits");
                    total21 = total21+credit;
                    sum21 = sum21+(grade1*credit);
                }else if(grade.equals("S")){
                    int grade1 = 9;
                    int credit = rs21.getInt("credits");
                    total21 = total21+credit;
                    sum21 = sum21+(grade1*credit);
                }else if(grade.equals("A")){
                    int grade1 = 8;
                    int credit = rs21.getInt("credits");
                    total21 = total21+credit;
                    sum21 = sum21+(grade1*credit);
                }else if(grade.equals("B")){
                    int grade1 = 7;
                    int credit = rs21.getInt("credits");
                    total21 = total21+credit;
                    sum21 = sum21+(grade1*credit);
                }else if(grade.equals("C")){
                    int grade1 = 6;
                    int credit = rs21.getInt("credits");
                    total21 = total21+credit;
                    sum21 = sum21+(grade1*credit);
                }else if(grade.equals("D")){
                    int grade1 = 5;
                    int credit = rs21.getInt("credits");
                    total21 = total21+credit;
                    sum21 = sum21+(grade1*credit);
                }else{
                    int grade1 = 0;
                    int credit = rs21.getInt("credits");
                    total1 = total1+credit;
                    sum21 = sum21+(grade1*credit);
                } }float s21 = sum21/total21;
             String strDouble21 = String.format("%.2f", s21);
                                    %><%= strDouble21%>
                                </td>
                                <td>
				<%
                PreparedStatement ps211 = conn.prepareStatement("select * from semester where htno='16NQ1A0589' AND year='I' AND sem='I'");
                ResultSet rs211 = ps211.executeQuery();
                while(rs211.next()){
                    if(rs211.getString("grade").equals("F")){
                out.println(rs121.getString("sname")+",");              
                }}
            %>
                                </td><td></td>
			</tr>
                        <tr>
                            
				<td>II</td>
				<td></td>
                                <td></td>
                                <td>
                <%float sum22=0,total22=0;
                PreparedStatement ps22 = conn.prepareStatement("select * from semester where htno='16NQ1A0589' AND year='II' AND sem='II'");
                ResultSet rs22 = ps22.executeQuery();
                while(rs22.next()){
                String grade = rs22.getString("grade");                
                if(grade.equals("O")){
                    int grade1 = 10;
                    int credit = rs22.getInt("credits");
                    total22 = total22+credit;
                    sum22 = sum22+(grade1*credit);
                }else if(grade.equals("S")){
                    int grade1 = 9;
                    int credit = rs22.getInt("credits");
                    total22 = total22+credit;
                    sum22 = sum22+(grade1*credit);
                }else if(grade.equals("A")){
                    int grade1 = 8;
                    int credit = rs22.getInt("credits");
                    total22 = total22+credit;
                    sum22 = sum22+(grade1*credit);
                }else if(grade.equals("B")){
                    int grade1 = 7;
                    int credit = rs22.getInt("credits");
                    total22 = total22+credit;
                    sum22 = sum22+(grade1*credit);
                }else if(grade.equals("C")){
                    int grade1 = 6;
                    int credit = rs22.getInt("credits");
                    total22 = total22+credit;
                    sum22 = sum22+(grade1*credit);
                }else if(grade.equals("D")){
                    int grade1 = 5;
                    int credit = rs22.getInt("credits");
                    total22 = total22+credit;
                    sum22 = sum22+(grade1*credit);
                }else{
                    int grade1 = 0;
                    int credit = rs22.getInt("credits");
                    total1 = total1+credit;
                    sum22 = sum22+(grade1*credit);
                } }float s22 = sum22/total22;
             String strDouble22 = String.format("%.2f", s22);
                                    %><%= strDouble22%>
                                </td>
                                <td>
				<%
                PreparedStatement ps221 = conn.prepareStatement("select * from semester where htno='16NQ1A0589' AND year='II' AND sem='II'");
                ResultSet rs221 = ps221.executeQuery();
                while(rs221.next()){
                    if(rs221.getString("grade").equals("F")){
                out.println(rs221.getString("sname")+",");              
                }}
            %>
                                </td><td></td>
			</tr>
                        <tr>
                            <td rowspan=2>III</td>
				<td>I</td>
				<td></td>
                                <td></td>
                                <td>
                <%float sum31=0,total31=0;
                PreparedStatement ps31 = conn.prepareStatement("select * from semester where htno='16NQ1A0589' AND year='III' AND sem='I'");
                ResultSet rs31 = ps31.executeQuery();
                while(rs31.next()){
                String grade = rs31.getString("grade");                
                if(grade.equals("O")){
                    int grade1 = 10;
                    int credit = rs31.getInt("credits");
                    total31 = total31+credit;
                    sum31 = sum31+(grade1*credit);
                }else if(grade.equals("S")){
                    int grade1 = 9;
                    int credit = rs31.getInt("credits");
                    total31 = total31+credit;
                    sum31 = sum31+(grade1*credit);
                }else if(grade.equals("A")){
                    int grade1 = 8;
                    int credit = rs31.getInt("credits");
                    total31 = total31+credit;
                    sum31 = sum31+(grade1*credit);
                }else if(grade.equals("B")){
                    int grade1 = 7;
                    int credit = rs31.getInt("credits");
                    total31 = total31+credit;
                    sum31 = sum31+(grade1*credit);
                }else if(grade.equals("C")){
                    int grade1 = 6;
                    int credit = rs31.getInt("credits");
                    total31 = total31+credit;
                    sum31 = sum31+(grade1*credit);
                }else if(grade.equals("D")){
                    int grade1 = 5;
                    int credit = rs31.getInt("credits");
                    total31 = total31+credit;
                    sum31 = sum31+(grade1*credit);
                }else{
                    int grade1 = 0;
                    int credit = rs31.getInt("credits");
                    total1 = total1+credit;
                    sum31 = sum31+(grade1*credit);
                } }float s31 = sum31/total31;
             String strDouble31 = String.format("%.2f", s31);
                                    %><%= strDouble31%>
                                </td>
                                <td>
				<%
                PreparedStatement ps311 = conn.prepareStatement("select * from semester where htno='16NQ1A0589' AND year='III' AND sem='I'");
                ResultSet rs311 = ps311.executeQuery();
                while(rs311.next()){
                    if(rs311.getString("grade").equals("F")){
                out.println(rs311.getString("sname")+",");              
                }}
            %>
                                </td><td></td>
			</tr>
                        <tr>
				<td>II</td>
				<td></td>
                                <td></td>
                                <td>
                <%float sum32=0,total32=0;
                PreparedStatement ps32 = conn.prepareStatement("select * from semester where htno='16NQ1A0589' AND year='III' AND sem='II'");
                ResultSet rs32 = ps32.executeQuery();
                while(rs32.next()){
                String grade = rs32.getString("grade");                
                if(grade.equals("O")){
                    int grade1 = 10;
                    int credit = rs32.getInt("credits");
                    total32 = total32+credit;
                    sum32 = sum32+(grade1*credit);
                }else if(grade.equals("S")){
                    int grade1 = 9;
                    int credit = rs32.getInt("credits");
                    total32 = total32+credit;
                    sum32 = sum32+(grade1*credit);
                }else if(grade.equals("A")){
                    int grade1 = 8;
                    int credit = rs32.getInt("credits");
                    total32 = total32+credit;
                    sum32 = sum32+(grade1*credit);
                }else if(grade.equals("B")){
                    int grade1 = 7;
                    int credit = rs32.getInt("credits");
                    total32 = total32+credit;
                    sum32 = sum32+(grade1*credit);
                }else if(grade.equals("C")){
                    int grade1 = 6;
                    int credit = rs32.getInt("credits");
                    total32 = total32+credit;
                    sum32 = sum32+(grade1*credit);
                }else if(grade.equals("D")){
                    int grade1 = 5;
                    int credit = rs32.getInt("credits");
                    total32 = total32+credit;
                    sum32 = sum32+(grade1*credit);
                }else{
                    int grade1 = 0;
                    int credit = rs32.getInt("credits");
                    total1 = total1+credit;
                    sum32 = sum32+(grade1*credit);
                } }float s32 = sum32/total32;
             String strDouble32 = String.format("%.2f", s32);
                                    %><%= strDouble32%>
                                </td>
                                <td>
				<%
                PreparedStatement ps321 = conn.prepareStatement("select * from semester where htno='16NQ1A0589' AND year='III' AND sem='II'");
                ResultSet rs321 = ps321.executeQuery();
                while(rs321.next()){
                    if(rs321.getString("grade").equals("F")){
                out.println(rs321.getString("sname")+",");              
                }}
            %>
                                </td><td></td>
			</tr>
                        <tr>
                            <td rowspan=2>IV</td>
				<td>I</td>
				<td></td>
                                <td></td>
                                <td>
                <%float sum41=0,total41=0;
                PreparedStatement ps41 = conn.prepareStatement("select * from semester where htno='16NQ1A0589' AND year='IV' AND sem='I'");
                ResultSet rs41 = ps41.executeQuery();
                while(rs41.next()){
                String grade = rs41.getString("grade");                
                if(grade.equals("O")){
                    int grade1 = 10;
                    int credit = rs41.getInt("credits");
                    total41 = total41+credit;
                    sum41 = sum41+(grade1*credit);
                }else if(grade.equals("S")){
                    int grade1 = 9;
                    int credit = rs41.getInt("credits");
                    total41 = total41+credit;
                    sum41 = sum41+(grade1*credit);
                }else if(grade.equals("A")){
                    int grade1 = 8;
                    int credit = rs41.getInt("credits");
                    total41 = total41+credit;
                    sum41 = sum41+(grade1*credit);
                }else if(grade.equals("B")){
                    int grade1 = 7;
                    int credit = rs41.getInt("credits");
                    total41 = total41+credit;
                    sum41 = sum41+(grade1*credit);
                }else if(grade.equals("C")){
                    int grade1 = 6;
                    int credit = rs41.getInt("credits");
                    total41 = total41+credit;
                    sum41 = sum41+(grade1*credit);
                }else if(grade.equals("D")){
                    int grade1 = 5;
                    int credit = rs41.getInt("credits");
                    total41 = total41+credit;
                    sum41 = sum41+(grade1*credit);
                }else{
                    int grade1 = 0;
                    int credit = rs41.getInt("credits");
                    total1 = total1+credit;
                    sum41 = sum41+(grade1*credit);
                } }float s41 = sum41/total41;
             String strDouble41 = String.format("%.2f", s41);
                                    %><%= strDouble41%>
                                </td>
                                <td>
				<%
                PreparedStatement ps411 = conn.prepareStatement("select * from semester where htno='16NQ1A0589' AND year='IV' AND sem='I'");
                ResultSet rs411 = ps411.executeQuery();
                while(rs411.next()){
                    if(rs411.getString("grade").equals("F")){
                out.println(rs411.getString("sname")+",");              
                }}
            %>
                                </td><td></td>
			</tr>
                        <tr>                            
				<td>II</td>
				<td></td>
                                <td></td>
                                <td>
                <%float sum42=0,total42=0;
                PreparedStatement ps42 = conn.prepareStatement("select * from semester where htno='16NQ1A0589' AND year='IV' AND sem='II'");
                ResultSet rs42 = ps42.executeQuery();
                while(rs42.next()){
                String grade = rs42.getString("grade");                
                if(grade.equals("O")){
                    int grade1 = 10;
                    int credit = rs42.getInt("credits");
                    total42 = total42+credit;
                    sum42 = sum42+(grade1*credit);
                }else if(grade.equals("S")){
                    int grade1 = 9;
                    int credit = rs42.getInt("credits");
                    total42 = total42+credit;
                    sum42 = sum42+(grade1*credit);
                }else if(grade.equals("A")){
                    int grade1 = 8;
                    int credit = rs42.getInt("credits");
                    total42 = total42+credit;
                    sum42 = sum42+(grade1*credit);
                }else if(grade.equals("B")){
                    int grade1 = 7;
                    int credit = rs42.getInt("credits");
                    total42 = total42+credit;
                    sum42 = sum42+(grade1*credit);
                }else if(grade.equals("C")){
                    int grade1 = 6;
                    int credit = rs42.getInt("credits");
                    total42 = total42+credit;
                    sum42 = sum42+(grade1*credit);
                }else if(grade.equals("D")){
                    int grade1 = 5;
                    int credit = rs42.getInt("credits");
                    total42 = total42+credit;
                    sum42 = sum42+(grade1*credit);
                }else{
                    int grade1 = 0;
                    int credit = rs42.getInt("credits");
                    total1 = total1+credit;
                    sum42 = sum42+(grade1*credit);
                } }float s42 = sum42/total42;
             String strDouble42 = String.format("%.2f", s42);
                                    %><%= strDouble42%>
                                </td>
                                <td>
				<%
                PreparedStatement ps421 = conn.prepareStatement("select * from semester where htno='16NQ1A0589' AND year='IV' AND sem='II'");
                ResultSet rs421 = ps421.executeQuery();
                while(rs421.next()){
                    if(rs421.getString("grade").equals("F")){
                out.println(rs421.getString("sname")+",");              
                }}
            %>
                                </td><td></td>
			</tr>
			
        </table>		
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