<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>    
<!DOCTYPE html>
<html class="no-js">
<head>
<meta charset="UTF-8">
<meta http-equiv="x-ua-compatible" content="ie=edge">
<title>문의한거 수정하기</title>
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
                            	<h1 style="color:white;"></h1>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- End Bradcaump area -->

		<!-- class = container  -->
		<div class="container">
			<div class="row">
				<div class="contact-form-wrap mt--60">
					<div class="col-xs-12">
						<div class="contact-title">
							<h1 class="title__line--6" style="text-align: center">문의한 글 수정하기</h1>
						</div>
					</div>
					<div class="accordion__body">
						<div class="col-xs-12">
							<div class="col-xs-1"></div>
							<form id="contact-form" action="/qna_board/update" method="post">
								<div class="col-xs-10">
									<div class="checkout-method__login">
										<div class="single-input">
											<div class="contact-box subject">
												<label for="id">작성자</label>
												<input readonly id="id" type="text" name="qb_writer" value="${qvo.qb_writer}">
												<input type="hidden" name="qb_no" value="${qvo.qb_no}">
											</div>
										</div>
										<div class="single-input">
											<div class="contact-box subject">
												<label for="title">제목</label>
												<input required id="title" type="text" name="qb_title" value="${qvo.qb_title}">
											</div>
										</div>
										<div class="single-input">
											<div class="contact-box subject">
												<label for="content">내용</label>
												<textarea rows="5" id="content" class="form-control" name="qb_content">${qvo.qb_content}</textarea>
											</div>
										</div>
										<br><br>
										<button id="submit" type="submit" class="fv-btn">UPDATE</button><br><br><br><br>
									</div>
								</div>
							</form>
							<div class="col-xs-1"></div>
							<div class="form-output">
								<p class="form-messege"></p>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- class = container  -->



	

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