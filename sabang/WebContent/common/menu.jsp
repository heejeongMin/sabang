<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<link rel="stylesheet" href="css/menu.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	
	//메뉴 드롭다운 슬라이드 효과
	$("li.filterOpt").on("click", function(e){
		$(e.target).find("ul.sublist").slideToggle();
	});//end .filterOpt onClick
	
	// 가격대 버튼 드롭다운 range 바
	$("input[type=range]").on("change", function(e){
		var result = $(e.target).val();
		if($(e.target).val().length > 4){
			var million = $(e.target).val().charAt(0);
			var hundred = $(e.target).val().substring(1);
			result = million+"억"+hundred;
		}
		$(".searchRange").text(result+"만원~무제한");
	});//end input[type=range] onChagne
	
});//end ready
</script>
<form action="HouseListServlet" method="get" id="searchBar">
	<input type="text" name="search">
	<button id="searchBtn">검색</button>
	<ul id="filterList">
		<li class="filterOpt">원룸/투룸+
			<ul class="sublist">
				<li class="subFilter">
					<div class="rangeWrap" >
						<input type="checkbox" name="rtype" value="oneRoom">원룸
						<input type="checkbox" name="rtype" value="twoRoom">투룸
						<input type="checkbox" name="rtype" value="threeRoom">쓰리룸이상
					</div>
				</li>
			</ul>
		</li>
		<li class="filterOpt">월세/전세
			<ul class="sublist">
				<li class="subFilter">
					<div class="rangeWrap" >
						<input type="checkbox" name="rentType" value="mrent">월세
						<input type="checkbox" name="rentType" value="yrent">전세
					</div>
				</li>
			</ul>
		</li>
		<li class="filterOpt">가격대
			<ul class="sublist">
				<li class="subFilter">월세
					<select name="mrent">
						<option value="0~40">0만원~30만원</option>
						<option value="40~60">30만원~60만원</option>
						<option value="60~80">60만원~90만원</option>
						<option value="80~100">80만원~100만원</option>
						<option value="100이상">100만원 이상</option>
					</select>
				</li>
				<li class="subFilter">보증금/전세가
					<div class="rangeWrap" >
						<input type="range" min=0 max=20000 step=100 value=10000 class="slider" id="myRange">
						<span class="searchRange"></span>
						<div class="rangeLable">
							<span class="rangeValue startValue">0</span>
							<span class="rangeValue middleValue">1억</span>
							<span class="rangeValue endValue">무제한</span>
						</div>
					</div>
				</li>
			</ul>
		</li>
		<li class="filterOpt">관리비
			<ul class="sublist">
				<li class="subFilter">
					<div class="rangeWrap" >
						<input type="radio" name="util" value="0">무관
						<input type="radio" name="util" value="5">~5만원
						<input type="radio" name="util" value="10">~10만원
						<input type="radio" name="util" value="20">~20만원
					</div>
				</li>
			</ul>
		</li>
	</ul>
</form>
<div style="clear:both;"></div>
