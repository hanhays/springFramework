<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>    
<!DOCTYPE html>
<html class="no-js">
<head>
<meta charset="UTF-8">
<meta http-equiv="x-ua-compatible" content="ie=edge">
<title>문의하기 게시판</title>
<meta name="description" content="">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- Place favicon.ico in the root directory -->
<link rel="shortcut icon" type="image/x-icon" href="/resources/images/favicon.ico">
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<link rel="apple-touch-icon" href="apple-touch-icon.png">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
    <!-- All css files are included here. -->
    <!-- Bootstrap fremwork main css -->
    <link rel="stylesheet" href="/resources/css/bootstrap.min.css">
    <!-- Owl Carousel min css -->
    <link rel="stylesheet" href="/resources/css/owl.carousel.min.css">
    <link rel="stylesheet" href="/resources/css/owl.theme.default.min.css">
    <!-- This core.css file contents all plugings css file. -->
    <link rel="stylesheet" href="/resources/css/core.css">
    <!-- Theme shortcodes/elements style -->
    <link rel="stylesheet" href="/resources/css/shortcode/shortcodes.css">
    <!-- Theme main style -->
    <link rel="stylesheet" href="/resources/style.css">
    <!-- Responsive css -->
    <link rel="stylesheet" href="/resources/css/responsive.css">
    <!-- User style -->
    <link rel="stylesheet" href="/resources/css/custom.css">
    <!-- Modernizr JS -->
    <script src="/resources/js/vendor/modernizr-3.5.0.min.js"></script>
</head>
<body>
<!-- Body main wrapper start -->
<div class="wrapper">   
<%@ include file="/resources/header.jsp" %>    
        
	    <!-- Start Bradcaump area -->
        <div class="ht__bradcaump__area" style="background: rgba(0, 0, 0, 0) url(/resources/images/bg/2.jpg) no-repeat scroll center center / cover ;">
            <div class="ht__bradcaump__wrap">
                <div class="container">
                    <div class="row">
                        <div class="col-xs-12">
                            <div class="bradcaump__inner">
                            	<h1></h1>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- End Bradcaump area -->

         
        <!-- cart-main-area start -->
        <div class="cart-main-area ptb--100 bg__white">
            <div class="container">
                <div class="row">
                	<div class="col-xs-12">
						<div class="contact-title">
							<h1 class="title__line--6" style="text-align:center">Q&A BOARD</h1>
						</div>
					</div>
                    <div class="col-md-12 col-sm-12 col-xs-12">
                            <div class="table-content table-responsive">
                                <table>
                                    <thead>
                                        <tr>
                                        	<th class="product-price">글번호</th>
                                            <th class="product-name">제목</th>
                                            <th class="product-price">작성자</th>
                                            <th class="product-price">작성일</th>
                                            <th class="product-price">조회수</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                    	<c:forEach items="${qto.qlist}" var="qvo">
                                        <tr>
                                            <td class="product-price">${qvo.qb_no}</td>
                                            <td class="product-name" style="text-align: left">
                                            	<c:forEach begin="1" end="${qvo.qb_indent }">&ensp;</c:forEach>
                                            	<c:if test="${qvo.qb_indent>0 }"><i class="material-icons">&#xe5da;</i></c:if>
                                            	<c:forEach begin="1" end="${qvo.qb_indent }">RE:</c:forEach>
                                            	<a href="/qna_board/read/${qvo.qb_no}">${qvo.qb_title}</a>
                                            </td>
                                            <td class="product-price">${qvo.qb_writer}</td>
                                            <td class="product-price">${qvo.qb_regdate}</td>
                                            <td class="product-price">${qvo.qb_readcnt}</td>
                                        </tr>
                                        </c:forEach>
                                    </tbody>
                                </table>
                            </div>
						    <!-- class = row  -->		
							<div class="row">
								<div class="text-center">
									<ul class="htc__pagenation">
										<li>
											<c:if test="${qto.curPage-1 >= 1 }">
												<a href="/qna_board/list?curPage=${qto.curPage-1}">
													<i class="zmdi zmdi-chevron-left"></i>
												</a>
											</c:if>
										</li>
										<c:forEach begin="${qto.beginPageNum}" end="${qto.stopPageNum}" var="var">
											<li class="${qto.curPage == var?'active':''}"><a href="/qna_board/list?curPage=${var}">${var}</a></li>
										</c:forEach>
										<li>
											<c:if test="${qto.curPage < qto.totalPage }">
												<a href="/qna_board/list?curPage=${qto.curPage+1}">
													<i class="zmdi zmdi-chevron-right"></i>
												</a>
											</c:if> 
										</li>
									</ul>
								</div>
							</div>
							<!-- class = row  -->
                            <div class="row">
                                <div class="col-md-12 col-sm-12 col-xs-12">
                                    <div class="buttons-cart--inner">
                                        <div class="buttons-cart">
                                            <a href="/">BACK</a>
                                        </div>
                                        <div class="buttons-cart checkout--btn">
                                        	<c:if test="${not empty login}">
	                                            <a href="/qna_board/insert">WRITE</a>
                                        	</c:if>
                                        </div>
                                    </div>
                                </div>
                            </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- cart-main-area end -->


		<%@ include file="/resources/footer.jsp" %>  
</div>
<!-- Body main wrapper end -->

    <!-- Placed js at the end of the document so the pages load faster -->

    <!-- jquery latest version -->
    <script src="/resources/js/vendor/jquery-3.2.1.min.js"></script>
    <!-- Bootstrap framework js -->
    <script src="/resources/js/bootstrap.min.js"></script>
    <!-- All js plugins included in this file. -->
    <script src="/resources/js/plugins.js"></script>
    <script src="/resources/js/slick.min.js"></script>
    <script src="/resources/js/owl.carousel.min.js"></script>
    <!-- Waypoints.min.js. -->
    <script src="/resources/js/waypoints.min.js"></script>
    <!-- Main js file that contents all jQuery plugins activation. -->
    <script src="/resources/js/main.js"></script>

</body>
</html>