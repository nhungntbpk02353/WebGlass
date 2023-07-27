package com.fpltn.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.Session;

import com.fpltn.dao.usersDao;
import com.fpltn.entities.Users;
import com.fpltn.util.HibernateUtil;

/**
 * Servlet implementation class userServlet
 */
@WebServlet("/userServlet")
public class userServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public userServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		// Tạo 1 Hibernate Session từ HibernateUtil
		Session hbsession = HibernateUtil.getSessionFactory().openSession();
		hbsession.beginTransaction();

		usersDao usersDao = new usersDao();

		List<Users> danhSachUsers = usersDao.getUsers();
		danhSachUsers.forEach(s -> System.out.println(s.getUsername())); // Xuất thử ra console

		// Tạo 1 HttpSession để qua trang index.jsp lấy dữ liệu
		javax.servlet.http.HttpSession session = request.getSession();

		// Thêm danhsachDanhMuc lấy từ Database vào Attribute đặt tên là listDM
		session.setAttribute("listUsers", danhSachUsers);
		response.sendRedirect("userManager.jsp");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		if (request.getCharacterEncoding() == null) {
			request.setCharacterEncoding("utf-8");
		}
		response.setContentType("text/json; charset=UTF-8");
		usersDao usersDao = new usersDao();

		List<Users> danhSachUsers = usersDao.getUsers();
		int idusers = danhSachUsers.get(danhSachUsers.size()-1).getId()+1;
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		String fullname = request.getParameter("fullname");
		String email = request.getParameter("email");
		String userole = request.getParameter("userole");
		Users users = new Users();
		users.setId(idusers);
		users.setUsername(username);
		users.setPassword(password);
		users.setFullname(fullname);
		users.setEmail(email);
		users.setUserole(userole);
		System.out.println(username);
		// Tạo 1 Hibernate Session từ HibernateUtil
		Session hbsession = HibernateUtil.getSessionFactory().openSession();
		hbsession.beginTransaction();

		// Lưu danh mục đã tạo ở trên
		hbsession.save(users);

		hbsession.getTransaction().commit();
		
		doGet(request, response);
	}

}
