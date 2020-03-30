<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>   

<!-- Start Header Style -->
        <header id="htc__header" class="htc__header__area header--one">
            <!-- Start Mainmenu Area -->
            <div id="sticky-header-with-topbar" class="mainmenu__wrap sticky__header">
                <div class="container">
                    <div class="row">
                        <div class="menumenu__container clearfix">
                            <div class="col-lg-2 col-md-2 col-sm-3 col-xs-5"> 
                                <div class="logo">
                                     <a href="/"><img src="/resources/images/logo/4.png" alt="logo images"></a>
                                </div>
                            </div>
                            <div class="col-md-7 col-lg-8 col-sm-5 col-xs-3">
                                <nav class="main__menu__nav hidden-xs hidden-sm">
                                    <ul class="main__menu">
                                        <li class="drop"><a href="#">WINE</a>
                                            <ul class="dropdown">
                                            	<li><a href="/wine/list">ALL</a></li>
			                                    <li><a href="/wine/selectList?wine_type=red">RED</a></li>
			                                    <li><a href="/wine/selectList?wine_type=white">WHITE</a></li>
			                                    <li><a href="/wine/selectList?wine_type=rose">ROSE</a></li>
			                                    <li><a href="/wine/selectList?wine_type=sparkling">SPARKLING</a></li>
			                                    <li><a href="/wine/selectList?wine_type=champagne">CHAMPAGNE</a></li>
                                            </ul>
	                                    </li>
                                        
                                        <li class="drop"><a href="#">BOARD</a>
                                            <ul class="dropdown">
                                                <li><a href="/review_board/list">REVIEW</a></li>
                                                <li><a href="/qna_board/list">Q&A</a></li>
                                            </ul>
                                        </li>
                                        <c:if test="${login.mem_type == 1}">
                                        	<li><a href="/member/list">MEMBER</a></li>
                                        	<li><a href="/wine/insert">PRODUCT</a></li>
                                        	<li><a href="/order/admin_orderlist">order</a></li>
                                        </c:if>
                                        
                                        <c:if test="${login.mem_type == 0}">
	                                        <li class="drop"><a href="#">MY PAGE</a>
	                                            <ul class="dropdown">
	                                            	<li><a href="/member/read/${login.mem_id}">profile</a></li>
	                                                <li><a href="/order/member_orderlist">order</a></li>
	                                            </ul>
	                                        </li>
                                        </c:if>
                                        
                                        <c:if test="${login.mem_type == 2}">
                                        	<li><a href="#">ceo</a></li>
                                        </c:if>
                                        	
                                        <c:choose>
                                        	<c:when test="${empty login}">
                                        		<li><a href="/member/loginui">LOGIN</a></li>
                                        	</c:when>
                                        	<c:otherwise>
												<li><a data-toggle="modal" href="#myModal">LOGOUT</a></li>
                                        	</c:otherwise>
                                        </c:choose>
                                        <li><a href="/cart/list">CART</a></li>
                                        <li><a href="/contact">CONTACT</a></li>
                                    </ul>
                                </nav>
                            </div>
                            <div class="col-md-3 col-lg-2 col-sm-4 col-xs-4">
                                <div class="header__right">
                                    <div class="header__search search search__open">
                                        <a href="#"><i class="icon-magnifier icons"></i></a>
                                    </div>
									<c:choose>
										<c:when test="${empty login}">
											<div class="header__account">
                                        		<a href="/member/loginui"><i class="icon-user icons"></i></a>
                                    		</div>
										</c:when>
										<c:otherwise>
											<div class="header__account">
                                        		<a data-toggle="modal" href="#myModal"><i class="icon-user icons"></i></a>
                                    		</div>
											<div class="modal fade" id="myModal" role="dialog">
												<div class="modal-dialog">
													<div class="modal-content">
														<div class="modal-header">
															<button type="button" class="close" data-dismiss="modal">&times;</button>
														</div>
														<div class="modal-body" style="text-align: center;">
															<br>
															<h3>로그아웃 하시겠습니까??</h3>
															<br> <a href="/member/logout" class="fr__btn">Yes</a>
															<br>
														</div>
														<div class="modal-footer"></div><br>
													</div>
												</div>
											</div>
										</c:otherwise>
									</c:choose>
                                    <div class="htc__shopping__cart">
                                        <a class="cart__menu" href="#"><i class="icon-handbag icons"></i></a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- End Mainmenu Area -->
        </header>
<!-- End Header Area -->

        <div class="body__overlay"></div>
        
		<!-- Start Offset Wrapper -->
        <div class="offset__wrapper">
          	<!-- Start Search Popap -->
            <div class="search__area">
                <div class="container" >
                    <div class="row" >
                        <div class="col-md-12" >
                            <div class="search__inner">
                                <form action="/wine/search" method="get">
                                    <input placeholder="Search..." type="text" name="content" id="content">
                                    <button type="submit"></button>
                                </form>
                                <div class="search__close__btn">
                                    <span class="search__close__btn_icon"><i class="zmdi zmdi-close"></i></span>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
          	<!-- End Search Popap -->
            
        	<!-- Start Cart Panel -->
            <div class="shopping__cart">
                <div class="shopping__cart__inner">
                    <div class="offsetmenu__close__btn">
                        <a href="#"><i class="zmdi zmdi-close"></i></a>
                    </div>
                    <div class="shp__cart__wrap">
                    
	                   	<c:set var="sum" value="0" />
 	                    	<c:forEach items="${clist}" var="cvo">
	                        <div class="shp__single__product">
	                            <div class="shp__pro__thumb">
	                                <a href="/wine/read/${cvo.cart_wineCode}">
	                                    <img src="${cvo.wine_thumbimg}" alt="product images">
	                                </a>
	                            </div>
	                            <div class="shp__pro__details">
	                                <h2><a href="/wine/read/${cvo.cart_wineCode}">${cvo.wine_name}</a></h2>
	                                <span class="quantity">QTY: ${cvo.cart_amount}</span>
	                                <span class="shp__price"><fmt:formatNumber value="${cvo.wine_price * cvo.cart_amount}" pattern="￦ ###,###,###" /></span>
	                            </div>
	                            <div class="remove__btn">
	                                <a href="/cart/delete/${cvo.cart_no}" title="Remove this item"><i class="zmdi zmdi-close"></i></a>
	                            </div>
	                        </div>
	                        <c:set var="sum" value="${sum + (cvo.wine_price * cvo.cart_amount)}" />
	                        </c:forEach> 
                    </div>
                    <ul class="shoping__total">
                        <li class="subtotal">Subtotal:</li>
                        <li class="total__price"><fmt:formatNumber value="${sum}" pattern="￦ ###,###,###" /></li>
                    </ul>
                    <ul class="shopping__btn">
                        <li><a href="/cart/list">View Cart</a></li>
                        
                    </ul>
                </div>
            </div>
        	<!-- End Cart Panel -->
        </div>
	<!-- End Offset Wrapper -->

