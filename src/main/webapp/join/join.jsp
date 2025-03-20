<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/include/head.jsp" %>
<!-- }} ----------------------------------------  컨텐츠 시작 영역 -->
   <br>
<table class="tbl">
		<tr>
			<td>
				<table border="0" style="width:70%">
					<tr>
						<td style="text-align:center;">
							<i class="fa-solid fa-user"></i>
							<span style="font-size:30px; font-weight: bold;">회원가입</span>
						</td>			
					</tr>
				</table>
				<table border="1" style="width:70%;height:400px;text-align:center; border-collapse:collapse;">
				<tr>
					<td>
						<img src="/TPJ6/image/person.jpg" border="1" style="height:200px; width:200px; border-radius:70%;"><br><br>
						<input type="button" value="개인회원 가입" onclick="window.location.href='/TPJ6/join/pjoin.jsp';"
						style="width:280px; height: 40px;font-size: 20px;font-weight:bold;">
					</td>
					<td>
						<img src="/TPJ6/image/company.jpg" border="1" style="height:200px; width:200px; border-radius:70%;"><br><br>
						<input type="button" value="기업회원 가입" onclick="window.location.href='/TPJ6/join/cjoin.jsp';"
						style="width:280px; height: 40px;font-size: 20px;font-weight:bold;">
					</td>						
				</tr>
				<table border="0" style="width:70%">
				<br>
					<tr>
						<td style="text-align:center;"><h3>이미 계정이 있나요?<a href="/TPJ6/login/login.jsp">&nbsp;<span style="text-decoration : underline;">로그인</span></h3></a></td>						
					</tr>
			</table>
			</table>
		</td>
	</tr>
</table>
<br>
<!-- }} ----------------------------------------  컨텐츠 종료 영역 -->
<%@ include file="/include/tail.jsp" %>