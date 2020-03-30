<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html class="no-js">
<head>
<meta charset="UTF-8">
<meta http-equiv="x-ua-compatible" content="ie=edge">
<title>Q&A</title>
<meta name="description" content="">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- Place favicon.ico in the root directory -->
<link rel="shortcut icon" type="image/x-icon"
	href="/resources/images/favicon.ico">
<link rel="apple-touch-icon" href="apple-touch-icon.png">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
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
section.replyList {
	padding: 30px 0;
}

section.replyList ol {
	padding: 0;
	margin: 0;
}

section.replyList ol li {
	padding: 10px 0;
	border-bottom: 2px solid #eee;
}

section.replyList div.userInfo {
	
}

section.replyList div.userInfo .userName {
	font-size: 24px;
	font-weight: bold;
}

section.replyList div.userInfo .date {
	color: #999;
	display: inline-block;
	margin-left: 10px;
}

section.replyList div.replyContent {
	padding: 10px;
	margin: 20px 0;
}
</style>

</head>
<body>
	<!-- Body main wrapper start -->
	<div class="wrapper">
		<%@ include file="/resources/header.jsp"%>

		<!-- Start Bradcaump area -->
		<div class="ht__bradcaump__area"
			style="background: rgba(0, 0, 0, 0) url(/resources/images/bg/1.jpg) no-repeat scroll center center/cover;">
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
							<h1 class="title__line--6" style="text-align: center">Q&A</h1>
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
										<td style="text-align: left;">${qvo.qb_title}</td>
									</tr>
									<tr>
										<td style="font-weight: bold; width: 20%;">작성자</td>
										<td style="text-align: left;">${qvo.qb_writer}</td>
									</tr>
									<tr>
										<td style="font-weight: bold; width: 20%;">작성일</td>
										<td style="text-align: left;">${qvo.qb_updatedate}</td>
									</tr>
									<tr>
										<td style="font-weight: bold; width: 20%;">조회수</td>
										<td style="text-align: left;">${qvo.qb_readcnt}</td>
									</tr>
									<tr>
										<td style="font-weight: bold; width: 20%;">내용</td>
										<td style="text-align: left;">${qvo.qb_content}</td>
									</tr>
								</tbody>
							</table>
						</div>

						<!-- class = row  -->
						<div class="row">
							<div class="col-xs-12">
								<div class="buttons-cart--inner">
									<div class="buttons-cart">
										<a href="/qna_board/list">BACK TO LIST</a>
										<c:if test="${login.mem_id == qvo.qb_writer}">
											<a href="/qna_board/update/${qvo.qb_no}">UPDATE</a>
										</c:if>
										<c:if test="${not empty login}">
											<a href="/qna_board/reply/${qvo.qb_no} ">REPLY</a>
										</c:if>
									</div>
									<div class="send__btn">
										<c:if test="${login.mem_id == qvo.qb_writer}">
											<a class="fr__btn" data-toggle="modal" href="#delete">DELETE</a>
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
													<br> <a href="/qna_board/delete/${qvo.qb_no}"
														class="fr__btn">Yes</a> <br>
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
			</div>
		</div>
		<!-- cart-main-area end -->


		<%@ include file="/resources/footer.jsp"%>
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