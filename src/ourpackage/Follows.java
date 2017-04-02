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
 * Servlet implementation class Follows
 */
public class Follows extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		try
		{
			Mongo mongo = new Mongo();
			DB db = mongo.getDB("Weshare");
			DBCollection table = db.getCollection("Follow");
    		BasicDBObject whereQuery = new BasicDBObject();
    		 
    		    HttpSession session = request.getSession();
				String uname = session.getAttribute("email").toString();	
				//System.out.println(uname);
				
    		    whereQuery.put("Userid",session.getAttribute("email"));
    		    BasicDBObject fields = new BasicDBObject();
    		    fields.put("type", 1);
    		    fields.put("typeid", 1);
    		    fields.put("time", 1);
    		    DBCursor cursor = table.find(whereQuery,fields).sort(new BasicDBObject("time",-1)).limit(5);
    		    ArrayList arr = new ArrayList();
    		      		   
    		   while (cursor.hasNext()) {
    		 		   arr.add(cursor.next());
			 }
    		 System.out.println("size of array follow.."+arr.size());
    		  ArrayList arr1 = new ArrayList();
    		  ArrayList arr2 = new ArrayList();
    		  ArrayList arr3 = new ArrayList();
  			  for(int i =0;i<arr.size();i++){
 			   //String val = (String) arr.get(i);
 				System.out.println(arr.get(i));
  		    	 BasicDBObject fields1 = new BasicDBObject();
  	   			 //DBCollection table1 = db.getCollection("Threads"); //type 
      		     BasicDBObject whereQuery1 = new BasicDBObject();
      		     BasicDBObject obj = new BasicDBObject();
      		     obj = (BasicDBObject)arr.get(i);
      		     String type = obj.getString("type");
      		     String typeid = obj.getString("typeid");
      		     if(type.equals("Threads"))
      		     {
      		    	  DBCollection table1 = db.getCollection("Threads"); 
      		    	  whereQuery1.put("Threadid",obj.getString("typeid"));
	   		    	  fields1.put("Threadname", 1);
	   				  fields1.put("description", 1);
	   				  DBCursor cursor1 = table1.find(whereQuery1, fields1);
	   				  while (cursor1.hasNext()) {
	   					  //System.out.println("Thread is : "+cursor5.next());
	   					  arr1.add(cursor1.next());
	   					}
	   				   System.out.println("size of array is : " +arr1.size());
	    		  }
      		     if(type.equals("People"))
      		     {
      		    	 System.out.println("People");
     		    	  DBCollection table1 = db.getCollection("People"); 
     		    	  whereQuery1.put("EmailId",obj.getString("typeid"));
	   		    	  fields1.put("FirstName", 1);
	   				  fields1.put("LastName", 1);
	   				  fields1.put("EmailId",1);
	   				  DBCursor cursor1 = table1.find(whereQuery1, fields1);
	   				  while (cursor1.hasNext()) {
	   					  //System.out.println("Thread is : "+cursor5.next());
	   					  arr2.add(cursor1.next());
	   					}
	   				   System.out.println("size of array is : " +arr2.size());
	   			
      		     }
      		   if(type.equals("Topics"))
    		     {
      			  System.out.println("Topics ");
   		    	  DBCollection table1 = db.getCollection("Topics"); 
   		    	  whereQuery1.put("Topicid",obj.getString("typeid"));
	   		    	  fields1.put("description", 1);
	   				  DBCursor cursor1 = table1.find(whereQuery1, fields1);
	   				  while (cursor1.hasNext()) {
	   					  //System.out.println("Thread is : "+cursor5.next());
	   					  arr3.add(cursor1.next());
	   					}
	   				   System.out.println("size of array is : " +arr3.size());
	   				
    		     }
    		 }	//end of for...
  			
  			request.setAttribute("thread",arr1);
  			 request.setAttribute("people",arr2);
  			 request.setAttribute("topic",arr3);
		}
		catch(Exception e)
		{
			System.out.println("not getting...");
			System.out.println("exception occured:"+e);
		}
	
		
	}
  

}
