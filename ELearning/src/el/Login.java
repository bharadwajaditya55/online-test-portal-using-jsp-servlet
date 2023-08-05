package el;

import java.sql.DriverManager;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
public class Login
{
	private String  userId ;
	private String	pass ;
	private String	userType ;
	private String	em;
	private String  message;
	
	public String getMessage() {
		return message;
	}
	public void setMessage(String message) {
		this.message = message;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getpass() {
		return pass;
	}
	public void setpass(String pass) {
		this.pass = pass;
	}
	public String getUserType() {
		return userType;
	}
	public void setUserType(String userType) {
		this.userType = userType;
	}
	public String getem() {
		return em;
	}
	public void setem(String em) {
		this.em = em;
	}
	
	public boolean checkLogin() throws Exception
	{
		
		boolean flag;
		Connection con1=DBConnection.getConnection();
		System.out.println(con1);
		String sql="select * from Login where userid=? and pass=? and userType = ?";
		PreparedStatement pstmt=con1.prepareStatement(sql);
		pstmt.setString(1,this.userId);
		pstmt.setString(2,this.pass);
		pstmt.setString(3,this.userType);
		ResultSet rset=pstmt.executeQuery();
		if(rset.next())
		{
			flag =true;
			this.userType=rset.getString("userType");
		}
		else
		{
			 flag=false;
			 this.message="Invalid user Name or pass";
		}
		return flag;
	}
	public boolean checkReg() throws Exception
	{
		boolean  flag = false;
		int che = 0;
		try {
		Connection con1=DBConnection.getConnection();
		String sql="INSERT INTO login (userId,pass,userType,em) VALUES (?, ?, ?,?)";
		PreparedStatement pstmt=con1.prepareStatement(sql);
		pstmt.setString(1,this.userId);
		pstmt.setString(2,this.pass);
		pstmt.setString(3,this.userType);
		pstmt.setString(4,this.em);
		System.out.println(this.em);
		che = pstmt.executeUpdate();
		}catch(SQLException sqe) {
			sqe.printStackTrace();
		}
		if(che == 1)
		{
			flag = true;
		}
		else
		{
			 flag=false;
			 this.message="user already exists,please try with some other email address";
		}
		return flag;
	}
}
