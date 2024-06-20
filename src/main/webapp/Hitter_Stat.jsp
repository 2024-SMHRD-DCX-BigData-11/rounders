<%@page import="com.baseballtalk.model.MemberDAO"%>
<%@page
	import="com.fasterxml.jackson.databind.ser.impl.ReadOnlyClassToSerializerMap"%>
<%@page import="com.baseballtalk.model.CommentDAO"%>
<%@page import="com.baseballtalk.model.RecoredCommentDTO"%>
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
<link href="./css/Write.css" rel="stylesheet" type="text/css">
<link href="./css/CommentTable.css" rel="stylesheet" type="text/css">
</head>
<body>
	<% List<PlayerDTO> showHitter_info = new PlayerDAO().showHitter_info();%>
	<% List<HitterStatDTO> showHitter_stat = new HitterStatDAO().showHitterStat(); %>
	<% List<RecoredCommentDTO> showRecoredComment = new CommentDAO().show_RecoredComment();%>
	<!-- 로그인 세션 값 가져오기 -->
	<% MemberDTO login_member = (MemberDTO) session.getAttribute("login_member");%>

	<%@ include file="header.jsp"%>
	<div id="wrap">
		<div id="total">
			<h4>타자 기록</h4>
			<div id="stat_con">
				<table id="p_info">
					<tr>
						<th>순위</th>
						<th>선수명</th>
						<th>소속팀</th>
						<th>포지션</th>
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
						<th>승리기여도(WAR)</th>
						<th>경기 출전 수</th>
						<th>타율</th>
						<th>홈런</th>
						<th>장타율</th>
						<th>출루율</th>
						<th>도루</th>
						<th>타점</th>
						<th>OPS(장타율+출루율)</th>
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


		<!-- 세션에서 닉네임값 가져오기 -->

		<% String mem_id = "";
   if(login_member != null){
	   mem_id = login_member.getMem_id();
   }   
   System.out.println(mem_id);
   String commentlink = "Login.jsp";
   if(login_member != null){
	   commentlink = "RecoredCommentInsertCon?";
   }
   System.out.println(commentlink);
	%>

		<div id="all">
		 <h3>댓글</h3>
			<form id="Input_Comment" action=<%=commentlink%> method="post">
				<fieldset>
					

			<div class="CommentList">
				<%
				for (RecoredCommentDTO rcmt : showRecoredComment) {
				%>
				<table class="CommentTable">

					<tr>
						<%
						String mem_nick = new MemberDAO().getNick(rcmt.getMem_id());
						%>
						<td><%=mem_nick%></td>
						<td><%=rcmt.getRcmt_content()%></td>
					</tr>

				</table>
				<%
				}
				%>
				
			</div>
				<div class="Comment">

						<table class="CommentTable">

							<tr>
								<%
								if (login_member != null) {%>
								<td><br> <br> <br><%=login_member.getMem_nick()%></td>
								<%} else {%>
								<td><br> <br> <br>익명</td>
								<%
								}
								%>
								<input type="hidden" name="mem_id" value=<%=mem_id%>>
								<input type="hidden" name="stat" value=1>
								<td><input type="text" class="CommentMain"
									name="rcmt_content" placeholder="댓글을 입력하세요."></td>
								<td><br> <br> <input type="submit"
									class="WriteButton" value="댓글 작성" onclick="login_check()"></td>

							</tr>

						</table>
				</div>
			</fieldset>
		</form>
	</div>
		<div>
			<%@ include file="Footer.jsp"%>
		</div>
	
	<script src="http://code.jquery.com/jquery-latest.min.js"></script>
	<script type="text/javascript">
        
          
            function login_check() {
               
               var login_member = <%=login_member%>;
               
               if (login_member == null) {
                      alert("로그인이 필요합니다. 로그인 페이지로 이동합니다.");
                      window.location.href = "Login.jsp"; // 로그인 페이지의 URL로 변경
                  }
               
                
               
            }
<%--             var rcmt_idx = <%=showRecoredComment.get(0).getRcmt_idx()%>;
            var rcmt_content = <%=showRecoredComment.get(0).getRcmt_content()%>;
            function editComment(rcmt_idx, rcmt_content) {
                 var newContent = prompt("수정할 내용을 입력하세요:", rcmt_content);
                 if (newContent != null) {
                     $.ajax({
                         url: "RecoredCommentUpdateCon?",
                         type: "POST",
                         data: {
                            rcmt_idx: rcmt_idx,
                             rcmt_content: newContent
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
            
            function deleteComment(rcmt_idx) {
                 if (confirm("정말로 댓글을 삭제하시겠습니까?")) {
                     $.ajax({
                         url: "RecoredCommentDeleteCon,
                         type: "POST",
                         data: { rcmt_idx: rcmt_idx },
                         success: function(response) {
                             alert("댓글이 삭제되었습니다.");
                             location.reload();
                         },
                         error: function() {
                             alert("댓글 삭제에 실패했습니다.");
                         }
                     });
                 }
             } --%>
      

               

      </script>
</body>
</html>