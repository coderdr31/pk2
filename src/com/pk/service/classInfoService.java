package com.pk.service;


import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.pk.model.classInfo;

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
}