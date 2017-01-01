package com.pk.service;


import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.pk.model.classInfo;
import com.pk.model.courseInfo;

public class classInfoService {

	private Connection conn;
	private PreparedStatement pstmt;

	public classInfoService() {
		conn = new com.pk.conn.conn().getCon();
	}
	
	public List queryAllcla() {
		List clas = new ArrayList();
		try {
			pstmt = conn.prepareStatement("select * from classinfo");
			ResultSet rs = pstmt.executeQuery(); // 结果集
			while (rs.next()) {
				classInfo cla = new classInfo();
				cla.setClassid(rs.getInt(1));		
				cla.setClassname(rs.getString(2));
				clas.add(cla);			
			}
			return clas;

		} catch (SQLException e) {
			e.printStackTrace();
			return null;
		}
	}
	public classInfo queryStubyID(String coursename) {
		try {
			pstmt = conn.prepareStatement("select * from classinfo where classname=?");
			pstmt.setString(1, coursename);   
			ResultSet rs = pstmt.executeQuery();
			if (rs.next()) {
				classInfo cou = new classInfo();
				cou.setClassname(rs.getString(1));
				return cou;

			}
			return null;

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return null;
		}

	}
	public boolean addClass(classInfo cla) {
		try {
			pstmt = conn.prepareStatement("insert into classinfo" + "(classid,classname) " + "values(?,?)");
			pstmt.setInt(1, cla.getClassid());
			pstmt.setString(2, cla.getClassname());
			

			pstmt.executeUpdate();
			return true;
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		}

	}
	
	public Boolean deleteClass(int classid) {

		try {
			pstmt = conn.prepareStatement("delete from  classinfo where classid=?");
			pstmt.setInt(1, classid);
			pstmt.executeUpdate();
			return true;
		} catch (Exception e) {
			e.getStackTrace();
			return false;
		}
	}
	
}