<%@page import="itfinder.vo.UserVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/include/head.jsp" %>
<%
//System.out.println("login 정보 " + login.getUno());
// uno로 회원정보 조회
// dto생성-> dto.Read(회원번호)-> vo에 할당
if(login == null || login.getUkind().equals("C"))
{
	out.println("<script>alert('작성 권한이 없습니다.'); location.href='/TPJ6/index/index.jsp';</script>");
	return;
}

UserDTO udto = new UserDTO();
UserVO uvo = udto.Read(login.getUno());


ResumeDTO rdto = new ResumeDTO();
ResumeVO rvo = rdto.ReRead(login.getUno());

%>
<script src="/TPJ6/js/jquery-3.7.1.js"></script>
<script>
window.onload = function()
{
	$("#retitle").focus();
}

function DoWrite()
{
	if ($("#retitle").val() == "")
	{
		alert("이력서제목을 입력하세요");
		$("#retitle").focus();
		return;
	}
	if ($("#rename").val() == "")
	{
		alert("성명을 입력하세요");
		$("#rename").focus();
		return;
	}
	if ($("#uphone").val() == "")
	{
		alert("연락처를 입력하세요");
		$("#uphone").focus();
		return;
	}
	if ($("#uemail").val() == "")
	{
		alert("이메일을 입력하세요");
		$("#uemail").focus();
		return;
	}
	if ($("#reeducation").val() == "")
	{
		alert("학력을 입력하세요");
		$("#reeducation").focus();
		return;
	}
	if ($("#rescore").val() == "")
	{
		alert("학점을 입력하세요");
		$("#rescore").focus();
		return;
	}
	if ($("#reschoolname").val() == "")
	{
		alert("학교명을 입력하세요");
		$("#reschoolname").focus();
		return;
	}
	if ($("#remajor").val() == "")
	{
		alert("전공을 입력하세요");
		$("#remajor").focus();
		return;
	}
	if ($("#regraduation").val() == "")
	{
		alert("졸업일자를 입력하세요");
		$("#regraduation").focus();
		return;
	}
	/* if ($("#recompanyname").val() == "")
	{
		alert("회사명을 입력하세요");
		$("#recompanyname").focus();
		return;
	}
	if ($("#retenure").val() == "")
	{
		alert("재직기간을 입력하세요");
		$("#retenure").focus();
		return;
	}
	if ($("#reposition").val() == "")
	{
		alert("직급/직책을 입력하세요");
		$("#reposition").focus();
		return;
	}
	if ($("#restatus").val() == "")
	{
		alert("재직여부를 입력하세요");
		$("#restatus").focus();
		return;
	}
	if ($("#reperformance").val() == "")
	{
		alert("주요성과를 입력하세요");
		$("#reperformance").focus();
		return;
	} */
	if ($("#reself").val() == "")
	{
		alert("자기소개서를 입력하세요");
		$("#reself").focus();
		return;
	}
	
	if (confirm ("이력서를 등록하시겠습니까?") == false)
	{
		return;
	}
	$("#mypage").submit();
}

//취소
function DoCancel()
{
	if(confirm("취소하시겠습니까?") == true)
	{
		document.location = "../index/index.jsp";
	}
}

