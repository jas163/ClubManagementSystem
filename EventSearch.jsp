<%@page import="java.sql.*"%>
<html>
<head>
    <title>Event Search</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f2f2f2;
            padding: 20px;
	    background-image:url("sharepageimage.jpg");
        }

        h1 {
            color: #333333;
            text-align: center;
            margin-top: 0;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }

        th, td {
            padding: 12px;
            text-align: left;
        }

        th {
            background-color: #333333;
            color: white;
            font-weight: bold;
            text-transform: uppercase;
        }

        tr:nth-child(even) {
            background-color: #f2f2f2;
        }

        tr:hover {
            background-color: #dddddd;
        }

        .search-form {
            text-align: center;
            margin-bottom: 20px;
        }

        .search-form input[type="text"] {
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 4px;
            width: 200px;
        }

        .search-form input[type="submit"] {
            padding: 10px 20px;
            background-color: #4CAF50;
            border: none;
            color: white;
            cursor: pointer;
            border-radius: 4px;
            font-weight: bold;
        }

        .container {
            max-width: 800px;
            margin: 0 auto;
            background-color: #ffffff;
            border-radius: 4px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        .header {
            background-color: #333333;
            color: white;
            padding: 20px;
            text-align: center;
            border-top-left-radius: 4px;
            border-top-right-radius: 4px;
        }

        .content {
            padding: 20px;
            margin-top: 20px;
        }
    </style>
</head>

<body>

<%
    String searchEvent = request.getParameter("event_name"); // Get the search value from the request parameter

    try {
        Class.forName("com.mysql.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/miniproj?useSSL=false", "root",
                "jasmine@1634");
        Statement stm = con.createStatement();

        String query = "SELECT * FROM clubregistration1";
        if (searchEvent != null && !searchEvent.isEmpty()) {
            
            query += " WHERE event_name = '" + searchEvent + "'";
        }

        ResultSet rs = stm.executeQuery(query);

        out.println("<html><body><div class='container'><div class='header'><h1>Student Data</h1></div>");
        
        // Add a form with the search bar
        out.println("<form method='post' action='Another.jsp' class='search-form'>");
        out.println("<input type='text' name='event_name' placeholder='Search by Event Name'>");
        out.println("<input type='submit' value='Search'>");
        out.println("</form>");
        
        out.println("<div class='content'><table><tr><th>Regd</th><th>Name</th><th>Event Name</th></tr>");

        while (rs.next()) {
            String redg = rs.getString("redg");
            String name = rs.getString("name");
            String eventName = rs.getString("event_name");

            // Create a link to the servlet with the event name as a query parameter
            String servletURL = "/Another.jsp?event_name&&name&&redg=" + eventName;
            out.println("<tr><td>" + redg + "</td><td>" + name + "</td><td>" + eventName + "</td></tr>");
        }

        out.println("</table></div></div></body></html>");

        con.close();
    } catch (ClassNotFoundException | SQLException e) {
        e.printStackTrace();
        out.println("Error: " + e.getMessage());
    }
%>
</body>
</html>