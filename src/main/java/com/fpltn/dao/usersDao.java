package com.fpltn.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.Transaction;

import com.fpltn.entities.Danhmuc;
import com.fpltn.entities.Users;
import com.fpltn.util.HibernateUtil;


public class usersDao {
	//hàm thêm
	public static void saveUser(Users users) {
		Transaction transaction = null;
		try (Session session = HibernateUtil.getSessionFactory().openSession()) {
			// start a transaction
			transaction = session.beginTransaction();
			// save the danh muc object
			session.save(users);
			// commit transaction
			transaction.commit();
		} catch (Exception e) {
			if (transaction != null) {
				transaction.rollback();
			}
			e.printStackTrace();
		}
	}
	public static List<Users> getUsers() { 
		try (Session session = (Session) HibernateUtil.getSessionFactory().openSession()) {
			return session.createQuery("select users from Users as users", Users.class).list();
		}
	}
	public static Users findByIduser(int id) {	
		try (Session session = (Session) HibernateUtil.getSessionFactory().openSession()) {		
			Users users = session.load(Users.class, id);
			System.out.print(users);
			return users;
		} 
			
	}
	
	//xóa danh mục theo ID
		public static void delete(int id) {
			Transaction transaction = null;
			try (Session session = HibernateUtil.getSessionFactory().openSession()) {
				// start a transaction
				transaction = session.beginTransaction();
				
				Users users = session.load(Users.class, id);
				session.delete(users);
				
				
				// commit transaction
				transaction.commit();
			} catch (Exception e) {
				if (transaction != null) {
					transaction.rollback();
				}
				e.printStackTrace();
			}
		}
		
		//Cập nhật danh mục
		public static void update(Users users) {
			
			Transaction transaction = null;
			try (Session session = HibernateUtil.getSessionFactory().openSession()) {
				// start a transaction
				transaction = session.beginTransaction();
				
				
				session.update(users);			
				
				// commit transaction
				transaction.commit();
			} catch (Exception e) {
				if (transaction != null) {
					transaction.rollback();
				}
				e.printStackTrace();
			}
			
		  
		  }

}
