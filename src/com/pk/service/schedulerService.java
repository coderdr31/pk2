package com.pk.service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.pk.model.tcInfo;

public class schedulerService {

	private Connection conn;
	private PreparedStatement pstmt;

	public schedulerService() {
		conn = new com.pk.conn.conn().getCon();
	}

	public boolean setScheduler() {
		
		System.out.println("开始生成课表");
		for (int cla = 10; cla >= 1; cla--) {
			for (int tc = 1; tc <= 11; tc++) {
				for (int time = 1; time <= 16; time++) {
					try {
//						pstmt = conn.prepareStatement("select schedulerid from scheduler where classid=" + cla
//								+ " and tc_course_id =" + tc + " and timeid = " + time);
						pstmt = conn.prepareStatement("select schedulerid from scheduler where (tc_course_id =" 
								+ tc + " and timeid = " + time + ") or (classid = " + cla + " and timeid = " + time +")");
						ResultSet rs = pstmt.executeQuery(); // 结果集
						 if(rs.next())  continue;
						 else {
								pstmt = conn.prepareStatement("INSERT INTO scheduler"
										+ "(`classid`,`tc_course_id`,`coursename`,`teachername`,`timeid`)"
										+ "VALUES (?,?,?,?,?)");
								PreparedStatement pstmt2 = conn.prepareStatement("select * from tcinfo where " +"tcid=" + tc);
//								PreparedStatement pstmt2 = conn.prepareStatement("select * from tcinfo where tcid=1");
								ResultSet rs2 = pstmt2.executeQuery();
								while(rs2.next()){ 							
								pstmt.setInt(1, cla);
								pstmt.setInt(2, tc);

								System.out.print("class"+cla );
								System.out.print("teacher"+tc);
								System.out.println("time"+time);


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
