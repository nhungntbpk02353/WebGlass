package com.fpltn.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.Session;


import com.fpltn.dao.usersDao;
import com.fpltn.util.HibernateUtil;

/**
 * Servlet implementation class DeleteUsers
 */
@WebServlet("/deleteusers")
public class DeleteUsers extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteUsers() {
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
				
				int idusers = Integer.parseInt(request.getParameter("id"));
				usersDao usersDao = new usersDao();
				usersDao.delete(idusers);

				RequestDispatcher rd = request.getRequestDispatcher("danhmuc");
				rd.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
