<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %> 
<%@ page import="java.text.DecimalFormat" %> 
<html>
<head>
<script src= 
"https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"> 
    </script> 
<style>
* {
  box-sizing: border-box;
}
.edit{
            border-radius: 10px;
            margin-left: 900px;
            margin-top: 40px;
            font-size: 20px;
            width: 300px;
            height: 50px;
            font-family: monospace;
        }
body{
background-image: url(https://image.freepik.com/free-photo/blurred-background-supermarket-aisle-with-products_62890-121.jpg);
            background-size: cover;
            background-attachment: local;
            padding-left: 150px;
            padding-top: 100px;
           
}
.mytab{
background-color: white;
}
tr:nth-child(even) {background-color: #f2f2f2;}
.myinput {
  	   width: 200px;
       height: 30px;
       border-radius: 5px;
       border-bottom: 15px;
}

#myTable {
  border-collapse: collapse;
  
  border: 1px solid #ddd;
  font-size: 18px;
}

#myTable th, #myTable td {
  text-align: left;
  
}

#myTable tr {
  border-bottom: 1px solid #ddd;
}

#myTable tr.header, #myTable tr:hover {
  background-color: #f1f1f1;
}

th, td {
  padding: 15px;
  text-align: left;
}
.div{
padding-top: 5px;
}
table {
  border-collapse: collapse;
}

table, th, td {
  border: 1px solid black;
}
</style>

<title>display data from the table using jsp</title>
</head>
<body>
<input class="myinput" type="text" id="gfg" onkeyup="myFunction()" placeholder="Search for names.." title="Type in a name">
<%
try {

String connectionURL = "jdbc:mysql://localhost:3306/gst";

Connection connection = null;

   Statement statement = null;

ResultSet rs = null;

Class.forName("com.mysql.jdbc.Driver").newInstance();

   connection = DriverManager.getConnection(connectionURL, "root", "AVINASHjay123@");

statement = connection.createStatement();

String QueryString = "SELECT * from gst.bills";
rs = statement.executeQuery(QueryString);
%><div class ="div">
<TABLE class="mytab" id="tables">
 <thead>
<tr class="header">
    <th >Product Code</th>
    <th >Product Name</th>
    <th >rate</th>
    <th >gst</th>
    <th >Quantity</th>
    <th >amount</th>
  </tr>
   </thead>
  <tbody id="geeks">
<%
while (rs.next()) {
%>
<TR onclick="javascript:showRow(this);">
<TD><%=rs.getString(1)%></TD>
<TD><%=rs.getString(2)%></TD>
<TD><%=rs.getDouble(3)%></TD>
<TD><%=rs.getDouble(4)%></TD>
<TD><%=rs.getString(5)%></TD>
<TD><%=rs.getString(6)%></TD>
</TR>
<% }

QueryString = "select Amount from gst.bills";
rs = statement.executeQuery(QueryString);
double bil=0;
while(rs.next()){
	bil=bil+ Double.parseDouble(rs.getString(1));
}
double round = Math.round(bil*100)/100;
 %>
 <TD></TD>
<TD></TD>
<TD></TD>
<TD></TD>
<TD>Total :</TD>
<TD><%=round%></TD>
<%
// close all the connections.
QueryString = "drop table gst.bills";
statement.executeUpdate(QueryString);
rs.close();
statement.close();
connection.close();
} catch (Exception ex) {
%>
</tbody>
<font size="+3" color="red"></b>
<%
out.println(ex);
}
%>
</TABLE>
 <form action="/">
        <input class ="edit "type="submit"  value="Back to Home"><br></form>
</div>
<p id="demo"> </p>

<script> 
            $(document).ready(function() { 
                $("#gfg").on("keyup", function() { 
                    var value = $(this).val().toLowerCase(); 
                    $("#geeks tr").filter(function() { 
                        $(this).toggle($(this).text() 
                        .toLowerCase().indexOf(value) > -1) 
                    }); 
                }); 
            }); 
           
        </script>

<script>
document.querySelector('.results').innerHTML = f1;</script>
</body>
</html>