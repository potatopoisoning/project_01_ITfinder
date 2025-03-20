<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/include/head.jsp" %>
<% 
//로그인이 안되어있거나 개인회원이면 못들어옴
if(login == null || login.getUkind().equals("P"))
{
	out.println("<script>alert('작성 권한이 없습니다.'); location.href='/TPJ6/index/index.jsp';</script>");
	return;
}
%>
<script> 
// 실제 구현시 삭제==========================================================================================
/*
 window.onload = function()
 {

	document.hwrite.jtitle.value = "서버 개발자";
	document.hwrite.jnumber.value = "3";
	document.hwrite.jnote.value = "엔지니어 프론트엔드";
	document.hwrite.jhour.value = "주 5일";
	document.hwrite.jpay.value = "회사 내규에 따름";
	
	$("#jtitle").focus();
 }
 */
 
 
 function DoWrite()
 {
	if( $("#jtitle").val() == "" )
	{
		$("#jtitle").focus();
		alert("제목을 입력하세요.");
		return;
	}
	if( $("#jkind").val() == "kind" )
	{
		$("#jkind").focus();
		alert("채용유형을 선택하세요.");
		return;
	}	
	if( $("#jperiod1").val() == "" )
	{
		$("#jperiod1").focus();
		alert("시작일을 선택하세요.");
		return;
	}	
	if( $("#jperiod2").val() == "" )
	{
		$("#jperiod2").focus();
		alert("마감일을 선택하세요.");
		return;
	}	
	if( $("#jnumber").val() == "" )
	{
		$("#jnumber").focus();
		alert("모집인원을 입력하세요.");
		return;
	}	
/* 	
	if( $("#jtype").val() == "t0" )
	{
		$("#jtype").focus();
		alert("모집업종을 선택하세요.");
		return;
	} */	
	if( $("#jnote").val() == "" )
	{
		$("#jnote").focus();
		alert("직무내용을 입력하세요.");
		return;
	}	
	if( $("#jhour").val() == "" )
	{
		$("#jhour").focus();
		alert("근무시간을 입력하세요.");
		return;
	}	
	if( $("#jregion").val() == "R0" )
	{
		$("#jregion").focus();
		alert("지역을 선택하세요.");
		return;
	}	
	if( $("#jpay").val() == "" )
	{
		$("#jpay").focus();
		alert("급여를 입력하세요.");
		return;
	}	
	if( $('input:checkbox[name="bekind"]').is(":checked") == false )
	{
		$("#bekind").focus();
		alert("복리후생을 선택하세요.");
		return;
	}	
	if(confirm("채용공고를 등록하시겠습니까?") == false)
	{
		return;
	}
	$("#hwrite").submit();
 }

function DoCancel()
{
	if(confirm("취소하시겠습니까?") == true)
	{
		document.location = "/TPJ6/company/list.jsp";
	}
}
 // 없음이 체크되면 다른 항목 체크해제
 function checkUnSelectAll(checkbox) 
{
	
  const checkboxes 
  = document.querySelectorAll("#bekind,#selectall");
  
  checkboxes.forEach((checkbox) => 
  {
		  checkbox.checked = false;
  })

}
 
 function checkSelectAll()  
 {
	  // 전체 체크박스
	  const checkboxes 
	    = document.querySelectorAll('.chbox');
//	    = document.querySelectorAll('input[id="bekind"]');
	  // 선택된 체크박스
	  const checked 
	    = document.querySelectorAll('.chbox:checked');
//	    = document.querySelectorAll('input[id="bekind"]:checked');
	  // select all 체크박스
	  const selectAll 
	    = document.querySelector('.allbox');
	  const unselectAll 
	    = document.querySelector('.nonebox');
	  
	  // 선택된 체크박스가 5개면
	  if(checked.length == 5 )  
	  {
	    selectAll.checked = true;
	    unselectAll.checked = false;
	  }else if(checked.length == 0)  
	  {
		  // 선택된 체크박스가 0개면
		  selectAll.checked = false;
		  unselectAll.checked = true;
	  }/* else if(selectAll.checked = 1)
	  {
		  unselectAll.checked = false;
	  } */else
	  {
		  selectAll.checked = false;
		  unselectAll.checked = false;
	  }
}

function selectAll(selectAll)  
{
	  const checkboxes 
	     = document.querySelectorAll("#bekind");
	  
	  checkboxes.forEach((checkbox) => {
	    checkbox.checked = selectAll.checked
	  })
}

