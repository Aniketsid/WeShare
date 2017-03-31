package ourpackage;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mongodb.BasicDBObject;
import com.mongodb.DB;
import com.mongodb.DBCollection;
import com.mongodb.DBCursor;
import com.mongodb.Mongo;

/**
 * Servlet implementation class ViewTopic
 */
public class ViewTopic extends HttpServlet {
	 

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		  String topicid=request.getParameter("id");
		  int id =Integer.parseInt(topicid);
		  System.out.println(topicid);
		  try
		  {
		  Mongo mongo = new Mongo();
			DB db = mongo.getDB("Weshare");
			DBCollection table = db.getCollection("Topics");
			DBCollection table1 = db.getCollection("Comment");
			BasicDBObject document = new BasicDBObject();
			BasicDBObject document1 = new BasicDBObject();
			document.put("Topicid", id);
			document1.put("Topicid", topicid);
			DBCursor cursor =table.find(document);
			 ArrayList  arr = new ArrayList ();
			  while(cursor.hasNext())
			 {
		       arr.add(cursor.next());
			 }
			  
				DBCursor cursor1 = table1.find(document1);
				ArrayList arr1 = new ArrayList();
				while(cursor1.hasNext())
				{
					arr1.add(cursor1.next());
				}
				request.setAttribute("topic",arr);
				request.setAttribute("comments",arr1);
		     request.getRequestDispatcher("topic.jsp").forward(request, response);
		  }
		  catch(Exception e)
		  {
			  System.out.println("Error");
		  }
	}
 
}
