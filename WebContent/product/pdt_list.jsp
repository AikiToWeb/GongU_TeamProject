<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="vo.*" %>
<%
request.setCharacterEncoding("utf-8");

ArrayList<ProductInfo> pdtList = (ArrayList<ProductInfo>)request.getAttribute("pdtList");
ArrayList<PdtCataBig> cataBigList = (ArrayList<PdtCataBig>)request.getAttribute("cataBigList");
ArrayList<PdtCataSmall> cataSmallList = (ArrayList<PdtCataSmall>)request.getAttribute("cataSmallList");
PdtPageInfo pdtPageInfo = (PdtPageInfo)request.getAttribute("pdtPageInfo");

String args = "", schargs = "";
// 검색관련 쿼리스트링 제작
if (pdtPageInfo.getKeyword() != null && !pdtPageInfo.getKeyword().equals(""))	schargs += "&keyword=" + pdtPageInfo.getKeyword();

if (pdtPageInfo.getBcata() != null && !pdtPageInfo.getBcata().equals(""))	schargs += "&bcata=" + pdtPageInfo.getBcata();

if (pdtPageInfo.getScata() != null && !pdtPageInfo.getScata().equals(""))	schargs += "&scata=" + pdtPageInfo.getScata();

if (pdtPageInfo.getSnum() != null && !pdtPageInfo.getSnum().equals(""))	schargs += "&snum=" + pdtPageInfo.getSnum();

if (pdtPageInfo.getEndnum() != null && !pdtPageInfo.getEndnum().equals(""))	schargs += "&endnum=" + pdtPageInfo.getEndnum();

args = "?cpage=" + pdtPageInfo.getCpage() + schargs;
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<style>
.bold { font-weight:bold; }
 a:link { color: black; text-decoration: none;}
 a:visited { color: black; text-decoration: none;}
 a:hover { color: blue; text-decoration: none;}
 .top { padding-top:50px; }
</style>
<script>
<%
String cbid = "", arrName = "";
int k = 0;
for (PdtCataSmall cata : cataSmallList) {
	if (!cbid.equals(cata.getAs_id())) {
	// 이전 대분류와 현재 대분류가 다르면(소분류의 소속 대분류가 변경되었으면 : 다른 소분류 배열을 생성해야 한다는 의미)
		cbid = cata.getAb_id();
		arrName = "arr" + cbid;	// 해당 대분류에 소속된 소분류 목록을 저장할 배열 이름 생성
		out.println("var " + arrName + " = new Array();");	// 소분류 배열 생성
		out.println(arrName + "[0] = new Option(\"\", \"전체 소분류\");");	// 소분류 배열의 첫번째 데이터 생성
		k = 1;	// 배열의 인덱스 번호로 사용할 값을 지정
	}
	out.println(arrName + "[" + k + "] = new Option(\"" + cata.getAs_id() + "\", \"" + cata.getAs_name() + "\");");
	k++;
}
%>

