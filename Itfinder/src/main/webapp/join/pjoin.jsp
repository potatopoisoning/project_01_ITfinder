<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/include/head.jsp" %>
<script>
//아이디 중복 여부 체크용
var IsDuplicate = false;

 window.onload = function()
 {
	 $("#uid").focus();
	 
	 $("#uid").keyup(function(){
		 IsDuplicate = false;
		 
		 userid = $(this).val();
		 if( userid == "" )
		{
			$("#spanMsg").html("아이디를 입력하세요.");
			return;
		}
		 $.ajax({
	 		type : "get",
	 		url : "idcheck.jsp?uid=" + userid,
	 		dataType : "html",
	 		success : function(result)
	 		{
	 			result = result.trim();
	 			//$("#spanMsg").html(result);
	 			switch(result)
	 			{
	 			case "00":
	 				$("#spanMsg").html("아이디 체크 오류입니다.");
	 				$("#spanMsg").css("color","green");
	 				break;
	 			case "01":
	 				$("#spanMsg").html("중복된 아이디입니다.");
	 				$("#spanMsg").css("color","red");
	 				IsDuplicate = true;
	 				break;
	 			case "02":
	 				$("#spanMsg").html("사용 가능한 아이디입니다.");
	 				$("#spanMsg").css("color","blue");
	 				break;	 			 				
	 			}
	 		}
		});		 		 
	 });
 }
 
 //회원가입 처리
 function DoJoin()
 {
	if($("#uid").val() == "")
	{
		alert("아이디를 입력하세요.");
		$("#uid").focus();
		return;
	}
	if(IsDuplicate == true)
	{
		alert("중복된 아이디입니다. 새로운 아이디를 입력하세요.");
		$("#uid").focus();
		return;
	}
	if($("#upw").val() == "")
	{
		alert("비밀번호를 입력하세요.");
		$("#upw").focus();
		return;
	}
	if($("#upw").val() != $("#upwcheck").val())
	{
		alert("비밀번호가 일치하지 않습니다.");
		$("#upwcheck").focus();
		return;
	}
	if($("#uname").val() == "")
	{
		alert("이름을 입력하세요.");
		$("#uname").focus();
		return;
	}
	if($("#sign").val() == "")
	{
		alert("가입방지코드를 입력하세요.");
		$("#sign").focus();
		return;
	}
	if( $('input:checkbox[id="agreeterm"]').is(":checked") == false )
	{
		$("#agreeterm").focus();
		alert("개인회원 약관에 동의하세요.");
		return;
	}	
	if( $('input:checkbox[id="agreeinfo"]').is(":checked") == false )
	{
		$("#agreeinfo").focus();
		alert("개인정보 수집 및 이용에 동의하세요.");
		return;
	}	
	
	 $.ajax({
	 		type : "get",
	 		url : "getsign.jsp",
	 		dataType : "html",
	 		success : function(result)
	 		{
	 			result = result.trim();
	 			if($("#sign").val() == result)
	 			{
	 				if(confirm("회원가입을 진행하시겠습니까?") == 1)
	 				{
	 					$("#pjoin").submit();
	 				}
	 			}else
	 			{
	 				alert("가입방지코드가 일치하지 않습니다.");
	 				$("#sign").focus();
	 			}		 			
	 		}
		});		 		 
 }
 
 //취소
 function DoCancel()
 {
	if(confirm("회원가입을 취소하시겠습니까?") == true)
	{
		document.location = "/TPJ6/index/index.jsp";
	}	 
 }
</script>
<!-- }} ----------------------------------------  컨텐츠 시작 영역 -->
  <br>
<table class="tbl">
	<tr>
		<td>
			<form id="pjoin" name="pjoin" method="post" action="pjoinok.jsp">
			<table border="0" style="width:70%;">
				<tr>
					<td style="height:40px">
						<span style="font-weight:bold;font-size: 30px;">개인회원가입</span>
					</td>
				</tr>																		
			</table>
			<table border="1" style="width:100%; border-collapse:collapse;text-align:center;" >
				<tr height="40px">
					<td style="width:200px; background-color:lightgray;text-align:center;">아이디</td>
					<td><input type="text" id="uid" name="uid" placeholder="아이디를 입력하세요 (!@#$등 특수문자 제외)" style="width:98%;height:35px;">
					<span id="spanMsg">아이디를 입력하세요.</span>
					</td>
				</tr>
				<tr>
					<td style="background-color: lightgray;text-align:center;">비밀번호</td>
					<td><input type="password" id="upw" name="upw" placeholder="비밀번호를 입력하세요." style="width:98%;height:35px;"></td>
				</tr>
				<tr>
					<td style="background-color: lightgray;text-align:center;">비밀번호 확인</td>
					<td><input type="password" id="upwcheck" name="upwcheck" placeholder="비밀번호를 다시 입력하세요." style="width:98%;height:35px;"></td>
				</tr>			
				<tr>
					<td style="background-color: lightgray;text-align:center;">이름</td>
					<td><input type="text" id="uname" name="uname" placeholder="이름을 입력하세요." style="width:98%;height:35px;"></td>
				</tr>		
				<tr>
					<td style="background-color: lightgray;text-align:center;">생년월일</td>
					<td><input type="text" id="ubirth" name="ubirth" placeholder="생년월일을 입력하세요." style="width:98%;height:35px;"></td>
				</tr>		
				<tr>
					<td style="background-color: lightgray;text-align:center;">연락처</td>
					<td><input type="text" id="uphone" name="uphone" placeholder="연락처를 입력하세요. (-제외)" style="width:98%;height:35px;"></td>
				</tr>
				<tr>
					<td style="background-color: lightgray;text-align:center;">이메일</td>
					<td>
						<input type="text" id="uemail" name="uemail" placeholder="이메일을 입력하세요." style="width:98%;height:35px;">
					</td>
				</tr>
				<tr>
					<td style="background-color: lightgray;text-align:center;">가입방지코드</td>
					<td>
						<input type="text" id="sign" name="sign" size="6" style="width:60%;height:35px;">
						<img src="img.jsp" style="width:200px;height:35px; vertical-align : bottom">
					</td>
				</tr>		
				<tr>
					<td colspan="2">
						<input type="checkbox" value="1" id="agreeterm" name="agreeterm">(필수)개인회원 약관에 동의<br>	<br>		
						<input type="checkbox" value="2" id="agreeinfo" name="agreeinfo">(필수)개인정보 수집 및 이용에 동의<br><br>			
						<input type="checkbox" value="3" id="agreemarket" name="agreemarket">(선택)마케팅 정보 수신 동의-이메일<br>			
					</td>
				</tr>																															
			</table>
			</form>
		</td>
	</tr>
</table>
<table class="tbl">
	<tr>
		<td align="center" style="padding:0 0 0 110px;">
			<input type="button" style="width:100px;height:40px;" onclick="DoJoin();" value="가입완료">		
			&nbsp;
			<input type="button" style="width:100px;height:40px;" onclick="DoCancel();" value="취소">			
		</td>						
	</tr>	
</table>
<br>
<!-- }} ----------------------------------------  컨텐츠 종료 영역 -->
<%@ include file="/include/tail.jsp" %>