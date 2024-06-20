<%@page import="com.baseballtalk.model.MemberDAO"%>
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
<div id = "wrap">
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
               <td>경기 출장</td>
               <td>선발 등판</td>
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
   <div class = "Comment">
   <div class = "CommentWrite">
   
      <form id = "Input_Comment" action=<%=commentlink %> method = "post">
      
         <table class = "CommentTable">
            
            <tr>
               <% if(login_member != null){ %>
               <td><br><br><br><%=login_member.getMem_nick()%></td>
               <%}else{ %>
                <td><br><br><br>익명</td>	
                <%} %>
               <input type="hidden" name = "mem_id" value=<%=mem_id %>>
               <input type="hidden" name = "stat" value=2>
               <td><input type="text" class="CommentMain" name = "rcmt_content" placeholder="댓글을 입력하세요." ></td>
               <td><br><br><input type="submit"class="WriteButton" value="댓글 작성" onclick="login_check()"></td>
            
            </tr>
            
         </table>
      
      </form>
      
   </div>
   
   <div class = "CommentList">
    <% for (RecoredCommentDTO rcmt : showRecoredComment) {%>
          
       
      <table class = "CommentTable">
      
         <tr>
          <% String mem_nick = new MemberDAO().getNick(rcmt.getMem_id());%>
            <td><%=mem_nick%></td>
            <td><%=rcmt.getRcmt_content()%></td>
            <%-- <td>
               <% if (login_member != null && rcmt.getMem_id().equals(login_member.getMem_id())) { %>
                        <button onclick="editComment('<%= rcmt.getRcmt_idx()%>','<%= rcmt.getRcmt_content()%>')">수정</button>
                        <button onclick="deleteComment('<%= rcmt.getRcmt_idx()%>')">삭제</button>
                    <% } %>
            </td> --%>
         
         </tr>
         
      </table>
   <%} %>
   </div>
   </div>
   </div>
   
</div>   
   <script  src="http://code.jquery.com/jquery-latest.min.js"></script>
       <script type="text/javascript">
        
          
            function login_check() {
               
               var login_member = <%=login_member%>;
               
               if (login_member == null) {
                      alert("로그인이 필요합니다. 로그인 페이지로 이동합니다.");
                      window.location.href = "Login.jsp"; // 로그인 페이지의 URL로 변경
                  }
               
                
               
            }
            <%-- var rcmt_idx = <%=showRecoredComment.get(0).getRcmt_idx()%>;
            var rcmt_content = $('.rcmt_content').val();
            function editComment(rcmt_idx, rcmt_content) {
                 var newContent = prompt("수정할 내용을 입력하세요:", rcmt_content);
                 if (newContent != null) {
                     $.ajax({
                         url: "RecoredCommentUpdateCon",
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
                         url: "RecoredCommentDeleteCon",
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