<%@page import="com.baseballtalk.model.HitterStatDAO"%>
<%@page import="com.baseballtalk.model.HitterStatDTO"%>
<%@page import="com.baseballtalk.model.PlayerDTO"%>
<%@page import="com.baseballtalk.model.PlayerDAO"%>
<%@page import="com.baseballtalk.model.ManagerDAO"%>
<%@page import="com.baseballtalk.model.MemberDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>타자 기록</title>
	<link href="./css/Total.css" rel="stylesheet" type="text/css">
</head>
<body>
<% List<PlayerDTO> showHitter_info = new PlayerDAO().showHitter_info();%>
<% List<HitterStatDTO> showHitter_stat = new HitterStatDAO().showHitterStat(); %>
	<%@ include file = "header.jsp" %>
	<div id="total">
		<h4>타자 기록</h4>
		<div id="stat_con">
			<table id="p_info">
				<tr>
					<td>순위</td>
					<td>선수명</td>
					<td>소속팀</td>
					<td>포지션</td>
				</tr>
				<%int i = 0;%>
				<%for(PlayerDTO p : showHitter_info){i++;%>
				<tr>
					<td><%=i%></td>
					<td><%=p.getPlayer_name()%></td>
					<td><%=p.getTeam_name()%></td>
					<td><%=p.getPlayer_position()%></td>
					
				</tr>
				<%} %>
			</table>
			<table id="p_stat">
				<tr>
					<td>승리기여도(WAR)</td>
					<td>경기 출전 수</td>
					<td>타율</td>
					<td>홈런</td>
					<td>장타율</td>
					<td>출루율</td>
					<td>도루</td>
					<td>타점</td>
					<td>OPS(장타율+출루율)</td>
				</tr>
				<%for(HitterStatDTO ht : showHitter_stat){%>
				<tr>
					<td><%=ht.getWar()%></td>
					<td><%=ht.getGame_played()%></td>
					<td><%=ht.getAvg()%></td>
					<td><%=ht.getHomerun() %></td>
					<td><%=ht.getSlg() %></td>
					<td><%=ht.getObp() %></td>
					<td><%=ht.getStealbase() %></td>
					<td><%=ht.getRbi() %></td>
					<td><%=ht.getOps() %></td>
				</tr>
				<%} %>
			</table>
	</div>
	</div>
</body>
</html>