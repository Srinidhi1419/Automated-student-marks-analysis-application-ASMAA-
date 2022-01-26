<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="DBConnection.DBConnection"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
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
    <a class="navbar-brand"><%= session.getAttribute("sname") %></a>
	<button class="navbar-toggler" type="button" data-target="#navmenu" data-toggle="collapse"><span class="navbar-toggler-icon"></span></button>
	<div class="collapse navbar-collapse justify-content-center" id="navmenu">
            
		<ul class="navbar-nav">
			<li class="nav-item last"><a class="nav-link py-0 text-white" href="Logout.jsp">Logout</a></li>
		</ul>
	</div>	
</div>
</nav>
<br/>
<!-- Student Login-->
<div class="container">
    

    <%
    Connection conn = DBConnection.getConnection();
                PreparedStatement ps = conn.prepareStatement("select * from student where htno='"+session.getAttribute("htno")+"'");
                ResultSet rs = ps.executeQuery();
                if(rs.next()){
    %>
    <center> <img id="myimage" src="view.jsp?htno=<%=rs.getString("htno")%>"  height="150" width="150"><br/><br/>
        Roll Number : <strong><%= rs.getString("htno")%></strong><br/>
        Student's Name : <strong><%= rs.getString("sname") %></strong><br/>
        Father's Name : <strong><%= rs.getString("fname") %></strong><br/>
        Branch : <strong><%= rs.getString("Branch") %></strong><br/>
        Year : <strong><%= rs.getString("Year") %></strong><br/>
        Semester : <strong><%= rs.getString("sem") %></strong><br/>
    </center>          
 <%}%>               
<br/>
</div>
<center>
        <div class="container">
    <h4></h4><hr>
    <h5>I Year I Semester</h5>
    
<table class="table table-bordered table-hover table-secondary table-striped">
    <tr><th>S.NO</th><th>SCODE</th><th>SNAME</th><th>GRADE</th><th>CREDITS</th></tr>
    <%
    int count5=0; float sum1=0,total1=0;
                PreparedStatement ps6 = conn.prepareStatement("select * from semester where htno='"+session.getAttribute("htno")+"' and year='I' and sem='I' ");
                ResultSet rs6 = ps6.executeQuery();
                while(rs6.next()){count5++;
                String grade = rs6.getString("grade");                
                if(grade.equals("O")){
                    int grade1 = 10;
                    int credit = rs6.getInt("credits");
                    total1 = total1+credit;
                    sum1 = sum1+(grade1*credit);
                }else if(grade.equals("S")){
                    int grade1 = 9;
                    int credit = rs6.getInt("credits");
                    total1 = total1+credit;
                    sum1 = sum1+(grade1*credit);
                }else if(grade.equals("A")){
                    int grade1 = 8;
                    int credit = rs6.getInt("credits");
                    total1 = total1+credit;
                    sum1 = sum1+(grade1*credit);
                }else if(grade.equals("B")){
                    int grade1 = 7;
                    int credit = rs6.getInt("credits");
                    total1 = total1+credit;
                    sum1 = sum1+(grade1*credit);
                }else if(grade.equals("C")){
                    int grade1 = 6;
                    int credit = rs6.getInt("credits");
                    total1 = total1+credit;
                    sum1 = sum1+(grade1*credit);
                }else if(grade.equals("D")){
                    int grade1 = 5;
                    int credit = rs6.getInt("credits");
                    total1 = total1+credit;
                    sum1 = sum1+(grade1*credit);
                }else{
                    int grade1 = 0;
                    int credit = rs6.getInt("credits");
                    total1 = total1+credit;
                    sum1 = sum1+(grade1*credit);
                }
    %>
    <tr><td><%=count5%></td><td><%=rs6.getString("scode")%></td><td><%= rs6.getString("sname") %></td><td><%= rs6.getString("grade") %></td><td><%= rs6.getInt("credits") %></td></tr>
             <%}
               float s = sum1/total1;
             String strDouble = String.format("%.2f", s);
             %>    
</table>

             <h5>SGPA For 1 Year 1 Sem is <strong><b><%= strDouble %></b></strong> out of 10 </h5>
</div>
<div class="container">
    <hr>
    <h5>I Year II Semester</h5>
    
