package website;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.fpltn.dao.sanphamDao;
import com.fpltn.dao.usersDao;
import com.fpltn.entities.Sanpham;
import com.fpltn.entities.Users;

/**
 * Servlet implementation class login
 */
@WebServlet("/login")
public class login extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public login() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
//		response.getWriter().append("Served at: ").append(request.getContextPath());
		if (request.getCharacterEncoding() == null) {
			request.setCharacterEncoding("utf-8");
		}
		response.setContentType("text/json; charset=UTF-8");

		String username = request.getParameter("username");
		String password = request.getParameter("password");
//		String userole = request.getParameter("userole");
		usersDao uDao = new usersDao();

		List<Users> danhSach = uDao.getUsers();
//		response.getWriter().append("Served at: hello ").append(request.getContextPath());
		HttpSession session = request.getSession();
		for (Users i : danhSach) {
			if (username.equals(i.getUsername()) && password.equals(i.getPassword())) {
				session.setAttribute("userlogin", "true");
				session.setAttribute("username", username);
				if(i.getUserole().equals("admin")) {
					RequestDispatcher rd = request.getRequestDispatcher("homeAdmin.jsp");
				}
				session.setAttribute("userrole", i.getUserole());
//				session.setAttribute("userole", userole);
				  RequestDispatcher rd = request.getRequestDispatcher("index.jsp");
				  rd.forward(request, response);
				 
//				response.sendRedirect("index.jsp");	
			} else {
				request.setAttribute("thongbao", "Đăng nhập thất bại");
				RequestDispatcher rd = request.getRequestDispatcher("login.jsp");
				rd.forward(request, response);
			
			}
			
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
