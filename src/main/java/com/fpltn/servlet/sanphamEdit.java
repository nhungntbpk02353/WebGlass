package com.fpltn.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.Session;

import com.fpltn.dao.sanphamDao;

import com.fpltn.entities.Sanpham;
import com.fpltn.util.HibernateUtil;

/**
 * Servlet implementation class sanphamEdit
 */
@WebServlet("/editsp")
public class sanphamEdit extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public sanphamEdit() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		Session hbsession = HibernateUtil.getSessionFactory().openSession();
		hbsession.beginTransaction();

		sanphamDao spDao = new sanphamDao();

		List<Sanpham> danhSachSanPham = spDao.getSanPham();
		danhSachSanPham.forEach(s -> System.out.println(s.getTensp())); // Xuất thử ra console

		// Tạo 1 HttpSession để qua trang index.jsp lấy dữ liệu
		javax.servlet.http.HttpSession session = request.getSession();

		// Thêm danhsachSP lấy từ Database vào Attribute đặt tên là listSP
		session.setAttribute("listSP", danhSachSanPham);
		response.sendRedirect("productManager.jsp");
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
	

	
		int idsp = Integer.parseInt(request.getParameter("id"));
		String masp = request.getParameter("masp");
		String tensp = request.getParameter("tensp");
		double gia = Double.parseDouble(request.getParameter("gia")) ;
		String motangan = request.getParameter("motangan");
		
		String hinh = request.getParameter("hinh");
		int danhmuc = Integer.parseInt(request.getParameter("danhmuc"));
		String ghichu = request.getParameter("ghichu");
		
		Sanpham sanpham = new Sanpham();
		sanpham.setId(idsp);
		sanpham.setMasp(masp);
		sanpham.setTensp(tensp);
		sanpham.setGia(gia);
		sanpham.setMotangan(motangan);
	
		sanpham.setHinh(hinh);
		sanpham.setDanhmuc(danhmuc);
		sanpham.setGhichu(ghichu);
	
		
		sanphamDao.update(sanpham);
		
		doGet(request, response);
	}

}
