<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en">
 <head>
<meta charset="utf-8" />
<title>Fooding</title>
<!-- SEO Meta Tags-->
<META HTTP-EQUIV="Cache-Control" CONTENT="no-cache">
<META HTTP-EQUIV="Pragma" CONTENT="no-cache">
<META HTTP-EQUIV="Expires" CONTENT="-1">
<meta name="description"
	content="MStore - Modern Bootstrap E-commerce Template" />
	
<meta name="keywords"
	content="bootstrap, shop, e-commerce, market, modern, responsive,  business, mobile, bootstrap 4, html5, css3, jquery, js, gallery, slider, touch, creative, clean" />
<meta name="author" content="Createx Studio" />
<!-- Viewport-->
<meta name="viewport" content="width=device-width, initial-scale=1" />
<!-- Favicon and Touch Icons-->
<link rel="apple-touch-icon" sizes="180x180" href="apple-touch-icon.png" />
<link rel="icon" type="image/png" sizes="32x32" href="favicon-32x32.png" />
<link rel="icon" type="image/png" sizes="16x16" href="favicon-16x16.png" />
<link rel="manifest" href="site.webmanifest" />
<link rel="mask-icon" color="#111" href="safari-pinned-tab.svg" />
<meta name="msapplication-TileColor" content="#111" />
<meta name="theme-color" content="#ffffff" />
<!-- Vendor Styles including: Font Icons, Plugins, etc.-->
<link rel="stylesheet" media="screen" href="css/vendor.min.css" />
<!-- Main Theme Styles + Bootstrap-->
<link rel="stylesheet" media="screen" id="main-styles"
	href="css/theme.min.css" />
<!-- Customizer styles and scripts-->

<script src="https://code.jquery.com/jquery-3.6.1.js"></script>
	<!-- JavaScript (jQuery) libraries, plugins and custom scripts-->
	<script src="js/vendor.min.js"></script>
	<script src="js/theme.min.js"></script>
	
	
