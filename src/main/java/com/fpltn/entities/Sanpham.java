package com.fpltn.entities;
// Generated 16:00:59, 13 thg 4, 2023 by Hibernate Tools 4.3.6.Final

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * Sanpham generated by hbm2java
 */
@Entity
@Table(name = "sanpham", catalog = "dbweb")
public class Sanpham implements java.io.Serializable {

	private int id;
	private String masp;
	private String tensp;
	private Double gia;
	private String motangan;

	private String hinh;
	private Integer danhmuc;
	private String ghichu;

	public Sanpham() {
	}

	public Sanpham(int id, String masp) {
		this.id = id;
		this.masp = masp;
	}

	public Sanpham(int id, String masp, String tensp, Double gia, String motangan, String hinh,
			Integer danhmuc, String ghichu) {
		this.id = id;
		this.masp = masp;
		this.tensp = tensp;
		this.gia = gia;
		this.motangan = motangan;
		
		this.hinh = hinh;
		this.danhmuc = danhmuc;
		this.ghichu = ghichu;
	}

	@Id

	@Column(name = "id", unique = true, nullable = false)
	public int getId() {
		return this.id;
	}

	public void setId(int id) {
		this.id = id;
	}

	@Column(name = "masp", nullable = false, length = 45)
	public String getMasp() {
		return this.masp;
	}

	public void setMasp(String masp) {
		this.masp = masp;
	}

	@Column(name = "tensp", length = 45)
	public String getTensp() {
		return this.tensp;
	}

	public void setTensp(String tensp) {
		this.tensp = tensp;
	}

	@Column(name = "gia", precision = 22, scale = 0)
	public Double getGia() {
		return this.gia;
	}

	public void setGia(Double gia) {
		this.gia = gia;
	}

	@Column(name = "motangan", length = 160)
	public String getMotangan() {
		return this.motangan;
	}

	public void setMotangan(String motangan) {
		this.motangan = motangan;
	}

	
	@Column(name = "hinh")
	public String getHinh() {
		return this.hinh;
	}

	public void setHinh(String hinh) {
		this.hinh = hinh;
	}

	@Column(name = "danhmuc")
	public Integer getDanhmuc() {
		return this.danhmuc;
	}

	public void setDanhmuc(Integer danhmuc) {
		this.danhmuc = danhmuc;
	}

	@Column(name = "ghichu")
	public String getGhichu() {
		return this.ghichu;
	}

	public void setGhichu(String ghichu) {
		this.ghichu = ghichu;
	}

}