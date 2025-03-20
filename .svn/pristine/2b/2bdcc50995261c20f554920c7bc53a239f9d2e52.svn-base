<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/include/head.jsp" %>
<% 
/* 로그인 유효성 테스트
if(login == null)
{
	response.sendRedirect("index.jsp");
	return;
}
*/
String bkind = request.getParameter("kind");
if(bkind == null) bkind = "F";
%>
<script>
window.onload = function()
{
 $("$btitle").focus();	
}

function DoWrite()
{
	if($("#btitle").val() == "")
	{
		$("#btitle").focus();
		alert("제목을 입력하세요.");
		return;
	}
	if($("#bnote").val() == "")
	{
		$("#bnote").focus();
		alert("내용을 입력하세요.");		
		return;
	}
	if(confirm("새로운 게시물을 작성하시겠습니까?") == false)
	{
		return;
	}
	$("#write").submit();
}

</script>

<!-- }} ----------------------------------------  컨텐츠 시작 영역 -->
  <br>
<table class="tbl">
	<tr>
		<td>
			<form id="write" name="write" method="post" enctype="multipart/form-data" action="writeok.jsp">
			<table border="0" style="width:80%;">
				<tr>
					<td style="height:40px">
						<span style="font-weight:bold;font-size: 30px;">자유게시판</span>
					</td>
				</tr>																		
			</table >
			<table border="1" style="width:100%; border-collapse: collapse;">
				<tr>
					<td style="width:120px; text-align:center; background-color:lightgray;">제목</td>
					<td>&nbsp;<input type="text" id="btitle" name="btitle" style="width:95%; height:20px;"></td>
				</tr>	
				<tr>
					<td style="width:120px; text-align:center; background-color:lightgray;">구분</td>
					<td>
						&nbsp;<input type="radio" id="bkind" name="bkind" value="R" <%= bkind.equals("R") ? "checked":"" %>>취업뉴스
						&nbsp;<input type="radio" id="bkind" name="bkind" value="N" checked>공지사항
						&nbsp;<input type="radio" id="bkind" name="bkind" value="F">일반게시글
					</td>
				</tr>			
				<tr>
					<td style="width:120px; text-align:center; background-color:lightgray;">내용</td>
					<td>&nbsp;<textarea id="bnote" name="bnote" style="width:95%; height:200px;"></textarea></td>
				</tr>
				<tr>
					<td style="width:120px; text-align:center; background-color:lightgray;">첨부파일</td>
					<td>&nbsp;<input id="fname" name="fname" type="file" style="width:95%"></td>
				</tr>
				
			</table>					
			</form>		
		</td>
	</tr>
	<table class="tbl">
				<tr>
					<td style="text-align:center;" colspan="2">
						<input type="button" onclick="DoWrite();" style="width:100px;height:40px;" value="등록">
					</td>
				</tr>
				</table>
	</table>
	<br>
<!-- }} ----------------------------------------  컨텐츠 종료 영역 -->
<%@ include file="/include/tail.jsp" %>