<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/include/head.jsp" %>
<script>
//아이디 중복 여부 체크용
var IsDuplicate = false;
var IsDuplicate2 = false;

 window.onload = function()
 {
	 $("#ulicensenum").focus();
	 
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
	 
	 $("#uname").keyup(function(){
		 IsDuplicate2 = false;
		 
		 uname = $(this).val();
		 if( uname == "" )
		{
			$("#spanMsg2").html("기업명을 입력하세요.");
			return;
		}
		 $.ajax({
	 		type : "get",
	 		url : "cnamecheck.jsp?uname=" + uname,
	 		dataType : "html",
	 		success : function(result)
	 		{
	 			result = result.trim();
	 			//$("#spanMsg").html(result);
	 			switch(result)
	 			{
	 			case "00":
	 				$("#spanMsg2").html("기업명 체크 오류입니다.");
	 				$("#spanMsg2").css("color","green");
	 				break;
	 			case "01":
	 				$("#spanMsg2").html("중복된 기업명입니다.");
	 				$("#spanMsg2").css("color","red");
	 				IsDuplicate2 = true;
	 				break;
	 			case "02":
	 				$("#spanMsg2").html("사용 가능한 기업명입니다.");
	 				$("#spanMsg2").css("color","blue");
	 				break;	 			 				
	 			}
	 		}
		});		 		 
	 });
 }

 
// 회원가입 처리
function DoJoin()
{
	if($("#ulicensenum").val() == "")
	{
		alert("사업자등록번호를 입력하세요");
		$("#ulicensenum").focus();
		return;
	}
	var fileCheck = document.getElementById("pname").value;

	if(!fileCheck)
	{
		alert("파일을 첨부해 주세요");
		$("#pname").focus();
		return;

	}
	if($("#uid").val() == "")
	{
		alert("아이디를 입력하세요");
		$("#uid").focus();
		return;
	}
	if( IsDuplicate == true)
	{
		alert("중복된 아이디 입니다. 새로운 아이디를 입력하세요.");
		$("#uid").focus();
		return;
	}
	if($("#upw").val() == "")
	{
		alert("비밀번호를 입력하세요");
		$("#upw").focus();
		return;
	}
	if($("#upwcheck").val() != $("#upw").val())
	{
		alert("비밀번호가 올바르지 않습니다");
		$("#upwcheck").focus();
		return;
	}
	if($("#uname").val() == "")
	{
		alert("기업명을 입력하세요");
		$("#uname").focus();
		return;
	}
		if( IsDuplicate2 == true)
	{
		alert("중복된 기업명 입니다. 새로운 기업명을 입력하세요.");
		$("#uname").focus();
		return;
	}
	
	if($("#uceo").val() == "")
	{
		alert("대표자명을 입력하세요");
		$("#uceo").focus();
		return;
	}
	if($("#ubirth").val() == "")
	{
		alert("설립일을 입력하세요");
		$("#ubirth").focus();
		return;
	}
	if($("#uindustry").val() == "")
	{
		alert("기업업종을 입력하세요");
		$("#uindustry").focus();
		return;
	}
	if($("#usize").val() == "")
	{
		alert("기업규모를 입력하세요");
		$("#usize").focus();
		return;
	}
	if($("#uphone").val() == "")
	{
		alert("연락처를 입력하세요");
		$("#uphone").focus();
		return;
	}
	if($("#sign").val() == "")
	{
		alert("가입방지 문자를 입력하세요");
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
	 					alert("회원가입이 완료되었습니다.");
	 					$("#cjoin").submit();
	 				}
	 			}else
	 			{
	 				alert("가입방지코드가 일치하지 않습니다.");
	 				$("#sign").focus();
	 			}		 			
	 		}
		});
	 
	 
}

// 취소
function DoCancel()
{
	if(confirm("취소하시겠습니까?") == true)
	{
		document.location = "/TPJ6/index/index.jsp";
	}
}

