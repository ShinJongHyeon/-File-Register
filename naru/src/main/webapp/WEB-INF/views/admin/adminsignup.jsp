<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="ko">

<head>
   <meta charset="utf-8" />
   <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
   <meta name="description" content="" />
   <meta name="author" content="" />
   <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
      integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
   <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
      integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
      crossorigin="anonymous"></script>
   <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"
      integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1"
      crossorigin="anonymous"></script>
   <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
      integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
      crossorigin="anonymous"></script>

   <title>NARUDATA</title>
   <!-- Core theme CSS (includes Bootstrap)-->
   <!--   <link href="css/styles.css" rel="stylesheet" />  -->



   <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
   <style>
      html,
      body {
         font-family: "Lato";
         min-height: 100%;
      }

      .main-head {
         height: 100%;
         background: #FFF;
      }

      .sidenav {
         height: 530px;
         background-color: #000;
         padding-top: 20px;
         margin-left: 25%;
         margin-top: 10%;
      }

      .main {
         padding: 0px 10px;
      }

      @media screen and (max-height: 450px) {
         .sidenav {
            padding-top: 15px;
         }
      }

      @media screen and (max-width: 450px) {
         .login-form {
            margin-top: 20%;
         }

         .register-form {
            margin-top: 10%;
         }
      }

      @media screen and (min-width: 768px) {
         .main {
            margin-left: 50%;
         }

         .sidenav {
            position: fixed;
            top: 0;
            left: 0;
            justify-content: center;
         }

         .login-form {
            margin-top: 65%;
         }

         .register-form {
            margin-top: 20%;
         }
      }

      .login-main-text {
         margin-top: 20%;
         padding: 60px;
         color: #fff;
      }

      .login-main-text h2 {
         font-weight: 300;
      }

      .btn-black {
         background-color: #000 !important;
         color: #fff;
      }


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
         box-shadow: 0 0.5rem 1rem rgba(0, 0, 0, .05), inset 0 -1px 0 rgba(0, 0, 0, .1);
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
</head>

<body>
   <!-- header -->
   <header class="navbar navbar-expand navbar-dark bg-dark bd-navbar">
      <a class="navbar-brand" href="index.html" style="font-size: 30px; margin-left: 12%;">NARUDATA</a>
      <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav"
         aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
         <span class="navbar-toggler-icon"></span>
      </button>
      <div class="collapse navbar-collapse" id="navbarNav" style="justify-content: center; font-size: 20px;">
         <ul class="navbar-nav">
            <li class="nav-item"><a class="nav-link" href="index.html">Home</a></li>
            <li class="nav-item"><a class="nav-link" href="#!">Services</a></li>
            <li class="nav-item"><a class="nav-link" href="list.html">Notice</a></li>
            <li class="nav-item"><a class="nav-link" href="#!">About Us</a></li>
            <li class="nav-item"><a class="nav-link" href="#!">Contact</a></li>
         </ul>
      </div>
      </div>
      <a class="btn btn-primary" href="#!" style="text-align:right; margin-right: 10%; font-size: 20px;">Login</a>
   </header>
   <main class="mt-5 pt-5"
		style="width: 1000px; margin-left: 440px; margin-bottom: 100px;">
		<div class="container-fluid px-4"
			style="width: 1000px; text-align: center;">
			<h1 class="mt-4" style="margin-bottom: 100px;">Admin User Controller</h1>

			<div class="card mb-4" style="width: 1000px; text-align: right;">
				<div class="card-header">
					<a class="btn btn-primary float-end" href="write"
						style="margin-bottom: 30px;">가입 승인 요청</a>
                <form action="board">
                     <!-- align="left" -->
                     <input type="text" name="keyword" placeholder="회원 이름 입력" id="keyword" value="">
                     <input type="submit" class="check2" value="조회" />
               </form>

            </div>
        <div class="card-body" style="text-align: center;">
            <table class="table table-hover table-striped">
                <thead>
                    <tr>
                        <th>회원번호</th>
                        <th>이름</th>
                        <th>아이디</th>
                        <th>Email</th>
                        <th>가입 시 포부</th>
                    </tr>
                </thead>
            </table>
        </div>
        
        </div>
        </div>
        </main>
        
      </div>
   </div>

   <!-- Footer-->
   <footer class="py-5 bg-dark" style="position : fixed;  bottom : 0; width: 100%;">
      <div class="container px-4 px-lg-5">
        <p class="m-0 text-center text-white">Copyright &copy;
				ShinJongHyeon 2023 starlgb02@narudata.com</p>
      </div>
   </footer>

</body>

</html>