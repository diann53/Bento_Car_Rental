package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.sql.*;
import java.util.*;

public final class db_005fconnect_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
    return _jspx_dependants;
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;

    try {
      response.setContentType("text/html;charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n");
      out.write("        <title>Student records</title>\n");
      out.write("    </head>\n");
      out.write("    <body>\n");
      out.write("        <form>\n");
      out.write("            <input type=\"text\" name=\"name\" placeholder=\"Name\">\n");
      out.write("            <input type=\"text\" name=\"matricNo\" placeholder=\"Matric number\">\n");
      out.write("            <input type=\"email\" name=\"email\" placeholder=\"Email\">\n");
      out.write("            <input type=\"submit\" name=\"submit\">\n");
      out.write("        </form>\n");
      out.write("        ");

            try {
                Class.forName("com.mysql.jdbc.Driver");
                String url = "jdbc:mysql://localhost:3306/bento_car_rental";
                
                Connection conn = DriverManager.getConnection(url, "root", "");
                out.println("DB connection ok");
                /*
                if (request.getParameter("submit") != null) {
                    String name = request.getParameter("name");
                    String matricNo = request.getParameter("matricNo");
                    String email = request.getParameter("email");

                    PreparedStatement updatestud = conn.prepareStatement("INSERT INTO stud VALUES (?,?,?)");
                    updatestud.setString(1, name);
                    updatestud.setString(2, matricNo);
                    updatestud.setString(3, email);
                    updatestud.executeUpdate();
                    updatestud.close();
                }
                
                String query = "SELECT * FROM stud";
                Statement stmt = conn.createStatement();
                ResultSet rs = stmt.executeQuery(query);
                
                out.println("<table>");
                while (rs.next()) {
                    out.println("<tr>");
                    out.println("<td>" + rs.getString(1) + "</td>");
                    out.println("<td>" + rs.getString(2) + "</td>");
                    out.println("<td>" + rs.getString(3) + "</td>");
                    out.println("</tr>");
                }
                out.println("</table>");
                
                stmt.close();*/
                conn.close();
            } catch (Exception ex) {
                System.out.println(ex);
            }
        
      out.write("\n");
      out.write("    </body>\n");
      out.write("</html>\n");
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
