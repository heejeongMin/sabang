<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.4.6/css/swiper.min.css">
<style type="text/css">
	form#register{
    	margin-top: 40px;
	}
	div#registerDiv{
		text-align: center;
   		padding-left: 400px;
	}
	p#textLength{
    float: left;
    position: absolute;
    color: lightgrey;
    left: 430px;
    top: 110px;
    text-align: right;
	}
	textarea{
		resize: none;
	}
	h1#registerH1{
		text-align: left;
		color: darkblue;
		text-shadow: 5px 4px aliceblue;
	}
</style>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.4.6/js/swiper.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		
		$("form").on("submit", function(e){//submit전 유효성체크
			console.log(Number.isNaN(Number.parseInt($("input[name=whlflr]").val())));
			if($("select[name=gcategory]").val()==""){
				e.preventDefault();
				alert("상품 카테고리를 선택하여주세요");
			}  else if(Number.isNaN(Number.parseInt($("input[name=area]").val()))){
				e.preventDefault();
				alert("평수는 숫자로만 입력해주세요.");
			} else if (Number.isNaN(Number.parseInt($("input[name=flr]").val()))){
				e.preventDefault();
				alert("매물층수는 숫자로만 입력해주세요.");
			} else if (Number.isNaN(Number.parseInt($("input[name=whflr]").val()))){
				e.preventDefault();
				alert("건물층수는 숫자로만 입력해주세요.");
			} else if ($("input[name=gimage]").val().length < 1){
				e.preventDefault();
				alert("사진을 등록하여주세요");
			}
		});//end for onSubmit
		
		
		$("textarea").on("keyup", function(e){//상품설명 글자수 세기
			$("p#textLength>span").text($(e.target).val().length);
		});//end textarea onKeyup
		
		
	});//end ready
