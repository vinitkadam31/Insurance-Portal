package webapp;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Scala.Rules;
import models.UserInfo;

/**
 * Servlet implementation class RegisterServlet
 */
@WebServlet(urlPatterns = "/register.do")
public class RegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	DBConectivity connectivity;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RegisterServlet() {
        super();
        // TODO Auto-generated constructor stub
        connectivity = new DBConectivity();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//request.setAttribute("name", "Vinit Kadam");
		System.out.println("email = " + request.getParameter("email"));
		request.setAttribute("email", request.getParameter("email"));
		request.getRequestDispatcher("WEB-INF/views/register.jsp").forward(request, response);
		//response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		UserInfo user = new UserInfo();
		user.name = request.getParameter("name");
		user.userName = request.getParameter("email");
		user.password = request.getParameter("password");
		String confirmpassword = request.getParameter("confirmpassword");
		user.dob = request.getParameter("dob");
		user.contactno = request.getParameter("contact");
		user.gender = request.getParameter("gender");
		
		user.address1 = request.getParameter("address1");
		user.address2 = request.getParameter("address2");
		user.city = request.getParameter("city");
		user.state = request.getParameter("state");
		user.country = request.getParameter("country");
		user.pincode = request.getParameter("pincode");
		boolean isError = false;
		//System.out.println(user.userName + " - " + Rules.isValid2(user.userName) + " - " + Rules.isValid3(user.userName));
		//boolean temp = Rules.isValid2(user.userName);
		//System.out.println(temp);
		//temp = Rules.isValid3(user.userName);
		//System.out.println(temp);
		String errorMessage = "";
		if((Rules.isStringEmpty(user.name)  || Rules.isStringEmpty(user.userName) || Rules.isStringEmpty(user.password) || Rules.isStringEmpty(confirmpassword) || Rules.isStringEmpty(user.dob) || Rules.isStringEmpty(user.contactno) || Rules.isStringEmpty(user.gender)))
		{
			isError = true;
			errorMessage = "Please fill all required fields";
		}
		if(!isError && (!Rules.isValid2(user.userName)))
		{
			isError = true;
			errorMessage = "Email id should be valid";
		}
		
		if(!isError && !Rules.isStringmatch(user.password, confirmpassword))
		{
			isError = true;
			errorMessage = "mismatch entries: password";
		}
		request.setAttribute("customername", user.userName);
		if(isError)
		{
			request.setAttribute("message", errorMessage);
			request.getRequestDispatcher("WEB-INF/views/register.jsp").forward(request, response);
		}
		else
		{
			int applicationId = connectivity.InsertNewCustomer(user);
			if(applicationId != 0)
			{
				request.setAttribute("applid", applicationId);
				request.getRequestDispatcher("WEB-INF/views/registerdetails.jsp").forward(request, response);
			}
		}
		
		
		//System.out.println(name);
		//System.out.println(email);System.out.println(password);System.out.println(confirmpassword);System.out.println(dob);System.out.println(contact);
		
		
		//doGet(request, response);
	}

}