</head>
<!-- Body-->
<body>

	<%--   ======================================상단 네비바 <<START>>======================================= --%>
	<div class="offcanvas offcanvas-reverse" id="offcanvas-search">
				<div
					class="offcanvas-header d-flex justify-content-between align-items-center">
					<h3 class="offcanvas-title">푸딩 - 검색</h3>
					<button class="close" type="button" data-dismiss="offcanvas"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<form>
				<div class="offcanvas-body">
					<div class="offcanvas-body-inner">
						<div class="input-group pt-3">
							<div class="input-group-prepend">
								<span class="input-group-text" id="search-icon"><i
									data-feather="search"></i></span>
							</div>
							<input class="form-control" type="text" id="site-search" name="main_search"
								placeholder="지역,음식,레스토랑 명 검색" aria-label="Search site"
								aria-describedby="search-icon" onsubmit="<%=request.getContextPath() %>/main_search.do?keyword=" />
						</div>
						<small class="form-text pt-1">원하는 지역, 음식, 레스토랑을 자유럽게 검색해보세요!<br> Powered by Fooding.co  _Dong</small>
					</div>
				</div>
				</form>
			</div>




	<%
	String userID = null; // 로그인이 된 사람들은 로그인정보를 담을 수 있도록한다
	if (session.getAttribute("id") != null) {
		userID = (String) session.getAttribute("id");
	}

	%>

	<!-- Off-canvas account-->
	<div class="offcanvas offcanvas-reverse" id="offcanvas-account">
		<div
			class="offcanvas-header d-flex justify-content-between align-items-center">
			<h3 class="offcanvas-title">로그인 / 회원가입</h3>
			<button class="close" type="button" data-dismiss="offcanvas"
				aria-label="Close">
				<span aria-hidden="true">&times;</span>
			</button>
		</div>
		
		<%-- 로그인 --%>
		<div class="offcanvas-body">
			<div class="offcanvas-body-inner">
				<ul class="nav nav-tabs nav-justified" role="tablist">
					<li class="nav-item"><a class="nav-link active" href="#signin"
						data-toggle="tab" role="tab"><i data-feather="log-in"></i>&nbsp;로그인</a></li>
					<li class="nav-item"><a class="nav-link" href="#signup"
						data-toggle="tab" role="tab"><i data-feather="user"></i>&nbsp;회원가입</a></li>
				</ul>
				<div class="tab-content pt-1">
					<div class="tab-pane fade show active" id="signin" role="tabpanel">
						<form class="needs-validation" novalidate method="post"
							action="<%=request.getContextPath()%>/login.do">
							<div class="form-group">
								<label class="sr-only" for="signin-id">ID</label>
								<div class="input-group">
									<div class="input-group-prepend">
										<span class="input-group-text" id="signin-id-icon"><i
											data-feather="mail"></i></span>
									</div>
									<input class="form-control" type="text" id="signin-id"
										placeholder="ID" aria-label="ID" name="id"
										aria-describedby="signin-id-icon" required />
									<div class="invalid-feedback">아이디를 입력해주세요.</div>
								</div>
							</div>
							<div class="form-group">
								<label class="sr-only" for="signin-password">Password</label>
								<div class="input-group">
									<div class="input-group-prepend">
										<span class="input-group-text" id="signin-password-icon"><i
											data-feather="lock"></i></span>
									</div>
									<input class="form-control" type="password"
										id="signin-password" placeholder="Password"
										aria-label="Password" name="pwd"
										aria-describedby="signin-password-icon" required />
									<div class="invalid-feedback">비밀번호를 입력해주세요.</div>
								</div>
							</div>
							<div class="custom-control custom-checkbox mb-3">
								<input class="custom-control-input" type="checkbox"
									id="remember-me" checked /> <label
									class="custom-control-label" for="remember-me">아이디 저장</label>
							</div>
							<button class="btn btn-primary btn-block" type="submit">
								로그인</button>
						</form>
					</div>

					<%-- 회원가입 --%>
					<div class="tab-pane fade" id="signup" role="tabpanel">
						<form method="post" class="needs-validation" novalidate action="<%=request.getContextPath()%>/member_join.do" id="signup-form" name="signup-form">
							<div class="form-group">
								<label class="sr-only" for="singup-id">아이디</label> <input
									class="form-control" type="text" id="signup-id"
									name="member_id" placeholder="아이디" aria-label="아이디" />
									<span class="feedback" id="signup-idchk"></span>
									<div class="invalid-feedback"></div>

							</div>
							<div class="form-group">
								<label class="sr-only" for="signup-password">비밀번호</label> <input
									class="form-control" type="password" id="signup-password"
									name="member_pwd" placeholder="Password" aria-label="Password"
									 />
								<span class="feedback" id="signup-pwdchk"></span>
								<div class="invalid-feedback"></div>
							</div>
							<div class="form-group">
								<label class="sr-only" for="signup-password-confirm">비밀번호
									확인</label> <input class="form-control" type="password"
									name="member_pwdchk" id="signup-password-confirm"
									placeholder="Confirm password" aria-label="Confirm password"
									 />
									 <span class="feedback" id="signup-pwdconfirm-chk"></span>
									 <div class="invalid-feedback"></div>
							</div>
							<div class="form-group">
								<label class="sr-only" for="signup-name">이름</label> <input
									class="form-control" type="text" id="signup-name"
									name="member_name" placeholder="이름" aria-label="Full name"
									/>
								<span class="feedback" id="signup-namechk"></span>
								<div class="invalid-feedback"></div>
							</div>
							<div class="form-group">
								<label class="sr-only" for="signup-email">이메일</label> <input
									class="form-control" type="email" id="signup-email"
									name="member_email" placeholder="Email"
									aria-label="Email address"/>
								<span class="feedback" id="signup-emailchk"></span>
								<div class="invalid-feedback"></div>
							</div>
							<div class="form-group">
								<label class="sr-only" for="signup-phone">연락처
									확인</label> <input class="form-control" type="text"
									name="member_phone" id="signup-phone"
									placeholder="Phone" aria-label="Phone"
									 />
								<span class="feedback" id="signup-phonechk"></span>
								<div class="invalid-feedback"></div>
							</div>
							<button class="btn btn-primary btn-block" type="button" onclick="checkAll()">
								가입하기</button>
								<button class="btn btn-primary btn-block" type="button" onclick="location.href='company-signup.jsp'">
								사업자 가입</button>
						
						</form>
						
						
					

					</div>
				</div>
				<div class="d-flex align-items-center pt-5">
					<hr class="w-100" />
					<div class="px-3 w-100 text-nowrap font-weight-semibold">소셜
						로그인</div>
					<hr class="w-100" />
				</div>
				<div class="text-center pt-4">
					<a class="social-btn sb-facebook mx-2 mb-3" href="#"
						data-toggle="tooltip" title="Facebook"><i
						class="flaticon-facebook"></i></a><a
						class="social-btn sb-google-plus mx-2 mb-3" href="#"
						data-toggle="tooltip" title="Google"><i
						class="flaticon-google-plus"></i></a><a
						class="social-btn sb-twitter mx-2 mb-3" href="#"
						data-toggle="tooltip" title="Twitter"><i
						class="flaticon-twitter"></i></a>
				</div>
			</div>
		</div>
	</div>

	
	<!-- Off-canvas cart-->
	<div class="offcanvas offcanvas-reverse" id="offcanvas-cart">
		<div
			class="offcanvas-header d-flex justify-content-between align-items-center">
			<h3 class="offcanvas-title">Your cart</h3>
			<button class="close" type="button" data-dismiss="offcanvas"
				aria-label="Close">
				<span aria-hidden="true">&times;</span>
			</button>
		</div>
		<div class="offcanvas-body">
			<div class="offcanvas-body-inner">
				<div class="text-right">
					<a class="text-danger btn-sm pr-0" href="#"><i class="mr-1"
						data-feather="x" style="width: 0.85rem; height: 0.85rem"></i>Clear
						cart</a>
				</div>
				<div class="widget widget-featured-entries pt-3">
					<div class="media">
						<div class="featured-entry-thumb mr-3">
							<a href="#"><img src="img/shop/widget/07.jpg" width="64"
								alt="Product thumb" /></a><span class="item-remove-btn"><i
								data-feather="x"></i></span>
						</div>
						<div class="media-body">
							<h6 class="featured-entry-title">
								<a href="#">Calvin Klein Jeans Keds</a>
							</h6>
							<p class="featured-entry-meta">
								1 <span class="text-muted">x</span> $125.00
							</p>
						</div>
					</div>
					<div class="media">
						<div class="featured-entry-thumb mr-3">
							<a href="#"><img src="img/shop/widget/08.jpg" width="64"
								alt="Product thumb" /></a><span class="item-remove-btn"><i
								data-feather="x"></i></span>
						</div>
						<div class="media-body">
							<h6 class="featured-entry-title">
								<a href="#">The North Face Hoodie</a>
							</h6>
							<p class="featured-entry-meta">
								1 <span class="text-muted">x</span> $134.00
							</p>
						</div>
					</div>
					<div class="media">
						<div class="featured-entry-thumb mr-3">
							<a href="#"><img src="img/shop/widget/09.jpg" width="64"
								alt="Product thumb" /></a><span class="item-remove-btn"><i
								data-feather="x"></i></span>
						</div>
						<div class="media-body">
							<h6 class="featured-entry-title">
								<a href="#">Medicine Chameleon Sunglasses</a>
							</h6>
							<p class="featured-entry-meta">
								1 <span class="text-muted">x</span> $47.00
							</p>
						</div>
					</div>
					<div class="media">
						<div class="featured-entry-thumb mr-3">
							<a href="#"><img src="img/shop/widget/10.jpg" width="64"
								alt="Product thumb" /></a><span class="item-remove-btn"><i
								data-feather="x"></i></span>
						</div>
						<div class="media-body">
							<h6 class="featured-entry-title">
								<a href="#">Adidas Performance Hat</a>
							</h6>
							<p class="featured-entry-meta">
								1 <span class="text-muted">x</span> $19.00
							</p>
						</div>
					</div>
					<hr />
					<div class="d-flex justify-content-between align-items-center py-3">
						<div class="font-size-sm">
							<span class="mr-2">Subtotal:</span><span
								class="font-weight-semibold text-dark">$325.00</span>
						</div>
						<a class="btn btn-outline-secondary btn-sm" href="cart.jsp">Expand
							cart<i class="mr-n2" data-feather="chevron-right"></i>
						</a>
					</div>
					<a class="btn btn-primary btn-sm btn-block"
						href="checkout-details.jsp"><i class="mr-1"
						data-feather="credit-card"></i>Checkout</a>
				</div>
			</div>
		</div>
	</div>
	<!-- Navbar Light-->
	<header class="navbar navbar-expand-lg navbar-light fixed-top bg-light">
		<div class="container-fluid navbar-inner">
			<!-- navbar brand-->
			<a class="navbar-brand" style="min-width: 100px" href="index.jsp"><img
				width="250" src="img/logo-fooding.png" alt="Fooding" /></a>
			<!-- navbar collapse area-->
			<div class="collapse navbar-collapse" id="menu">
				<!-- Site menu-->
				<ul class="navbar-nav">
					<li class="nav-item dropdown mega-dropdown dropdown-more"><a
						class="nav-link dropdown-toggle" href="#" data-toggle="dropdown">카테고리<i
							data-feather="more-horizontal"></i></a>
						<div class="dropdown-menu">
							<div class="dropdown-inner">
								<div class="dropdown-column">
									<div
										class="bg-position-center bg-no-repeat bg-size-cover text-center px-3 py-4 mb-3"
										style="background-image: url(img/megamenu/cat_bg02.jpg)">
										<h3 class="h5 text-white text-shadow my-3">지역별</h3>
									</div>
									<div class="widget widget-links">
										<ul>
											<li><a href="SearchKeyRestaurant.do?keyword=서울"><i
													class="widget-categories-indicator"
													data-feather="chevron-right"></i><span class="font-size-sm">서울</span></a></li>
											<li><a href="SearchKeyRestaurant.do?keyword=경기"><i
													class="widget-categories-indicator"
													data-feather="chevron-right"></i><span class="font-size-sm">경기</span></a></li>
											<li><a href="SearchKeyRestaurant.do?keyword=인천"><i
											class="widget-categories-indicator"
											data-feather="chevron-right"></i><span class="font-size-sm">인천</span></a></li>
											<li><a href="SearchKeyRestaurant.do?keyword=대구"><i
													class="widget-categories-indicator"
													data-feather="chevron-right"></i><span class="font-size-sm">대구</span></a></li>
											<li><a href="SearchKeyRestaurant.do?keyword=부산"><i
													class="widget-categories-indicator"
													data-feather="chevron-right"></i><span class="font-size-sm">부산</span></a></li>
											<li><a href="SearchKeyRestaurant.do?keyword=제주"><i
													class="widget-categories-indicator"
													data-feather="chevron-right"></i><span class="font-size-sm">제주</span></a></li>
										</ul>
									</div>
								</div>
								<div class="dropdown-column">
									<div
										class="bg-position-center bg-no-repeat bg-size-cover text-center px-3 py-4 mb-3"
										style="background-image: url(img/megamenu/cat_bg01.jpg)">
										<h3 class="h5 text-white text-shadow my-3">테마별</h3>
									</div>
									<div class="widget widget-links">
										<ul>
											<li><a href="SearchKeyRestaurant.do?keyword=데이트"><i
													class="widget-categories-indicator"
													data-feather="chevron-right"></i><span class="font-size-sm">데이트 코스</span></a></li>
											<li><a href="SearchKeyRestaurant.do?keyword=가족"><i
													class="widget-categories-indicator"
													data-feather="chevron-right"></i><span class="font-size-sm">가족모임</span></a></li>
											<li><a href="SearchKeyRestaurant.do?keyword=뷰"><i
													class="widget-categories-indicator"
													data-feather="chevron-right"></i><span class="font-size-sm">뷰가 좋은</span></a></li>
											<li><a href="SearchKeyRestaurant.do?keyword=전통"><i
													class="widget-categories-indicator"
													data-feather="chevron-right"></i><span class="font-size-sm">전통적인</span></a></li>
											<li><a href="SearchKeyRestaurant.do?keyword=비지니스"><i
													class="widget-categories-indicator"
													data-feather="chevron-right"></i><span class="font-size-sm">비지니스미팅</span></a></li>
											
										</ul>
									</div>
								</div>
								<div class="dropdown-column">
									<div
										class="bg-position-center bg-no-repeat bg-size-cover text-center px-3 py-4 mb-3"
										style="background-image: url(img/megamenu/cat_bg03.jpg)">
										<h3 class="h5 text-white text-shadow my-3">장르별</h3>
									</div>
									<div class="widget widget-links">
										<ul>
											<li><a href="SearchKeyRestaurant.do?keyword=고기"><i
													class="widget-categories-indicator"
													data-feather="chevron-right"></i><span class="font-size-sm">고기요리</span></a></li>
											<li><a href="SearchKeyRestaurant.do?keyword=한식"><i
													class="widget-categories-indicator"
													data-feather="chevron-right"></i><span class="font-size-sm">한식</span></a></li>
											<li><a href="SearchKeyRestaurant.do?keyword=양식"><i
													class="widget-categories-indicator"
													data-feather="chevron-right"></i><span class="font-size-sm">양식</span></a></li>
											<li><a href="SearchKeyRestaurant.do?keyword=중식"><i
													class="widget-categories-indicator"
													data-feather="chevron-right"></i><span class="font-size-sm">중식</span></a></li>
											<li><a href="SearchKeyRestaurant.do?keyword=일식"><i
													class="widget-categories-indicator"
													data-feather="chevron-right"></i><span class="font-size-sm">일식</span></a></li>
											<li><a href="SearchKeyRestaurant.do?keyword=아시안"><i
													class="widget-categories-indicator"
													data-feather="chevron-right"></i><span class="font-size-sm">아시안</span></a></li>
											<li><a href="SearchKeyRestaurant.do?keyword=카페"><i
													class="widget-categories-indicator"
													data-feather="chevron-right"></i><span class="font-size-sm">카페,디저트</span></a></li>
										</ul>
									</div>
								</div>
							</div>
						</div></li>
					<li class="nav-item dropdown mega-dropdown"><a
						class="nav-link dropdown-toggle" href="#" data-toggle="dropdown">게시판</a>
						<div class="dropdown-menu">
							<div class="dropdown-inner">
								<div class="dropdown-column">
									<div class="widget widget-links">
										<h3 class="widget-title">Shop layouts</h3>
										<ul>
											<li><a href="shop-style1-ls.jsp"> <i
													class="widget-categories-indicator"
													data-feather="chevron-right"> </i><span
													class="font-size-sm">Shop Style 1 - Left Sidebar</span></a></li>
											<li><a href="shop-style1-ls.jsp"> <i
													class="widget-categories-indicator"
													data-feather="chevron-right"> </i><span
													class="font-size-sm">Shop Style 1 - Left Sidebar</span></a></li>
										</ul>
									</div>
								</div>
								<div class="dropdown-column">
									<div class="widget widget-links">
										<h3 class="widget-title">Shop</h3>
										<ul>
											<li><a href="shop-categories-apparel.jsp"><i
													class="widget-categories-indicator"
													data-feather="chevron-right"></i><span class="font-size-sm">Shop
														Categories - Apparel</span></a></li>

											<li><a href="shop-single-apparel.jsp"><i
													class="widget-categories-indicator"
													data-feather="chevron-right"></i><span class="font-size-sm">Product
														Page #1 - Apparel</span></a></li>

											<li><a href="cart.jsp"><i
													class="widget-categories-indicator"
													data-feather="chevron-right"></i><span class="font-size-sm">Cart</span></a></li>
											<li><a href="checkout-details.jsp"><i
													class="widget-categories-indicator"
													data-feather="chevron-right"></i><span class="font-size-sm">Checkout
														- Details</span></a></li>
											<li><a href="checkout-shipping.jsp"><i
													class="widget-categories-indicator"
													data-feather="chevron-right"></i><span class="font-size-sm">Checkout
														- Shipping</span></a></li>
											<li><a href="checkout-payment.jsp"><i
													class="widget-categories-indicator"
													data-feather="chevron-right"></i><span class="font-size-sm">Checkout
														- Payment</span></a></li>
											<li><a href="checkout-review.jsp"><i
													class="widget-categories-indicator"
													data-feather="chevron-right"></i><span class="font-size-sm">Checkout
														- Review</span></a></li>
											<li><a href="checkout-complete.jsp"><i
													class="widget-categories-indicator"
													data-feather="chevron-right"></i><span class="font-size-sm">Checkout
														- Complete</span></a></li>
										</ul>
									</div>
								</div>
								<div class="dropdown-column">
									<a class="d-block mx-auto" href="#" style="max-width: 228px"><img
										class="d-block" src="img/megamenu/promo-banner.jpg"
										alt="Promo banner" /></a>
								</div>
							</div>
						</div></li>

					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle" href="#" data-toggle="dropdown">예약</a>
						<ul class="dropdown-menu">
							<li class="dropdown"><a
								class="dropdown-item dropdown-toggle" href="#"
								data-toggle="dropdown">Blog Layout</a>
								<ul class="dropdown-menu">
									<li><a class="dropdown-item" href="blog-rs.jsp">Blog
											Right Sidebar</a></li>
								</ul></li>
							<li class="dropdown-divider"></li>
							<li class="dropdown"><a
								class="dropdown-item dropdown-toggle" href="#"
								data-toggle="dropdown">Single Post Layout</a>
								<ul class="dropdown-menu">
									<li class="dropdown-divider"></li>
									<li><a class="dropdown-item" href="blog-single-ns.jsp">Post
											No Sidebar</a></li>
								</ul></li>
						</ul></li>
					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle" href="#" data-toggle="dropdown">내정보</a>
						<ul class="dropdown-menu">
							<li class="dropdown"><a
								class="dropdown-item dropdown-toggle" href="#"
								data-toggle="dropdown">User Account</a>
								<ul class="dropdown-menu">
									<li><a class="dropdown-item" href="account-orders.jsp">Orders
											History</a></li>
									<li class="dropdown-divider"></li>
									<li><a class="dropdown-item" href="account-profile.jsp">Profile
											Settings</a></li>
									<li class="dropdown-divider"></li>
									<li><a class="dropdown-item" href="account-address.jsp">Account
											Addresses</a></li>
									<li class="dropdown-divider"></li>
									<li><a class="dropdown-item" href="account-payment.jsp">Payment
											Methods</a></li>
									<li class="dropdown-divider"></li>
									<li><a class="dropdown-item" href="account-wishlist.jsp">Wishlist</a>
									</li>
									<li class="dropdown-divider"></li>
									<li><a class="dropdown-item" href="account-tickets.jsp">My
											Tickets</a></li>
									<li class="dropdown-divider"></li>
									<li><a class="dropdown-item"
										href="account-single-ticket.jsp">Single Ticket</a></li>
									<li class="dropdown-divider"></li>
									<li><a class="dropdown-item" href="account-signin.jsp">Sign
											In / Sign Up Page</a></li>
									<li class="dropdown-divider"></li>
									<li><a class="dropdown-item"
										href="account-password-recovery.jsp">Password Recovery</a></li>
								</ul></li>
							<li class="dropdown-divider"></li>
							<li><a class="dropdown-item" href="about.jsp">About Us</a></li>
							<li class="dropdown-divider"></li>
							<li><a class="dropdown-item" href="contacts.jsp">Contacts</a>
							</li>
							<li class="dropdown-divider"></li>
							<li class="dropdown"><a
								class="dropdown-item dropdown-toggle" href="#"
								data-toggle="dropdown">Help Center</a>
								<ul class="dropdown-menu">
									<li><a class="dropdown-item" href="help-topics.jsp">Help
											Topics</a></li>
									<li class="dropdown-divider"></li>
									<li><a class="dropdown-item" href="help-single-topic.jsp">Single
											Topic</a></li>
									<li class="dropdown-divider"></li>
									<li><a class="dropdown-item"
										href="help-submit-request.jsp">Submit a Request</a></li>
								</ul></li>
							<li class="dropdown-divider"></li>
							<li><a class="dropdown-item" href="product-comparison.jsp">Product
									Comparison</a></li>
							<li class="dropdown-divider"></li>
							<li><a class="dropdown-item" href="order-tracking.jsp">Order
									Tracking</a></li>
							<li class="dropdown-divider"></li>
							<li><a class="dropdown-item" href="404.jsp">404 Not
									Found</a></li>
						</ul></li>
					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle" href="#" data-toggle="dropdown"><i
							class="mr-1" data-feather="file-text"></i>레스토랑</a>
						<ul class="dropdown-menu">
							<li><a class="dropdown-item" href="<%=request.getContextPath() %>/board_main_list.do">
									<div class="d-flex py-1">
										<i class="mt-1 ml-n2" data-feather="file-text"
											style="width: 1.4375rem; height: 1.4375rem"></i>
										<div class="ml-2">
											<span class="d-block mb-n1">레스토랑 목록</span>
										</div>
									</div>
							</a></li>
							<li class="dropdown-divider"></li>
							<li><a class="dropdown-item" href="Board_Main_join.jsp">
									<div class="d-flex py-1">
										<i class="mt-1 ml-n2" data-feather="grid"
											style="width: 1.375rem; height: 1.375rem"></i>
										<div class="ml-2">
											<span class="d-block mb-n1">레스토랑 추가
											</span>
										</div>
									</div>
							</a></li>
							<li class="dropdown-divider"></li>
							<li><a class="dropdown-item" href="LoadRestaurantList.do">
									<div class="d-flex py-1">
										<i class="mt-1 ml-n2" data-feather="grid"
											style="width: 1.375rem; height: 1.375rem"></i>
										<div class="ml-2">
											<span class="d-block mb-n1">레스토랑 목록<br>(동현작업중)
											</span>
										</div>
									</div>
							</a></li>
							<li class="dropdown-divider"></li>
							<li><a class="dropdown-item"
								href="mailto:contact@createx.studio">
									<div class="d-flex py-1">
										<i class="mt-1 ml-n2" data-feather="life-buoy"
											style="width: 1.4375rem; height: 1.4375rem"></i>
										<div class="ml-2">
											<span class="d-block mb-n1">Support</span><small
												class="text-muted">contact@createx.studio</small>
										</div>
									</div>
							</a></li>
						</ul></li>
				</ul>
			</div>
			
			<!-- navbar buttons-->
			<div class="navbar-btns">
				<div class="navbar-btns-inner">
					<div class="navbar-toggler navbar-btn collapsed"
						data-toggle="collapse" data-target="#menu">
						<i class="mx-auto mb-1" data-feather="menu"></i>Menu
					</div>
					<form method="get" action="<%=request.getContextPath()%>/total_main_search.do">
						<div class="flex-grow-1 pb-3 pt-sm-3 my-1 pr-lg-4 order-sm-2">
							<div class="input-group flex-nowrap">
								<div class="input-group-prepend">
									<%-- 검색input테그 --%>

									<input class="form-control rounded" type="text"
										id="site-search" placeholder="통합 검색" name="keyword"
										aria-label="Search site" aria-describedby="search-icon">
									<%-- 검색input테그 END --%>

									<%-- 검색버튼 --%>
						

									<%-- 검색버튼 END--%>
								</div>

							</div>
						</div>
					</form>
					<%
					// 접속하기는 로그인이 되어있지 않은 경우만 나오게한다
					if (userID == null) {
					%>
					<a class="navbar-btn navbar-collapse-hidden"
						href="#offcanvas-account" data-toggle="offcanvas"><i
						class="mx-auto mb-1" data-feather="log-in"></i>로그인/가입</a>


					<%
					// 로그인이 되어있는 사람만 볼수 있는 화면
					} else {
					%>
					<a class="navbar-btn navbar-collapse-hidden"
						href="member/logout.jsp"><i
						class="mx-auto mb-1" data-feather="log-out"></i>로그아웃</a>

					<%
					}
					%>
					<a class="navbar-btn" href="#offcanvas-cart"
						data-toggle="offcanvas"><span
						class="d-block position-relative"><span
							class="navbar-btn-badge bg-primary text-light">4</span><i
							class="mx-auto mb-1" data-feather="shopping-cart"></i>관심 레스토랑</span></a>
				</div>
			</div>
		</div>
	</header>	
	<%--   ======================================상단 네비바 <<END>>======================================= --%>
	
	
    <!-- Page Title-->
    <div class="page-title-wrapper" aria-label="Page title">
      <div class="container">
        <nav aria-label="breadcrumb">
          <ol class="breadcrumb">
            <li class="mt-n1 mr-1"><i data-feather="home"></i></li>
            <li class="breadcrumb-item"><a href="index.jsp" style="font-family: 'GmarketSansMedium';">Home</a>
            </li>
            <li class="breadcrumb-item"><a href="#" style="font-family: 'GmarketSansMedium';">레스토랑 추천</a>
            </li>
          </ol>
        </nav>
       <h1 class="page-title" style="font-family: 'GmarketSansMedium';">레스토랑 추천&nbsp;🎲
  <span class="lead font-weight-semibold text-muted"></span>
