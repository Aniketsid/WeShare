package ourpackage;

import java.io.IOException;
import java.util.ArrayList;

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
 * Servlet implementation class People
 */
public class People extends HttpServlet {
	 
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 
		try
		{
			Mongo mongo = new Mongo();
			DB db = mongo.getDB("Weshare");
			HttpSession session = request.getSession();
			  		 
			BasicDBObject fields2 = new BasicDBObject();
   			DBCollection table3 = db.getCollection("Threads");
    		BasicDBObject whereQuery3 = new BasicDBObject();
    		System.out.println(session.getAttribute("email"));
		    whereQuery3.put("creator",session.getAttribute("email"));
		    fields2.put("Threadname", 1);
		    fields2.put("description", 1);
		    fields2.put("time", 1);
		    DBCursor cursor3 = table3.find(whereQuery3, fields2);
		    ArrayList arr1 = new ArrayList();
		    while (cursor3.hasNext()) {
			 	   arr1.add(cursor3.next());
			} 
		    request.setAttribute("threads", arr1);
			
    		 DBCollection table4 = db.getCollection("Interest");
    		 BasicDBObject whereQuery4 = new BasicDBObject();
    		 BasicDBObject fields4 = new BasicDBObject();
    		 whereQuery4.put("EmailId",session.getAttribute("email"));
    		 fields4.put("Threadid",1);
    		 DBCursor cursor4 = table4.find(whereQuery4, fields4); //all threadid came....
    		 ArrayList arr4 = new ArrayList();
 		     while (cursor4.hasNext()) {
 		    	  System.out.println("interests block : ");
 		    	 arr4.add(cursor4.next());		    
				} 
 		     ArrayList arr5 = new ArrayList();
 			  for(int i =0;i<arr4.size();i++){
			   //String val = (String) arr.get(i);
				//System.out.println(arr4.get(i));
 		    	 BasicDBObject fields5 = new BasicDBObject();
 	   			 DBCollection table5 = db.getCollection("Threads");
     		     BasicDBObject whereQuery5 = new BasicDBObject();
     		     BasicDBObject obj = new BasicDBObject();
     		     obj = (BasicDBObject)arr4.get(i);
     		     System.out.println(obj.getString("Threadid"));
 		    	 whereQuery5.put("Threadid",obj.getString("Threadid"));
		    	  fields5.put("Threadname", 1);
				  fields5.put("description", 1);
				  DBCursor cursor5 = table5.find(whereQuery5, fields5);
				
				   while (cursor5.hasNext()) {
					  //System.out.println("Thread is : "+cursor5.next());
					  arr5.add(cursor5.next());
					} 
				}
		System.out.println("size of array is : " +arr5.size());	
 		request.setAttribute("interests",arr5);
    	
 		//getTopic Added..
 		 DBCollection table6 = db.getCollection("Topics");
		 BasicDBObject whereQuery6 = new BasicDBObject();
		 BasicDBObject fields6 = new BasicDBObject();
		 whereQuery6.put("creatorid",session.getAttribute("email"));
		 fields6.put("Threadid",1);
		 fields6.put("description", 1);
		 fields6.put("time", 1);
		 DBCursor cursor6 = table6.find(whereQuery6,fields6); //all description came....
		 ArrayList arr6 = new ArrayList();
		 while(cursor6.hasNext()) {
		    	  //System.out.println("topics are : "+cursor6.next());
		    	  arr6.add(cursor6.next());		    
		 } 
		 //request.setAttribute("topics",arr6); 
		
		 ArrayList arr7 = new ArrayList();
		   for(int i =0;i<arr6.size();i++)
		   {
		   //String val = (String) arr.get(i);
			System.out.println("get thread block");
		    	 BasicDBObject fields7 = new BasicDBObject();
	   			 DBCollection table7 = db.getCollection("Threads");
 		     BasicDBObject whereQuery7 = new BasicDBObject();
 		     BasicDBObject obj1 = new BasicDBObject();
 		     obj1 = (BasicDBObject)arr6.get(i);
 		     System.out.println(obj1.getString("Threadid"));
		    whereQuery7.put("Threadid",Integer.parseInt(obj1.getString("Threadid")));
	    	  fields7.put("Threadname", 1);
	    	  fields7.put("time", 1);
			  DBCursor cursor7 = table7.find(whereQuery7, fields7);
			 while (cursor7.hasNext()) {
				  //System.out.println("Corresponding Thread is : "+cursor7.next());
				  arr7.add(cursor7.next());
				} 
			}
	    System.out.println("size of array is : " +arr7.size());	
		 
	      request.setAttribute("topic1",arr6); 
	      request.setAttribute("topic2",arr7); 
	      
    		 //get user info...
    		    DBCollection table1 = db.getCollection("People");
 			    BasicDBObject whereQuery = new BasicDBObject();
    		    whereQuery.put("EmailId",session.getAttribute("email"));
    		    BasicDBObject fields = new BasicDBObject();
    		    fields.put("FirstName", 1);
    		    fields.put("LastName", 1);
    		    fields.put("EmailId", 1);
    		    fields.put("Designation", 1);
    		    fields.put("Gender", 1);
    		    fields.put("DOB", 1);
    		    fields.put("profilepic", 1);
    		    DBCursor cursor = table1.find(whereQuery, fields);
    		    ArrayList arr = new ArrayList();
    		    while (cursor.hasNext()) {
    			 	   arr.add(cursor.next());
				} 
    		   request.setAttribute("message2",arr);
    		    		    
    	
		}
		catch(Exception e)
		{
			System.out.println("not getting...");
			System.out.println("exception occured:"+e);
		}
		

	}

	 
}
