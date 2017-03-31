package ourpackage;
import java.awt.image.BufferedImage;
import java.io.ByteArrayInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.rmi.ServerException;
import java.util.ArrayList;
import java.util.List;

import javax.imageio.ImageIO;
import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.sql.rowset.serial.SerialException;
import javax.swing.JList;

import org.bson.types.Binary;

import com.mongodb.BasicDBObject;
import com.mongodb.DB;
import com.mongodb.DBCollection;
import com.mongodb.DBCursor;
import com.mongodb.DBObject;
import com.mongodb.Mongo;
import com.mongodb.gridfs.GridFS;
import com.mongodb.gridfs.GridFSDBFile;
import com.mongodb.gridfs.GridFSInputFile;

/**
 * @author Miss Alka
 *
 */
public class Save extends HttpServlet{
	//@SuppressWarnings("rawtypes")
	public void doPost(HttpServletRequest req, HttpServletResponse res) throws ServerException, IOException 
	{
		System.out.println("Testing Page");
		String fname = req.getParameter("fname");
		String lname = req.getParameter("lname");
		String email = req.getParameter("email");
		String designation = req.getParameter("designation");
		String gender = req.getParameter("gender");
		String dob = req.getParameter("dob");
		String password1 = req.getParameter("password1");
		String password2 = req.getParameter("password2");
		String pic = req.getParameter("pic");
		 
		System.out.println(fname+" "+lname+" "+designation+" "+gender+" "+email+" "+dob+" "+password1+" "+password2+" "+pic);
		
		try
		{
			Mongo mongo = new Mongo();
			DB db = mongo.getDB("Weshare");
			DBCollection table = db.getCollection("People");
			DBCollection table2 = db.getCollection("Interest");
			BasicDBObject document = new BasicDBObject();

			int count = getEmail(email,table);
			
  			if(count==0)
			{
							document.put("FirstName", fname);
							document.put("LastName", lname);
							document.put("EmailId", email);
							document.put("Designation", designation);
							document.put("Gender", gender);
							document.put("DOB", dob);
							document.put("password", password2);
							document.put("profilepic", pic);
				  				
				  		    table.insert(document);
							
							System.out.println("document inserted successfuly..");	
						    
							System.out.println("selected threds are:- ");
							
							String value[] = req.getParameterValues("interest");
							//List<DBObject>  documents = new ArrayList<DBObject>();
							for(int i =0;i<value.length;i++){
								BasicDBObject document2 = new BasicDBObject();
								if(value[i]!="")
								{
									document2.put("EmailId", email);
									document2.put("Threadid", value[i]);
									//documents.add(document2);
									table2.insert(document2);
								}
							    System.out.println(value[i]);
							}
							HttpSession session = req.getSession();
							session.setAttribute("email",email);	 
							session.setAttribute("loggedin","yes");	
						    res.sendRedirect("../dashboard.jsp");
			}
			else
				System.out.println("EmailId already Exists...choose another email");
				
	    }
		catch(Exception e)
		{
			System.out.println("Kuch bhi...");
			System.out.println("exception occured:"+e);
		}
		
	}
	int getEmail(String mail,DBCollection table)
	{
		BasicDBObject document = new BasicDBObject();
		document.put("EmailId",mail);
		int count;
		DBCursor cursor=table.find(document);
		if(cursor.hasNext())
			count=1;
		else
			count=0;
		return count;
	}
	
	 
}
