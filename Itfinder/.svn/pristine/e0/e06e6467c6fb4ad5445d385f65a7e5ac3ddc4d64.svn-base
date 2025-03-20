<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/include/post_view.jsp" %>
<%
String jno = request.getParameter("no");
String uno = request.getParameter("no");
if(jno == null || jno.equals(""))
{
	response.sendRedirect("/TPJ6/index/index.jsp");
	return;	
}
//게시물 정보를 조회한다.
JobDTO jdto = new JobDTO();
JobVO  vo   = jdto.Read(jno, true);
%>
<!---------------------------------------------  컨텐츠 시작 영역 -->
     <br>
      <table border="0" class="htbl">
		<tr>
			<td style="height:40px">
				<span style="font-weight:bold;font-size: 30px;">채용공고</span>
			</td>
		</tr>																		
	</table >
	<br>
     <table class="tbl">
    	<tr>
    		<td>
    	 		<table class="ttbl" border="1">
			       	<tr>
			       		<th align="left"><%= vo.getUname() %></th>
			       		<td style="color: #777;"><h6>등록일: <%= vo.getJwdate() %>&nbsp;&nbsp;조회수: <%= vo.getJhit() %>회<h6></td>
			        </tr>
			        <tr>
			        	<th align="left"><h2><%= vo.getJtitle() %></h2></th>
			       		<td>
			       			<input type="button" onclick="window.location.href='/TPJ6/mypage/list.jsp?jno=<%= jno %>'"  style="width:100px;height:40px;align:right;" value="입사지원">
			       		</td>
			        </tr>
      			</table>
    		 </td>
		</tr>   
     	<tr>
     		<td>
     			<table class="itbl">
     				<tr>
     					<th>채용유형</th>
     					<td><%= vo.getJkindName() %></td>
     				</tr>
     				<tr>
     					<th>모집기간</th>
     					<td><%= vo.getJperiod1() %>~<%= vo.getJperiod2() %></td>
     				</tr>
     				<tr>
     					<th>모집인원</th>
     					<td><%= vo.getJnumber() %>명</td>
     				</tr>
     				<tr>
     					<th>모집업종</th>
     					<td><%= vo.getJtypeName() %></td>
     				</tr>
     				<tr>
     					<th>직무내용</th>
     					<td>
     						<%= vo.getJnote() %>
						</td>
     				</tr>
     				<tr>
     					<th>근무시간 및 요일</th>
     					<td><%= vo.getJhour() %></td>
     				</tr>
     				<tr>
     					<th>근무지역</th>
     					<td><%= vo.getJregionName() %></td>
     				</tr>
     				<tr>
     					<th>급여</th>
     					<td><%= vo.getJpay() %></td>
     				</tr>
     				<tr>
     					<th>학력</th>
     					<td><%= vo.getJeducationName() %>
     					<%
     					if(vo.getJeducation2() != null)
     					{
     							%><span style="color: #777;"><%= vo.getJeducation2Name() %></span><%
     					}	
     					%>
     					</td>
     				</tr>
     				<tr>
     					<th>경력</th>
     					<td><%= vo.getJcareerName() %></td>
     				</tr>
     				<tr>
     					<th>복리후생</th>
     					<td><% 
     					BenefitDTO bdto = new BenefitDTO();
						ArrayList<BenefitVO> blist = bdto.Read(jno);
						String msg = "";
						for(BenefitVO bvo : blist)
						{
							msg += bvo.getBename() + ","; 
						}
						msg = msg.substring(0, msg.length()-1);
						%>	
							 <%= msg %>
						</td>
     				</tr>
     			</table>
     		</td>
     	</tr>
     	<tr>
     		<td>
     			<table class="ctbl">
     				<tr>
     					<td rowspan="3"><img src="/TPJ6/post/down.jsp?uno=<%= vo.getUno() %>" width="200px" height="80px"></td>
     					<th>대표자명</th>
     					<td><%= vo.getUceo() %></td>
     				</tr>
     				<tr>
     					<th>업종</th>
     					<td><%= vo.getUindustry() %></td>
     				</tr>
     				<tr>
     					<th>기업규모</th>
     					<td><%= vo.getUsize() %></td>
     				</tr>
     				<tr>
     					<th rowspan="2"><h2><%= vo.getUname() %></h2></th>
     					<th>설립일</th>
     					<td><%= vo.getUbirth() %></td>
     				</tr>
     				<tr>
     					<td colspan="2"><a href="/TPJ6/community/review/list.jsp?rvcompanyname=<%= vo.getUname() %>"><button style="width:100px;height:40px;">기업리뷰</button></a></td>
    				</tr>
    			</table>
    		</td>
    	</tr>
    	<tr>
    	<td>
			<input type="button" style="width:100px;height:40px;" onclick="window.location.href='/TPJ6/post/list.jsp';" value="목록">
    	</td>
    	</tr>
    </table>
    <br>
<!---------------------------------------------  컨텐츠 종료 영역 -->
<%@ include file="/include/tail.jsp" %>