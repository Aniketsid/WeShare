package ourpackage;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Collections;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.catalina.ha.backend.CollectedInfo;

import com.mongodb.BasicDBObject;
import com.mongodb.DB;
import com.mongodb.DBCollection;
import com.mongodb.DBCursor;
import com.mongodb.Mongo;

/**
 * Servlet implementation class RecentTopics
 */
public class RecentTopics extends HttpServlet {
	 
	protected void doGet(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		Mongo mongo = new Mongo();
		DB db = mongo.getDB("Weshare");
		DBCollection table = db.getCollection("Topics");
		BasicDBObject document = new BasicDBObject();
		DBCursor cursor = table.find(document);
	    ArrayList arr = new ArrayList();
	    while(cursor.hasNext())
	    {
	    	arr.add(cursor.next());
	    }
		Collections.reverse(arr);
	    for (Object cur : arr) {
		System.out.println(cur);
		}
		request.setAttribute("recent",arr);
	}
 
}
