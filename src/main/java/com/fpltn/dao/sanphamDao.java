package com.fpltn.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

import com.fpltn.util.HibernateUtil;
//import org.hibernate.Transaction;
import com.fpltn.entities.Danhmuc;
import com.fpltn.entities.Sanpham;
import com.fpltn.entities.Users;



public class sanphamDao {
	
	//hàm thêm
		public static void saveSanpham(Sanpham sanpham) {
			Transaction transaction = null;
			try (Session session = HibernateUtil.getSessionFactory().openSession()) {
				// start a transaction
				transaction = session.beginTransaction();
				// save the danh muc object
				session.save(sanpham);
				// commit transaction
				transaction.commit();
			} catch (Exception e) {
				if (transaction != null) {
					transaction.rollback();
				}
				e.printStackTrace();
			}
		}
	public static List<Sanpham> getSanPham() { 
		try (Session session = (Session) HibernateUtil.getSessionFactory().openSession()) {
			return session.createQuery("select sanpham from Sanpham as sanpham", Sanpham.class).list();
		}
	}
	public static Sanpham findByIdsp(int id) {	
		try (Session session = (Session) HibernateUtil.getSessionFactory().openSession()) {		
			Sanpham sp = session.load(Sanpham.class, id);
			System.out.print(sp);
			return sp;
		} 
			
	}
	//xóa sp theo ID
			public static void delete(int id) {
				Transaction transaction = null;
				try (Session session = HibernateUtil.getSessionFactory().openSession()) {
					// start a transaction
					transaction = session.beginTransaction();
					
					Sanpham sanpham = session.load(Sanpham.class, id);
					session.delete(sanpham);
					
					
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
			public static void update(Sanpham sanpham) {
				
				Transaction transaction = null;
				try (Session session = HibernateUtil.getSessionFactory().openSession()) {
					// start a transaction
					transaction = session.beginTransaction();
					
					
					session.update(sanpham);			
					
					// commit transaction
					transaction.commit();
				} catch (Exception e) {
					if (transaction != null) {
						transaction.rollback();
					}
					e.printStackTrace();
				}
				
			  
			  }
	
	
	//Phân trang dữ liệu
		public static List<Sanpham> getSanpham(int viTri, int soLuong) {
			try (Session session = (Session) HibernateUtil.getSessionFactory().openSession()) {
			  Query query = session.createQuery("select sanpham from Sanpham as sanpham", Sanpham.class);
			  query.setFirstResult(viTri);
			  query.setMaxResults(soLuong);
			  return query.list();
			}
		}
		
		public static long DemSoLuongSanPham() {
			try (Session session = (Session) HibernateUtil.getSessionFactory().openSession()) {
			  String countQ = "Select count (sanpham.id) from Sanpham as sanpham";
			  Query countQuery = session.createQuery(countQ);
			  return (Long) countQuery.uniqueResult();
			}
		}
		
		//Tìm kiếm và Phân trang dữ liệu
				public static List<Sanpham> timKiem(String tuKhoa) {
					try (Session session = (Session) HibernateUtil.getSessionFactory().openSession()) {
					  Query query = session.createQuery(
							  "select sanpham from Sanpham as sanpham where sanpham.tensp LIKE :tensp ", Sanpham.class);
					  query.setParameter("tensp", "%" + tuKhoa + "%");
					  return query.list();
					}
				}
}