</script>
<!---------------------------------------------  컨텐츠 시작 영역 -->
<br>
<table class="tbl">
	<tr>
		<td style="height:40px">
			<span style="font-weight:bold;font-size: 30px;">채용공고 등록</span>
		</td>
	</tr>
	<form name="hwrite" id="hwrite" method="post" action="writeok.jsp">
	<table border="1" class="tbl">
		<tr>
			<td style="background-color : lightgray; width : 200px; height : 35px; text-align : center;" >채용공고명*</td>
			<td>
				<input type="text" id="jtitle" name="jtitle" style="height : 25px; margin : 10px;" size="100" placeholder="제목을 입력해주세요" >
			</td>					
		</tr>
		<tr>
			<td style="background-color : lightgray; width : 200px; height : 35px; text-align : center;" >채용유형*</td>
			<td>
				<select id="jkind" name="jkind" style="width : 100px; height : 25px; margin : 10px;">
						<option value="kind">구분</option>
						<option value="J">정규직</option>
						<option value="B">비정규직</option>
				</select>
			</td>
		</tr>
		<tr>
			<td style="background-color : lightgray; width : 200px; height : 35px; text-align : center;" >모집기간*</td>
			<td>&nbsp;
				<!-- 크기조절은 CSS만 사용 -->
				<input type="date" id="jperiod1" name="jperiod1">~<input type="date" id="jperiod2" name="jperiod2">
			</td>
		</tr>
		<tr>
			<td style="background-color : lightgray; width : 200px; height : 35px; text-align : center;" >모집인원*</td>
			<td>
				<input type="text" id="jnumber" name="jnumber" style="height : 25px; margin : 10px;" size="30" placeholder="인원을 입력해주세요" >명
			</td>
		</tr>
		<tr>
			<td style="background-color : lightgray; width : 200px; height : 35px; text-align : center;" >모집업종*</td>
			<td>
				<select id="jtype" name="jtype" style="width : 100px; height : 25px; margin : 10px;">
					<option value="t0">모집업종</option>
					<option value="t1">소프트웨어 엔지니어</option>
					<option value="t2">프론트엔드 개발자</option>
					<option value="t3">파이썬 개발자</option>
					<option value="t4">머신러닝 엔지니어</option>
					<option value="t5">웹개발자</option>
					<option value="t6">자바 개발자</option>
					<option value="t7">서버 개발자</option>
					<option value="t8">c,c++ 개발자</option>
					<option value="t9">앱 개발자</option>
				</select>
			</td>	
		</tr>
		<tr>
			<td style="background-color : lightgray; width : 200px; height : 35px; text-align : center;" >직무내용*</td>
			<td>
				<textarea id="jnote" name="jnote" style="width: 95%; height:150px; margin : 10px;" size="50" placeholder="직무내용을 입력해주세요" ></textarea>
			</td>
		</tr>
		<tr>
			<td style="background-color : lightgray; width : 200px; height : 35px; text-align : center;" >근무시간 및 요일*</td>
			<td>
				<input type="text" id="jhour" name="jhour" style="height : 25px; margin : 10px;" size="50" placeholder="근무시간 및 요일을 입력해주세요" >
			</td>
		</tr>
		<tr>
			<td style="background-color : lightgray; width : 200px; height : 35px; text-align : center;" >근무지역*</td>
			<td>
				<select id="jregion" name="jregion" style="width : 100px; height : 25px; margin : 10px;">
					<option value="R0">지역</option>
					<option value="R1">서울</option>
					<option value="R2">경기도</option>
					<option value="R3">강원도</option>
					<option value="R4">충청남도</option>
					<option value="R5">충청북도</option>
					<option value="R6">전라남도</option>
					<option value="R7">전라북도</option>
					<option value="R8">경상남도</option>
					<option value="R9">경상북도</option>
					<option value="R10">제주도</option>
				</select>
			</td>	
		</tr>
		<tr>
			<td style="background-color : lightgray; width : 200px; height : 35px; text-align : center;" >급여*</td>
			<td>
				<input type="text" id="jpay" name="jpay" style="height : 25px; margin : 10px;" size="30" placeholder="급여를 입력해주세요" >
			</td>
		</tr>
		<tr>
			<td style="background-color : lightgray; width : 200px; height : 35px; text-align : center;" >학력*</td>
			<td>
				<select id="jeducation" name="jeducation" style="width : 150px; height : 25px; margin : 10px;">
					<option value="e0">학력 무관</option>
					<option value="e1">고등학교 졸업</option>
					<option value="e2">2년제 대학졸업</option>
					<option value="e3">4년제 대학졸업</option>
					<option value="e4">대학원 졸업</option>
				</select>
				<input value="LC" id="jeducation2" name="jeducation2" type="checkbox">졸업예정자 가능 
			</td>
		</tr>
		<tr>
			<td style="background-color : lightgray; width : 200px; height : 35px; text-align : center;" >경력*</td>
			<td>
				<select id="jcareer" name="jcareer" style="width : 150px; height : 25px; margin : 10px;">
					<option value="c0">경력 무관</option>
					<option value="c1">1년 이상</option>
					<option value="c2">2년 이상</option>
					<option value="c3">3년 이상</option>
					<option value="c4">4년 이상</option>
				</select>
			</td>
		</tr>
		<tr>
			<td style="background-color : lightgray; width : 200px; height : 35px; text-align : center;" >복리후생*</td>
			<td>&nbsp;
				<input value="0:모두선택" type="checkbox" id="selectall" class="allbox" onclick='selectAll(this)'>모두선택
				<input value="1:기숙사" type="checkbox" id="bekind" class="chbox" name="bekind" onclick='checkSelectAll(this)'>기숙사 
				<input value="2:통근버스" type="checkbox" id="bekind" class="chbox" name="bekind" onclick='checkSelectAll(this)'>통근버스 
				<input value="3:차량유지비" type="checkbox" id="bekind" class="chbox" name="bekind" onclick='checkSelectAll(this)'>차량유지비
				<input value="4:식사제공" type="checkbox" id="bekind" class="chbox" name="bekind" onclick='checkSelectAll(this)'>식사제공
				<input value="5:직원대출제도" type="checkbox" id="bekind" class="chbox" name="bekind" onclick='checkSelectAll(this)'>직원대출제도
				<input value="6:없음" type="checkbox" id="bekind1" class="nonebox" name="bekind" onclick='checkUnSelectAll(this)'>없음
			</td>
		</tr>
		<table class="tbl">
			<tr>		<!-- form으로 할건지 버튼으로 할건지 -->
				<td style="width : 200px; height : 35px; text-align : center;" >
					<input type="button" onclick="DoCancel();" style="width : 60px; height : 30px;" value="취소">
					&nbsp;&nbsp;
					<input type="button" onclick="DoWrite();" style="width : 60px; height : 30px;" value="등록">
				</td>
			</tr>
		</table>
	</table>
	</form>
</table>
<br>
<!--------------------------------------------  컨텐츠 종료 영역 -->
<%@ include file="/include/tail.jsp" %>