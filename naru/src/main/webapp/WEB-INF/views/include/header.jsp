<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<script src="resources/js/login.js" charset="UTF-8"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

<link rel="stylesheet"
	href="https://fonts.googleapis.com/icon?family=Material+Icons" />
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/lodash.js/4.17.21/lodash.min.js"
	integrity="sha512-WFN04846sdKMIP5LKNphMaWzU7YpMyCU245etK3g/2ARYbPK9Ub18eG+ljU96qKRCWh+quCY7yefSmlkQw1ANQ=="
	crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/gsap/3.10.4/gsap.min.js"
	integrity="sha512-VEBjfxWUOyzl0bAwh4gdLEaQyDYPvLrZql3pw1ifgb6fhEvZl9iDDehwHZ+dsMzA0Jfww8Xt7COSZuJ/slxc4Q=="
	crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/gsap/3.10.4/ScrollToPlugin.min.js"
	integrity="sha512-lZACdYsy0W98dOcn+QRNHDxFuhm62lfs8qK5+wPp7X358CN3f+ml49HpnwzTiXFzETs4++fADePDI+L2zwlm7Q=="
	crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/ScrollMagic/2.0.8/ScrollMagic.min.js"
	integrity="sha512-8E3KZoPoZCD+1dgfqhPbejQBnQfBXe8FuwL4z/c8sTrgeDMFEnoyTlH3obB4/fV+6Sg0a0XF+L/6xS4Xx1fUEg=="
	crossorigin="anonymous" referrerpolicy="no-referrer"></script>


<style>
	.input-form {
		max-width: 680px;
		margin-top: 80px;
		padding: 32px;
		background: #fff;
		-webkit-border-radius: 10px;
		-moz-border-radius: 10px;
		border-radius: 10px;
		-webkit-box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15);
		-moz-box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15);
		box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15)
	}
	
	.bd-navbar {
		position: sticky;
		top: 0;
		z-index: 1071;
		min-height: 4rem;
		box-shadow: 0 0.5rem 1rem rgba(0, 0, 0, .05), inset 0 -1px 0
			rgba(0, 0, 0, .1);
	}
	
	.bd-sidebar {
		position: sticky;
		top: 4rem;
		z-index: 1000;
		height: calc(100vh - 4rem);
		background: #eee;
		border-right: 1px solid rgba(0, 0, 0, .1);
		overflow-y: auto;
		min-width: 160px;
		max-width: 220px;
	}
	
	.bd-sidebar .nav {
		display: block;
	}
	
	.bd-sidebar .nav>li>a {
		display: block;
		padding: .25rem 1.5rem;
		font-size: 90%;
	}
</style>


