<%@ page import="java.sql.*" %>
<html>
<head>
    <style>
        body {
            background-image: url('sharepageimage.jpg');
            background-repeat: no-repeat;
            background-size: cover;
            font-family: Arial, sans-serif;
	    
        }

        table {
            border-collapse: collapse;
            width: 100%;
            margin-top: 20px;
        }

        th, td {
            padding: 10px;
            text-align: left;
            border-bottom: 1px solid #ddd;
        }

        th {
            background-color: #f2f2f2;
            font-weight: bold;
        }

        tr:hover {
            background-color: #f5f5f5;
        }

        .delete-button {
            padding: 5px 10px;
            background-color: #ff0000;
            color: #fff;
            border: none;
            cursor: pointer;
        }

        .delete-button:hover {
            background-color: #cc0000;
        }
    </style>
</head>
<body>
<%
    try {
        Class.forName("com.mysql.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/miniproj?useSSL=false", "root", "jasmine@1634");
        Statement stm = con.createStatement();

        String query = "SELECT * FROM idea where delete1 = 'no' ";

        ResultSet rs = stm.executeQuery(query);

        out.println("<table><tr><th>Name</th><th>Registration Number</th><th>Contact</th><th>Idea</th><th>Delete</th></tr>");
        while (rs.next()) {
            String name = rs.getString("name");
            String regis= rs.getString("regis");
            String phone = rs.getString("phone");
            String idea = rs.getString("idea");
            String value = rs.getString("delete1");
%>
            <tr>
                <td><%=name %></td>
                <td><%=regis %></td>    
                <td><%=phone%></td>
                <td><%=idea%></td>
                <td>
                    <a href="deleteidea.jsp?regis=<%= regis %>&value=yes">
                        <button class="delete-button">Delete</button>
                    </a>
                </td>
            </tr>
<%
        }
        out.println("</table>");

        con.close();
    } catch (ClassNotFoundException | SQLException e) {
        e.printStackTrace();
        out.println("Error: " + e.getMessage());
    }
%>
</body>
</html>