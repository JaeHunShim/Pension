<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<script>
var msg ="${msg}";
if(msg="false"){
	
	alert("아이디나 비밀번호를 확인해주세요");
	self.location="/user/login";
}	
</script>
</body>
</html>