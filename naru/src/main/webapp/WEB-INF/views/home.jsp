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
        integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
        crossorigin="anonymous">
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
        integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
        crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"
        integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1"
        crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
        integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
        crossorigin="anonymous"></script>

    <title>어음교환 페이지</title>
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">

    
</head>

<body>
    <%@ include file="include/header.jsp"%>

            <!-- Page Content-->
            <div class="container px-4 px-lg-5" style="margin-left: 200px;">
				<%-- <%= MemberVO member = (MemberVO)session.getAttribute("member");%> --%>

                <!-- Heading Row-->
                <div class="row gx-4 gx-lg-5 align-items-center my-5">
                    <div class="col-lg-7"><img class="img-fluid rounded mb-4 mb-lg-0"
                            src=https://www.blockmedia.co.kr/wp-content/uploads/2020/08/%EA%B8%B0%EC%97%85%EC%9D%80%ED%96%89-1280x640.png
                             alt="..." style="width: 560px;padding-left:50px; " /></div>
                    <div class="col-lg-5">
                        <h1 class="font-weight-light">어음교환 홈페이지</h1>
                        <p>
                        <h3><strong>어음 교환</strong></h3>
                        어음 교환 서비스</p>
                    </div>
                </div>
                <!-- Call to Action-->
                <div class="card text-white bg-secondary my-5 py-4 text-center">
                    <div class="card-body">
                        <p class="text-white m-0"><strong>어음교환 예제</strong></p>
                    </div>
                </div>
                <!-- Content Row-->
                <div class="row gx-4 gx-lg-5">
                <div class="col-md-4 mb-5">
                        <div class="card h-100">
                            <div class="card-body">
                                <h2 class="card-title" style="text-align:center">어음교환</h2>
                                <hr><br>
                                <p class="card-text" style="text-align:center">
                                    <strong>예제 1</strong><br><br>
                                    <strong>예제 2</strong><br><br>
                                    <strong>예제 3</strong>
                                </p>
                            </div>
                            <!-- <div class="card-footer" style="text-align:right;"><a
                                    class="btn btn-primary btn-sm" href="#!">교환하기</a></div> -->
                        </div>
                    </div>
                    <div class="col-md-4 mb-5">
                        <div class="card h-100">
                            <div class="card-body">
                                <h2 class="card-title" style="text-align:center">금융회사 코드조회</h2>
                                <hr><br>
                                <p class="card-text" style="text-align:center">
                                    <strong>은행코드 등록(Excel)</strong><br><br>
                                    <strong>은행코드 조회</strong>
                                </p>
                            </div>
                            <!-- <div class="card-footer" style="text-align:right;"><a
                                    class="btn btn-primary btn-sm" href="#!">조회하기</a></div> -->
                        </div>
                    </div>
                    <div class="col-md-4 mb-5">
                        <div class="card h-100">
                            <div class="card-body">
                                <h2 class="card-title" style="text-align:center">파일등록 서비스</h2>
                                <hr><br>
                                <p class="card-text" style="text-align:center">
                                    <strong>TEXT 파일 등록</strong><br/><br>
                                   <strong> 스캔내역 조회 </strong><br/>
                                </p>
                            </div>
                            <!-- <div class="card-footer" style="text-align:right;"><a
                                    class="btn btn-primary btn-sm" href="#!">등록하기</a></div> -->
                        </div>
                    </div>
                    
                </div>
                
            </div>
            </div>
            </div>
            <footer class="py-5 bg-dark">
        <div class="container px-4 px-lg-5">
            <p class="m-0 text-center text-white">Copyright &copy;
				ShinJongHyeon 2023 starlgb02@narudata.com</p>
        </div>
    </footer>
      
</div>
</body>

</html>