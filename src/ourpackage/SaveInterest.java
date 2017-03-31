package ourpackage;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class SaveInterest
 */
public class SaveInterest extends HttpServlet {

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		 
		String value[]=new String[10];
		value = req.getParameterValues("value");
		for(int i =0;i<value.length;i++){
			System.out.println(value[i]);
		}
		System.out.println();
	}

}