</script>
<!--------------------------------------------  컨텐츠 시작 영역 -->
<br>
<table class="tbl">
	<tr>
		<td>
			<form id="cjoin" name="cjoin" method="post" enctype="multipart/form-data" action="cjoinok.jsp">
			<table border="0" style="width:70%;">
				<tr>
					<td style="height:40px">
						<span style="font-weight:bold;font-size: 30px;">기업회원가입</span>
					</td>
				</tr>																		
			</table>
			<table border="1" style="width:100%; border-collapse:collapse;text-align:center;" >
				<tr height="40px">
					<td style="width:200px; background-color:lightgray;text-align:center;">사업자등록번호</td>
					<td><input type="text" name="ulicensenum" id="ulicensenum" placeholder="'-'빼고 숫자만 입력하세요." style="width:98%;height:35px;"></td>
				</tr>
				<tr height="40px" >
					<td rowspan="2" style="width:130px; background-color:lightgray;text-align:center;">기업 로고</td>
					<td>기업 로고를 첨부해주세요.</td>
				</tr>
				<tr>
					<td><input type="file" name="pname" id="pname" style="width:98%;height:35px;"></td>
				</tr>
				<tr height="40px">
					<td style="width:130px; background-color:lightgray;text-align:center;">아이디</td>
					<td><input type="text" name="uid" id="uid" placeholder="아이디를 입력하세요 (!@#$등 특수문자 제외)" style="width:98%;height:35px;">
					<span id="spanMsg">아이디를 입력하세요.</span>
					</td>
				</tr>
				<tr>
					<td style="background-color: lightgray;text-align:center;">비밀번호</td>
					<td><input type="password" name="upw" id="upw" placeholder="비밀번호를 입력하세요." style="width:98%;height:35px;"></td>
				</tr>
				<tr>
					<td style="background-color: lightgray;text-align:center;">비밀번호 확인</td>
					<td><input type="password" name="upwcheck" id="upwcheck" placeholder="비밀번호를 다시 입력하세요." style="width:98%;height:35px;"></td>
				</tr>			
				<tr>
					<td style="background-color: lightgray;text-align:center;">기업명</td>
					<td><input type="text" name="uname" id="uname" placeholder="기업명을 입력하세요." style="width:98%;height:35px;">
					<span id="spanMsg2">기업명을 입력하세요.</span>
					</td>
				</tr>		
				<tr>
					<td style="background-color: lightgray;text-align:center;">대표자명</td>
					<td><input type="text" name="uceo" id="uceo" placeholder="대표자명을 입력하세요." style="width:98%;height:35px;"></td>
				</tr>		
				<tr>
					<td style="background-color: lightgray;text-align:center;">설립일</td>
					<td><input type="text" name="ubirth" id="ubirth" placeholder="기업 설립일을 입력하세요." style="width:98%;height:35px;"></td>
				</tr>		
				<tr>
					<td style="background-color: lightgray;text-align:center;">기업업종</td>
					<td><input type="text" name="uindustry" id="uindustry" placeholder="기업업종을 입력하세요." style="width:98%;height:35px;"></td>
				</tr>		
				<tr>
					<td style="background-color: lightgray;text-align:center;">기업규모</td>
					<td><input type="text" name="usize" id="usize" placeholder="기업규모를 입력하세요." style="width:98%;height:35px;"></td>
				</tr>		
				<tr>
					<td style="background-color: lightgray;text-align:center;">연락처</td>
					<td><input type="text" name="uphone" id="uphone" placeholder="연락처를 입력하세요. (-제외)" style="width:98%;height:35px;"></td>
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
						<input type="checkbox" value="1" name="agreeterm" id="agreeterm">(필수)개인회원 약관에 동의<br><br>		
						<input type="checkbox" value="2" name="agreeinfo" id="agreeinfo">(필수)개인정보 수집 및 이용에 동의<br><br>			
						<input type="checkbox" value="3" name="agreemarket" id="agreemarket">(선택)마케팅 정보 수신 동의-이메일<br>			
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