<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.container-fluid {
	display:flex;
}

.navbar-brand {
	padding-left: 20px;
}


#top-text {
	margin-right: 20px;
}

.d-flex {margin-right: 50px;}
</style>
<nav class="navbar fixed-top navbar-light bg-light fixed-top">
	<div class="container-fluid">
		<div>
			<a class="navbar-brand" href="#" onclick="location.href='index.jsp';""> 
				<img src="img/logo.png" width="60" alt=logo_image " />
				<span id="top-text"> 공유해방 </span>
			</a>
		</div>
		<div>
			<nav class="navbar navbar-light bg-light">
				<div class="container-fluid">
					<form class="d-flex" action="">
						<input class="form-control me-2" type="search" placeholder="원하는 공간을 검색해보세요."
							aria-label="Search"size="80">
					</form>
				</div>
			</nav>
		</div>
		<div>
			<a href="login_form.jsp">로그인</a> /
			<a href="member/join_form.jsp">회원가입</a>
			
		</div>
		<div>
			<button class="navbar-toggler" type="button"
				data-bs-toggle="offcanvas" data-bs-target="#offcanvasNavbar"
				aria-controls="offcanvasNavbar">
				<span class="navbar-toggler-icon"></span>
			</button>
		</div>

		<div class="offcanvas offcanvas-end" tabindex="-1"
			id="offcanvasNavbar" aria-labelledby="offcanvasNavbarLabel">
			<div class="offcanvas-header">
				<h5 class="offcanvas-title" id="offcanvasNavbarLabel">Offcanvas</h5>
				<button type="button" class="btn-close text-reset"
					data-bs-dismiss="offcanvas" aria-label="Close"></button>
			</div>
			<div class="offcanvas-body">
				<ul class="navbar-nav justify-content-end flex-grow-1 pe-3">
					<li class="nav-item"><a class="nav-link active"
						aria-current="page" href="#">Home</a></li>
					<li class="nav-item"><a class="nav-link" href="#">Link</a></li>
					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle" href="#"
						id="offcanvasNavbarDropdown" role="button"
						data-bs-toggle="dropdown" aria-expanded="false"> Dropdown </a>
						<ul class="dropdown-menu"
							aria-labelledby="offcanvasNavbarDropdown">
							<li><a class="dropdown-item" href="#">Action</a></li>
							<li><a class="dropdown-item" href="#">Another action</a></li>
							<li>
								<hr class="dropdown-divider">
							</li>
							<li><a class="dropdown-item" href="#">Something else
									here</a></li>
						</ul></li>
				</ul>
				<form class="d-flex">
					<input class="form-control me-2" type="search" placeholder="Search"
						aria-label="Search">
					<button class="btn btn-outline-success" type="submit">Search</button>
				</form>
			</div>
		</div>
	</div>
</nav>
</body>
</html>