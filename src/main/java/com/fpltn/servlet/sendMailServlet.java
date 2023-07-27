package com.fpltn.servlet;

import java.io.IOException;
import java.net.PasswordAuthentication;
import java.util.Properties;

import javax.mail.Message;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


/**
 * Servlet implementation class sendMailServlet
 */
@WebServlet("/sendMailServlet")
public class sendMailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public sendMailServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		RequestDispatcher rd = request.getRequestDispatcher("contact.jsp");
		rd.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		req.setCharacterEncoding ("utf-8");
		resp.setCharacterEncoding ("utf-8");
		final String username = "bichnhung722@gmail.com";
		final String password = "vhdukxuohrrmargb";
		Properties props = new Properties();
		props.put("mail.smtp.host", "smtp.gmail.com");
		props.put("mail.smtp.port", "587");
		props.put("mail.smtp.auth", "true");
		props.put("mail.smtp.starttls.enable", "true");
		// Get the Session object.
		
		Session session = Session.getInstance(props, new javax.mail.Authenticator() {
			protected javax.mail.PasswordAuthentication getPasswordAuthentication() {
					return new javax.mail.PasswordAuthentication (username, password);
			}
		
		
		});
		
		String tomail = req.getParameter("Email");
		String subject = req.getParameter("Subject");
		String content = req.getParameter("Content");
		
		
		
		if(tomail.equalsIgnoreCase("") || subject.equalsIgnoreCase("") || content.equalsIgnoreCase("") )
		{
			req.setAttribute("message", "Vui lòng nhập đầy đủ thông tin");
			
		}else {
			try {
				Message msg= new MimeMessage(session);
				msg.setFrom(new InternetAddress(username));
				msg.addRecipient(Message.RecipientType.TO,new InternetAddress(tomail));
				msg.setSubject(subject);
				msg.setText(content);
				Transport.send(msg);
				req.setAttribute("message", "Gửi mail thành công!");
			} catch (Exception e) {
				System.out.println(e.getMessage());
			}
			
		}
		req.getRequestDispatcher("contact.jsp").forward(req, resp);
		/*
		 * final String username="bichnhung722@gmail.com";
		 * 
		 * final String password="wnreeostsaeqbgtm"; Properties prop = new Properties();
		 * prop.put("mail.smtp.host", "smtp.gmail.com"); prop.put("mail.smtp.port",
		 * "587"); prop.put("mail.smtp.auth", "true");
		 * prop.put("mail.smtp.starttls.enable", "true");
		 */
			/*
			  {
			 * protected PasswordAuthentication getPasswordAuthentication() { return new
			 * PasswordAuthentication(username, password); } } );
			 */
		 
		
		
		
	}

}
