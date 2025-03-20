<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/include/head.jsp" %>
<link rel="stylesheet" href="/TPJ6/css/star.css"/>
<% 

if(login == null || login.getUkind().equals("C"))
{
	out.println("<script>alert('작성권한이 없습니다.'); location.href='/TPJ6/community/review/list.jsp';</script>");
	return;
}

%>
<script>
window.onload = function()
{
 $("#rvcompanyname").focus();	
}

function DoWrite()
{
	if($("#rvcompanyname").val() == "")
	{
		$("#rvcompanyname").focus();
		alert("회사명을 입력하세요.");
		return;
	}
	if($("#rvcomment").val() == "")
	{ 
		$("#rvcomment").focus();
		alert("기업한줄평을 입력하세요.");		
		return;
	}
	if($("#rvgood").val() == "")
	{
		$("#rvgood").focus();
		alert("기업의 장점을 입력하세요.");		
		return;
	}
	if($("#rvbad").val() == "")
	{
		$("#rvbad").focus();
		alert("기업의 단점을 입력하세요.");		
		return;
	}
	if(confirm("기업리뷰를 등록하시겠습니까?") == false)
	{
		return;
	}
	$("#write").submit();
}


</script>
<!--------------------------------------------  컨텐츠 시작 영역 -->
<br>
<table class="tbl">
	<form id="write" name="write" method="post" action="writeok.jsp">
		<tr>
			<td style="height:40px">
				<span style="font-weight:bold;font-size: 30px;">기업리뷰 등록</span>
			</td>
		</tr>																		
	<table border="1" class="tbl">
		<tr height="40px">
			<td style="width:200px; background-color:lightgray;text-align:center;">회사명</td>
			<td align="left" style="padding:0 0 0 10px;">									
				<select id="rvcompanyname" name="rvcompanyname" style="width : 150px; height : 25px; ">
				<%	
					UserDTO udto = new UserDTO();
					ArrayList<Map<String,String>> list = udto.GetList(login.getUno());
					System.out.println(list.size());
					for(Map<String,String> uvo : list)
					{
						System.out.println("uno"+uvo.get("uno"));
						System.out.println("uname"+uvo.get("uname"));
						System.out.println("ukind"+uvo.get("ukind"));
						System.out.println("pname"+uvo.get("pname"));
						System.out.println("done"+uvo.get("done"));
						if(uvo.get("done").equals("0"))
						{
						%>	
							<option value="<%= uvo.get("uno") %>:<%= uvo.get("uname") %>"><%= uvo.get("uname") %></option>
						<%
						}
					}
					%>
				</select>	
			</td>
		</tr>	
		<tr>
			<td style="background-color: lightgray;text-align:center;">회사 평가하기</td>
			<td align="center" style="padding:0 0 10px 10px;">
				 <div>
			        총점
			        <div class="star-rating" id="rvtotal">
			            <input id="total5" name="rvtotal" type="radio" value="5"/><label for="total5">★</label>
			            <input id="total4" name="rvtotal" type="radio" value="4"/><label for="total4">★</label>
			            <input id="total3" name="rvtotal" type="radio" value="3"/><label for="total3">★</label>
			            <input id="total2" name="rvtotal" type="radio" value="2"/><label for="total2">★</label>
			            <input id="total1" name="rvtotal" type="radio" value="1"/><label for="total1">★</label>
			        </div>
			    </div>
			    <div>
			        업무와 삶의 균형
			        <div class="star-rating" id="rvbalance">
			            <input id="balance5" name="rvbalance" type="radio" value="5"/><label for="balance5">★</label>
			            <input id="balance4" name="rvbalance" type="radio" value="4"/><label for="balance4">★</label>
			            <input id="balance3" name="rvbalance" type="radio" value="3"/><label for="balance3">★</label>
			            <input id="balance2" name="rvbalance" type="radio" value="2"/><label for="balance2">★</label>
			            <input id="balance1" name="rvbalance" type="radio" value="1"/><label for="balance1">★</label>
			        </div>
			    </div>
			    <div>
			        급여 및 복지
			        <div class="star-rating" id="rvpay">
			            <input id="pay5" name="rvpay" type="radio" value="5"/><label for="pay5">★</label>
			            <input id="pay4" name="rvpay" type="radio" value="4"/><label for="pay4">★</label>
			            <input id="pay3" name="rvpay" type="radio" value="3"/><label for="pay3">★</label>
			            <input id="pay2" name="rvpay" type="radio" value="2"/><label for="pay2">★</label>
			            <input id="pay1" name="rvpay" type="radio" value="1"/><label for="pay1">★</label>
			        </div>
			    </div>
			     <div>
			        사내문화
			        <div class="star-rating" id="rvculture">
			            <input id="culture5" name="rvculture" type="radio" value="5"/><label for="culture5">★</label>
			            <input id="culture4" name="rvculture" type="radio" value="4"/><label for="culture4">★</label>
			            <input id="culture3" name="rvculture" type="radio" value="3"/><label for="culture3">★</label>
			            <input id="culture2" name="rvculture" type="radio" value="2"/><label for="culture2">★</label>
			            <input id="culture1" name="rvculture" type="radio" value="1"/><label for="culture1">★</label>
			        </div>
			    </div>
			</td>
		</tr>		
		<tr>
			<td style="background-color: lightgray;text-align:center;">기업한줄평</td>
			<td style="padding:0 0 0 10px;"><input type="text" id="rvcomment" name="rvcomment" style="width:98%;height:25px;"></td>
		</tr>		
		<tr>
			<td style="background-color: lightgray;text-align:center; height:200px;">기업의 장점</td>
			<td style="padding:0 0 0 10px;"><textarea id="rvgood" name="rvgood" style="width:98%; height:180px;"></textarea></td>
		</tr>
		<tr>
			<td style="background-color: lightgray;text-align:center; height:200px;">기업의 단점</td>
			<td style="padding:0 0 0 10px;"><textarea id="rvbad" name="rvbad" style="width:98%; height:180px;"></textarea></td>
		</tr>								
	</table>
	<table class="tbl" text-align:center;">
		<tr>
			<td align="center"><input type="button" onclick="DoWrite();" value="제출완료" style="width:100px;height:40px;"></td>						
		</tr>	
	</table>
	</form>
</table>
<br>
<!--------------------------------------------  컨텐츠 종료 영역 -->
<%@ include file="/include/tail.jsp" %>