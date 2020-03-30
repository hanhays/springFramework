<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>    
<!DOCTYPE html>
<html class="no-js">
<head>
<meta charset="UTF-8">
<meta http-equiv="x-ua-compatible" content="ie=edge">
<title>사용자 주문 내역</title>
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
        <div class="ht__bradcaump__area" style="background: rgba(0, 0, 0, 0) url(/resources/images/bg/777.jpg) no-repeat scroll center center / cover ;">
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
                    <div class="col-md-12 col-sm-12 col-xs-12">
                    
						<div class="table-content table-responsive">
							<table>
								<thead>
									<tr>
										<th class="product-name">order date</th>
										<th class="product-name">member id</th>
										<th class="product-name">order number(order_id)</th>
										<th class="product-price">order cost</th>
										<th class="product-name">order state</th>
										<th class="product-name">confirm</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach items="${admin_olist}" var="ovo">
									<tr>
										<td class="product-name">${ovo.order_regdate}</td>
										<td class="product-name">${ovo.order_memId}</td>
										<td class="product-name"><a href="/order/read/${ovo.order_idnumber}">${ovo.order_idnumber}</a></td>
										<td class="product-price"><span class="amount"><fmt:formatNumber value="${ovo.order_totalprice}" pattern="￦ ###,###,###" /></span></td>
										<td class="product-name">
											<c:choose>
												<c:when test="${ovo.order_state == 0 && ovo.order_cancel == 0}">주문중</c:when>
												<c:when test="${ovo.order_state == 0 && ovo.order_cancel == 1}">주문취소요청중</c:when>
												<c:when test="${ovo.order_state == 1 && ovo.order_cancel == 0}">주문완료</c:when>
												<c:when test="${ovo.order_state == 1 && ovo.order_cancel == 1}">취소완료</c:when>
											</c:choose>
										</td>
										<td class="product-name">
											<c:choose>
												<c:when test="${ovo.order_state == 0 && ovo.order_cancel == 0}">
													<!-- order_state = 1 로 갱신  -->
													<a href="/order/shipping/${ovo.order_idnumber}">배송하기</a>
												</c:when>
												<c:when test="${ovo.order_state == 0 && ovo.order_cancel == 1}">
													<!-- order_state = 1 로 갱신  -->
													<a href="/order/cancelconfrim/${ovo.order_idnumber}">주문취소승인</a>
												</c:when>
											</c:choose>
										</td>
									</tr>
									</c:forEach>
											
								</tbody>
							</table>
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