package staff;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class StaffDAO {
	private Connection conn=null;
	private ResultSet rs;
	
	public StaffDAO() {
		try {
			String dbURL = "jdbc:mysql://localhost:3306/carddb?serverTimezone=UTC";
			String dbID = "root";
			String dbPassword = "cmskdytl00";
			Class.forName("com.mysql.cj.jdbc.Driver");
			conn = DriverManager.getConnection(dbURL, dbID, dbPassword);
		} catch (Exception e) {
			e.printStackTrace(); // 오류가 무엇인지 출력
		}
	}
	

	public int getNext() { 
		String SQL = "SELECT IDSTAFF FROM STAFF ORDER BY IDSTAFF DESC";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				return rs.getInt(1) + 1;
			}
			return 1;//첫 번째 게시물인 경우
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1; //데이터베이스 오류
	}
	
	public String getDate() { 
		String SQL = "SELECT NOW()";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				return rs.getString(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return ""; //데이터베이스 오류
	}
	
	public int insert(Staff staff) { 
		String SQL = "INSERT INTO STAFF VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, getNext());
			pstmt.setString(2, staff.getStaffname());
			pstmt.setString(3, staff.getCellphone());
			pstmt.setString(4, staff.getEmail());
			pstmt.setString(5, staff.getPosition());
			pstmt.setString(6, staff.getDepartment());
			pstmt.setString(7, getDate());
			pstmt.setString(8, staff.getCompanyname());
			pstmt.setString(9, staff.getPhone());
			pstmt.setString(10, staff.getFax());
			pstmt.setString(11, staff.getPoscalcode());
			pstmt.setString(12, staff.getAddress());
			pstmt.setString(13, staff.getIndustry());
			pstmt.setString(14, staff.getStock());
			return pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
			return -1; //데이터베이스 오류
	}
	
	public ArrayList<Staff> getList(int pageNumber) {
		String SQL = "SELECT * FROM STAFF WHERE IDSTAFF < ? ORDER BY IDSTAFF DESC LIMIT 10";
		ArrayList<Staff> list = new ArrayList<Staff>();
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, getNext() - (pageNumber - 1) * 10);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				Staff staff = new Staff();
				staff.setIdstaff(rs.getInt(1));
				staff.setStaffname(rs.getString(2));
				staff.setCellphone(rs.getString(3));
				staff.setEmail(rs.getString(4));
				staff.setPosition(rs.getString(5));
				staff.setDepartment(rs.getString(6));
				staff.setDate(rs.getString(7));
				staff.setCompanyname(rs.getString(8));
				staff.setPhone(rs.getString(9));
				staff.setFax(rs.getString(10));
				staff.setPoscalcode(rs.getString(11));
				staff.setAddress(rs.getString(12));
				staff.setIndustry(rs.getString(13));
				staff.setStock(rs.getString(14));
				list.add(staff);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	public boolean nextPage(int pageNumber) {
		String SQL = "SELECT * FROM STAFF WHERE IDSTAFF < ?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, getNext() - (pageNumber - 1) * 10);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				return true;
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return false;
	}
	
	public Staff getBbs(int idstaff) {
		String SQL = "SELECT * FROM STAFF WHERE IDSTAFF = ?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, idstaff);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				Staff staff = new Staff();
				staff.setIdstaff(rs.getInt(1));
				staff.setStaffname(rs.getString(2));
				staff.setCellphone(rs.getString(3));
				staff.setEmail(rs.getString(4));
				staff.setPosition(rs.getString(5));
				staff.setDepartment(rs.getString(6));
				staff.setDate(rs.getString(7));
				staff.setCompanyname(rs.getString(8));
				staff.setPhone(rs.getString(9));
				staff.setFax(rs.getString(10));
				staff.setPoscalcode(rs.getString(11));
				staff.setAddress(rs.getString(12));
				staff.setIndustry(rs.getString(13));
				staff.setStock(rs.getString(14));
				return staff;
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
	public int delete(int idstaff) {
		String SQL = "DELETE FROM STAFF WHERE idstaff = ?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, idstaff);
			return pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}
		return -1;
	}
	
	public int update(int idstaff, String staffname, String cellphone, String email, String position, String department, 
			String companyname, String phone, String fax, String poscalcode, String address, String industry, String stock) {
		String SQL = "UPDATE STAFF SET staffname=?, cellphone = ?, email=?, position=?, department=?, companyname=?, "
				+ "phone=?, fax=?, poscalcode=?, address=?, industry=?, stock=? WHERE idstaff = ?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, staffname);
			pstmt.setString(2, cellphone);
			pstmt.setString(3, email);
			pstmt.setString(4, position);
			pstmt.setString(5, department);
			pstmt.setString(6, companyname);
			pstmt.setString(7, phone);
			pstmt.setString(8, fax);
			pstmt.setString(9, poscalcode);
			pstmt.setString(10, address);
			pstmt.setString(11, industry);
			pstmt.setString(12, stock); 
			pstmt.setInt(13, idstaff); 
			return pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}
		return -1;
	}
}
