<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>    
<!DOCTYPE html>
<html class="no-js">
<head>
<meta charset="UTF-8">
<meta http-equiv="x-ua-compatible" content="ie=edge">
<title>REVIEW</title>
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

<style>
 section.replyList { padding:30px 0; }
 section.replyList ol { padding:0; margin:0; }
 section.replyList ol li { padding:10px 0; border-bottom:2px solid #eee; }
 section.replyList div.userInfo { }
 section.replyList div.userInfo .userName { font-size:24px; font-weight:bold; }
 section.replyList div.userInfo .date { color:#999; display:inline-block; margin-left:10px; }
 section.replyList div.replyContent { padding:10px; margin:20px 0; }
</style>    

</head>
<body>
<!-- Body main wrapper start -->
<div class="wrapper">   
<%@ include file="/resources/header.jsp" %>

 	<!-- Start Bradcaump area -->
    <div class="ht__bradcaump__area" style="background: rgba(0, 0, 0, 0) url(/resources/images/bg/1.jpg) no-repeat scroll center center / cover ;">
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
							<h1 class="title__line--6" style="text-align:center">REVIEW</h1>
						</div>
					</div>
					
					<div class="col-xs-12">
						<div class="ht__testimonial__activation clearfix">
							<!-- Start Single Testimonial -->
							<div class="col-lg-12 col-md-12 single__tes">
								<div class="testimonial">
									<div class="testimonial__thumb">
										<a href="/wine/read/${rvo.wine_code}"><img src="${rvo.wine_img}" alt="wine_thumbimg images"></a>
									</div>
									<div class="testimonial__details">
										<h4><a href="/wine/read/${rvo.wine_code}">${rvo.wine_name}</a></h4>
										<p>${rvo.wine_code}</p>
										<p>${rvo.wine_type}</p>
										<p>${rvo.wine_price}</p>
									</div>
								</div>
							</div>
							<!-- End Single Testimonial -->
						</div>
					</div>

					<div class="col-xs-2"></div>
                    <div class="col-xs-8">
                            <div class="table-content table-responsive">
                                <table>
                                    <thead>
                                    </thead>
                                    <tbody>
						 				<tr>
											<td style="font-weight: bold; width: 20%;">제목</td>
											<td style="text-align: left;">${rvo.rb_title}</td>
										</tr>
										<tr>
											<td style="font-weight: bold; width: 20%;">작성자</td>
											<td style="text-align: left;">${rvo.rb_writer}</td>
										</tr>
										<tr>
											<td style="font-weight: bold; width: 20%;">작성일</td>
											<td style="text-align: left;">${rvo.rb_regdate}</td>
										</tr>
										<tr>
											<td style="font-weight: bold; width: 20%;">조회수</td>
											<td style="text-align: left;">${rvo.rb_readcnt}</td>
										</tr>
										<tr>
											<td style="font-weight: bold; width: 20%;">내용</td>
											<td style="text-align: left;">${rvo.rb_content}</td>
										</tr>
                                    </tbody>
                                </table>
                            </div>

							<!-- class = row  -->
                            <div class="row">
                                <div class="col-xs-12">
                                    <div class="buttons-cart--inner">
                                        <div class="buttons-cart">
                                            <a href="/review_board/list">BACK TO LIST</a>
                                            <c:if test="${login.mem_id == rvo.rb_writer}">
                                            	<a href="/review_board/update/${rvo.rb_no}">UPDATE</a>
                                            </c:if>
                                        </div>
                                        <div class="send__btn">
                                        	<c:if test="${login.mem_id == rvo.rb_writer}">
	                                            <a class="fr__btn" data-toggle="modal" href="#delete">delete</a>
                                        	</c:if>
                                        </div>
										<div class="modal fade" id="delete" role="dialog">
											<div class="modal-dialog">
												<div class="modal-content">
													<div class="modal-header">
														<button type="button" class="close" data-dismiss="modal">&times;</button>
													</div>
													<div class="modal-body" style="text-align: center;">
														<br>
														<h3>삭제 하시겠습니까??</h3>
														<br> <a href="/review_board/delete/${rvo.rb_no}" class="fr__btn">Yes</a>
														<br>
													</div>
													<div class="modal-footer"></div>
													<br>
												</div>
											</div>
										</div>
									</div>
                                </div>
                            </div>
					</div>
                </div>



				<!-- 댓글입력 start  -->
				<div class="row">
					<div class="col-md-2"></div>
					<div class="col-md-8">
						<div class="checkout__inner">
							<div class="accordion">
								<div class="accordion__title">회원에게만 댓글 작성 권한이 있습니다.</div>
								<div class="accordion__body">
									<div class="shipinfo">
										<a href="#" class="ship-to-another-trigger"><i class="zmdi zmdi-long-arrow-right"></i>댓글 작성하기</a>
										<div class="ship-to-another-content">
											<form action="/review_board_reply/insert" method="post">
												<div class="row">
													<div class="col-md-6">
														<div class="single-input">
															<label for="writer">작성자</label>
															<input readonly id="writer" type="text" name="rpy_writer" value="${login.mem_id}">
															<input type="hidden" name="rpy_bno" value="${rvo.rb_no}">
														</div>
													</div>
													<div class="col-md-6"></div>
													<div class="col-md-12">
														<div class="single-input">
															<label for="content">내용</label>
															<textarea rows="3" id="content" name="rpy_content"></textarea>
														</div>
													</div>
													<div class="col-md-12">
														<button id="submit" type="submit" class="fv-btn">WRITE</button>
													</div>
												</div>
											</form>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="col-md-2"></div>
				</div>
				<!-- 댓글입력 end  -->


				<!-- 댓글   -->
				<div class="row">
					<div class="col-md-2"></div>
					<div class="col-md-8">
						<section class="replyList">
							<ol>
								<c:forEach items="${replylist}" var="reply">
									<li>
										<div class="userInfo">
											<span class="userName">${reply.rpy_writer}</span>
											<span class="date">${reply.rpy_regdate}</span>&nbsp;&nbsp;&nbsp;&nbsp;
											<c:if test="${reply.rpy_writer == login.mem_id}">
												<a class="" href="/review_board_reply/delete/${reply.rpy_no}"><i class="icon-trash icons"></i></a>
											</c:if>
										</div>
										<div class="replyContent">${reply.rpy_content}</div>
									</li>
								</c:forEach>
							</ol>
						</section>
					</div>
					<div class="col-md-2"></div>
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