package el;

import java.sql.DriverManager;
import java.sql.Connection;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

//import sun.jdbc.odbc.ee.DataSource;

public class DBConnection
{
	
	public static Connection getConnection() throws Exception
	{
		Connection conn = null;
		try
		{
			/* Database Connection Code to connect with Oracle Database*/
			try
			{
				if (conn == null) {
				Class.forName("com.mysql.cj.jdbc.Driver");
				
				
				InitialContext initialcontext=new InitialContext();
				Context envContext=(Context)initialcontext.lookup("java:/comp/env");
				DataSource ds=(DataSource)envContext.lookup("jdbc/LO");
				
				conn=ds.getConnection();
				System.out.println("connection"+conn);
			} }
			catch(Exception e)
			{
				e.printStackTrace();
			}
			String url = "jdbc:mysql://localhost:3306/elearning?allowPublicKeyRetrieval=true&useSSL=false";  //xe
		conn = DriverManager.getConnection(url,"root","root");

			
		}
		catch(Exception ex)
		{
			ex.printStackTrace();
		}
		
		
		return conn;
	}
}