</script>
<!-------------------------------------------  컨텐츠 시작 영역 -->
<br>
<table class="tbl">
	<form name="mypage" id="mypage" method="post" action="writeok.jsp">
		<tr>
			<td style="height:40px">
				<span style="font-weight:bold;font-size: 30px;">이력서 등록</span>
			</td>
		</tr>
		<br>
		<table class="tbl">
			<tr>
				<td>
					<p><h4>인적사항</h4></p>
				</td>
			</tr>
		</table>																		
		<table border="1" class="tbl" >
			<tr height="30px">
				<td style="width:200px; background-color:lightgray;text-align:center;">이력서 제목</td>
				<td style="padding:0 0 0 10px;"><input type="text" name="retitle" id="retitle" style="width:60%;height:25px;" placeholder="이력서 제목을 입력하세요"></td>
			</tr>
			<tr height="30px">
				<td style="width:200px; background-color:lightgray;text-align:center;">성명</td>
				<td style="padding:0 0 0 10px;"><input type="text" name="rename" id="rename" style="width:60%;height:25px;" value="<%= uvo.getUname() %>" readonly></td>
			</tr>
			<tr height="30px">
				<td style="width:200px; background-color:lightgray;text-align:center;">연락처</td>
				<td style="padding:0 0 0 10px;"><input type="text" name="uphone" id="uphone" style="width:60%;height:25px;" value="<%= uvo.getUphone() %>" readonly></td>
			</tr>
			<tr height="30px">
				<td style="width:200px; background-color:lightgray;text-align:center;">이메일</td>
				<td style="padding:0 0 0 10px;"><input type="text" name="uemail" id="uemail" style="width:60%;height:25px;" value="<%= uvo.getUemail() %>" readonly></td>
			</tr>
		</table>
		<table class="tbl">
			<tr>
				<td>
					<p><h4>학력사항</h4></p>
				</td>
			</tr>
		</table>
		<table border="1" class="tbl" >
			<tr height="30px">
				<td style="width:200px; background-color:lightgray;text-align:center;">학력</td>
				<td style="padding:0 0 0 10px;"><input type="text" name="reeducation" id="reeducation" style="width:60%;height:25px;" placeholder="최종학력을 입력하세요"></td>
			</tr>
			<tr height="30px">
				<td style="width:200px; background-color:lightgray;text-align:center;">학점</td>
				<td style="padding:0 0 0 10px;"><input type="text" name="rescore" id="rescore" style="width:60%;height:25px;" placeholder="학업성적은 평균학점/만점으로 작성하세요"></td>
			</tr>
			<tr height="30px">
				<td style="width:200px; background-color:lightgray;text-align:center;">학교명</td>
				<td style="padding:0 0 0 10px;"><input type="text" name="reschoolname" id="reschoolname" style="width:60%;height:25px;" placeholder="최종 졸업한 학교명을 작성하세요"></td>
			</tr>
			<tr height="30px">
				<td style="width:200px; background-color:lightgray;text-align:center;">전공명</td>
				<td style="padding:0 0 0 10px;"><input type="text" name="remajor" id="remajor" style="width:60%;height:25px;" placeholder="전공명을 입력하세요"></td>
			</tr>
			<tr height="30px">
				<td style="width:200px; background-color:lightgray;text-align:center;">졸업일자</td>
				<td style="padding:0 0 0 10px;"><input type="text" name="regraduation" id="regraduation" style="width:60%;height:25px;" placeholder="졸업일자를 입력하세요 예 : 24-01-01"></td>
			</tr>
		</table>
		<table class="tbl">
			<tr>
				<td>
					<p><h4>경력사항</h4></p>
				</td>
			</tr>
		</table>
		<table border="1" class="tbl">
			<tr height="30px">
				<td style="width:200px; background-color:lightgray;text-align:center;">회사명</td>
				<td style="padding:0 0 0 10px;"><input type="text" name="recompanyname" id="recompanyname" style="width:60%;height:25px;" placeholder="회사명을 입력하세요">&nbsp;중요한 경력사항을 엄선해서 작성하세요</td>
			</tr>
			<tr height="30px">
				<td style="width:200px; background-color:lightgray;text-align:center;">재직기간</td>
				<td style="padding:0 0 0 10px;" ><input type="text" name="retenure" id="retenure" style="width:60%;height:25px;" placeholder="재직기간을 입력하세요 (재직기간은 숫자로만 입력하세요)"></td>
			</tr>
			<tr height="30px">
				<td style="width:200px; background-color:lightgray;text-align:center;">직급/직책</td>
				<td style="padding:0 0 0 10px;"><input type="text" name="reposition" id="reposition" style="width:60%;height:25px;" placeholder="직급 / 직책을 입력하세요"></td>
			</tr>
			<tr height="30px">
				<td style="width:200px; background-color:lightgray;text-align:center;">재직여부</td>
				<td style="padding:0 0 0 10px;"><input type="text" name="restatus" id="restatus" style="width:60%;height:25px;" placeholder="재직여부를 입력하세요 (재직여부는 재직 / 퇴사 / 휴직으로만 작성하세요)"></td>
			</tr>
			<tr height="30px">
				<td style="width:200px; background-color:lightgray;text-align:center;">주요성과</td>
				<td style="padding:0 0 0 10px;"><input type="text" name="reperformance" id="reperformance" style="width:60%;height:25px;" placeholder="주요성과를 입력하세요"></td>
			</tr>
		</table>
		<table class="tbl">
			<tr>
				<td>
					<p><h4>자기소개서</h4></p>
				</td>
			</tr>
		</table>
		<table class="tbl">
			<tr>
				<td>
					<textarea style="width:100%; height:200px;" name="reself" id="reself" ></textarea>
				</td>
			</tr>
		</table>
		<table border="0" style="width:80%;height:100px;text-align:center;">
			<tr>
				<td align="center">
				<input type="button" style="width:100px;height:40px;" onclick="DoCancel();" value="취소">
				&nbsp;
				<input type="button" onclick="DoWrite();" value="등록" style="width:100px;height:40px;">
				</td>						
			</tr>	
		</table>
	</form>
</table>
<br>
<!---------------------------------------------  컨텐츠 종료 영역 -->
<%@ include file="/include/tail.jsp" %>