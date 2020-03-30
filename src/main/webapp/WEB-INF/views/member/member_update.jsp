<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>    
<!DOCTYPE html>
<html class="no-js">
<head>
<meta charset="UTF-8">
<meta http-equiv="x-ua-compatible" content="ie=edge">
<title>회원정보수정</title>
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
        <div class="ht__bradcaump__area" style="background: rgba(0, 0, 0, 0) url(/resources/images/bg/45.jpeg) no-repeat scroll center center / cover ;">
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
							<h1 class="title__line--6" style="text-align: center">UPDATE</h1>
						</div>
					</div>
					<div class="accordion__body">
						<div class="col-xs-12">
							<div class="col-xs-2"></div>
							<form id="contact-form" action="/member/update" method="post">
								<div class="col-xs-4">
									<div class="checkout-method__login">
										<div class="single-input">
											<div class="contact-box subject">
												<label for="id">ID</label>
												<input readonly id="id" type="text" name="mem_id" value="${dto.mem_id}">
											</div>
										</div>
										<div class="single-input">
											<div class="contact-box subject">
												<label for="pw">PASSWORD</label>
												<input required id="pw" type="password" name="mem_pw">
												<span id="pwmsg"></span>(영문대소문자/숫자 중 2가지 이상 조합, 4~10자)
											</div>
										</div>
										<div class="single-input">
											<div class="contact-box subject">
												<label for="pwck">PASSWORD CHECK</label>
												<input required id="pwck" type="password" name="pwcheck">
												<span id="pwcheckmsg"></span>
											</div>
										</div>
										<div class="single-input">
											<div class="contact-box subject">
												<label for="name">NAME</label>
												<input required id="name" type="text" name="mem_name" value="${dto.mem_name}">
											</div>
										</div>
										<div class="single-input">
											<div class="contact-box subject">
												<label for="gender">GENDER</label><br>&emsp;&emsp;&emsp;&emsp;
												<input required id="gender" type="radio" name="mem_gender" value="m" checked>Mail&emsp;&emsp;
												<input required id="gender" type="radio" name="mem_gender" value="f">Femail
											</div>
										</div>
										<div class="single-input">
											<div class="contact-box subject">
												<label for="contact">PHONE NUMBER</label>
												<input required id="contact" type="tel" name="mem_contact" onKeyup="inputPhoneNumber(this);" maxlength="13" placeholder="000-0000-0000" value="${dto.mem_contact}">
											</div>
										</div>
										<div class="single-input">
											<div class="contact-box subject">
												<label for="birth">BIRTH</label>
												<input readonly id="birth" type="text" name="mem_birth" value="${dto.mem_birth}">
											</div>
										</div>
										<div class="single-input">
											<div class="contact-box subject">
												<label for="regdate">REGISTE DATE</label>
												<input readonly id="regdate" type="text" name="mem_regdate" value="${dto.mem_regdate}">
											</div>
										</div>
										<p class="require">* Required fields</p><br><br>
									</div>
									<div class="single-contact-form">
										<div class="single-contact-form">
											<div class="contact-box subject">
												<label for="email">E-MAIL</label><br>
												<input id="email" type="email" name="mem_email" value="${dto.mem_email}">
											</div>
										</div>
										<div class="single-contact-form">
											<div class="contact-box subject">
												<label for="add1">POSTAL CODE</label><br>
												<input id="add1" type="text" name="mem_address1" value="${dto.mem_address1}">
											</div>
										</div>
										<div class="single-contact-form">
											<div class="contact-box subject">
												<label for="add2">ADDRESS 1</label><br>
												<input id="add2" type="text" name="mem_address2" value="${dto.mem_address2}">
											</div>
										</div>
										<div class="single-contact-form">
											<div class="contact-box subject">
												<label for="add3">ADDRESS 2</label><br>
												<input id="add3" type="text" name="mem_address3" value="${dto.mem_address3}">
											</div>
										</div>
										<div class="contact-btn">
                                    		<button id="submit" type="submit" class="fv-btn">UPDATE</button>
                                		</div>
                                		<br><br><br><br><br><br><br><br>
									</div>
								</div>
							</form>
							<div class="col-xs-6"></div>
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
    
<script type="text/javascript">
   $(document).ready(function() {
      var ckpw = '0';
      var ckpwck = '0';
      $("input[name='mem_pw']").change(function() {
         var pw = $("input[name='mem_pw']").val();
         var limit = /^[a-zA-Z0-9]{4,10}$/;
         if (!limit.test(pw)) {
            $("#pwmsg").text("4이상 10이하 영문대소문자/숫자를 이용하세요.");
            $("#pwmsg").css("color", "red");
            ckpw = '0';
         } else {
            $("#pwmsg").text("");
            ckpw = '1';
         }
      });
      $("input[name='pwcheck']").change(function() {
         var pw = $("input[name='mem_pw']").val();
         var pwcheck = $("input[name='pwcheck']").val();
         if (pw != pwcheck) {
            $("#pwcheckmsg").text("비밀번호가 일치하지 않습니다.");
            $("#pwcheckmsg").css("color", "red");
            ckpwck = '0';
         } else {
            $("#pwcheckmsg").text("비밀번호가 일치합니다.");
            $("#pwcheckmsg").css("color", "blue");
            ckpwck = '1';
         }
      });
      $("#submit").click(function() {
        if (ckpw != '1') {
            alert("사용 가능한 비밀번호를 입력하시오.");
         } else if (ckpwck != '1') {
            alert("비밀번호가 일치하지 않습니다.");
         } else if(confirm("정보를 수정하시겠습니까?") == true){
        	 return true;
         }
		return false;
      });
   });
   
   
function inputPhoneNumber(obj) {
    var number = obj.value.replace(/[^0-9]/g, "");
    var phone = "";
    if(number.length < 4) {
        return number;
    } else if(number.length < 7) {
        phone += number.substr(0, 3);
        phone += "-";
        phone += number.substr(3);
    } else if(number.length < 11) {
        phone += number.substr(0, 3);
        phone += "-";
        phone += number.substr(3, 3);
        phone += "-";
        phone += number.substr(6);
    } else {
        phone += number.substr(0, 3);
        phone += "-";
        phone += number.substr(3, 4);
        phone += "-";
        phone += number.substr(7);
    }
    obj.value = phone;
}
</script>

</body>
</html>