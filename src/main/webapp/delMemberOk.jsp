<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 탈퇴</title>
</head>
<body>
	<%
		request.setCharacterEncoding("UTF-8");
		
		String memberId = request.getParameter("id");
		
		String sql = "DELETE FROM members WHERE id= '"+ memberId +"'";
				
		String driverName = "com.mysql.jdbc.Driver";
		String url = "jdbc:mysql://localhost:3306/webdb";
		
		String username = "root";
		String password = "yoojj1990";
		
		Connection conn = null;
		Statement stmt = null; 
		
		
		try{
			Class.forName(driverName); // 드라이버 로딩
			conn = DriverManager.getConnection(url, username, password); // DB연동
			stmt = conn.createStatement(); // sql문 객체
			
			int dbFlag = stmt.executeUpdate(sql); // sql문 실행 -> 1이 오면 성공 아니면 실패
			
			if(dbFlag == 1){
				out.println("회원 탈퇴 성공");
			}else{
				out.println("회원 탈퇴 실패");
			}
			
			//out.println(conn);
		} catch(Exception e){
			e.printStackTrace(); // 에러 내용 출력
		} finally{
			try{
				if(stmt != null){
					stmt.close();
				}
				if(conn != null){
					conn.close();
				}
			} catch(Exception e){
				e.printStackTrace();
			}
		}
		
	%>
	
</body>
</html>