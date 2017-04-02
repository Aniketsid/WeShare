package ourpackage;

import java.io.IOException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.mongodb.BasicDBObject;
import com.mongodb.DB;
import com.mongodb.DBCollection;
import com.mongodb.Mongo;

/**
 * Servlet implementation class AddComment
 */
public class AddComment extends HttpServlet {
	 /**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
	    HttpSession session = request.getSession();
		String topicid = request.getParameter("id");
		String comment = request.getParameter("comment");
		String creator = session.getAttribute("email").toString();
		 DateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
		 Date date = new Date();
		 System.out.println(dateFormat.format(date));

		 System.out.println(topicid);
		 System.out.println(comment);
		 System.out.println(creator);
		 try
		 	{
				Mongo mongo = new Mongo();
				DB db = mongo.getDB("Weshare");
				DBCollection table = db.getCollection("Comment");
				BasicDBObject document = new BasicDBObject();
				document.put("Commentid",100 + (int)(Math.random() * 10000));
				document.put("Topicid",topicid);
				System.out.println("Topic id in Add Comment :"+topicid);
				document.put("Description",comment);
				document.put("creatorid",creator);
				document.put("time",dateFormat.format(date));
				 table.insert(document); // insert doc
				  System.out.println("Comment added");
				  String url="./ViewTopic?id="+topicid;
				  response.sendRedirect(url);;
		 	}
		 	catch(Exception e)
		 	{
		 		System.out.println("Error with database");
		 	}
      }

}
