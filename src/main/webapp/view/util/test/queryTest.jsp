<%@page import="java.sql.*"%>
<%@page import="com.zumuniyo.util.DBUtilForJNDI"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>쿼리테스트</title>
</head>
<body>
<%
Connection conn = null;
ResultSet rs = null;
Statement st = null;
ResultSetMetaData rsmd = null;
String sql = null;

try {
   // 쿼리문 여기에 입력
   
   sql = "select * from tab";
      
   // first,last 사용시 파라메터 추가설정해야함
   conn = DBUtilForJNDI.getConnection();
   st = conn.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_UPDATABLE);
   rs = st.executeQuery(sql);
   rsmd = rs.getMetaData();

   // 로우수 구하기
   rs.last();
   int row = rs.getRow();
   rs.beforeFirst();
   // 컬럼수 구하기
   int col = rsmd.getColumnCount();
   System.out.println("결과수: " + row);
   // 컬럼명 출력
   for (int i = 1; i <= col; i++) {
      System.out.printf("%-15s", rsmd.getColumnName(i));
   }
   System.out.println("");
   // 타입출력
   for (int i = 1; i <= col; i++) {
      System.out.printf("%-15s", "("+(rsmd.getColumnTypeName(i))+")");
   }
   System.out.println("");
   
   // 결과 출력
   while (rs.next()) {
      for (int c = 1; c <= col; c++)
         System.out.printf("%-15s", rs.getString(c));
      System.out.println("");
   }

} catch (SQLException e) {
   e.printStackTrace();
} finally {
   DBUtilForJNDI.dbClose(rs, st, conn);
}
%>
</body>
</html>