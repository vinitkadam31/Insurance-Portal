package webapp;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class PersonalDetailsServlet
 */
@WebServlet(urlPatterns = "/personaldetails.do")
public class PersonalDetailsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PersonalDetailsServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		System.out.println("Hello..."+request.getParameter("name"));
		request.setAttribute("name", request.getParameter("name"));
		request.setAttribute("email", request.getParameter("email"));
		request.setAttribute("dob", request.getParameter("dob"));
		request.setAttribute("contact", request.getParameter("contact"));
		request.setAttribute("gender", request.getParameter("gender"));
		request.getRequestDispatcher("WEB-INF/views/register.jsp").forward(request, response);
	}

}
