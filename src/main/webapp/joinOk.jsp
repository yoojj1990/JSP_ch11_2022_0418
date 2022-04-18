<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 가입 환영</title>
</head>
<body>
	<%
		request.setCharacterEncoding("UTF-8");
		
		String memberId = request.getParameter("id");
		String memberPw = request.getParameter("pw");
		String memberName = request.getParameter("name");
		String memberEmail = request.getParameter("email");
		
		System.out.println(memberId);
		System.out.println(memberPw);
		System.out.println(memberName);
		System.out.println(memberEmail);
		
		String sql = "INSERT INTO members(id, passwd, name, email) VALUES('" + memberId + "','" + memberPw + "','" + memberName + "','" + memberEmail + "')";
		
		String driverName = "com.mysql.jdbc.Driver";
		String url = "jdbc:mysql://localhost:3306/webdb";
		
		String username = "root";
		String password = "yoojj1990";
		
		Connection conn = null;
		Statement stmt = null; 
		
		try{
			Class.forName(driverName); // 드라이버 로딩
			conn = DriverManager.getConnection(url, username, password); // DB연동
			stmt = conn.createStatement();
			
			int dbFlag = stmt.executeUpdate(sql); // sql문 실행 -> 1이 오면 성공 아니면 실패
			
			if(dbFlag == 1){
				out.println("회원 가입 성공");
			}else{
				out.println("회원 가입 실패");
			}
			
			out.println(conn);
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