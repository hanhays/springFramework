<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>    
<!DOCTYPE html>
<html class="no-js">
<head>
<meta charset="UTF-8">
<meta http-equiv="x-ua-compatible" content="ie=edge">
<title>상품 목록</title>
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


        <!-- Start Product Grid -->
        <section class="htc__product__grid bg__white ptb--100">
            <div class="container">
                <div class="row">
                    <div class="col-lg-9 col-lg-push-3 col-md-9 col-md-push-3 col-sm-12 col-xs-12">
                        <div class="htc__product__rightidebar">
                            <div class="htc__grid__top">
                                <div class="htc__select__option">
                                    
                                </div>
                                <div class="ht__pro__qun"></div>
                                <!-- Start List And Grid View -->
                                <ul class="view__mode" role="tablist">
                                    <li role="presentation" class="grid-view active"><a href="#grid-view" role="tab" data-toggle="tab"><i class="zmdi zmdi-grid"></i></a></li>
                                    <li role="presentation" class="list-view"><a href="#list-view" role="tab" data-toggle="tab"><i class="zmdi zmdi-view-list"></i></a></li>
                                </ul>
                                <!-- End List And Grid View -->
                            </div>
                            
                            <!-- Start Product View -->
                            <div class="row">
                                <div class="shop__grid__view__wrap">
                                    <div role="tabpanel" id="grid-view" class="single-grid-view tab-pane fade in active clearfix">
                                        <c:forEach items="${to.wlist}" var="wdto">
                                        <!-- Start Single Product -->
                                        <div class="col-md-4 col-lg-4 col-sm-6 col-xs-12">
                                            <div class="category">
                                                <div class="ht__cat__thumb">
                                                    <a href="/wine/read/${wdto.wine_code}">
                                                        <img src="${wdto.wine_img}" alt="product images">
                                                    </a>
                                                </div>
                                                <div class="fr__hover__info">
                                                    <ul class="product__action">
                                                        <li><a href="/wine/read/${wdto.wine_code}"><i>${wdto.wine_readcnt}</i></a></li>
                                                        <li><a href="#"><i class="icon-handbag icons"></i></a></li>
                                                    </ul>
                                                </div>
                                                <div class="fr__product__inner">
                                                    <h4><a href="/wine/read/${wdto.wine_code}">${wdto.wine_name}</a></h4>
                                                    <ul class="fr__pro__prize">
                                                        <li><fmt:formatNumber value="${wdto.wine_price}" pattern="￦ ###,###,###"/></li>
                                                    </ul>
                                                </div>
                                            </div>
                                        </div>
                                        <!-- End Single Product -->
                                        </c:forEach>
                                    </div>
                                    <div role="tabpanel" id="list-view" class="single-grid-view tab-pane fade clearfix">
                                        <div class="col-xs-12">
                                            <div class="ht__list__wrap">
                                            	<c:forEach items="${to.wlist}" var="wdto">
                                                <!-- Start List Product -->
                                                <div class="ht__list__product">
                                                    <div class="ht__list__thumb">
                                                        <a href="/wine/read/${wdto.wine_code}"><img src="${wdto.wine_img}" alt="product images"></a>
                                                    </div>
                                                    <div class="htc__list__details">
                                                        <h2><a href="/wine/read/${wdto.wine_code}">${wdto.wine_name}</a></h2>
                                                        <ul  class="pro__prize">
                                                            <li><fmt:formatNumber value="${wdto.wine_price}" pattern="￦ ###,###,###"/></li>
                                                        </ul>
                                                        <p><span>Views:</span>&emsp;${wdto.wine_readcnt}</p>
                                                        <p style="font-family: 'Nanum Gothic', sans-serif;">${wdto.wine_info}</p>
                                                        <div class="fr__list__btn">
                                                            <a class="fr__btn" href="/wine/read/${wdto.wine_code}">READ MORE</a>
                                                        </div>
                                                    </div>
                                                </div>
                                                <!-- End List Product -->
                                    			</c:forEach>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!-- End Product View -->
                            
                        </div>
                        
                        
                        <!-- Start Pagenation -->
                        <div class="row">
                            <div class="col-xs-12">
                                <ul class="htc__pagenation">
									<li>
										<c:if test="${to.curPage-1 >= 1 }">
											<a href="/wine/${listname}curPage=${to.curPage-1}">
												<i class="zmdi zmdi-chevron-left"></i>
											</a>
										</c:if>
									</li>
									<c:forEach begin="${to.beginPageNum}" end="${to.stopPageNum}" var="var">
										<li class="${to.curPage == var?'active':''}"><a href="/wine/${listname}curPage=${var}">${var}</a></li>
									</c:forEach>
									<li>
										<c:if test="${to.curPage < to.totalPage }">
											<a href="/wine/${listname}curPage=${to.curPage+1}">
												<i class="zmdi zmdi-chevron-right"></i>
											</a>
										</c:if> 
									</li>
                                </ul>
                            </div>
                        </div>
                        <!-- End Pagenation -->
                        
                        
                    </div>
                    
                    
                    
                    <div class="col-lg-3 col-lg-pull-9 col-md-3 col-md-pull-9 col-sm-12 col-xs-12 smt-40 xmt-40">
                        <div class="htc__product__leftsidebar">
                            
                            <!-- Start Category Area -->
                            <div class="htc__category">
                                <h4 class="title__line--4">categories</h4>
                                <ul class="ht__cat__list">
                                	<li><a href="/wine/list">ALL</a></li>
                                    <li><a href="/wine/selectList?wine_type=red">RED</a></li>
                                    <li><a href="/wine/selectList?wine_type=white">WHITE</a></li>
                                    <li><a href="/wine/selectList?wine_type=rose">ROSE</a></li>
                                    <li><a href="/wine/selectList?wine_type=sparkling">SPARKLING</a></li>
                                    <li><a href="/wine/selectList?wine_type=champagne">CHAMPAGNE</a></li>
                                </ul>
                            </div>
                            <!-- End Category Area -->
                            
                   
                            <!-- Start Best Sell Area -->
                            <div class="htc__recent__product">
                                <h2 class="title__line--4">best seller</h2>
                                <div class="htc__recent__product__inner">
                                    
                                    <c:forEach items="${to.wlist}" begin="1" end="5" var="wdto">
                                    <!-- Start Single Product -->
                                    <div class="htc__best__product">
                                        <div class="htc__best__pro__thumb">
                                            <a href="/wine/read/${wdto.wine_code}">
                                                <img src="${wdto.wine_thumbimg}" alt="small product">
                                            </a>
                                        </div>
                                        <div class="htc__best__product__details">
                                            <h2><a href="/wine/read/${wdto.wine_code}">${wdto.wine_name}</a></h2>
                                            <ul class="rating">
                                                <li><i class="icon-star icons"></i></li>
                                                <li><i class="icon-star icons"></i></li>
                                                <li><i class="icon-star icons"></i></li>
                                                <li class="old"><i class="icon-star icons"></i></li>
                                                <li class="old"><i class="icon-star icons"></i></li>
                                            </ul>
                                            <ul  class="pro__prize">
                                                <li><fmt:formatNumber value="${wdto.wine_price}" pattern="￦ ###,###,###"/></li>
                                            </ul>
                                        </div>
                                    </div>
                                    <!-- End Single Product -->
                                    </c:forEach>
                                                                        
                                </div>
                            </div>
                            <!-- End Best Sell Area -->
                            
                            
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- End Product Grid -->



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