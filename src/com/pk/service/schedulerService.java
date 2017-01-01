package com.pk.service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Vector;

import com.pk.model.tcInfo;

public class schedulerService {

	private Connection conn;
	private PreparedStatement pstmt;

	public schedulerService() {
		conn = new com.pk.conn.conn().getCon();
	}

	public boolean setScheduler() {				
		try {
			pstmt = conn.prepareStatement("TRUNCATE scheduler");
			pstmt.execute();
		} catch (SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		System.out.println("清空课表");
		Vector tc_v = new Vector();
		try {
			pstmt = conn.prepareStatement("select tcid from tcinfo");
			pstmt.execute();
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()){ tc_v.add(rs.getInt(1)); }
		} catch (SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		
		Vector class_v = new Vector();
		try {
			pstmt = conn.prepareStatement("select classid from classinfo");
			pstmt.execute();
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()){ class_v.add(rs.getInt(1)); }
		} catch (SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		
		System.out.println("开始生成课表");
		for (int cla = 0; cla < class_v.size(); cla++) {
			for (int tc = 0; tc < tc_v.size(); tc++) {
				for (int time = 1; time <= 16; time++) {
					try {
						pstmt = conn.prepareStatement("select schedulerid from scheduler where (tc_course_id =" 
								+(int) tc_v.get(tc) + " and timeid = " + time + ") or (classid = " + (int) class_v.get(cla) + " and timeid = " + time +")");
						ResultSet rs = pstmt.executeQuery(); // 结果集
						 if(rs.next())  continue;
						 else {
								pstmt = conn.prepareStatement("INSERT INTO scheduler"
										+ "(`classid`,`tc_course_id`,`coursename`,`teachername`,`timeid`)"
										+ "VALUES (?,?,?,?,?)");
								PreparedStatement pstmt2 = conn.prepareStatement("select * from tcinfo where " +"tcid=" +(int) tc_v.get(tc));
//								PreparedStatement pstmt2 = conn.prepareStatement("select * from tcinfo where tcid=1");
								ResultSet rs2 = pstmt2.executeQuery();
								while(rs2.next()){ 							
								pstmt.setInt(1, (int) class_v.get(cla));
								pstmt.setInt(2, (int) tc_v.get(tc));

//								System.out.print("class"+(int) class_v.get(cla) );
//								System.out.print("teacher"+tc_v.get(tc));
//								System.out.println("time"+time);


								pstmt.setString(3, rs2.getString(2));
								pstmt.setString(4, rs2.getString(3));
								pstmt.setInt(5, time);
								pstmt.executeUpdate();}
								break;
								 }

					} catch (SQLException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
						return false;
					}
				}
			}
		}
		System.out.println("生成课表");
		return true;
	}

}
