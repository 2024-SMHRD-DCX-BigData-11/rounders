<%@page import="com.baseballtalk.model.CommentDAO"%>
<%@page import="com.baseballtalk.model.FreeBoardCommentDTO"%>
<%@page import="java.util.List"%>
<%@page import="com.baseballtalk.model.MemberDAO"%>
<%@page import="com.baseballtalk.model.BoardDAO"%>
<%@page import="com.baseballtalk.model.FreeBoardDTO"%>
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
	<style>
	.file_img{
		width: 100px;
		height: 100px;
	}
	</style>
</head>
<body>
<%
	int board_idx = Integer.parseInt(request.getParameter("board_idx"));
	FreeBoardDTO freeBoard = new BoardDAO().FreeDetail(board_idx);
	List<FreeBoardCommentDTO> showFreeBoardComment = new CommentDAO().show_FreeBoardComment(board_idx);
	String mem_nick = new MemberDAO().getNick(freeBoard.getMem_id());
	int View = freeBoard.getBoard_views();
	View++;
	FreeBoardDTO frbd = new FreeBoardDTO(freeBoard.getBoard_idx(),
			View);
	int cnt = new BoardDAO().updateFreeView(frbd);
	MemberDTO login_member = (MemberDTO)session.getAttribute("login_member");
	
	 %>
<%@ include file = "header.jsp" %>
	<div id = "board">
				<form action="#" method="post" enctype="multipart/form-data">
				<table id="list">
					<tr><td class="td">제목</td>
						
						<td><%=freeBoard.getBoard_title()%></td>
					</tr>
					<tr>
						<td class="td">작성자</td>
						<td><%=mem_nick%></td>
					</tr>
					<tr>
						<td class="td">등록일</td>
						<td><%=freeBoard.getCreated_at()%></td>
					</tr>
					<tr>
						<td class="td">첨부파일</td>
						<td><%=freeBoard.getBoard_file()%></td>
					</tr>
					<tr>
						<td class="td">추천</td>
						<td><span><%=freeBoard.getBoard_likes() %></span><a href="FreeUpCon?board_idx=<%=board_idx%>"><img alt=" 좋아요" src="./image/rating.png" id="like"></a></td>
					</tr>
					<tr>
						<td class="td">조회수</td>
						<td><%=View%></td>
					</tr>
					<tr>
						<td colspan="2">내용</td>
					</tr>
					<tr>
						<td colspan="2"><h4><%=freeBoard.getBoard_content() %></h4>
						<%if(freeBoard.getBoard_file() != null){ %>
						<div>
						<img class = "file_img" alt="" src="./file/<%=freeBoard.getBoard_file()%>">
						</div>
						<%} %>
						</td>
					</tr>
					<tr>
						<td colspan="2" id="rs">
							<input type="button" value="뒤로가기" id = "backButton">
							<% if(login_member != null && login_member.getMem_id().equals(freeBoard.getMem_id())){%>
							<a href = "FreeBoardUpdate.jsp?board_idx=<%= board_idx %>">"><button id ="updateButton" color="black">수정</button></a>
							<a href="FreePostingDeleteCon?board_idx=<%=board_idx%>"><button id = "deleteButton">삭제</button></a>
							<%} %>
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
	   commentlink = "FreeCommentInsertCon";
   }
   System.out.println(commentlink);
	%>
			<div id="all">
		 <h3>댓글</h3>
			<form id="Input_Comment" action=<%=commentlink%> method="post">
				<fieldset>
					

			<div class="CommentList">
				<%
				for (FreeBoardCommentDTO tbc : showFreeBoardComment) {
				%>
				<table class="CommentTable">
				<%String comment_mem_nick = new MemberDAO().getNick(tbc.getMem_id()); %>
					<tr>
						<td><%=comment_mem_nick%></td>
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