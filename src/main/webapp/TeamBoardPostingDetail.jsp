<%@page import="com.baseballtalk.model.CommentDAO"%>
<%@page import="com.baseballtalk.model.TeamBoardCommentDTO"%>
<%@page import="java.util.List"%>
<%@page import="com.baseballtalk.model.MemberDAO"%>
<%@page import="com.baseballtalk.model.BoardDAO"%>
<%@page import="com.baseballtalk.model.TeamBoardDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글</title>
	<link href="./css/PostingDetail.css" rel="stylesheet" type="text/css">
	<link href="./css/CommentTable.css" rel="stylesheet" type="text/css">
	
</head>
<body>
<%
	int board_idx = Integer.parseInt(request.getParameter("board_idx"));
	TeamBoardDTO teamBoard = new BoardDAO().TeamDetail(board_idx) ;
	List<TeamBoardCommentDTO> showTeamBoardComment = new CommentDAO().show_TeamBoardComment();
	String mem_nick = new MemberDAO().getNick(teamBoard.getMem_id());
<<<<<<< HEAD
	MemberDTO login_member = (MemberDTO)session.getAttribute("login_member");
	int View = teamBoard.getBoard_views();
	View++;
	TeamBoardDTO tbd = new TeamBoardDTO(teamBoard.getBoard_idx(),
			View);
	int cnt = new BoardDAO().updateTeamView(tbd);
=======
	MemberDTO login_member = (MemberDTO) session.getAttribute("login_member");
>>>>>>> branch 'develop' of https://github.com/2024-SMHRD-DCX-BigData-11/Rounders.git
%>
<%@ include file = "header.jsp" %>
	<div id = "board">
				<form action="#" method="post" enctype="multipart/form-data">
				<table id="list">
					<tr><td class="td">카테고리</td>
						
						<td><%=teamBoard.getBoard_category()%></td>
					</tr>
					<tr><td class="td">제목</td>
						
						<td><%=teamBoard.getBoard_title()%></td>
					</tr>
					<tr>
						<td class="td">작성자</td>
						<td><%=mem_nick%></td>
					</tr>
					<tr>
						<td class="td">등록일</td>
						<td><%=teamBoard.getCreated_at()%></td>
					</tr>
					<tr>
						<td class="td">조회수</td>
						<td><%=View%></td>
					</tr>
					<tr>
						<td class="td">좋아요</td>
						<td><span><%=teamBoard.getBoard_likes() %></span><a href="TeamBoardUpCon?board_idx=<%=board_idx%>"><button id = "btn_like">추천</button></td></a>
					</tr>
					<tr>
						<td class="td">첨부파일</td>
						<td><%=teamBoard.getBoard_file()%></td>
					</tr>
					
					<tr>
						<td colspan="2">내용</td>
					</tr>
					<tr>
						<td colspan="2"><h4><%=teamBoard.getBoard_content()%></h4></td>
					</tr>
					<tr>
						<td colspan="2" id="rs">
<<<<<<< HEAD
							<a href="#"><input type="button" value="뒤로가기"></a>
							<% if(login_member != null && login_member.getMem_id().equals(teamBoard.getMem_id())){%>
							<a href = "#""><button id ="updateButton" color="black">수정</button></a>
							<a href="#"><button id = "deleteButton">삭제</button></a>
							<%} %>
=======
							<a href="#"><input type="button" value="뒤로가기" id="backButton"></a>
>>>>>>> branch 'develop' of https://github.com/2024-SMHRD-DCX-BigData-11/Rounders.git
						</td>
					</tr>
				</table>
				</form>
			</div>
			<!-- 세션에서 닉네임값 가져오기 -->

		<% String mem_id = "";
   if(login_member != null){
	   mem_id = login_member.getMem_id();
   }   
   System.out.println(mem_id);
   String commentlink = "Login.jsp";
   if(login_member != null){
	   commentlink = "TeamBoardCommentInsertCon";
   }
   System.out.println(commentlink);
	%>
			<div id="all">
		 <h3>댓글</h3>
			<form id="Input_Comment" action=<%=commentlink%> method="post">
				<fieldset>
					

			<div class="CommentList">
				<%
				for (TeamBoardCommentDTO tbc : showTeamBoardComment) {
				%>
				<table class="CommentTable">

					<tr>
						<td><%=mem_nick%></td>
						<td><%=tbc.getCmt_content()%></td>
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
								<input type="hidden" name="board_idx" value=<%=board_idx %>>
								<td><input type="text" class="CommentMain"
									name="cmt_content" placeholder="댓글을 입력하세요."></td>
								<td><br> <br> <input type="submit"
									class="WriteButton" value="댓글 작성" onclick="login_check()"></td>

							</tr>

						</table>
				</div>
			</fieldset>
		</form>
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
		<div>
			<%@ include file="Footer.jsp"%>
		</div>
	<script>
		document.getElementById('backButton').addEventListener('click',
				function() {
					window.history.back(); // 브라우저의 뒤로 가기 기능을 실행합니다.
				});
	</script>
</body>
</html>