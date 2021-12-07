<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.container {
	width: 940px;
}

h2 {
	text-align: center;
	padding: 50px 0;
}

.cata-name {
	font-size: 20px;
	font-weight: bold;
	text-align: center;
}

.recommend {
	padding-top: 50px;
}

#carouselExampleControls {
	padding-top: 20px;
}

#show-rooms {
	margin-top: 50px;
}

.carousel-inner {
	width: auto;
	height: 360px; /* 이미지 높이 변경 */
}

.carousel-item {
	width: auto;
	height: 100%;
}

.d-block {
	display: block;
	width: auto;
	height: 100%;
}

.carousel-caption h5, p {
	margin-top: 50px;
}

.carousel-control-prev {
	margin-top: 40px;
}

.carousel-control-next {
	margin-top: 40px;
}

.row {
	padding: 20px 0;

}
.recommend-list {
	display: flex;
	justify-content: space-between;
	margin-top:20px;
}
</style>
</head>
<body>
	<div class="container">
		<h2>어떤 공간을 찾으시나요?</h2>
		<div class="row category">
			<div class="col-3 box">
				<!-- 클릭시 파티룸 목록 이동 -->
				<a href="pdt_list.pdt"> <img src="img/party.jpg"
					class="img-thumbnail border-0" alt="파티룸">
				<p class="cata-name">파티룸</p>
				</a>
			</div>
			<div class="col-3 box">
				<!-- 클릭시 녹음실 목록 이동 -->
				<a href="pdt_list.pdt"> <img src="img/mic.jpg"
					class="img-thumbnail border-0" alt="녹음실">
				<p class="cata-name">녹음실</p>
				</a>
			</div>
			<div class="col-3 box ">
				<!-- 클릭시 공부방 목록 이동 -->
				<a href="pdt_list.pdt"> <img src="img/study.jpg"
					class="img-thumbnail border-0" alt="공부방">
				<p class="cata-name">공부방</p>
				</a>
			</div>
			<div class="col-3 box">
				<!-- 클릭시 컨퍼런스룸 목록 이동 -->
				<a href="pdt_list.pdt"> <img
					src="img/conference.jpg" class="img-thumbnail border-0" alt="컨퍼런스룸">
				<p class="cata-name">컨퍼런스룸</p>
				</a>
			</div>
		</div>
		<div id="show-rooms">
			<div id="carouselExampleControls" class="carousel slide"
				data-bs-ride="carousel">
				<div class="carousel-inner">
					<div class="carousel-item active">
						<img src="img/recordRoomImg01.png" class="d-block w-100" alt="녹음실">
						<div class="carousel-caption d-none d-md-block">
							<h5>밴드 음악 녹음 공간</h5>
							<p>&lt;공유해방&gt;에서 제공하는 다양한 장비와 함께 최고의 결과물을 제작하세요.</p>
						</div>
					</div>
					<div class="carousel-item">
						<img src="img/studyRoomImg01.png" class="d-block w-100" alt="스터디룸">
						<div class="carousel-caption d-none d-md-block">
							<h5>책이 구비된 스터디룸</h5>
							<p>&lt;공유해방&gt;에서 제공하는 다양한 서적과 함께 최고의 학습 분위기를 가져보세요.</p>
						</div>
					</div>
					<div class="carousel-item">
						<img src="img/conferenceRoom01.png" class="d-block w-100"
							alt="컨퍼런스룸">
						<div class="carousel-caption d-none d-md-block">
							<h5>컨퍼런스룸</h5>
							<p>&lt;공유해방&gt;에서 제공하는 편의시설과 함께 보다 생산적인 회의를 가져보세요.</p>
						</div>
					</div>
					<div class="carousel-item">
						<img src="img/partyRoomImg01.png" class="d-block w-100" alt="파티룸">
						<div class="carousel-caption d-none d-md-block">
							<h5>캐쥬얼 파티룸</h5>
							<p>&lt;공유해방&gt;에서 제공하는 다양한 용품과 함께 잊을 수 없는 추억을 만들어보세요.</p>
						</div>
					</div>
				</div>
				<button class="carousel-control-prev" type="button"
					data-bs-target="#carouselExampleControls" data-bs-slide="prev">
					<span class="carousel-control-prev-icon" aria-hidden="true"></span>
					<span class="visually-hidden">Previous</span>
				</button>
				<button class="carousel-control-next" type="button"
					data-bs-target="#carouselExampleControls" data-bs-slide="next">
					<span class="carousel-control-next-icon" aria-hidden="true"></span>
					<span class="visually-hidden">Next</span>
				</button>
			</div>
		</div>
		<!-- 오늘의 추천 공간 -->
		<div class="recommend">
			<h2>오늘의 추천 공간</h2>
			<div class="recommend-list">
				<div class="card" style="width: 18rem;">
				  <img src="..." class="card-img-top" alt="...">
				  <div class="card-body">
				    <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
				  </div>
				</div>	
				<div class="card" style="width: 18rem;">
				  <img src="..." class="card-img-top" alt="...">
				  <div class="card-body">
				    <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
				  </div>
				</div>	
				<div class="card" style="width: 18rem;">
				  <img src="..." class="card-img-top" alt="...">
				  <div class="card-body">
				    <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
				  </div>
				</div>	
			</div>
			<div class="recommend-list">
				<div class="card" style="width: 18rem;">
				  <img src="..." class="card-img-top" alt="...">
				  <div class="card-body">
				    <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
				  </div>
				</div>	
				<div class="card" style="width: 18rem;">
				  <img src="..." class="card-img-top" alt="...">
				  <div class="card-body">
				    <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
				  </div>
				</div>	
				<div class="card" style="width: 18rem;">
				  <img src="..." class="card-img-top" alt="...">
				  <div class="card-body">
				    <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
				  </div>
				</div>	
			</div>
			<div class="recommend-list">
				<div class="card" style="width: 18rem;">
				  <img src="..." class="card-img-top" alt="...">
				  <div class="card-body">
				    <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
				  </div>
				</div>	
				<div class="card" style="width: 18rem;">
				  <img src="..." class="card-img-top" alt="...">
				  <div class="card-body">
				    <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
				  </div>
				</div>	
				<div class="card" style="width: 18rem;">
				  <img src="..." class="card-img-top" alt="...">
				  <div class="card-body">
				    <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
				  </div>
				</div>	
			</div>
			
			
			
			




		</div>



	</div>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
		crossorigin="anonymous"></script>
</body>
</html>