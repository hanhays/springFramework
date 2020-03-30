<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>    
<!DOCTYPE html>
<html class="no-js">
<head>
<meta charset="UTF-8">
<meta http-equiv="x-ua-compatible" content="ie=edge">
<title>사용자 주문내역 상세보기</title>
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
        <div class="ht__bradcaump__area" style="background: rgba(0, 0, 0, 0) url(/resources/images/bg/3.jpg) no-repeat scroll center center / cover ;">
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
											<th class="product-thumbnail">order wine</th>
											<th class="product-name">name of wine</th>
											<th class="product-price">price</th>
											<th class="product-quantity">quantity</th>
											<th class="product-subtotal">total</th>
										</tr>
									</thead>
									<tbody>
										<c:set var="sum" value="0" />
											<c:forEach items="${odlist}" var="odvo">
												<tr>
													<td class="product-thumbnail"><a href="/wine/read/${odvo.wine_code}"><img src="${odvo.wine_thumbimg}" alt="product img" /></a></td>
													<td class="product-name"><a href="/wine/read/${odvo.wine_code}">${odvo.wine_name}</a></td>
													<td class="product-price"><span class="amount"><fmt:formatNumber value="${odvo.wine_price}" pattern="￦ ###,###,###" /></span></td>
													<td class="product-quantity">${odvo.od_amount}</td>
													<td class="product-subtotal"><span class="amount"><fmt:formatNumber value="${odvo.wine_price * odvo.od_amount}" pattern="￦ ###,###,###" /></span></td>
												</tr>
												<c:set var="sum" value="${sum + (odvo.wine_price * odvo.od_amount)}" />
											</c:forEach>
									</tbody>
								</table>
							</div>
							
							<div class="row">
                                <div class="col-md-6 col-sm-12 col-xs-12"></div>
                                <div class="col-md-6 col-sm-12 col-xs-12 smt-40 xmt-40">
                                    <div class="htc__cart__total">
                                        <div class="cart__desk__list">
                                            <ul class="cart__desc">
                                                <li>order total</li>
                                                <li>tax</li>
                                                <li>shipping</li>
                                            </ul>
                                            <ul class="cart__price">
                                                <li><fmt:formatNumber value="${sum}" pattern="￦ ###,###,###" /></li>
                                                <li><fmt:formatNumber value="${sum * 0.1}" pattern="￦ ###,###,###" /></li>
                                                <li>￦ 2,500</li>
                                            </ul>
                                        </div>
                                        <div class="cart__total">
                                            <span>total</span>
                                            <span><fmt:formatNumber value="${sum + (sum*0.1) + 2500}" pattern="￦ ###,###,###" /></span>
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