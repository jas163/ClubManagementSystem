<%@page import="java.sql.*"%>
<html>
<head>
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
	    background-image:url('sharepageimage.jpg');
        }

        .container {
            max-width: 800px;
            margin: 0 auto;
            padding: 20px;
        }

        h1 {
            text-align: center;
            color: #333;
        }

        hr {
            margin-top: 20px;
            border: none;
            border-top: 1px solid #ccc;
        }

        .side {
            display: flex;
            align-items: center;
            margin-bottom: 10px;
        }

        .child {
            flex: 1;
            padding: 10px;
        }

        #c1 {
            font-weight: bold;
        }

        #c2 {
            text-align: right;
        }

        .button {
            display: inline-block;
            padding: 10px 20px;
            background-color: #4CAF50;
            color: white;
            text-decoration: none;
            border-radius: 4px;
            transition: background-color 0.3s;
        }

        .button:hover {
            background-color: #45a049;
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

<a href="eventbuttons.html"><button>BACK</button></a>

</ul>
</div>
</nav>
    <div class="container">
        <form>
            <h1>Event Details</h1>
            <hr>
            <%
            String event_name1 = request.getParameter("event_name2");
            String value = request.getParameter("value");
            try {
                Class.forName("com.mysql.jdbc.Driver");
                Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/miniproj?useSSL=false&allowPublicKeyRetrieval=true", "root", "jasmine@1634");
                Statement stm = con.createStatement();
                if (event_name1 != null && value != null) {
                    PreparedStatement stm1 = con.prepareStatement("update permission set approval=? where event_name=? "); 
                    stm1.setString(1, value);
                    stm1.setString(2, event_name1);
                    int x = stm1.executeUpdate();
                }
                ResultSet rs = stm.executeQuery("select * from permission where approval='review' ");
                while (rs.next()) {
                    String event_name = rs.getString("event_name");
            %>
            <div class="side">
                <div class="child" id="c1"><%= event_name %></div>
                <div class="child" id="c2">
                    <a class="button" href="EventDetails.jsp?event_name=<%= event_name %>">OPEN</a>
                </div>
            </div>
            <%
                }
                con.close();
            } catch (Exception e) {
                out.println(e);
            }
            %>
        </form>
    </div>
</body>
</html>