</script>
	<h1 id="registerH1">매물 수정하기</h1>
	<form method="POST" enctype="multipart/form-data" action="HouseUpdateServlet" id="register">
	 	<div class="swiper-container">
		    <div class="swiper-wrapper">
		      <div class="swiper-slide">
		      	<table width="800px" style="margin: 30px 0 0 50px;">
		      		<tr>
						<td class="td_default" style="text-align:center;"><font size="5"><b>매물 기본 정보</b></font> &nbsp;</td>
					</tr>
					<tr> <td height="20"> </tr>
					<tr>
						<table align="center" width="710" cellspacing="0" cellpadding="0" border="0" style='margin-left: 100px'>
							<tr> <td height="1" colspan="8" bgcolor="CECECE"></td> </tr>
							<tr> <td height="10"></td> </tr>
							<td class="td_title">매물타입</td>
							<td class="td_default update" id="updateName" colspan="2" style='padding-left: 30px;text-align: left;'>
								<input type="text" name="htype" value="${infoDTO.htype}" readonly>
							</td>
							<tr> <td height="10"></td> </tr>
							<tr>
								<td class="td_title">매물코드</td>
								<td class="td_default" colspan="2" style='padding-left: 30px' id="hcode">
									<input type="text" name="hcode" value="${infoDTO.hcode}" readonly>
								</td>
							</tr>
							<tr> <td height="10"></td> </tr>
							<tr>
								<td class="td_title">세타입</td>
								<td class="td_default update" id="" colspan="2" style='padding-left: 30px;text-align: left;'>
	 								<c:if test='${infoDTO.rtype.equals("월세")}'>
										<input type="radio" name="rtype" value="월세" checked><span style="margin-left: -15px;">월세</span>
										<input type="radio" name="rtype" value="전세" style="float: left; position: relative; left: 50px;"><span style="margin-left: 35px;">전세</span>
									</c:if>
									<c:if test='${infoDTO.rtype.equals("전세")}'>
										<input type="radio" name="rtype" value="월세"><span style="margin-left: -15px;">월세</span>
										<input type="radio" name="rtype" value="전세" checked style="float: left; position: relative; left: 50px;"><span style="margin-left: 35px;">전세</span>
									</c:if>
								</td>
							</tr>
							<tr> <td height="10"></td> </tr>
							<tr>
								<td class="td_title">매물명</td>
								<td class="td_default" id="" colspan="2" style='padding-left: 30px'>
									<input type="text" name="hname" placeholder="50자 이내" size=40 value="${infoDTO.hname}" >
								</td>
							</tr>
							<tr> <td height="10"></td> </tr>
							<tr>
								<td class="td_title">매물설명</td>
								<td class="td_default" id="" colspan="2" style="padding-left: 30px; text-align: left; position:relative">
									<textarea cols="70" rows="10" name="hetc" maxlength="250" required>${infoDTO.hetc}</textarea>
									<p id="textLength">(<span>0</span>/250)</p>
								</td>
							</tr>
							<tr> <td height="10"></td> </tr>
							<tr>
								<td class="td_title">평수</td>
								<td class="td_red" id="" colspan="2" style='padding-left: 30px; text-align: left;' >
									<input type="text" name="area" size ="4" style="margin-right: 10px;" value="${infoDTO.area}"> (단위: 제곱미터)
								</td>
							</tr>
							<tr> <td height="10"></td> </tr>
							<tr>
								<td class="td_title">층수</td>
								<td class="td_red" id="" colspan="2"  style='padding-left: 30px; text-align: left;' >
									<input type="text" name="flr" size="2" placeholder="매물층" value="${infoDTO.flr}" style="margin-right:10px; ">/
									<input type="text" name="whflr" size="2" placeholder="건물층" value="${infoDTO.whlflr}" style="position: absolute; margin-left: 10px;">
								</td>
							</tr>
							<tr> <td height="10"></td> </tr>
							<tr>
								<td class="td_title">방개수</td>
								<td class="td_red" id="" colspan="2" style='padding-left: 30px; text-align:left; ' >
									<input type="text" name="room" size="2" value="${infoDTO.room}" style="margin-right:10px;"> 개
								</td>
							</tr>
							<tr> <td height="10"></td> </tr>
							<tr>
								<td class="td_title">욕실개수</td>
								<td class="td_red" id="" colspan= "2" style='padding-left: 30px; text-align:left;' >
									<input type="text" name="batr" size="2" value="${infoDTO.batr}" style="margin-right:10px;"> 개 
								</td>
							</tr>
							<tr> <td height="10"></td> </tr>
							<tr> <td class="td_title">주소</td>
								 <td class="td_red" colspan="2" style='padding-left: 30px' >
									<input type="text" name="post" id="sample4_postcode" value="" placeholder="우편번호">
									<input type="button" onclick="sample4_execDaumPostcode()" value="주소 찾기" style="margin: 0 10px;">
									<input type="text" name="addr" id="sample4_roadAddress" value="${infoDTO.addr}" placeholder="도로명주소">
									<input type="text" id="sample4_jibunAddress" placeholder="지번주소" style="display: none;">
									<span id="guide"></span>	
								 </td>
							</tr>
							<tr> <td height="10"></td> </tr>
							<tr>
								<td class="td_title">사진등록</td>
								<td class="td_default" colspan="2" style='padding-left: 30px'> 
									<input type="file" name="himage"/>
								</td>
							</tr>
							<tr> <td height="30"></td> </tr>
						</table>
					</tr>
		      	</table>
		      </div>
		      <div class="swiper-slide">
		      	<table width="800px" style="margin: 30px 0 0 50px;">
		      		<tr>
						<td class="td_default" style="text-align:center;"><font size="5"><b>매물 가격 정보</b></font> &nbsp;</td>
					</tr>
					<tr> <td height="20"> </tr>
					<tr>
						<table align="center" width="710" cellspacing="0" cellpadding="0" border="0" style='margin-left: 100px'>
							<tr> <td height="1" colspan="8" bgcolor="CECECE"></td> </tr>
							<tr> <td height="50"></td> </tr>
							<tr>
								<td class="td_title">보증금</td>
								<td class="td_red" id="" colspan="2" style='padding-left: 30px; text-align: left;' >
									<input type="text" name="deposit" size ="4" value="${priceDTO.deposit}" style="margin-right: 10px;"> (단위: 만원)
								</td>
							</tr>
							<tr> <td height="10"></td> </tr>
							<tr>
								<td class="td_title">월세</td>
								<td class="td_red" id="" colspan="2"  style='padding-left: 30px; text-align: left;' >
									<input type="text" name="mrent" size="4" value="${priceDTO.mrent}" style="margin-right:10px;"> (단위: 만원)
								</td>
							</tr>
							<tr> <td height="10"></td> </tr>
							<tr>
								<td class="td_title">전세</td>
								<td class="td_red" id="" colspan="2" style='padding-left: 30px; text-align:left; ' >
									<input type="text" name="yrent" size="4" value="${priceDTO.yrent}" style="margin-right:10px;"> (단위: 만원)
								</td>
							</tr>
							<tr> <td height="10"></td> </tr>
							<tr>
								<td class="td_title">관리비</td>
								<td class="td_red" id="" colspan="2" style='padding-left: 30px; text-align:left; ' >
									<input type="text" name="maintc" size="4" value="${priceDTO.maintc}" style="margin-right:10px;"> (단위: 만원)
								</td>
							</tr>
							<tr> <td height="10"></td> </tr>
							<tr>
								<td class="td_title">주차비</td>
								<td class="td_red" id="" colspan="2" style='padding-left: 30px; text-align:left; ' >
									<input type="text" name="parkf" size="4" value="${priceDTO.parkf}" style="margin-right:10px;"> (단위: 만원)
								</td>
							</tr>
						</table>
					</tr>
		      	</table>
		      </div>
		      <div class="swiper-slide">
		      	     	<table width="800px" style="margin: 30px 0 0 50px;">
		      		<tr>
						<td class="td_default" style="text-align:center;"><font size="5"><b>매물 옵션 정보</b></font> &nbsp;</td>
					</tr>
					<tr> <td height="20"> </tr>
					<tr>
						<table align="center" width="710" cellspacing="0" cellpadding="0" border="0" style='margin-left: 100px'>
							<tr> <td height="1" colspan="8" bgcolor="CECECE"></td> </tr>
							<tr> <td height="50"></td> </tr>
							<tr>
								<td class="td_title">옵션유무</td>
								<td class="td_red" id="" colspan="2" style='padding-left: 30px; text-align: left;' >
								<c:if test="${optionDTO.bltin == 'Y'.charAt(0)}">
									<input type="checkbox" name="options" value="BLTIN" checked style="margin-right: 10px;"> 빌트인<br>
								</c:if>
								<c:if test="${optionDTO.bltin != 'Y'.charAt(0)}">
									<input type="checkbox" name="options" value="BLTIN" style="margin-right: 10px;"> 빌트인<br>
								</c:if>
								<c:if test="${optionDTO.elev == 'Y'.charAt(0)}">
									<input type="checkbox" name="options" value="ELEV" checked style="margin-right: 10px;"> 엘레베이터<br>
								</c:if>
								<c:if test="${optionDTO.elev != 'Y'.charAt(0)}">
									<input type="checkbox" name="options" value="ELEV" style="margin-right: 10px;"> 엘레베이터<br>
								</c:if>
								<c:if test="${optionDTO.pet == 'Y'.charAt(0)}">
									<input type="checkbox" name="options" value="PET" checked style="margin-right: 10px;"> 반려동물<br>
								</c:if>
								<c:if test="${optionDTO.pet != 'Y'.charAt(0)}">
									<input type="checkbox" name="options" value="PET" style="margin-right: 10px;"> 반려동물<br>
								</c:if>
								<c:if test="${optionDTO.vrd == 'Y'.charAt(0)}">
									<input type="checkbox" name="options" value="VRD" checked style="margin-right: 10px;"> 베란다/발코니<br>
								</c:if>
								<c:if test="${optionDTO.vrd != 'Y'.charAt(0)}">
									<input type="checkbox" name="options" value="VRD" style="margin-right: 10px;"> 베란다/발코니<br>
								</c:if>
								<c:if test="${optionDTO.loan == 'Y'.charAt(0)}">
									<input type="checkbox" name="options" value="LOAN" checked style="margin-right: 10px;"> 전세자금대출<br>
								</c:if>
								<c:if test="${optionDTO.loan != 'Y'.charAt(0)}">
									<input type="checkbox" name="options" value="LOAN" style="margin-right: 10px;"> 전세자금대출<br>
								</c:if>
								<c:if test="${optionDTO.park == 'Y'.charAt(0)}">
									<input type="checkbox" name="options" value="PARK" checked style="margin-right: 10px;"> 주차<br>
								</c:if>
								<c:if test="${optionDTO.park != 'Y'.charAt(0)}">
									<input type="checkbox" name="options" value="PARK" style="margin-right: 10px;"> 주차<br>
								</c:if>
								<c:if test="${optionDTO.mdate == 'Y'.charAt(0)}">
									<input type="checkbox" name="options" value="MDDATE" checked style="margin-right: 10px;"> 입주날짜 협의 가능<br>
								</c:if>
								<c:if test="${optionDTO.mdate != 'Y'.charAt(0)}">
									<input type="checkbox" name="options" value="MDDATE" style="margin-right: 10px;"> 입주날짜 협의 가능<br>
								</c:if>	
								</td>
							</tr>
							<tr> <td height="10"></td> </tr>
							<tr>
								<td class="td_title">기타사항</td>
								<td class="td_default" id="updateName" colspan="2" style="padding-left: 30px; text-align: left; position:relative">
									<textarea cols="70" rows="10" name="etc" maxlength="250" placeholder="냉장고, 책상, 에어컨...">${optionDTO.etc}</textarea>
									<p id="textLength">(<span>0</span>/250)</p>
								</td>
							</tr>
						</table>
					</tr>
		      	</table>
		      </div>
		    </div>
		    <!-- Add Pagination -->
		    <div class="swiper-pagination"></div>
		    
		    <!-- Add Arrows -->
		    <div class="swiper-button-next"></div>
		    <div class="swiper-button-prev"></div>
		  </div>
			<div id="registerDiv">
				<input type="submit" value="수정하기">
				<input type="reset"	value="다시작성">
			</div>
