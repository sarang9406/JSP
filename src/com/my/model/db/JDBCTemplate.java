package com.my.model.db;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class JDBCTemplate {

	public static Connection getConnection() {
		try {
			Class.forName("oracle.jdbc.OracleDriver");
		} catch (ClassNotFoundException e) {
			System.out.println("ERROR DRIVER CONNECTION");
			e.printStackTrace();
		}
		Connection con = null;

		String url = "jdbc:oracle:thin:@localhost:1521:xe";
		String user = "kh";
		String pw = "kh";

		try {
			con = DriverManager.getConnection(url, user, pw);
			con.setAutoCommit(false);
		} catch (SQLException e) {
			System.out.println("ERROR CONNECTION INSTANCE");
			e.printStackTrace();
		}
		return con;
	}

	public static void close(Connection con) {
		try {
			con.close();
		} catch (SQLException e) {
			System.out.println("ERROR CLOSING");
			e.printStackTrace();
		}
	}

	public static void close(ResultSet rs) {
		try {
			rs.close();
		} catch (SQLException e) {
			System.out.println("ERROR CLOSING");
			e.printStackTrace();
		}
	}

	public static void close(Statement stmt) {
		try {
			stmt.close();
		} catch (SQLException e) {
			System.out.println("ERROR CLOSING");
			e.printStackTrace();
		}
	}
	
	public static void commit(Connection con) {
		try {
			con.commit();
		} catch (SQLException e) {
			System.out.println("ERROR COMMIT");
			e.printStackTrace();
		}
	}
	public static void rollback (Connection con ) {
		try {
			con.rollback();
		} catch (SQLException e) {
			System.out.println("ERROR ROLLBACK");
			e.printStackTrace();
		}
	}
}
