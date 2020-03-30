<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>    
<!DOCTYPE html>
<html class="no-js">
<head>
<meta charset="UTF-8">
<meta http-equiv="x-ua-compatible" content="ie=edge">
<title>회원목록</title>
<meta name="description" content="">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- Place favicon.ico in the root directory -->
<link rel="shortcut icon" type="image/x-icon" href="/resources/images/favicon.ico">
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
							<h1 class="title__line--6" style="text-align:center">MEMBER LIST</h1>
						</div>
					</div>
                    <div class="col-md-12 col-sm-12 col-xs-12">
                            <div class="table-content table-responsive">
                                <table>
                                    <thead>
                                        <tr>
                                        	<th class="product-price">번호</th>
                                            <th class="product-price">가입일</th>
                                            <th class="product-name">아이디</th>
                                            <th class="product-price">이름</th>
                                            <th class="product-price">성별</th>
                                            <th class="product-price">연락처</th>
                                            <th class="product-price">생년월일</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                    	<c:forEach items="${to.list}" var="dto">
                                        <tr>
                                            <td class="product-price">${dto.rownum}</td>
                                            <td class="product-price">${dto.mem_regdate}</td>
                                            <td class="product-name"><a href="/member/read/${dto.mem_id}">${dto.mem_id}</a></td>
                                            <td class="product-price">${dto.mem_name}</td>
                                            <td class="product-price">${dto.mem_gender}</td>
                                            <td class="product-price">${dto.mem_contact}</td>
                                            <td class="product-price">${dto.mem_birth}</td>
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
											<c:if test="${to.curPage-1 >= 1 }">
												<a href="/member/list?curPage=${to.curPage-1}">
													<i class="zmdi zmdi-chevron-left"></i>
												</a>
											</c:if>
										</li>
										<c:forEach begin="${to.beginPageNum}" end="${to.stopPageNum}" var="var">
											<li class="${to.curPage == var?'active':''}"><a href="/member/list?curPage=${var}">${var}</a></li>
										</c:forEach>
										<li>
											<c:if test="${to.curPage < to.totalPage }">
												<a href="/member/list?curPage=${to.curPage+1}">
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