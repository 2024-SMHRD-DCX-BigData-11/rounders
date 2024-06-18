<%@page import="com.baseballtalk.model.FreeBoardCommentDTO"%>
<%@page import="com.baseballtalk.model.CommentDAO"%>
<%@page import="com.baseballtalk.model.RecoredCommentDTO"%>
<%@page import="com.baseballtalk.model.PitcherStatDTO"%>
<%@page import="com.baseballtalk.model.PitcherStatDAO"%>
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
<title>투수 기록</title>
	<link href="./css/Total.css" rel="stylesheet" type="text/css">
	<link href="./css/CommentTable.css" rel="stylesheet" type="text/css">
</head>
<body>
<% List<PlayerDTO> showPitcher_info = new PlayerDAO().showPitcher_info(); %>
<% List<PitcherStatDTO> showPitcher_stat = new PitcherStatDAO().showPitcherStat();%>
<% List<RecoredCommentDTO> showRecoredComment = new CommentDAO().show_RecoredComment();%>
 <!-- 로그인 세션 값 가져오기 -->
 <% MemberDTO login_member = (MemberDTO) session.getAttribute("login_member");%>
	     
	<%@ include file = "header.jsp" %>
	<div id="total">
		<h4>투수 기록</h4>
		<div id="stat_con">
			<table id="p_info">
				<tr>
					<td>순위</td>
					<td>선수명</td>
					<td>소속팀</td>
					<td>포지션</td>
				</tr>
				<%int i = 0;%>
				<%for(PlayerDTO p : showPitcher_info){i++;%>
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
					<td>승</td>
					<td>패</td>
					<td>이닝</td>
					<td>평균 자책점</td>
					<td>경기 출장 수</td>
					<td>선발 등판 횟수</td>
					<td>홀드</td>
					<td>세이브</td>
					<td>K/9</td>
					<td>B/9</td>
					<td>HR/9</td>
					<td>BABIP</td>
					<td>FIP</td>
					<td>FIP_WAR</td>
					<td>RA9_WAR</td>
					
				</tr>
				<%for(PitcherStatDTO pt : showPitcher_stat){%>
				<tr>
					<td><%=pt.getPlayer_win()%></td>
					<td><%=pt.getPlayer_lose()%></td>
					<td><%=pt.getIp()%></td>
					<td><%=pt.getEra()%></td>
					<td><%=pt.getGame_played()%></td>
					<td><%=pt.getGs()%></td>
					<td><%=pt.getHold()%></td>
					<td><%=pt.getSaves()%></td>
					<td><%=pt.getK_per_9()%></td>
					<td><%=pt.getB_per_9()%></td>
					<td><%=pt.getHr_per_9()%></td>
					<td><%=pt.getBabip()%></td>
					<td><%=pt.getFip()%></td>
					<td><%=pt.getFip_war()%></td>
					<td><%=pt.getRa9_war()%></td>
				</tr>
				<%} %>
			</table>
	</div>
	</div>
	
	<!-- 세션에서 닉네임값 가져오기 -->
	
	<% String nick = login_member.getMem_nick();%>
		
	
	<div class = "Comment">
	
		<form id = "Input_Comment" action="CommentCon" method = "post" encType = "multipart/form-data" onsubmit="return false">
		
			<table class = "CommentTable">
				
				<tr>
					
					<td><br><br><br><%=nick%></td>
					<td><input type="text" class="CommentMain" name = "CommentContent" placeholder="상대방을 존중하는 댓글을 남깁시다." ></td>
					<td><br><br><input type="submit" class="WriteButton" value="댓글 작성" onclick="login_check()"></td>
				
				</tr>
				
				<tr>
				
					<td colspan="3"><input type="file" name="FileName"></td>
				
				</tr>
				
			</table>
		
		</form>
		
	</div>
	
	<div class = "CommentList">
	 <% for (RecoredCommentDTO rcmt : showRecoredComment) { %>
		<table class = "CommentTable">
		
			<tr>
			
				<td><%=rcmt.getMem_id()%></td>
				<td><%=rcmt.getRcmt_content()%></td>
				<td>
					<% if (login_member != null && rcmt.getMem_id().equals(login_member.getMem_nick())) { %>
                        <button onclick="editComment('<%= rcmt.getRcmt_content()%>')">수정</button>
                        <button onclick="deleteComment('<%= rcmt.getRcmt_idx()%>')">삭제</button>
                    <% } %>
				
				</td>
			
			</tr>
			
		</table>
	<%} %>
	</div>
	
	<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
	    <script type="text/javascript">
	     
		    
				function login_check() {
					
					var login_member = <%=login_member%>;
					
					if (!login_member) {
		                alert("로그인이 필요합니다. 로그인 페이지로 이동합니다.");
		                window.location.href = "Login.jsp"; // 로그인 페이지의 URL로 변경
		                return false;
		            }
					
					 document.getElementById("Input_Comment").submit();
					
				}
				
				function editComment(Rcmt_idx, Rcmt_content) {
			        var newContent = prompt("수정할 내용을 입력하세요:", commentContent);
			        if (newContent != null) {
			            $.ajax({
			                url: "CommentCon",
			                type: "POST",
			                data: {
			                	Rcmt_idx: Rcmt_idx,
			                    newContent: newContent
			                },
			                success: function(response) {
			                    alert("댓글이 수정되었습니다.");
			                    location.reload();
			                },
			                error: function() {
			                    alert("댓글 수정에 실패했습니다.");
			                }
			            });
			        }
			    }
				
				function deleteComment(Rcmt_idx) {
			        if (confirm("정말로 댓글을 삭제하시겠습니까?")) {
			            $.ajax({
			                url: "CommentCon",
			                type: "POST",
			                data: { Rcmt_idx: Rcmt_idx },
			                success: function(response) {
			                    alert("댓글이 삭제되었습니다.");
			                    location.reload();
			                },
			                error: function() {
			                    alert("댓글 삭제에 실패했습니다.");
			                }
			            });
			        }
			    }
		

					

		</script>
</body>
</html>