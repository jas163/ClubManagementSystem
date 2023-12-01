<%@page import="java.sql.*"%>
<html>
<head>
    <style>*{
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
            background-color: #f2f2f2;
        }

        h1 {
            color: #2f4858;
        }

        h2 {
            color: #ff524b;
        }

        table {
            width: 600px;
            background-color: #ffffff;
            border: 1px solid #dddddd;
            border-collapse: collapse;
            margin: 0 auto;
        }

        table tr:first-child {
            background-color: #f2f2f2;
        }

        table td {
            padding: 10px;
        }

        .center {
            text-align: center;
        }

        #avatar {
            width: 150px;
            height: 150px;
            border-radius: 50%;
        }

        #acceptBtn,
        #declineBtn {
            display: inline-block;
            padding: 10px 20px;
            margin-top: 20px;
            font-size: 16px;
            color: #ffffff;
            background-color: #ff524b;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            text-decoration: none;
        }

        #acceptBtn:hover,
        #declineBtn:hover {
            background-color: #e03c32;
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

<a href="admin.jsp"><button>BACK</button></a>
</ul>
</div>
</nav>
<%
    String event_name = request.getParameter("event_name");
    try {
        Class.forName("com.mysql.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/miniproj?useSSL=false", "root", "jasmine@1634");
        PreparedStatement stm = con.prepareStatement("SELECT * FROM permission WHERE event_name=?");
        stm.setString(1, event_name);
        ResultSet rs = stm.executeQuery();
        if (rs.next()) {
            %>
            <center>
                <h1>Student Details</h1>
            </center>
            <hr>
            <div class="center">
                <table cellspacing="8" cellpadding="20">
                    <tr>
                        <td colspan="2">
                            <h2><%= event_name %></h2>
                        </td>
                    </tr>
            
                    <tr>
                        <td><b>club_name:</b></td>
                        <td><b><%=rs.getString("club_name")%></b></td>
                    </tr>
                    <tr>
                        <td><b>description:</b></td>
                        <td><b><%=rs.getString("description")%></b></td>
                    </tr>
                    <tr>
                        <td><b>Mobile No:</b></td>
                        <td><b><%=rs.getString("phone")%></b></td>
                    </tr>
                    <tr>
                        <td><b>Place:</b></td>
                        <td><b><%=rs.getString("place")%></b></td>
                    </tr>
                    <tr>
                        <td><b>Event Date:</b></td>
                        <td><b><%=rs.getString("date")%></b></td>
                    </tr>
                </table>
                <br>
                <a href="admin.jsp?event_name2=<%= event_name %>&value=yes" id="acceptBtn">Accept</a>
                <a href="admin.jsp?event_name2=<%= event_name %>&value=no" id="declineBtn">Decline</a>
            </div>
            <%
        }
        con.close();
    } catch (Exception e) {
        e.printStackTrace();
    }
%>
</body>
</html>