</h1>
<span class="d-block mt-2 text-muted"></span>
<hr class="mt-4">
      </div>
    </div>
    <!-- Page Content  ==========================================================================================-->
 
    
    <!--가게정보 상세페이지  ==============================================================================================-->
    <h1 style="text-align: center; font-family: 'GmarketSansMedium';">이 레스토랑은 어떠신가요?</h1>
    <br>  <br>
    
     <c:set var="list" value="${List}" />
	    <c:if test="${!empty list }">
      <c:forEach items="${list }" var="dto">
		    <div class="modal modal-quick-view fade" id="quick-view${dto.getMain_idx()}" tabindex="-1" role="dialog">
		      <div class="modal-dialog" role="document">
		        <div class="modal-content">
		          <div class="modal-header">
		            <div>
		              <h2 class="h2 modal-title mb-1" style="font-family: 'GmarketSansMedium';">${dto.getMain_name()}</h2>
		              <h5 class="text-primary font-weight-light mb-0" style="font-family: 'GmarketSansMedium';">${dto.getMain_info() }</h5>
		            </div>
		            <button class="close" type="button" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
		          </div>
		          <div class="modal-body">
		            <div class="row">
		              <!-- Product gallery-->
		              <div class="col-lg-7">
		                <div class="owl-carousel" data-owl-carousel="{ &quot;nav&quot;: true, &quot;dots&quot;: false, &quot;loop&quot;: true, &quot;margin&quot;: 15 }">
			                <img src="${dto.getMain_img()}" alt="${dto.getMain_img()}">
			                <img src="${dto.getMain_img()}" alt="${dto.getMain_img()}">
			                <img src="${dto.getMain_img()}" alt="${dto.getMain_img()}">
			                <img src="${dto.getMain_img()}" alt="${dto.getMain_img()}">
		                </div>
		              </div>
		              <!-- Product details-->
		              <div class="col-lg-5 pt-4 pt-lg-0">
		                <form class="pb-4">
		                  <div class="form-group">
		                    <label class="d-block">Choose color</label>
		                    <div class="custom-control custom-option custom-control-inline mb-2">
		                      <input class="custom-control-input" type="radio" name="color" value="dark" id="dark" required>
		                      <label class="custom-option-label" for="dark"><span class="custom-option-color" style="background-color: #2c363f;"></span></label>
		                    </div>
		                    <div class="custom-control custom-option custom-control-inline mb-2">
		                      <input class="custom-control-input" type="radio" name="color" value="red" id="red" required>
		                      <label class="custom-option-label" for="red"><span class="custom-option-color" style="background-color: #e7484d;"></span></label>
		                    </div>
		                    <div class="custom-control custom-option custom-control-inline mb-2">
		                      <input class="custom-control-input" type="radio" name="color" value="white" id="white" required>
		                      <label class="custom-option-label" for="white"><span class="custom-option-color" style="background-color: #e0dfe4;"></span></label>
		                    </div>
		                    <div class="custom-control custom-option custom-control-inline mb-2">
		                      <input class="custom-control-input" type="radio" name="color" value="beige" id="beige" required>
		                      <label class="custom-option-label" for="beige"><span class="custom-option-color" style="background-color: #e6ddd6;"></span></label>
		                    </div>
		                  </div>
		                  <div class="form-group">
		                    <select class="form-control custom-select" id="size" name="size" required>
		                      <option value>- Select a size</option>
		                      <option value="13">13</option>
		                      <option value="12">12</option>
		                      <option value="11.5">11.5</option>
		                      <option value="11">11</option>
		                      <option value="10.5">10.5</option>
		                      <option value="10">10</option>
		                      <option value="9.5">9.5</option>
		                      <option value="9">9</option>
		                      <option value="8.5">8.5</option>
		                      <option value="8">8</option>
		                      <option value="7.5">7.5</option>
		                    </select>
		                  </div>
		                  <div class="d-flex flex-wrap align-items-center pt-1">
		                    <div>
		                      <input class="px-2 form-control mr-2" type="number" name="quantity" style="width: 3.2rem;" value="1" required>
		                    </div>
		                    <div>
		                      <button class="btn btn-primary px-5 mr-2" type="submit"><i class="mr-2" data-feather="shopping-cart" style="font-family: 'GmarketSansMedium';"></i>예약하기</button>
		                    </div><a class="btn box-shadow-0 nav-link-inline my-2" href="#"><i class="align-middle mr-1" data-feather="heart" style="width: 1.1rem; height: 1.1rem;"></i>찜하기</a>
		                  </div>
		                </form>
		                <div class="card">
		                  <div class="card-header py-3 bg-0">
		                    <h3 class="h6 mb-0"><span class="d-inline-block pr-2 border-right mr-2 align-middle mt-n1"><i data-feather="info" style="width: 1.1rem; height: 1.1rem;"></i></span>레스토랑 상세 정보</h3>
		                  </div>
		                  <div class="card-body">
		                    <ul class="mb-0" style="font-family: 'GmarketSansMedium';">
		                      <li>주소 : ${dto.getMain_addr() } ${dto.getMain_detailaddr() }<br> 우편번호 : ${dto.getMain_post() }</li>
		                      <br>
		                      <li>전화 : ${dto.getMain_phone() }</li>
		                      <br>
		                      <li>=======정보=======<br>${dto.getMain_info()}</li>
		                      <br>
		                      <li>음식 종류 : ${dto.getMain_type() }</li>
		                      <br>
		                      <li>오픈시간 : ${dto.getMain_opentime()} ~ 마감시간 : ${dto.getMain_endtime() }</li>
		                    </ul>
		                  </div>
		                </div>
		              </div>
		                              =================================================모달 추가 정보 구분칸===================================================
		              
		            </div>
		          </div>
		        </div>
		      </div>
		    </div>
		   </c:forEach>
		   </c:if>
    <!-- Toast notifications-->
   
          <!-- Shop sidebar-->
           <div class="container pb-6 mb-4">
           <div class="bg-secondary">
            <div class="row" style="justify-content: center;">
              <c:set var="list" value="${List}" />
              <c:if test="${!empty list }">
                <c:forEach items="${list }" var="dto">
                <!-- DB데이터만큼 리스트 출력되는 가게목록. -->
                <div class="col-md-3 col-sm-6 pt-md-4">
                  <div class="product-card mb-4">
                    <div class="product-thumb">
                      <a class="product-thumb-link" href="">	</a><span
                        class="product-wishlist-btn" data-toggle="tooltip"
                        data-placement="left" title="찜하기"><i
                        data-feather="heart"></i></span><img src="${dto.getMain_img()}"
                        alt="${dto.getMain_name()}">
                    </div>
                    <div class="product-card-body text-center">
                      <a class="product-meta" href="#"  style="font-family: 'GmarketSansMedium';">${dto.getMain_info() }</a>
                      <h3 class="product-card-title">
                        <a href="shop-single-apparel.jsp"  style="font-family: 'GmarketSansMedium'; font-size: 18px;">${dto.getMain_name()}</a>
                      </h3>
                      <span class="text-primary-orange"  style="font-family: 'GmarketSansMedium'; font-size: 13px;">${dto.getMain_addr() }</span>
                    </div>
                    <div class="product-card-body body-hidden">
                     
                      <button class="btn btn-primary btn-sm btn-block" type="button"
                        data-toggle="toast" data-target="#cart-toast"  style="font-family: 'GmarketSansMedium';">예약하기</button>
                      <a class="quick-view-btn" href="#quick-view${dto.getMain_idx()}"
                        data-toggle="modal" style=" color:black;"><i class="mr-2" data-feather="eye" style="font-family: 'GmarketSansMedium';"></i>자세히</a>
                    </div>
                  </div>
                </div>
    
              </c:forEach>
              </c:if>
              
                 <c:if test="${empty list }">
	                 <div class="pb-md-6 py-md-6">
	             		  <h1>😢검색 내용이 없습니다.😢</h1>
	               	</div>
            	  </c:if>
            </div>
          </div>
          </div>
            
                <!-- 레스토랑-->
           <div class="bg-secondary">
                    <div class="px-3 pt-8 pb-md-4 pt-md-4 text-center">
                      <h4 class="font-size-sm font-weight-normal pt-1 mb-0"></h4>
                      <h2 class="h3 pb-2" style="font-family: 'GmarketSansMedium';">다시 추천받기</h2>
                      <a class="d-block text-decoration-0" href="RandomRST.do">
                      	<div class="btn btn-primary btn-sm" style="font-family: 'GmarketSansMedium';">🎲 레스토랑 추천 🎲</div>
                      </a>
                    </div>
                  </div>
             
    <!-- Footer-->
    <footer class="page-footer bg-dark">
      <!-- first row-->
      <div class="pt-5 pb-0 pb-md-4">
        <div class="container">
          <div class="row">
            <div class="col-md-4 col-sm-6">
              <div class="widget widget-links pb-4">
                <h3 class="widget-title text-white border-light">Shop departments</h3>
                <ul>
                  <li><a class="nav-link-inline nav-link-light" href="#"><i class="widget-categories-indicator" data-feather="chevron-right"></i><span class="font-size-sm">Apparel &amp; Shoes</span></a></li>
                  <li><a class="nav-link-inline nav-link-light" href="#"><i class="widget-categories-indicator" data-feather="chevron-right"></i><span class="font-size-sm">Glasses &amp; Accessories</span></a></li>
                  <li><a class="nav-link-inline nav-link-light" href="#"><i class="widget-categories-indicator" data-feather="chevron-right"></i><span class="font-size-sm">Handbags &amp; Backpacks</span></a></li>
                  <li><a class="nav-link-inline nav-link-light" href="#"><i class="widget-categories-indicator" data-feather="chevron-right"></i><span class="font-size-sm">Computers &amp; Accessories</span></a></li>
                  <li><a class="nav-link-inline nav-link-light" href="#"><i class="widget-categories-indicator" data-feather="chevron-right"></i><span class="font-size-sm">Smartphones &amp; Tablets</span></a></li>
                  <li><a class="nav-link-inline nav-link-light" href="#"><i class="widget-categories-indicator" data-feather="chevron-right"></i><span class="font-size-sm">TV, Video &amp; Audio</span></a></li>
                  <li><a class="nav-link-inline nav-link-light" href="#"><i class="widget-categories-indicator" data-feather="chevron-right"></i><span class="font-size-sm">Cameras, Photo &amp; Video</span></a></li>
                  <li><a class="nav-link-inline nav-link-light" href="#"><i class="widget-categories-indicator" data-feather="chevron-right"></i><span class="font-size-sm">Headphones</span></a></li>
                  <li><a class="nav-link-inline nav-link-light" href="#"><i class="widget-categories-indicator" data-feather="chevron-right"></i><span class="font-size-sm">Wearable Electronics</span></a></li>
                  <li><a class="nav-link-inline nav-link-light" href="#"><i class="widget-categories-indicator" data-feather="chevron-right"></i><span class="font-size-sm">Printers &amp; Ink</span></a></li>
                  <li><a class="nav-link-inline nav-link-light" href="#"><i class="widget-categories-indicator" data-feather="chevron-right"></i><span class="font-size-sm">Video Games</span></a></li>
                  <li><a class="nav-link-inline nav-link-light" href="#"><i class="widget-categories-indicator" data-feather="chevron-right"></i><span class="font-size-sm">Car Electronics</span></a></li>
                  <li><a class="nav-link-inline nav-link-light" href="#"><i class="widget-categories-indicator" data-feather="chevron-right"></i><span class="font-size-sm">Smart Home, IoT</span></a></li>
                </ul>
              </div>
            </div>
            <div class="col-md-3 col-sm-6">
              <div class="widget widget-links pb-4">
                <h3 class="widget-title text-white border-light">Account &amp; shipping info</h3>
                <ul>
                  <li><a class="nav-link-inline nav-link-light" href="#"><i class="widget-categories-indicator" data-feather="chevron-right"></i><span class="font-size-sm">Your account</span></a></li>
                  <li><a class="nav-link-inline nav-link-light" href="#"><i class="widget-categories-indicator" data-feather="chevron-right"></i><span class="font-size-sm">Shipping rates &amp; policies</span></a></li>
                  <li><a class="nav-link-inline nav-link-light" href="#"><i class="widget-categories-indicator" data-feather="chevron-right"></i><span class="font-size-sm">Refunds &amp; replacements</span></a></li>
                  <li><a class="nav-link-inline nav-link-light" href="#"><i class="widget-categories-indicator" data-feather="chevron-right"></i><span class="font-size-sm">Taxes</span></a></li>
                  <li><a class="nav-link-inline nav-link-light" href="#"><i class="widget-categories-indicator" data-feather="chevron-right"></i><span class="font-size-sm">Delivery info</span></a></li>
                </ul>
              </div>
              <div class="widget widget-links pb-4">
                <h3 class="widget-title text-white border-light">About us</h3>
                <ul>
                  <li><a class="nav-link-inline nav-link-light" href="#"><i class="widget-categories-indicator" data-feather="chevron-right"></i><span class="font-size-sm">Careers</span></a></li>
                  <li><a class="nav-link-inline nav-link-light" href="#"><i class="widget-categories-indicator" data-feather="chevron-right"></i><span class="font-size-sm">About shop</span></a></li>
                  <li><a class="nav-link-inline nav-link-light" href="#"><i class="widget-categories-indicator" data-feather="chevron-right"></i><span class="font-size-sm">Our stores</span></a></li>
                  <li><a class="nav-link-inline nav-link-light" href="#"><i class="widget-categories-indicator" data-feather="chevron-right"></i><span class="font-size-sm">Services</span></a></li>
                  <li><a class="nav-link-inline nav-link-light" href="#"><i class="widget-categories-indicator" data-feather="chevron-right"></i><span class="font-size-sm">News</span></a></li>
                </ul>
              </div>
            </div>
            <div class="col-xl-4 offset-xl-1 col-md-5">
              <div class="widget">
                <!-- Subscription form (MailChimp)-->
                <h3 class="widget-title text-white border-light">Stay informed</h3>
                <form class="validate pb-4" action="https://studio.us12.list-manage.com/subscribe/post-json?u=c7103e2c981361a6639545bd5&amp;amp;id=29ca296126&amp;c=?" method="get" name="mc-embedded-subscribe-form" id="mc-embedded-subscribe-form">
                  <div class="input-group mb-2">
                    <div class="input-group-prepend"><span class="input-group-text" style="background-color: #e8e8e8;"><i data-feather="mail"></i></span></div>
                    <input class="form-control border-0 box-shadow-0 bg-secondary" type="email" name="EMAIL" id="mce-EMAIL" value="" placeholder="Your email" required>
                  </div>
                  <!-- real people should not fill this in and expect good things - do not remove this or risk form bot signups-->
                  <div style="position: absolute; left: -5000px;" aria-hidden="true">
                    <input type="text" name="b_c7103e2c981361a6639545bd5_29ca296126" tabindex="-1">
                  </div>
                  <button class="btn btn-primary btn-block" type="submit" name="subscribe" id="mc-embedded-subscribe">Subscribe*</button>
                  <p class="font-size-xs text-white opacity-60 pt-2 mb-2" id="mc-helper">*Subscribe to our newsletter to receive early discount offers, updates and new products info.</p>
                  <!-- Subscription status-->
                  <div class="subscribe-status"></div>
                </form>
                <!-- Mobile app download-->
                <div class="widget pb-4">
                  <h3 class="widget-title text-white border-light">Download our app</h3><a class="market-btn market-btn-light apple-btn mr-2 mb-2" href="#" role="button"><span class="market-button-subtitle">Download on the</span><span class="market-button-title">App Store</span></a><a class="market-btn market-btn-light google-btn" href="#" role="button"><span class="market-button-subtitle">Download on the</span><span class="market-button-title">Google Play</span></a>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
      <!-- shop features-->
      <div class="pt-5 pb-0 pb-md-5 border-bottom border-light" id="shop-features" style="background-color: #1f1f1f;">
        <div class="container">
          <div class="row">
            <div class="col-md-3 col-sm-6 border-right border-light">
              <div class="icon-box text-center mb-5 mb-md-0">
                <div class="icon-box-icon"><i data-feather="truck"></i></div>
                <h3 class="icon-box-title font-weight-semibold text-white">Free local delivery</h3>
                <p class="icon-box-text">Free delivery for all orders over $100</p>
              </div>
            </div>
            <div class="col-md-3 col-sm-6 border-right border-light">
              <div class="icon-box text-center mb-5 mb-md-0">
                <div class="icon-box-icon"><i data-feather="refresh-cw"></i></div>
                <h3 class="icon-box-title font-weight-semibold text-white">Money back guarantee</h3>
                <p class="icon-box-text">Free delivery for all orders over $100</p>
              </div>
            </div>
            <div class="col-md-3 col-sm-6 border-right border-light">
              <div class="icon-box text-center mb-5 mb-md-0">
                <div class="icon-box-icon"><i data-feather="life-buoy"></i></div>
                <h3 class="icon-box-title font-weight-semibold text-white">24/7 customer support</h3>
                <p class="icon-box-text">Friendly 24/7 customer support</p>
              </div>
            </div>
            <div class="col-md-3 col-sm-6">
              <div class="icon-box text-center mb-5 mb-md-0">
                <div class="icon-box-icon"><i data-feather="credit-card"></i></div>
                <h3 class="icon-box-title font-weight-semibold text-white">Secure online payment</h3>
                <p class="icon-box-text">We posess SSL / Secure Ñertificate</p>
              </div>
            </div>
          </div>
        </div>
      </div>
      <!-- third row-->
      <div class="pt-5 pb-4" style="background-color: #1f1f1f;">
        <div class="container">
          <div class="row">
            <div class="col-sm-6 text-center text-sm-left">
              <div class="mb-4 mb-sm-0"><a class="d-inline-block" href="index.jsp"><img width="100" src="img/logo-light.png" alt="MStore"/></a>
                <div class="navbar-lang-switcher dropdown border-light mt-3 mb-0 mt-sm-0">
                  <div class="dropdown-toggle text-white" data-toggle="dropdown"><img width="20" src="img/flags/en.png" alt="English"/><span>USD</span>
                  </div>
                  <ul class="dropdown-menu" style="width: 150px;">
                    <li class="dropdown-item">
                      <select class="custom-select custom-select-sm">
                        <option value="usd">$ USD</option>
                        <option value="usd">â¬ EUR</option>
                        <option value="usd">Â£ UKP</option>
                        <option value="usd">Â¥ JPY</option>
                      </select>
                    </li>
                    <li><a class="dropdown-item" href="index.jsp"><img class="mr-2" width="20" src="img/flags/fr.png" alt="FranÃ§ais"/>FranÃ§ais</a></li>
                    <li class="dropdown-divider"></li>
                    <li><a class="dropdown-item" href="#"><img class="mr-2" width="20" src="img/flags/de.png" alt="Deutsch"/>Deutsch</a></li>
                    <li class="dropdown-divider"></li>
                    <li><a class="dropdown-item" href="#"><img class="mr-2" width="20" src="img/flags/it.png" alt="Italiano"/>Italiano</a></li>
                  </ul>
                </div>
              </div>
            </div>
            <div class="col-sm-6 text-center text-sm-right"><a class="social-btn sb-facebook sb-light mx-1 mb-2" href="#"><i class="flaticon-facebook"></i></a><a class="social-btn sb-twitter sb-light mx-1 mb-2" href="#"><i class="flaticon-twitter"></i></a><a class="social-btn sb-instagram sb-light mx-1 mb-2" href="#"><i class="flaticon-instagram"></i></a><a class="social-btn sb-vimeo sb-light mx-1 mb-2" href="#"><i class="flaticon-vimeo"></i></a></div>
          </div>
          <div class="row pt-4">
            <div class="col-sm-6 text-center text-sm-left">
              <ul class="list-inline font-size-sm">
                <li class="list-inline-item mr-3"><a class="nav-link-inline nav-link-light" href="#">Outlets</a></li>
                <li class="list-inline-item mr-3"><a class="nav-link-inline nav-link-light" href="#">Affiliates</a></li>
                <li class="list-inline-item mr-3"><a class="nav-link-inline nav-link-light" href="#">Support</a></li>
                <li class="list-inline-item mr-3"><a class="nav-link-inline nav-link-light" href="#">Privacy</a></li>
                <li class="list-inline-item mr-3"><a class="nav-link-inline nav-link-light" href="#">Terms of use</a></li>
              </ul>
            </div>
            <div class="col-sm-6 text-center text-sm-right">
              <div class="d-inline-block"><img width="187" src="img/cards.png" alt="Payment methods"/>
              </div>
            </div>
          </div>
        </div>
      </div>
      <div class="py-3" style="background-color: #1a1a1a;">
        <div class="container font-size-xs text-center" aria-label="Copyright"><span class="text-white opacity-60 mr-1">Â© All rights reserved. Made by</span><a class="nav-link-inline nav-link-light" href="https://createx.studio/" target="_blank">Createx Studio</a></div>
      </div>
    </footer>
    <!-- Back To Top Button--><a class="scroll-to-top-btn" href="#"><i class="scroll-to-top-btn-icon" data-feather="chevron-up"></i></a>
    <!-- JavaScript (jQuery) libraries, plugins and custom scripts-->
    <script src="js/vendor.min.js"></script>
    <script src="js/theme.min.js"></script>
    <script type="text/javascript" src="js/sign_upChk.js"></script>
  </body>
</html>