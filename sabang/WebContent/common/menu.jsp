<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<link rel="stylesheet" href="css/menu.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	
	//메뉴 드롭다운 슬라이드 효과
	$("li.filterOpt").on("click", function(e){
		$("li.filterOpt").find("ul.sublist").each(function(idx, ele){//다른 버튼을 누르면 이미 열린애들은 닫아주기
			if(ele.clientHeight != 0) $(ele).hide(); 
		});//end ul.sublist반복
		
		$(e.target).find("ul.sublist").slideToggle();
	});//end .filterOpt onClick
	
	//sub메뉴가 열렸을 때 누르면 부모인 li.filterOpt에 이벤트 전파 방지
	$("ul.sublist").on("click", function(e){
		e.stopPropagation();
	});//end ul.sublist onClick
	
	$(document).mouseup(function(e){// 버튼 눌렀다가 다른데 누르면 드롭다온 사라짐. 
		if($(e.target).parents().filter("ul#filterList").length == 0){
			$("li.filterOpt").find("ul.sublist").each(function(idx, ele){//다른 버튼을 누르면 이미 열린애들은 닫아주기
				if(ele.clientHeight != 0) $(ele).hide(); 
			});//end ul.sublist반복
		};
	});//end mouseup 
	
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
	
	$("button#searchBtn").on("click", function(e){
		if($("input[name=search]").val().trim().length == 0){
			e.preventDefault();
			alert("검색어를 입력하여주세요");
		}
	});//end searchBtn onClick
	
	
	
	 $("input.filter").on("change", function(e){
		var filters = [];
		$("input.filter").each(function(idx, ele){
			if(ele.checked) filters.push($(ele).val());
		});//end each
		console.log(filters);
	 	$.ajax({
			type:'get',
			url:'HouseListServlet',
			data:{
				filters : filters.toString()
			},
			dataType: "html",
			success:function(data, status, xhr){
				$("div#wrap").html($(data).nextAll("div#wrap"));
// 				$("html").html(data);
// 				location.href="HouseListServlet?filters="+filters.toString();
			},
			error:function(xhr, status, error){console.log(status)}
		});//end ajax 
	}); // end input[name=rtype] onChange 
	
	var filters = [];
	/* $("input.filter").on("change", function(e){
		$("input.filter").each(function(idx, ele){
			if(ele.checked) filters.push($(ele).val());
		});//end each
	}).delay(10000).queue(function(){
		$.ajax({
			type:'get',
			url:'HouseListServlet',
			data:{
				filters : filters.toString()
			},
			dataType: "html",
			success:function(data, status, xhr){
				
// 				$("html").document(data);
// 				location.href="HouseListServlet?filters="+filters.toString();
			},
			error:function(xhr, status, error){console.log(status)}
		});//end ajax 
	}); */
	
	
	
});//end ready
</script>
<style>
</style>
<form action="HouseListServlet" method="get" id="searchBar">
	<input type="text" name="search" id="search" placeholder="연희동, 신촌, 신축 ...">
	<button id="searchBtn">검색</button>
	<ul id="filterList">
		<li class="filterOpt">원룸/투룸+
			<ul class="sublist subListHide">
				<li class="subFilter">
					<div class="rangeWrap" >
						<input type="checkbox" name="rtype" class="filter" value="o">원룸<br>
						<input type="checkbox" name="rtype" class="filter" value="t">투룸<br>
						<input type="checkbox" name="rtype" class="filter" value="f">오피스텔<br>
						<input type="checkbox" name="rtype" class="filter" value="p">아파트<br>
					</div>
				</li>
			</ul>
		</li>
		<li class="filterOpt">월세/전세
			<ul class="sublist">
				<li class="subFilter">
					<div class="rangeWrap" >
						<input type="checkbox" name="rentType" class="filter" value="월세">월세<br>
						<input type="checkbox" name="rentType" class="filter" value="전세">전세<br>
					</div>
				</li>
			</ul>
		</li>
		<li class="filterOpt">가격대
			<ul class="sublist">
				<li class="subFilter">월세
					<select name="mrent" class="filter">
						<option value="선택해주세요">선택해주세요</option>
						<option value="0~40">0만원~30만원</option>
						<option value="40~60">30만원~60만원</option>
						<option value="60~80">60만원~90만원</option>
						<option value="80~100">80만원~100만원</option>
						<option value="100이상">100만원 이상</option>
					</select>
				</li>
				<li class="subFilter">보증금/전세가
					<div class="rangeWrap" >
						<input type="range" min=0 max=20000 step=100 value=10000 class="slider" id="myRange" class="filter" >
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
						<input type="radio" name="util" class="filter" value="maintc0" >무관<br>
						<input type="radio" name="util" class="filter" value="maintc5">~5만원<br>
						<input type="radio" name="util" class="filter" value="maintc10">~10만원<br>
						<input type="radio" name="util" class="filter" value="maintc20">~20만원<br>
					</div>
				</li>
			</ul>
		</li>
	</ul>
</form>
<div style="clear:both;" id="test"></div>