<table class="table table-bordered table-hover table-secondary table-striped">
    <tr><th>S.NO</th><th>SCODE</th><th>SNAME</th><th>GRADE</th><th>CREDITS</th></tr>
    <%
    int count= 0; float sum=0,total=0;
                PreparedStatement ps1 = conn.prepareStatement("select * from semester where htno='"+session.getAttribute("htno")+"' and year='I' and sem='II' ");
                ResultSet rs1 = ps1.executeQuery();
                while(rs1.next()){count++;
                String grade = rs1.getString("grade");                
                if(grade.equals("O")){
                    int grade1 = 10;
                    int credit = rs1.getInt("credits");
                    total = total+credit;
                    sum = sum+(grade1*credit);
                }else if(grade.equals("S")){
                    int grade1 = 9;
                    int credit = rs1.getInt("credits");
                    total = total+credit;
                    sum = sum+(grade1*credit);
                }else if(grade.equals("A")){
                    int grade1 = 8;
                    int credit = rs1.getInt("credits");
                    total = total+credit;
                    sum = sum+(grade1*credit);
                }else if(grade.equals("B")){
                    int grade1 = 7;
                    int credit = rs1.getInt("credits");
                    total = total+credit;
                    sum = sum+(grade1*credit);
                }else if(grade.equals("C")){
                    int grade1 = 6;
                    int credit = rs1.getInt("credits");
                    total = total+credit;
                    sum = sum+(grade1*credit);
                }else if(grade.equals("D")){
                    int grade1 = 5;
                    int credit = rs1.getInt("credits");
                    total = total+credit;
                    sum = sum+(grade1*credit);
                }else{
                    int grade1 = 0;
                    int credit = rs1.getInt("credits");
                    total = total+credit;
                    sum = sum+(grade1*credit);
                }
                
                
    %>
    <tr><td><%=count%></td><td><%=rs1.getString("scode")%></td><td><%= rs1.getString("sname") %></td><td><%= grade %></td><td><%= rs1.getInt("credits") %></td></tr>
             <%}
              float s1 = sum/total;
             String strDouble1 = String.format("%.2f", s1);
             %>
             
</table>
             <h5>SGPA For 1 Year 2 Sem is <strong><b><%= strDouble1 %></b></strong> out of 10 </h5>
</div>
<hr>
<div class="container">
    <h5>II Year I Semester</h5>
    
<table class="table table-bordered table-hover table-secondary table-striped">
    <tr><th>S.NO</th><th>SCODE</th><th>SNAME</th><th>GRADE</th><th>CREDITS</th></tr>
    <%
    int count6=0;float sum21=0;int total21=0;
                PreparedStatement ps7 = conn.prepareStatement("select * from semester where htno='"+session.getAttribute("htno")+"' and year='II' and sem='I' ");
                ResultSet rs7 = ps7.executeQuery();
                while(rs7.next()){count6++;
                
                String grade = rs7.getString("grade");                
                if(grade.equals("O")){
                    int grade1 = 10;
                    int credit = rs7.getInt("credits");
                    total21 = total21+credit;
                    sum21 = sum21+(grade1*credit);
                }else if(grade.equals("S")){
                    int grade1 = 9;
                    int credit = rs7.getInt("credits");
                    total21 = total21+credit;
                    sum21 = sum21+(grade1*credit);
                }else if(grade.equals("A")){
                    int grade1 = 8;
                    int credit = rs7.getInt("credits");
                    total21 = total21+credit;
                    sum21 = sum21+(grade1*credit);
                }else if(grade.equals("B")){
                    int grade1 = 7;
                    int credit = rs7.getInt("credits");
                    total21 = total21+credit;
                    sum21 = sum21+(grade1*credit);
                }else if(grade.equals("C")){
                    int grade1 = 6;
                    int credit = rs7.getInt("credits");
                    total21 = total21+credit;
                    sum21 = sum21+(grade1*credit);
                }else if(grade.equals("D")){
                    int grade1 = 5;
                    int credit = rs7.getInt("credits");
                    total21 = total21+credit;
                    sum21 = sum21+(grade1*credit);
                }else{
                    int grade1 = 0;
                    int credit = rs7.getInt("credits");
                    total21 = total21+credit;
                    sum21 = sum21+(grade1*credit);
                }
    %>
    <tr><td><%=count6%></td><td><%=rs7.getString("scode")%></td><td><%= rs7.getString("sname") %></td><td><%= rs7.getString("grade") %></td><td><%= rs7.getInt("credits") %></td></tr>
             <%}
             float s21 = sum21/total21;
             String strDouble21 = String.format("%.2f",s21);
             %>   
