import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class BackEventRegistrationServlet extends HttpServlet {
    protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        res.setContentType("text/html");
        PrintWriter pw = res.getWriter();
        String name = req.getParameter("name");
        String redg = req.getParameter("redg");
        String branch = req.getParameter("branch");
        String email = req.getParameter("email");
        String year = req.getParameter("year");
        String event_name = req.getParameter("event_name");
        String contact = req.getParameter("contact");

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/miniproj?useSSL=false", "root", "jasmine@1634");
            String query = "INSERT INTO clubregistration1 (name, redg, branch, email, year, event_name, contact) VALUES (?, ?, ?, ?, ?, ?, ?)";
            PreparedStatement stm = con.prepareStatement(query);
            stm.setString(1, name);
            stm.setString(2, redg);
            stm.setString(3, branch);
            stm.setString(4, email);
            stm.setString(5, year);
            stm.setString(6, event_name);
            stm.setString(7, contact);

            int rowsInserted = stm.executeUpdate();
            System.out.println("Data updated successfully.. " + rowsInserted + " row(s) affected");

            if (rowsInserted > 0) {
                res.sendRedirect("aftereventregistration.html");
            } else {
                pw.println("<html><body><h1>Registration not successful</h1></body></html>");
            }
            
            con.close();
        } catch (Exception e) {
            pw.println(e.getMessage());
        }
    }
}
