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
 * Servlet implementation class AddThread
 */
public class AddThread extends HttpServlet {
	 	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String thread = request.getParameter("tname");
		String desc=request.getParameter("description");
		String tag=request.getParameter("tag");
		String tags[] = tag.split(",");
		
		System.out.println(thread+" "+desc);
		try
		{
		Mongo mongo = new Mongo();
		DB db = mongo.getDB("Weshare");
		DBCollection table = db.getCollection("Threads");
		DBCollection table1 = db.getCollection("Tags");
		BasicDBObject document = new BasicDBObject();
		
		HttpSession session = request.getSession();
		 DateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
		 Date date = new Date();
		 System.out.println(dateFormat.format(date));
		 int x =100 + (int)(Math.random() * 10000) ;
		document.put("Threadid",x);
		document.put("Threadname", thread);
		document.put("description", desc);
	    document.put("creator", session.getAttribute("email"));	
	    document.put("time",dateFormat.format(date));
	    table.insert(document);
	    System.out.println("inserted successfully");
	    for(int i=0;i<tags.length;i++)
	    {
	    	System.out.println(tags[i]);
	    	BasicDBObject document1 = new BasicDBObject();
	    	   document1.put("Threadid",x);
	    	   document1.put("Tag",tags[i].trim());
	    	  
	    	   table1.insert(document1);
	    }
	      response.sendRedirect("addTopic.jsp");
		}
		catch(Exception e)
		{
			System.out.println("Error with database");
		}
	}

}
