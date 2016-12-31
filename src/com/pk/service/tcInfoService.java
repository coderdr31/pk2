package com.pk.service;

import java.sql.Connection;
import java.sql.PreparedStatement;
//import java.sql.ResultSet;
import java.sql.SQLException;
//import java.util.ArrayList;
//import java.util.List;

import com.pk.model.tcInfo;

public class tcInfoService {
	private Connection conn;
	private PreparedStatement pstmt;

	public tcInfoService() {
		conn = new com.pk.conn.conn().getCon();
	}

	public boolean addTc(tcInfo tc) {
		try {
			pstmt = conn.prepareStatement("insert into tcinfo" + "(tcid,tcname,tccourse) " + "values(?,?,?)");
			pstmt.setInt(1, tc.getTcid());
			pstmt.setString(2, tc.getTcname());
			pstmt.setString(3, tc.getTccourse());

			pstmt.executeUpdate();
			return true;
		} catch (SQLException e) {
			// TODO Auto-generated catch block

			e.printStackTrace();
			return false;
		}

	}

//	public List queryAllStu() {
//		List stus = new ArrayList();
//		try {
//			pstmt = conn.prepareStatement("select * from studentinfo");
//			ResultSet rs = pstmt.executeQuery(); // 结果集
//			while (rs.next()) {
//				tcInfo stu = new tcInfo();
//				stu.setId(rs.getInt(1));
//				stu.setNicheng(rs.getString(2));
//				stu.setTruename(rs.getString(3));
//				stu.setXb(rs.getByte(4));
//				if (rs.getDate(5) != null)
//					stu.setCsrq(rs.getDate(5).toString());
//				stu.setZy(rs.getString(6));
//				if (rs.getString(7) != null)
//					stu.setKc(rs.getString(7).split("&"));
//				if (rs.getString(8) != null)
//					stu.setXq(rs.getString(8).split("&"));
//				stu.setBz(rs.getString(9));
//				stus.add(stu);
//				
//			}
//			return stus;
//
//		} catch (SQLException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//			return null;
//		}
//
//	}
//
//	public tcInfo queryStubyID(int id) {
//		try {
//			pstmt = conn.prepareStatement("select * from studentinfo where id=?");
//			pstmt.setInt(1, id);
//			ResultSet rs = pstmt.executeQuery();
//			if (rs.next()) {
//				tcInfo stu = new tcInfo();
//				stu.setId(rs.getInt(1));
//				stu.setNicheng(rs.getString(2));
//				stu.setTruename(rs.getString(3));
//				stu.setXb(rs.getByte(4));
//				if (rs.getDate(5) != null)
//					stu.setCsrq(rs.getDate(5).toString());
//				stu.setZy(rs.getString(6));
//				if (rs.getString(7) != null)
//					stu.setKc(rs.getString(7).split("&"));
//				if (rs.getString(8) != null)
//					stu.setXq(rs.getString(8).split("&"));
//				stu.setBz(rs.getString(9));
//				return stu;
//
//			}
//			return null;
//
//		} catch (SQLException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//			return null;
//		}
//
//	}
//
//	public boolean updateStu(tcInfo stu) {
//
//		try {
//			pstmt = conn.prepareStatement("update  studentinfo set nicheng=? , truename=? , xb=? ,csrq=? ,"
//					+ " zy=? ,kc=? , xq=?, bz=?   where id=?");
//			pstmt.setString(1, stu.getNicheng());
//			pstmt.setString(2, stu.getTruename());
//			pstmt.setByte(3, stu.getXb());
//			pstmt.setString(4, stu.getCsrq());
//			pstmt.setString(5, stu.getZy());
//			pstmt.setString(6, stu.getKcs());
//			pstmt.setString(7, stu.getXqs());
//			pstmt.setString(8, stu.getBz());
//			pstmt.setInt(9, stu.getId());
//			pstmt.executeUpdate();
//			return true;
//		} catch (SQLException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//			return false;
//		}
//	}
//
//	public Boolean deleteStu(int id) {
//
//		try {
//			pstmt = conn.prepareStatement("delete from  studentinfo where id=?");
//			pstmt.setInt(1, id);
//			pstmt.executeUpdate();
//			return true;
//		} catch (Exception e) {
//			e.getStackTrace();
//			return false;
//		}
//
//	}
}
