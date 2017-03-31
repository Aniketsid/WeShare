package ourpackage;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.text.DateFormat;
import java.text.SimpleDateFormat;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.mongodb.BasicDBObject;
import com.mongodb.DB;
import com.mongodb.DBCollection;
import com.mongodb.DBObject;
import com.mongodb.Mongo;

/**
 * Servlet implementation class AddTopic
 */
public class AddTopic extends HttpServlet {
	  
	 
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 String description=request.getParameter("description");
		 String thread=request.getParameter("thread");
		 System.out.println(description+" "+thread );
		 DateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
		 Date date = new Date();
		 System.out.println(dateFormat.format(date));
		 try
			{
				Mongo mongo = new Mongo();
				DB db = mongo.getDB("Weshare");
				DBCollection table = db.getCollection("Topics");
				BasicDBObject document = new BasicDBObject();
				 HttpSession session = request.getSession();
				  
				 document.put("Topicid",100 + (int)(Math.random() * 10000));
				 System.out.println(session.getAttribute("email"));
				 document.put("Threadid",thread);
				 document.put("description", description);
				 document.put("creatorid",session.getAttribute("email"));
				 document.put("time",dateFormat.format(date));
				 table.insert(document); // insert first doc
				 System.out.println("inserted Successfully");
//				 ArrayList  arr = new ArrayList ();
//				 request.setAttribute("comments",arr);
//				 arr.add(document);
////				
//				 request.setAttribute("topic",arr);
//				 
//			     request.getRequestDispatcher("topic.jsp").forward(request, response);
                 response.sendRedirect("./ViewTopic?id="+document.getString("Topicid"));
			}
		 catch(Exception e)
		 {
			 System.out.println("Error with database");
		 }
	}
 
	
	
}