</table>
 <h5>SGPA For 2 Year 1 Sem is <strong><b><%= strDouble21 %></b></strong> out of 10 </h5>
</div>

<div class="container"><hr>
    <h5>II Year II Semester</h5>
    
<table class="table table-bordered table-hover table-secondary table-striped">
    <tr><th>S.NO</th><th>SCODE</th><th>SNAME</th><th>GRADE</th><th>CREDITS</th></tr>
    <%
    int count1= 0;float sum22=0;int total22=0;
                PreparedStatement ps2 = conn.prepareStatement("select * from semester where htno='"+session.getAttribute("htno")+"' and year='II' and sem='II' ");
                ResultSet rs2 = ps2.executeQuery();
                while(rs2.next()){count1++;
                
                String grade = rs2.getString("grade");                
                if(grade.equals("O")){
                    int grade1 = 10;
                    int credit = rs2.getInt("credits");
                    total22 = total22+credit;
                    sum22 = sum22+(grade1*credit);
                }else if(grade.equals("S")){
                    int grade1 = 9;
                    int credit = rs2.getInt("credits");
                    total22 = total22+credit;
                    sum22 = sum22+(grade1*credit);
                }else if(grade.equals("A")){
                    int grade1 = 8;
                    int credit = rs2.getInt("credits");
                    total22 = total22+credit;
                    sum22 = sum22+(grade1*credit);
                }else if(grade.equals("B")){
                    int grade1 = 7;
                    int credit = rs2.getInt("credits");
                    total22 = total22+credit;
                    sum22 = sum22+(grade1*credit);
                }else if(grade.equals("C")){
                    int grade1 = 6;
                    int credit = rs2.getInt("credits");
                    total22 = total22+credit;
                    sum22 = sum22+(grade1*credit);
                }else if(grade.equals("D")){
                    int grade1 = 5;
                    int credit = rs2.getInt("credits");
                    total22 = total22+credit;
                    sum22 = sum22+(grade1*credit);
                }else{
                    int grade1 = 0;
                    int credit = rs2.getInt("credits");
                    total22 = total22+credit;
                    sum22 = sum22+(grade1*credit);
                }


    %>
    <tr><td><%=count1%></td><td><%=rs2.getString("scode")%></td><td><%= rs2.getString("sname") %></td><td><%= rs2.getString("grade") %></td><td><%= rs2.getInt("credits") %></td></tr>
             <%}
             float s22 = sum22/total22;
             String strDouble22 = String.format("%.2f",s22);
             %>   
</table>
 <h5>SGPA For 2 Year 2 Sem is <strong><b><%= strDouble22 %></b></strong> out of 10 </h5>
</div>
<div class="container"><hr>
    <h5>III Year I Semester</h5>
    
<table class="table table-bordered table-hover table-secondary table-striped">
    <tr><th>S.NO</th><th>SCODE</th><th>SNAME</th><th>GRADE</th><th>CREDITS</th></tr>
    <%
    int count2= 0;float sum31=0;int total31=0;
                PreparedStatement ps3 = conn.prepareStatement("select * from semester where htno='"+session.getAttribute("htno")+"' and year='III' and sem='I' ");
                ResultSet rs3 = ps3.executeQuery();
                while(rs3.next()){count2++;
                
                 String grade = rs3.getString("grade");                
                if(grade.equals("O")){
                    int grade1 = 10;
                    int credit = rs3.getInt("credits");
                    total31 = total31+credit;
                    sum31 = sum31+(grade1*credit);
                }else if(grade.equals("S")){
                    int grade1 = 9;
                    int credit = rs3.getInt("credits");
                    total31 = total31+credit;
                    sum31 = sum31+(grade1*credit);
                }else if(grade.equals("A")){
                    int grade1 = 8;
                    int credit = rs3.getInt("credits");
                    total31 = total31+credit;
                    sum31 = sum31+(grade1*credit);
                }else if(grade.equals("B")){
                    int grade1 = 7;
                    int credit = rs3.getInt("credits");
                    total31 = total31+credit;
                    sum31 = sum31+(grade1*credit);
                }else if(grade.equals("C")){
                    int grade1 = 6;
                    int credit = rs3.getInt("credits");
                    total31 = total31+credit;
                    sum31 = sum31+(grade1*credit);
                }else if(grade.equals("D")){
                    int grade1 = 5;
                    int credit = rs3.getInt("credits");
                    total31 = total31+credit;
                    sum31 = sum31+(grade1*credit);
                }else{
                    int grade1 = 0;
                    int credit = rs3.getInt("credits");
                    total31 = total31+credit;
                    sum31 = sum31+(grade1*credit);
                }



    %>
    <tr><td><%=count2%></td><td><%=rs3.getString("scode")%></td><td><%= rs3.getString("sname") %></td><td><%= rs3.getString("grade") %></td><td><%= rs3.getInt("credits") %></td></tr>
             <%}
             float s31 = sum31/total31;
             String strDouble31 = String.format("%.2f",s31);
             %>   