function setCategory(x, target) {
	for (var i = target.options.length - 1 ; i > 0 ; i--)
		target.options[i] = null;

	if (x != "") {
		var arr = eval("arr" + x);
		for (var i = 0 ; i < arr.length ; i++)
			target.options[i] = new Option(arr[i].value, arr[i].text);

		target.options[0].selected = true;
	}
}
</script>
</head>
<body>
<h2>상품 목록</h2>
<div class="wrapper">
	<!-- top -->
	<div class="top" height="auto;">
		<jsp:include page="../top.jsp" />
	</div>
	<div class="main">
		<!-- 상품 검색(대분류, 소분류, 검색어, 브랜드, 가격대) 폼 시작 -->
		<form name="frmSch" method="get">
		<!-- 상품에 대한 검색조건을 선택 및 입력하는 폼(검색조건을 쿼리스트링으로 가지고 다녀야 하므로 전송방식은 get으로 설정) -->
		<input type="hidden" name="sort" value="<%=pdtPageInfo.getSort() %>" />
		<table width="800" cellpadding="5">
		<tr>
		<th width="10%">분류</th>
		<td width="40%">
			<select name="bcata" onchange="setCategory(this.value, this.form.scata);">
				<option value="">전체 대분류</option>
		<% for (PdtCataBig cata : cataBigList) { %>
				<option value="<%=cata.getAb_id() %>" 
				<% if (cata.getAb_id().equals(pdtPageInfo.getBcata())) { %>selected="selected"<% } %>><%=cata.getAb_name() %></option>
		<% } %>
			</select>
			<select name="scata">
				<option value="">전체 소분류</option>
		<%
		if (pdtPageInfo.getBcata() != null && !pdtPageInfo.getBcata().equals("")) {
		// 검색조건으로 대분류가 존재하면 (해당 대분류에 소속된 소분류의 목록을 보여줌)
			for (PdtCataSmall cata : cataSmallList) {
				if (pdtPageInfo.getBcata().equals(cata.getAb_id())) {
				// 검색조건의 대분류와 동일한 대분류를 가진 소분류일 경우
		%>
				<option value="<%=cata.getAs_id() %>"
				<% if (cata.getAs_id().equals(pdtPageInfo.getScata())) { %>selected="selected"<% } %>><%=cata.getAs_name() %></option>
		<%
				}
			}
		}
		%>
			</select>
		</td>
		</tr>
		<tr>
		<th>상품명</th>
		<td><input type="text" name="keyword" value="<%=pdtPageInfo.getKeyword() %>" /></td>
		<th>인원</th>
		<td>
			<input type="text" name="snum" value="<%=pdtPageInfo.getSnum() %>" size="3" />명 ~
			<input type="text" name="endnum" value="<%=pdtPageInfo.getEndnum() %>" size="3" />명
		</td>
		</tr>
		<tr><td colspan="4" align="center" style="border-bottom:1px solid black;">
			<input type="submit" value="상품 검색" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<input type="reset" value="조건 초기화" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<input type="button" value="전체 검색" onclick="location.href='pdt_list.pdt';" /><br />
		</td></tr>
		</table>
		</form>
		<!-- 상품 검색 폼 종료 -->
		
		<p style="width:800px; font-size:80%;" align="right">정렬 조건 :
			<a href="pdt_list.pdt<%=args %>&sort=idd" <%=(pdtPageInfo.getSort().equals("idd") ? "class='bold'" : "") %>>신상품순</a>&nbsp;
			<a href="pdt_list.pdt<%=args %>&sort=salecntd" <%=(pdtPageInfo.getSort().equals("salecntd") ? "class='bold'" : "") %>>판매량수</a>&nbsp;	<!-- 이거 하려면 ProductDao에 salecnt 추가 해야함 -->
			<a href="pdt_list.pdt<%=args %>&sort=mina" <%=(pdtPageInfo.getSort().equals("peoplea") ? "class='bold'" : "") %>>인원 적은순</a>&nbsp;
			<a href="pdt_list.pdt<%=args %>&sort=maxd" <%=(pdtPageInfo.getSort().equals("peopled") ? "class='bold'" : "") %>>인원 많은순</a>&nbsp;
			<a href="pdt_list.pdt<%=args %>&sort=namea" <%=(pdtPageInfo.getSort().equals("namea") ? "class='bold'" : "") %>>상품명순</a>&nbsp;
			<a href="pdt_list.pdt<%=args %>&sort=reviewd" <%=(pdtPageInfo.getSort().equals("reviewd") ? "class='bold'" : "") %>>리뷰순</a>&nbsp;
			<a href="pdt_list.pdt<%=args %>&sort=readcntd" <%=(pdtPageInfo.getSort().equals("readcntd") ? "class='bold'" : "") %>>조회순</a>&nbsp;
			<a href="pdt_list.pdt<%=args %>&sort=scored" <%=(pdtPageInfo.getSort().equals("scored") ? "class='bold'" : "") %>>평점순</a>&nbsp;
		</p>
		
		<!-- 상품 목록 시작 -->
		<table width="800" cellpadding="5">
		<%
		if (pdtList.size() > 0) {
		// 상품 검색결과가 있으면
			for (int i = 0 ; i < pdtList.size() ; i++) {
				ProductInfo pi = pdtList.get(i);
				String lnk = null;
				if (pi.getRi_stock() != 0) {	// 상품의 재고가 남아 있는 경우
					lnk = "<a href=\"pdt_view.pdt" + args + "&piid=" + pi.getRi_id() + 
						"&sort=" + pdtPageInfo.getSort() + "&psize=" + pdtPageInfo.getPsize() + "\">";
				} else {	// 상품의 재고가 없는 품절일 경우
					lnk = "<a href=\"javascript:alert('예약할 수 없는 상품입니다.');\">";
				}
		
				if (pdtPageInfo.getPsize() == 8) {
				// 한 페이지에 12개의 상품 목록을 보여줄 경우(한 줄에 4개 씩 보여주기)
					if (i % 4 == 0)		out.println("<tr align='center'>");
		%>
		<td width="25%">
			<%=lnk %><img src="product/pdt_img/<%=pi.getRi_img1() %>" width="180" height="200" /><br />
			<%=pi.getRi_name() %>&nbsp;(<%=pi.getRi_addr2() %>)</a><br />
			<%=pi.getRi_hash() %><br />
			<%=pi.getRi_price() %> 원
		</td>
		<%
					if (i % 4 == 3)		out.println("</tr>");
		
					if (i == pdtList.size() - 1 && i % 4 != 3) {
					// 현재 출력하는 데이터가 pdtList의 마지막 데이터이면서 4칸을 모두 채우지 못했을 경우
						for (int j = 0 ; j < (4 - 1 - (i % 4)) ; j++)	out.println("<td>&nbsp;</td>");
						out.println("</tr>");
					}
		
				} else {
				// 한 페이지에 10개의 상품 목록을 보여줄 경우(한 줄에 1개 씩 보여주기)
		%>
		<tr>
		<td width="150" align="center"><%=lnk %><img src="product/pdt_img/<%=pi.getRi_img1() %>" width="110" height="130" /></a></td>
		<td width="*"><%=lnk + pi.getRi_name() %></a><br /><%=pi.getRi_hash() %></td>
		<td width="100"><strong><%=pi.getRi_price() %></strong> 원</td>
		</tr>
		<%
				}
			}
		} else {
			out.println("<tr><th>검색된 상품이 없습니다.</th></tr>");
		}
		%>
		</table>
		<!-- 상품 목록 종료 -->
		<%
		if (pdtList.size() > 0) {
		// 상품 검색결과가 있으면 페이지 번호를 출력
			out.println("<p style='width:800px;' align='center'>");
			args = "?sort=" + pdtPageInfo.getSort() + "&psize=" + pdtPageInfo.getPsize() + schargs;
			if (pdtPageInfo.getCpage() == 1) {
				out.println("[&lt;&lt;]&nbsp;&nbsp;[&lt;]&nbsp;&nbsp;");
			} else {
				out.print("<a href='pdt_list.pdt" + args + "&cpage=1'>[&lt;&lt;]</a>&nbsp;&nbsp;");
				out.println("<a href='pdt_list.pdt" + args + "&cpage=" + (pdtPageInfo.getCpage() - 1) + "'>[&lt;]</a>&nbsp;&nbsp;");
			}	// 첫 페이지와 이전 페이지 링크
		
			for (int i = 1, j = pdtPageInfo.getSpage() ; i <= pdtPageInfo.getBsize() && j <= pdtPageInfo.getEpage() ; i++, j++) {
				if (pdtPageInfo.getCpage() == j) {
					out.print("&nbsp;<strong>" + j + "</strong>&nbsp;");
				} else {
					out.print("&nbsp;<a href='pdt_list.pdt" + args + "&cpage=" + j + "'>" + j + "</a>&nbsp;");
				}
			}
		
			if (pdtPageInfo.getCpage() == pdtPageInfo.getPcnt()) {
				out.println("&nbsp;&nbsp;[&gt;]&nbsp;&nbsp;[&gt;&gt;]");
			} else {
				out.print("&nbsp;&nbsp;<a href='pdt_list.pdt" + args + "&cpage=" + (pdtPageInfo.getCpage() + 1) + "'>[&gt;]</a>");
				out.println("&nbsp;&nbsp;<a href='pdt_list.pdt" + args + "&cpage=" + (pdtPageInfo.getPcnt()) + "'>[&gt;&gt;]</a>");
			}
			out.println("</p>");
		}
		%>
	</div>
</div>
</body>
</html>