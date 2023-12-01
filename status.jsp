<%@page import="java.sql.*"%>
<html>
<head>
  <title>Event Status</title>
  <style>
*{
text-decoration: none;
}
.navbar{
background:rgb(223,207,221);font-family:arial;padding-right:15px;padding-left:15px;
}
.navdiv{
display:flex;align-items:center;justify-content:space-between;
}
.logo a{
font-size:15px;font-weight:400;color:rgb(1, 3, 16);
}
li{
list-style:none;display:inline-block;
}
li a{
color:rgb(15, 15, 15);font-size:18px;font-weight:bold;margin-right:15px;
}
button{
background-color:white;margin-left:10px;border-radius:10px;padding:15px;width:90px;
}
button a{
color:rgb(246, 237, 237);font-weight:bold;font-size:10px;
}
.image2 {
      margin-right: 100px;
      width: 20mm;
      height: 20mm;
      border: 2px solid black;
    }
    body {
      font-family: Arial, sans-serif;
      margin: 0;
      padding: 20px;
      background-color: #f9f9f9;
      background-image: url('sharepageimage.jpg');
    }

    table {
      width: 100%;
      border-collapse: collapse;
      margin-top: 20px;
    }

    th {
      background-color: #f2f2f2;
      padding: 10px;
      text-align: left;
    }

    td {
      padding: 10px;
      border: none; /* Remove border */
      background-color: transparent; /* Set transparent background */
    }

    tr:hover td {
      background-color: #e6e6e6;
    }
  </style>
</head>
<body>
<nav class="navbar">
<div class="navdiv">
<div class="logo"><a href="#">
    
	<table>
       <tr><td><img class="Image 5" src="vishnulogo.png"  width="50" height="50" alt="Image 5"></td>
        <td>SHRI VISHNU ENGINEERING COLLEGE FOR WOMEN</td></tr> 
    </table>
        
         
        
       
    

    </div>
<ul>

<a href="coEventbuttons.html"><button>BACK</button></a>

</ul>
</div>
</nav>
<%
try {
    Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/miniproj?allowPublicKeyRetrieval=true&useSSL=false", "root", "jasmine@1634");
    PreparedStatement stmt = con.prepareStatement("SELECT * FROM permission");
    ResultSet rs1 = stmt.executeQuery();
%>
<table>
  <tr>
    <th>EVENT NAME</th>
    <th>STATUS</th>
  </tr>
<%
    while (rs1.next()) {
      String msg = "";
      String k = rs1.getString("approval");
      String m = rs1.getString("event_name");
      if (k.equals("yes")) {
        msg = "ACCEPTED";
      } else if (k.equals("no")) {
        msg = "REJECTED";
      } else {
        msg = "REVIEW";
      }
%>
  <tr>
    <td><%= m %></td>
    <td><%= msg %></td>
  </tr>
<%
    }
    con.close();
} catch (Exception e) {
    e.printStackTrace();
    out.println("Error occurred");
}
%>
</table>
</body>
</html>
