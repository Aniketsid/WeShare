package ourpackage;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.mongodb.BasicDBObject;
import com.mongodb.DB;
import com.mongodb.DBCollection;
import com.mongodb.DBCursor;
import com.mongodb.Mongo;

/**
 * Servlet implementation class Login
 */
public class Login extends HttpServlet {
	 
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 String email = request.getParameter("email");
		 String pass = request.getParameter("password");

			Mongo mongo = new Mongo();
			DB db = mongo.getDB("Weshare");
			DBCollection table = db.getCollection("People");
			BasicDBObject document = new BasicDBObject();
			document.put("EmailId", email);
			document.put("password", pass);
			System.out.println(email+" "+pass);
			DBCursor cursor =  table.find(document);
			if(cursor.hasNext())
			{
				HttpSession session = request.getSession();
				session.setAttribute("email",email);
				session.setAttribute("loggedin", "yes");
  				response.sendRedirect("dashboard.jsp");
			}
			else
			{
				response.sendRedirect("index.jsp");
			}
	}

}