<!-- header -->

	<header class="navbar navbar-expand navbar-dark bg-dark bd-navbar">
	<a class="navbar-brand" href="#"
		style="font-size: 30px; margin-left: 12%;">어음교환 서비스</a>
	<button class="navbar-toggler" type="button" data-toggle="collapse"
		data-target="#navbarNav" aria-controls="navbarNav"
		aria-expanded="false" aria-label="Toggle navigation">
		<span class="navbar-toggler-icon"></span>
	</button>
	<c:choose>
		<c:when test="${member.member_id eq 'Admin'}">
			<div class="collapse navbar-collapse" id="navbarNav"
				style="justify-content: center; font-size: 20px;">
				<ul class="navbar-nav">
					<li class="nav-item"><a class="nav-link" href="home">홈</a></li>
					<li class="nav-item"><a class="nav-link" href="#!">어음교환</a></li>
					<li class="nav-item"><a class="nav-link" href="change">작업일자(교환일) 관리</a></li>
					<li class="nav-item"><a class="nav-link" href="codecheck">코드조회</a></li>
					<li class="nav-item"><a class="nav-link" href="fileregister">파일등록</a></li>
					<li class="nav-item"><a class="nav-link"
						onclick="location.href='board'" style="cursor:pointer;">게시판</a></li>
					<li class="nav-item"><a class="nav-link" href="#!">Contact</a></li>
				</ul>
			</div>
		</c:when>
		<c:when test="${member.member_pass == 1}">
			<p style="color:white; margin-left: 230px; 
				margin-right: 220px; font-size:20px; margin-top: 15px;">현재 서비스를 이용할 수 없습니다.</p>
		</c:when>
		<c:otherwise>
			<div class="collapse navbar-collapse" id="navbarNav"
				style="justify-content: center; font-size: 20px;">
				<ul class="navbar-nav">
					<li class="nav-item"><a class="nav-link" href="home">홈</a></li>
					<li class="nav-item"><a class="nav-link" href="#!">어음교환</a></li>
					<li class="nav-item"><a class="nav-link" href="codecheck">코드조회</a></li>
					<li class="nav-item"><a class="nav-link" href="fileregister">파일등록</a></li>
					<li class="nav-item"><a class="nav-link"
						onclick="location.href='board'" style="cursor:pointer;">게시판</a></li>
					<li class="nav-item"><a class="nav-link" href="#!">Contact</a></li>
				</ul>
			</div>
		</c:otherwise>
	</c:choose>
	
		<form style="cursor: pointer; text-align: right; margin-right: 10%; font-size: 20px;">
	 		<c:choose>
	 		
				<c:when test="${member.member_id eq 'Admin'}">
					<i class="btn btn-primary" onclick="location.href='memberList'"
						title="회원관리">MemberList</i>
					<i class="btn btn-primary" onclick="location.href='logout'"
						title="로그아웃">Logout</i>
					<div style="color:white;"><b>${member.member_name}</b> 님 환영합니다.</div>
				</c:when>
				
				<%-- <c:when test="${member.member_id == null}">
					<i class="btn btn-primary" onclick="location.href='login'"
						title="로그인" style="text-align: right;">login</i>
				</c:when> --%>
				
				<c:when test="${member.member_pass == 1}">
					<i class="btn btn-primary" onclick="location.href='logout'" title="로그아웃">Logout</i>
					<div style="color:white; text-align: right;" ><b>${member.member_name}</b> 님 관리자의 승인을 기다리세요. </div>	
				</c:when>
				
				<c:otherwise>	 						
					<i class="btn btn-primary" onclick="location.href='mypBtn()'"
						title="회원관리">Mypage</i>
					<i class="btn btn-primary" onclick="location.href='logout'"
						title="로그아웃" >
						Logout</i>
					<div  style="color:white;"><b>${member.member_name}</b>님 어서오세요.</div>
				</c:otherwise>
			</c:choose>
		</form>
 </header>
	
	<div class="container-fluid" style="font-family: Lato">
		<div class="row flex-nowrap">
		<c:choose>
		<c:when test="${member.member_id eq 'Admin'}">
			<div class="col-3 bd-sidebar">
				<ul class="nav" style="margin-top: 50px; font-size: 17px;">
					<li><a>
						<h3>어음교환</h3>
					</a>
						<ul>
							<li><a href="#"
								style="text-decoration: none; color: rgb(92, 115, 220);">예제 1</a></li>
							<li><a href="#"
								style="text-decoration: none; color: rgb(92, 115, 220);">예제 2</a></li>
							<li><a href="#"
								style="text-decoration: none; color: rgb(92, 115, 220);">예제 3</a></li>
						</ul> <br>
						<li><a>
						<h3>작업일자(교환일) 관리</h3>
					</a>
						<ul>
							<li><a href="change"
								style="text-decoration: none; color: rgb(92, 115, 220);">작업일자(교환일) 관리</a>
							</li>
						</ul>
					</li>
					<br>
					<li><a>
						<h3>코드조회</h3>
					</a>
						<ul>
							<li><a href="codecheck"
								style="text-decoration: none; color: rgb(92, 115, 220);">은행코드 등록(Excel)</a>
							</li>
							<li><a href="codecheck"
								style="text-decoration: none; color: rgb(92, 115, 220);">은행 코드조회</a>
							</li>
						</ul>
					</li>
					<br>
					<li><a>
							<h3>파일등록</h3>
					</a>
						<ul>
							<li><a href="fileregister"
								style="text-decoration: none; color: rgb(92, 115, 220);">TEXT 파일</a>
							</li>
							<li><a href="fileregister"
								style="text-decoration: none; color: rgb(92, 115, 220);">스캔 내역 조회</a>
							</li>
						</ul></li>
					<br>
					<li><a>
							<h3>고객지원</h3>
					</a>
						<ul>
							<li><a onclick="location.href='board'" 
								style="text-decoration: none; color: rgb(92, 115, 220); cursor:pointer;">게시판</a>
							</li>
						</ul>
					</li>
					<br>
					<li><a>
							<h3>Contact</h3>
					</a>
						<ul>
							<li><a href="#"
								style="text-decoration: none; color: rgb(92, 115, 220);">문의하기</a>
							</li>
						</ul>
					</li>
				</ul>
			</div>
			</c:when>
			
			<c:when test="${member.member_pass == 1}">
				<div style="color:white;" >현재 서비스를 이용할 수 없습니다.</div>
			</c:when>
			
			<c:otherwise>
				<div class="col-3 bd-sidebar">
					<ul class="nav" style="margin-top: 50px; font-size: 17px;">
						<li><a>
								<h3>어음교환</h3>
						</a>
							<ul>
								<li><a href="#"
									style="text-decoration: none; color: rgb(92, 115, 220);">예제 1</a></li>
								<li><a href="#"
									style="text-decoration: none; color: rgb(92, 115, 220);">예제 2</a></li>
								<li><a href="#"
									style="text-decoration: none; color: rgb(92, 115, 220);">예제 3</a></li>
							</ul> <br>
						
						<li><a>
							<h3>코드조회</h3>
						</a>
							<ul>
								<li><a href="codecheck"
									style="text-decoration: none; color: rgb(92, 115, 220);">은행코드 등록(Excel)</a>
								</li>
								<li><a href="codecheck"
									style="text-decoration: none; color: rgb(92, 115, 220);">은행 코드조회</a>
								</li>
							</ul>
						</li>
						<br>
						<li><a>
								<h3>파일등록</h3>
						</a>
							<ul>
								<li><a href="fileregister"
									style="text-decoration: none; color: rgb(92, 115, 220);">TEXT 파일</a>
								</li>
								<li><a href="fileregister"
									style="text-decoration: none; color: rgb(92, 115, 220);">스캔 내역 조회</a>
								</li>
							</ul></li>
						<br>
						<li><a>
								<h3>고객지원</h3>
						</a>
							<ul>
								<li><a onclick="location.href='board'" 
									style="text-decoration: none; color: rgb(92, 115, 220); cursor:pointer;">게시판</a>
								</li>
							</ul>
						</li>
						<br>
						<li><a>
								<h3>Contact</h3>
						</a>
							<ul>
								<li><a href="#"
									style="text-decoration: none; color: rgb(92, 115, 220);">문의하기</a>
								</li>
							</ul>
						</li>
					</ul>
				</div>
			</c:otherwise>
			
			</c:choose>
			