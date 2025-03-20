<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/include/head.jsp" %>
<!-- }} ----------------------------------------  컨텐츠 시작 영역 -->
<br>
<script>
window.onload = function()
{
	 $("#uid").focus();
	 
	 $("#btnLogin").click(function(){
		 DoLogin();
	 });
	 
	 $("#uid,#upw").keyup(function(event){
		if(event.keyCode == 13)
		{
			//Enter문자가 눌러짐.
			DoLogin();
		}		 
	 });
	// 실제 구현시 삭제==========================================================================================
	/* document.login.uid.value = "ptest1";
	document.login.upw.value = "ptest1"; */
}

function DoLogin()
{
	
	if($("#uid").val() == "")
	{
		alert("아이디를 입력하세요.");
		$("#uid").focus();
		return;
	}
	if($("#upw").val() == "")
	{
		alert("비밀번호를 입력하세요.");
		$("#upw").focus();
		return;
	}
	 $.ajax({
 		type : "post",
 		url : "loginok.jsp",
 		data :
 		{
 			uid : $("#uid").val(),
 			upw : $("#upw").val()
 		},
 		dataType : "html",
 		success : function(result)
 		{
 			result = result.trim();
 			switch(result)	
 			{
 			case "ERROR":
 				alert("아이디 또는 비밀번호가 일치하지 않습니다.");
 				$("#uid").focus();
 				break;
 			case "OK":
 				alert("로그인이 되었습니다..");
 				document.location = "/TPJ6/index/index.jsp";
 				break;	
 			}
 		}
	});		 	
	
}	
</script>
<table class="tbl">
	<tr>
		<td>
			<form name="login" method="post" action="loginok.jsp">
			<table style="width:80%;text-align:center;">		
				<tr>
					<td>
						<i class="fa-solid fa-lock"></i>
						<span style="font-size:30px; font-weight: bold;">로그인</span>
					</td>			
				</tr>
				<tr>
					<td style="text-align:center;">
						<input type="text" id="uid" name="uid" placeholder="&nbsp;아이디를 입력하세요." style="width:350px;height:40px;">
					</td>
				</tr>
				<tr>
					<td style="text-align:center;">
						<input type="password" id="upw" name="upw" placeholder="&nbsp;비밀번호를 입력하세요." style="width:350px;height:40px;">
					</td>
				</tr>
				<tr>
					<td colspan="2" style="text-align:center;">
						<input type="button" id="btnLogin" value="로그인" style="width:350px; height: 40px;font-size: 20px;">
					</td>
				</tr>
				<tr>
					<td height="30px">
						<h3>아직 회원이 아니신가요?<a href="/TPJ6/join/join.jsp" style="color:black">&nbsp;<span style="text-decoration : underline;">회원가입</span></a></h3>
					</td>								
				</tr>
			</table>						
			</form>			
		</td>
	</tr>
</table>
<br>
<!-- }} ----------------------------------------  컨텐츠 종료 영역 -->
<%@ include file="/include/tail.jsp" %>