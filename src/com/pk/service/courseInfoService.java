package com.pk.service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.pk.model.courseInfo;

public class courseInfoService {

	private Connection conn;
	private PreparedStatement pstmt;

	public courseInfoService() {
		conn = new com.pk.conn.conn().getCon();
	}

	public boolean addCourse(courseInfo course) {
		try {
			pstmt = conn.prepareStatement("insert into courseinfo" + "(coursename,coursehour) " + "values(?,?)");
			pstmt.setString(1, course.getCoursename());
			pstmt.setInt(2, course.getCoursehour());

			pstmt.executeUpdate();
			return true;
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		}

	}
	
	public List queryAllCou() {
	List cous = new ArrayList();
	try {
		pstmt = conn.prepareStatement("select * from courseinfo");
		ResultSet rs = pstmt.executeQuery(); // 结果集
		while (rs.next()) {
			courseInfo cou = new courseInfo();
			cou.setCoursename(rs.getString(1));
			cou.setCoursehour(rs.getInt(2));			
			
			cous.add(cou);			
		}
		return cous;

	} catch (SQLException e) {
		e.printStackTrace();
		return null;
	}
}
	
	public courseInfo queryStubyID(String coursename) {
		try {
			pstmt = conn.prepareStatement("select * from courseinfo where coursename=?");
			pstmt.setString(1, coursename);   
			ResultSet rs = pstmt.executeQuery();
			if (rs.next()) {
				courseInfo cou = new courseInfo();
				cou.setCoursename(rs.getString(1));
				cou.setCoursehour(rs.getInt(2));
				return cou;

			}
			return null;

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return null;
		}

	}
	
	public boolean updateCou(courseInfo cou) {

		try {
			pstmt = conn.prepareStatement("update  courseinfo set coursehour=?  where coursename=?");
			pstmt.setInt(1, cou.getCoursehour());
			pstmt.setString(2, cou.getCoursename());
			
			pstmt.executeUpdate();
			return true;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return false;
		}
	}

	public Boolean deleteCou(String coursename) {

		try {
			pstmt = conn.prepareStatement("delete from  courseinfo where coursename=?");
			pstmt.setString(1, coursename);
			pstmt.executeUpdate();
			return true;
		} catch (Exception e) {
			e.getStackTrace();
			return false;
		}
	}
	
}