</table>
<h5>SGPA For 3 Year 1 Sem is <strong><b><%= strDouble31 %></b></strong> out of 10 </h5>
</div>
<div class="container"><hr>
    <h5>III Year II Semester</h5>
    
<table class="table table-bordered table-hover table-secondary table-striped">
    <tr><th>S.NO</th><th>SCODE</th><th>SNAME</th><th>GRADE</th><th>CREDITS</th></tr>
    <%
    int count3= 0;float sum32=0;int total32=0;
                PreparedStatement ps4 = conn.prepareStatement("select * from semester where htno='"+session.getAttribute("htno")+"' and year='III' and sem='II' ");
                ResultSet rs4 = ps4.executeQuery();
                while(rs4.next()){count3++;
                
                String grade = rs4.getString("grade");                
                if(grade.equals("O")){
                    int grade1 = 10;
                    int credit = rs4.getInt("credits");
                    total32 = total32+credit;
                    sum32 = sum32+(grade1*credit);
                }else if(grade.equals("S")){
                    int grade1 = 9;
                    int credit = rs4.getInt("credits");
                    total32 = total32+credit;
                    sum32 = sum32+(grade1*credit);
                }else if(grade.equals("A")){
                    int grade1 = 8;
                    int credit = rs4.getInt("credits");
                    total32 = total32+credit;
                    sum32 = sum32+(grade1*credit);
                }else if(grade.equals("B")){
                    int grade1 = 7;
                    int credit = rs4.getInt("credits");
                    total32 = total32+credit;
                    sum32 = sum32+(grade1*credit);
                }else if(grade.equals("C")){
                    int grade1 = 6;
                    int credit = rs4.getInt("credits");
                    total32 = total32+credit;
                    sum32 = sum32+(grade1*credit);
                }else if(grade.equals("D")){
                    int grade1 = 5;
                    int credit = rs4.getInt("credits");
                    total32 = total32+credit;
                    sum32 = sum32+(grade1*credit);
                }else{
                    int grade1 = 0;
                    int credit = rs4.getInt("credits");
                    total32 = total32+credit;
                    sum32 = sum32+(grade1*credit);
                }

    %>
    <tr><td><%=count3%></td><td><%=rs4.getString("scode")%></td><td><%= rs4.getString("sname") %></td><td><%= rs4.getString("grade") %></td><td><%= rs4.getInt("credits") %></td></tr>
             <%}
             float s32 = sum32/total32;
             String strDouble32 = String.format("%.2f",s32);
             %>   
</table>
<h5>SGPA For 3 Year 2 Sem is <strong><b><%= strDouble32 %></b></strong> out of 10 </h5>
</div>
<div class="container"><hr>
    <h5>IV Year I Semester</h5>
    
