<%@page import="java.sql.*"%>
<html>
<body>
    <%
        String idea = request.getParameter("idea");
        String name = request.getParameter("name");
        String regis= request.getParameter("regis");
        
	String delete1 = "no";
	String phone = request.getParameter("phone");

        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/miniproj?useSSL=false", "root", "jasmine@1634");
            String query = "INSERT INTO idea(idea, name, regis, delete1, phone) VALUES (?, ?, ?, ?, ?)";
            PreparedStatement stm = con.prepareStatement(query);
            stm.setString(1, idea);
            stm.setString(2, name);
            stm.setString(3, regis);
            stm.setString(4, delete1);
            stm.setString(5,  phone);
            

            int rowsInserted = stm.executeUpdate();
            System.out.println("Data updated successfully.. " + rowsInserted + " row(s) affected");

            if (rowsInserted > 0) {
                response.sendRedirect("thanks.html");
            } else {
                out.println("<html><body><h1>Registration not successful</h1></body></html>");
            }
            
            con.close();
        } catch (Exception e) {
            out.println(e.getMessage());
        }
   %>
</body>
</html>