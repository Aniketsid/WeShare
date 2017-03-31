package ourpackage;

import java.awt.List;
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
 * Servlet implementation class Threads
 */
public class Threads extends HttpServlet {
	 	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	   
	 		try
			{
				Mongo mongo = new Mongo();
				DB db = mongo.getDB("Weshare");
				DBCollection table = db.getCollection("Threads");
				BasicDBObject document = new BasicDBObject();
	    		 BasicDBObject whereQuery = new BasicDBObject();
	    		   // whereQuery.put("employeeId", 5);
	    		    BasicDBObject fields = new BasicDBObject();
	    		    fields.put("Threadname", 1);
	    		    fields.put("Threadid", 1);
	    		    DBCursor cursor = table.find(whereQuery, fields);
	    		    ArrayList  arr = new ArrayList ();
	    		  
	    		   while (cursor.hasNext()) {
	    			
	    			  arr.add(cursor.next());
	    			  
					 
				}
	    		   request.setAttribute("message", arr);
				 			 
			}
			catch(Exception e)
			{
				System.out.println("not getting...");
				System.out.println("exception occured:"+e);
			}
			
		}
	}

	 
	 


