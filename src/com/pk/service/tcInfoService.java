package com.pk.service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
//import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
//import java.util.ArrayList;
//import java.util.List;
import java.util.List;

import com.pk.model.tcInfo;

public class tcInfoService {
	private Connection conn;
	private PreparedStatement pstmt;

	public tcInfoService() {
		conn = new com.pk.conn.conn().getCon();
	}

	public boolean addTc(tcInfo tc) {
		try {
			pstmt = conn.prepareStatement("insert into tcinfo" + "(tcjgh,tcname,tccourse) " + "values(?,?,?)");
			pstmt.setInt(1, tc.getTcjgh());
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

	public List queryAllTc() {
		List tcs = new ArrayList();
		try {
			pstmt = conn.prepareStatement("select * from tcinfo order by tcname");
			ResultSet rs = pstmt.executeQuery(); // 结果集
			while (rs.next()) {
				tcInfo tc = new tcInfo();
				tc.setTcid(rs.getInt(1));
				tc.setTcname(rs.getString(2));
				tc.setTccourse(rs.getString(3));
				tc.setTcjgh(rs.getInt(4));
				
				tcs.add(tc);
			}
			return tcs;

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return null;
		}

	}

	public tcInfo queryTcbyID(int tcid) {
		try {
			pstmt = conn.prepareStatement("select * from tcinfo where tcid=?");
			pstmt.setInt(1, tcid);
			ResultSet rs = pstmt.executeQuery();
			if (rs.next()) {
				tcInfo tc = new tcInfo();
				tc.setTcid(rs.getInt(1));
				tc.setTcname(rs.getString(2));
				tc.setTccourse(rs.getString(3));
				tc.setTcjgh(rs.getInt(4));
								
				return tc;

			}
			return null;

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return null;
		}

	}

	public boolean updateTc(tcInfo tc) {

		try {
			pstmt = conn.prepareStatement("update  tcinfo set tcname=? , tccourse=? , tcjgh=?  where tcid=?");
			pstmt.setString(1, tc.getTcname());
			pstmt.setString(2, tc.getTccourse());
			pstmt.setInt(3, tc.getTcjgh());
			pstmt.setInt(4, tc.getTcid());
			pstmt.executeUpdate();
			return true;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return false;
		}
	}

	public Boolean deleteTc(int tcid) {

		try {
			pstmt = conn.prepareStatement("delete from  tcinfo where tcid=?");
			pstmt.setInt(1, tcid);
			pstmt.executeUpdate();
			return true;
		} catch (Exception e) {
			e.getStackTrace();
			return false;
		}

	}
}