</form>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script>
    //본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
    function sample4_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 도로명 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var fullRoadAddr = data.roadAddress; // 도로명 주소 변수
                var extraRoadAddr = ''; // 도로명 조합형 주소 변수

                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraRoadAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                   extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 도로명, 지번 조합형 주소가 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if(extraRoadAddr !== ''){
                    extraRoadAddr = ' (' + extraRoadAddr + ')';
                }
                // 도로명, 지번 주소의 유무에 따라 해당 조합형 주소를 추가한다.
                if(fullRoadAddr !== ''){
                    fullRoadAddr += extraRoadAddr;
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample4_postcode').value = data.zonecode; //5자리 새우편번호 사용
                document.getElementById('sample4_roadAddress').value = fullRoadAddr;
                document.getElementById('sample4_jibunAddress').value = data.jibunAddress;

                // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
                if(data.autoRoadAddress) {
                    //예상되는 도로명 주소에 조합형 주소를 추가한다.
                    var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
                    document.getElementById('guide').innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';

                } else if(data.autoJibunAddress) {
                    var expJibunAddr = data.autoJibunAddress;
                    document.getElementById('guide').innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';

                } else {
                    document.getElementById('guide').innerHTML = '';
                }
            }
        }).open();
    }
</script>
  <script>
    var swiper = new Swiper('.swiper-container', {
      pagination: {
        el: '.swiper-pagination',
        type: 'progressbar',
      },
      navigation: {
        nextEl: '.swiper-button-next',
        prevEl: '.swiper-button-prev',
      },
    });
  </script>