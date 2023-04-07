<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html lang="ko">
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
        integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
        crossorigin="anonymous">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"
        integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1"
        crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
        integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
        crossorigin="anonymous"></script>
        <script src="resources/js/mypage.js"></script>

    <title>가입 승인 페이지</title>
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">

</head>

<body>
    <%@ include file="../include/header.jsp"%>
    
            <main class="mt-5 pt-5" style="width: 1000px; margin-left: 200px; margin-bottom: 100px;">
                <div class="container-fluid px-4" style="width: 1000px; text-align: center; ">
                    <h1 class="mt-4" style="margin-bottom: 100px;">가입 승인 및 거절</h1>

                    <div class="list2" align="center">
                        <form>
                           <table id="mem" style="border:1px solid #E1DCDC;" cellpadding="7" cellspacing="7">
                             <tr class="block1">
                                 <th>이름</th>
                                 <td style="border-bottom:1px solid #E1DCDC;">
                                    <input id="member_name" type="text" class="input" value="${member2.member_name}"/>
                                 </td>
                              </tr>
                              <tr class="block1">
                                 <th>아이디</th>
                                 <td style="border-bottom:1px solid #E1DCDC;">
                                    <input id="member_id"  type="text" class="input" value="${member2.member_id}">
                                 </td>
                              </tr>
                            
                              <tr class="block1">
                                 <th>승인대기</th>
                                 <td style="border-bottom:1px solid #E1DCDC;">
                                  		<!-- <button id = "update-button" type="button" value="승인"
                                    		class = "member_pass" onclick="approveMember()">승인</button> -->
                                    
                                    <input id="member_id"  type="text" class="input" value="${member2.member_pass}">
                                   
  
                                    <!-- <select id="email_select">
                                        <option value="" selected>----</option>
                                        <option id="member_pass" value="">가입승인</option>
                                        <option id="member_pass" value="">가입거절</option>
                                     </select> -->
                                 </td>
                               <%-- <c:choose>
                                 <c:when test="${member.member_pass == 0 }">
                                 <td style="border-bottom:1px solid #E1DCDC;">
                                    <button id = "${member.member_id }" type="button" value="승인"
                                    	class = "appro">승인</button>
                                    	<button id = "${member.member_id }" type="button" value="거부"
                                    	class = "deni">거부</button>
                                 </td>
                                 </c:when>
                                 <c:when test = "${member.member_pass == 1}">
                                 <button id="${member.member_id}" type="button" vlaue="추방"
                                  class="userDrop">회원 삭제</button>                                
                                  </c:when>
                                  <c:when test = "${member.member_pass == 3}">
                                  	<td>추방 회원</td>
                                  </c:when>
                                  <c:when test = "${member.member_pass == 2}">
                                  	<td>승인 거절 회원</td>
                                  </c:when>
                                </c:choose> --%>
                              </tr>
                              
                              
                           </table>
                        </form>
                        <br><br><br>
                        <input type="button" class="update" onclick="memberUp()" style="cursor: pointer" value="적용" />&nbsp;&nbsp;&nbsp;
                        <input type="button" class="cancel" onclick="location.href='memberList'" style="cursor: pointer" value="취소" />&nbsp;&nbsp;&nbsp;
                        <input type="button" class="delete" value="삭제" onClick="delMember2('${member2.member_id}')">
                     </div>
                     	
                  
                    </div>
                
            </main>
            </div>
            </div>

    <footer class="py-5 bg-dark">
        <div class="container px-4 px-lg-5">
            <p class="m-0 text-center text-white">Copyright &copy;
				ShinJongHyeon 2023 starlgb02@narudata.com</p>
        </div>
    </footer>

</body>

</html>