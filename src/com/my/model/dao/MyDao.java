package com.my.model.dao;

import static com.my.model.db.JDBCTemplate.*;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.my.model.dto.MyDto;

public class MyDao {

	
	public List<MyDto> selectList(){
		
		Connection con = getConnection();
		
		String sql = "SELECT MYNO, MYNAME, MYTITLE, MYCONTENT, MYDATE "
				+ " FROM MYBOARD ORDER BY MYNO DESC";
		Statement stmt = null;
		ResultSet rs = null;
		List<MyDto> list = new ArrayList<MyDto>();
		try {
			stmt = con.createStatement();
			rs = stmt.executeQuery(sql);
			
			while(rs.next()) {
				MyDto dto = new MyDto();
				dto.setMyno(rs.getInt(1));
				dto.setMyname(rs.getString(2));
				dto.setMytitle(rs.getString(3));
				dto.setMycontent(rs.getString(4));
				dto.setMydate(rs.getDate(5));
				
				list.add(dto);
			}
		} catch (SQLException e) {
			System.out.println("ERROR STATMENT");
			e.printStackTrace();
		} finally {
			close(rs);
			close(stmt);
			close(con);
		}
		
		
		return list;
	}
	public MyDto selectOne (int myno) {
		Connection con = getConnection();
		
		String sql =  "SELECT MYNO, MYNAME, MYTITLE, MYCONTENT, MYDATE "
				+ " FROM MYBOARD "
				+ " WHERE MYNO = ? ";
		PreparedStatement pstm = null;
		ResultSet rs = null;
		MyDto dto = new MyDto();
		try {
			pstm = con.prepareStatement(sql);
			pstm.setInt(1, myno);
			
			rs = pstm.executeQuery();
			
			while (rs.next()) {
				dto.setMyname(rs.getString(2));
				dto.setMytitle(rs.getString(3));
				dto.setMycontent(rs.getString(4));
			}
		} catch (SQLException e) {
			System.out.println("ERROR STATEMENT");
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstm);
			close(con);
		}
		
		return dto;
	}
	public int insert(MyDto dto) {
		Connection con = getConnection();
		
		String sql = "INSERT INTO MYBOARD VALUES (MYNOSEQ.NEXTVAL,?, ?, ?, SYSDATE)";
		PreparedStatement pstm = null;
		int res = 0;
		
		try {
			pstm = con.prepareStatement(sql);
			pstm.setString(1, dto.getMyname());
			pstm.setString(2, dto.getMytitle());
			pstm.setString(3, dto.getMycontent());
			
			res = pstm.executeUpdate();
			
			if(res>0) {
				commit(con);
			}
			
		} catch (SQLException e) {
			System.out.println("ERROR STATEMENT");
			e.printStackTrace();
		} finally {
			close(pstm);
			close(con);
		}
		
		return res;
	}
	public int update(MyDto dto) {
		Connection con = getConnection();
		String sql = "UPDATE MYBOARD SET MYTITLE = ?, MYCONTENT = ? WHERE MYNO = ?";
		PreparedStatement pstm = null;
		int res = 0;
		
		try {
			pstm = con.prepareStatement(sql);
			pstm.setString(1, dto.getMytitle());
			pstm.setString(2, dto.getMycontent());
			pstm.setInt(3, dto.getMyno());
			
			res = pstm.executeUpdate();
			
			if(res>0) {
				commit(con);
			}
			
		} catch (SQLException e) {
			System.out.println("ERROR STATEMENT");
			e.printStackTrace();
		} finally {
			close(pstm);
			close(con);
		}
		
		return res;
	}
	public int delete(int myno) {
		Connection con = getConnection();
		String sql = "DELETE MYBOARD WHERE MYNO = ?";
		PreparedStatement pstm = null;
		int res = 0;
		
		try {
			pstm = con.prepareStatement(sql);
			pstm.setInt(1, myno);
			
			res = pstm.executeUpdate();
			
			if(res>0) {
				commit(con);
			}
		} catch (SQLException e) {
			System.out.println("ERROR STATEMENT");
			e.printStackTrace();
		} finally {
			close(pstm);
			close(con);
		}
		return res;
	}
}
