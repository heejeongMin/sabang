<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%><style type="text/css">
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
    left: 460px;
    top: 110px;
	}
	textarea{
		resize: none;
	}
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		$("select[name=htype]").on("change", function(e){ //상품 코드 값 정하기
			$.ajax({
				type:'get',
				url:'HouseRegisterServlet',
				data:{ htype:$(e.target).val()},
				dataType:'text',
				success:function(data, status, xhr){
					var newCode = Number.parseInt(data)+1;
					switch($(e.target).val()){
					case "o": 
						if(newCode < 10){
							$("#hcode>input").val("O00"+newCode);
						} else if (newCode < 100){
							$("#hcode>input").val("O0"+newCode);
						} else {
							$("#hcode>input").val("O"+newCode);
						}
						 break;
					case "t": 
						if(newCode < 10 ){
							$("#hcode>input").val("T00"+newCode); 
						} else if (newCode < 100){
							$("#hcode>input").val("T0"+newCode);
						} else {
							$("#hcode>input").val("T"+newCode);
						}
						break;
					case "f": 
						if(newCode < 10){
							$("#hcode>input").val("F00"+newCode);
						} else if (newCode < 100){
							$("#hcode>input").val("F0"+newCode);
						} else {
							$("#hcode>input").val("F"+newCode);
						}
						 break;
					case "p":
						if(newCode < 10){
							$("#hcode>input").val("P00"+newCode);
						} else if (newCode < 100){
							$("#hcode>input").val("P0"+newCode);
						} else {
							$("#hcode>input").val("P"+newCode);
						}
						break;
					}
				},
				error:function(xhr, status, data){ console.log(status); }
			});//end ajax
		});//end select gcategory change
		
		$("form").on("submit", function(e){//submit전 유효성체크
			if($("select[name=gcategory]").val()==""){
				e.preventDefault();
				alert("상품 카테고리를 선택하여주세요");
			} else if (Number.isNaN(Number.parseInt($("input[name=gprice]").val()))){//가격은 숫자로 입력
				e.preventDefault();
				alert("가격은 숫자로 입력하세요");
			} else if ($("input[name=gimage]").val().length < 1){
				e.preventDefault();
				alert("사진을 등록하여주세요");
			}
		});//end for onSubmit
		
		
		$("textarea").on("keyup", function(e){//상품설명 글자수 세기
			$("p#textLength>span").text($(e.target).val().length);
			
			/* if($("p#textLength>span").text($(e.target).val().length == 250){
				e.preventDefault();
			} */
		});//end textarea onKeyup
		
	});//end ready
</script>
	<form method="POST" enctype="multipart/form-data" action="GoodsRegisterServlet" id="register">
	<table width="800px" cellspacing="0" cellpadding="0">
		<tr>
			<td class="td_default" style="text-align:center;"><font size="5"><b>- 새로운 매물 등록하기 -</b></font> &nbsp;</td>
		</tr>
		<tr> <td height="20"> </tr>
		<tr>
			<td>
				<table align="center" width="710" cellspacing="0" cellpadding="0" border="0" style='margin-left: 30px'>
					<tr> <td height="1" colspan="8" bgcolor="CECECE"></td> </tr>
					<tr> <td height="10"></td> </tr>
					<tr>
						<td class="td_title">매물타입</td>
						<td class="td_default update" id="updateName" colspan="2" style='padding-left: 30px;text-align: left;'>
							<select name="htype">
								<option value="">선택해주세요</option>	
								<option value="o">아파트</option>	
								<option value="t">투룸</option>	
								<option value="f">오피스텔</option>	
								<option value="p">아파트</option>	
							</select>
						</td>
					</tr>
					<tr> <td height="10"></td> </tr>
					<tr>
						<td class="td_title">매물코드</td>
						<td class="td_default" colspan="2" style='padding-left: 30px' id="hcode">
							<input type="text" name="hcode" value="" readonly>
						</td>
					</tr>
					<tr> <td height="10"></td> </tr>
					<tr>
						<td class="td_title">세타입</td>
						<td class="td_default update" id="" colspan="2" style='padding-left: 30px;text-align: left;'>
							<input type="radio" name="rtype" value="월세"><span style="margin-left: -15px;">월세</span>
							<input type="radio" name="rtype" value="전세" style="float: left; position: relative; left: 50px;"><span style="margin-left: 35px;">전세</span>
						</td>
					</tr>
					<tr> <td height="10"></td> </tr>
					<tr>
						<td class="td_title">매물명</td>
						<td class="td_default" id="updateName" colspan="2" style='padding-left: 30px'>
							<input type="text" name="gname" placeholder="50자 이내" size=40 required>
						</td>
					</tr>
					<tr> <td height="10"></td> </tr>
					<tr>
						<td class="td_title">매물설명</td>
						<td class="td_default" id="updateName" colspan="2" style="padding-left: 30px; text-align: left; position:relative">
							<textarea cols="70" rows="10" name="gcontent" maxlength="2000" required></textarea>
							<p id="textLength">(<span>0</span>/250)</p>
						</td>
					</tr>
					<tr> <td height="10"></td> </tr>
					<tr>
						<td class="td_title">보증금/전세가</td>
						<td class="td_red" id="updateYrent" colspan="2" style='padding-left: 30px' >
							<input type="text" name="yrent">
						</td>
					</tr>
					<tr> <td height="10"></td> </tr>
					<tr>
						<td class="td_title">월세가</td>
						<td class="td_red" id="updateMrent" colspan="2" style='padding-left: 30px' >
							<input type="text" name="mrent">
						</td>
					</tr>
					<tr> <td height="10"></td> </tr>
					<tr> <td class="td_title">주소</td>
						 <td class="td_red" colspan="2" style='padding-left: 30px' >
							<input type="text" name="post" id="sample4_postcode" placeholder="우편번호">
							<input type="button" onclick="sample4_execDaumPostcode()" value="우편번호 찾기" style="margin: 0 10px;">
							<input type="text" name="addr" id="sample4_roadAddress" placeholder="도로명주소">
							<input type="text" name="addr2" id="sample4_jibunAddress" placeholder="지번주소" style="display: none;">
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
	<div id="registerDiv">
		<input type="submit" value="등록하기">
		<input type="reset" value="다시작성">
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