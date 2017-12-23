package webapp;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/*
 * Browser sends Http Request to Web Server
 * 
 * Code in Web Server => Input:HttpRequest, Output: HttpResponse
 * JEE with Servlets
 * 
 * Web Server responds with Http Response
 */

//Java Platform, Enterprise Edition (Java EE) JEE6

//Servlet is a Java programming language class 
//used to extend the capabilities of servers 
//that host applications accessed by means of 
//a request-response programming model.

//1. extends javax.servlet.http.HttpServlet
//2. @WebServlet(urlPatterns = "/login.do")
//3. doGet(HttpServletRequest request, HttpServletResponse response)
//4. How is the response created?

@WebServlet(urlPatterns = "/login.do")
public class LoginServlet extends HttpServlet {
	DBConectivity connectivity;
	
	public LoginServlet()
	{
		connectivity = new DBConectivity();
	}
	
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		System.out.println("LOgin screen doGet");
		connectivity.SetStatusAsInactive();
		request.getRequestDispatcher("WEB-INF/views/login.jsp").forward(request, response);
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String username = request.getParameter("name");
		String password = request.getParameter("password");
		request.setAttribute("name", username);
		request.setAttribute("password", password);
		String usertype = connectivity.ValidateCredentials(username, password);
		System.out.println("Usertype in servlet = " + usertype);
		if(usertype != null)
		{
			connectivity.SetStatusAsActive(username);
			if(usertype.equalsIgnoreCase("C"))
			{
				String applid = connectivity.GetApplid(username);
				
				String applCount = connectivity.GetCustViewApplCount(applid);
				if(Integer.parseInt(applCount) > 0)//Pending policy
				{
					request.setAttribute("usertype", usertype);
					response.sendRedirect("/viewpolicy.do?usertype=" + usertype);
				}
				else//Display graph
				{
					String count = connectivity.GetApplicationCompletCount(applid);
					String showgraph;
					if(Integer.parseInt(count) > 0)
						showgraph = "true";
					else
						showgraph = "false";
					request.setAttribute("usertype", usertype);
					request.setAttribute("applid", applid);
					response.sendRedirect("/paymentschedule.do?applid=" + applid + "&showgraph="+ showgraph);
				}
			}
			else
			{
				request.setAttribute("usertype", usertype);
				response.sendRedirect("/viewpolicy.do?usertype=" + usertype);
				//request.getRequestDispatcher("forms/welcome.jsp").forward(request, response);
			}
			
		}
		else
		{
			request.setAttribute("message", "invalid credentials");
			request.getRequestDispatcher("WEB-INF/views/login.jsp").forward(request, response);
		}

	}

}