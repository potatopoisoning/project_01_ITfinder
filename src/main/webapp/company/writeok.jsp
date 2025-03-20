<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/include/head.jsp" %>
<%
request.setCharacterEncoding("utf-8");

String jtitle     = request.getParameter("jtitle");
String jkind      = request.getParameter("jkind");
String jperiod1   = request.getParameter("jperiod1");
String jperiod2   = request.getParameter("jperiod2");
String jnumber    = request.getParameter("jnumber");
String jtype      = request.getParameter("jtype");
String jnote      = request.getParameter("jnote");
String jhour      = request.getParameter("jhour");
String jregion    = request.getParameter("jregion");
String jpay       = request.getParameter("jpay");
String jeducation = request.getParameter("jeducation");
String jeducation2 = request.getParameter("jeducation2");
String jcareer    = request.getParameter("jcareer");
String uno        = request.getParameter("uno");
String bekind[]   = request.getParameterValues("bekind");
String jno        = request.getParameter("no");
String bename     = request.getParameter("bename");

//게시물을 저장한다.
JobVO jvo = new JobVO();
jvo.setJtitle(jtitle);
jvo.setJkind(jkind);
jvo.setJperiod1(jperiod1);
jvo.setJperiod2(jperiod2);
jvo.setJnumber(jnumber);
jvo.setJtype(jtype);
jvo.setJnote(jnote);
jvo.setJhour(jhour);
jvo.setJregion(jregion);
jvo.setJpay(jpay);
jvo.setJeducation(jeducation);
jvo.setJeducation2(jeducation2);
jvo.setJcareer(jcareer);
jvo.setUno(login.getUno());

BenefitVO bvo = new BenefitVO();
bvo.setBename(bename);

JobDTO jdto = new JobDTO();
jdto.Insert(jvo);

BenefitDTO bdto = new BenefitDTO();


if(bekind != null)
{
	for(String v : bekind)
	{
		String[] ary = v.split(":");
		bdto.Insert(ary[0], ary[1], jvo.getJno() );
	}
}
response.sendRedirect("/TPJ6/post/view.jsp?no=" + jvo.getJno());
%>
<!----------------------------------------------  컨텐츠 시작 영역 -->
<!---------------------------------------------  컨텐츠 종료 영역 -->
<%@ include file="/include/tail.jsp" %>