<table class="table table-bordered table-hover table-secondary table-striped">
    <tr><th>S.NO</th><th>SCODE</th><th>SNAME</th><th>GRADE</th><th>CREDITS</th></tr>
    <%
    int count4= 0;float sum41=0;int total41=0;
                PreparedStatement ps5 = conn.prepareStatement("select * from semester where htno='"+session.getAttribute("htno")+"' and year='IV' and sem='I' ");
                ResultSet rs5 = ps5.executeQuery();
                while(rs5.next()){count4++;
                
                String grade = rs5.getString("grade");                
                if(grade.equals("O")){
                    int grade1 = 10;
                    int credit = rs5.getInt("credits");
                    total41 = total41+credit;
                    sum41 = sum41+(grade1*credit);
                }else if(grade.equals("S")){
                    int grade1 = 9;
                    int credit = rs5.getInt("credits");
                    total41 = total41+credit;
                    sum41 = sum41+(grade1*credit);
                }else if(grade.equals("A")){
                    int grade1 = 8;
                    int credit = rs5.getInt("credits");
                    total41 = total41+credit;
                    sum41 = sum41+(grade1*credit);
                }else if(grade.equals("B")){
                    int grade1 = 7;
                    int credit = rs5.getInt("credits");
                    total41 = total41+credit;
                    sum41 = sum41+(grade1*credit);
                }else if(grade.equals("C")){
                    int grade1 = 6;
                    int credit = rs5.getInt("credits");
                    total41 = total41+credit;
                    sum41 = sum41+(grade1*credit);
                }else if(grade.equals("D")){
                    int grade1 = 5;
                    int credit = rs5.getInt("credits");
                    total41 = total41+credit;
                    sum41 = sum41+(grade1*credit);
                }else{
                    int grade1 = 0;
                    int credit = rs5.getInt("credits");
                    total41 = total41+credit;
                    sum41 = sum41+(grade1*credit);
                }

    %>
    <tr><td><%=count4%></td><td><%=rs5.getString("scode")%></td><td><%= rs5.getString("sname") %></td><td><%= rs5.getString("grade") %></td><td><%= rs5.getInt("credits") %></td></tr>
             <%}
             float s41 = sum41/total41;
             String strDouble41 = String.format("%.2f",s41);
             %>   
</table>
<h5>SGPA For 4 Year 1 Sem is <strong><b><%= strDouble41 %></b></strong> out of 10 </h5>
<br/>
<div class="container"><hr>
    <h5>IV Year II Semester</h5>
    
<table class="table table-bordered table-hover table-secondary table-striped">
    <tr><th>S.NO</th><th>SCODE</th><th>SNAME</th><th>GRADE</th><th>CREDITS</th></tr>
    <%
    int count14= 0;float sum42=0;int total42=0;
                PreparedStatement ps14 = conn.prepareStatement("select * from semester where htno='"+session.getAttribute("htno")+"' and year='IV' and sem='I' ");
                ResultSet rs14 = ps14.executeQuery();
                while(rs5.next()){count4++;
                
                String grade = rs14.getString("grade");                
                if(grade.equals("O")){
                    int grade1 = 10;
                    int credit = rs14.getInt("credits");
                    total42 = total42+credit;
                    sum42 = sum42+(grade1*credit);
                }else if(grade.equals("S")){
                    int grade1 = 9;
                    int credit = rs14.getInt("credits");
                    total42 = total42+credit;
                    sum42 = sum42+(grade1*credit);
                }else if(grade.equals("A")){
                    int grade1 = 8;
                    int credit = rs14.getInt("credits");
                    total42 = total42+credit;
                    sum42 = sum42+(grade1*credit);
                }else if(grade.equals("B")){
                    int grade1 = 7;
                    int credit = rs14.getInt("credits");
                    total42 = total41+credit;
                    sum42 = sum42+(grade1*credit);
                }else if(grade.equals("C")){
                    int grade1 = 6;
                    int credit = rs14.getInt("credits");
                    total42 = total42+credit;
                    sum42 = sum42+(grade1*credit);
                }else if(grade.equals("D")){
                    int grade1 = 5;
                    int credit = rs14.getInt("credits");
                    total42 = total42+credit;
                    sum42 = sum42+(grade1*credit);
                }else{
                    int grade1 = 0;
                    int credit = rs14.getInt("credits");
                    total42 = total42+credit;
                    sum42 = sum42+(grade1*credit);
                }

    %>
    <tr><td><%=count4%></td><td><%=rs5.getString("scode")%></td><td><%= rs5.getString("sname") %></td><td><%= rs5.getString("grade") %></td><td><%= rs5.getInt("credits") %></td></tr>
             <%}
             float s42 = sum42/total42;
             String strDouble42 = String.format("%.2f",s41);
             %>   
</table>
<h5>SGPA For 4 Year 2 Sem is <strong><b><%= strDouble41 %></b></strong> out of 10 </h5>
<br/>
<%
float CGPA1 = ((s*24)+(s1*24)+(s21*22)+(s22*22)+(s31*21)+(s32*21)+(s41*22))/200;
float per1 = (float)(CGPA1-0.7)*10;
String CGPA = String.format("%.2f",CGPA1);
String per = String.format("%.2f",per1);
%>
<h5>CGPA is <strong><b><%= CGPA %></b></strong> out of 10</h5>


<h5>Equivalent Percentage is <strong><%= per %></strong> out of 100</h5>
</div>
</center>
<br/>
<br/>
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
