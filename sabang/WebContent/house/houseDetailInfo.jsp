<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
*{
 padding: 0;
 margin:0;
}
.wrapper {
	padding: 1rem;
	background: tomato;
}

.main-element {
	margin-bottom: 2rem;
	width: 100%;
	height: 100px;
	background: white;
}

.element-container {
	display: flex;
	justify-content: space-between;
}

#rightElement {
	width: 56%;
	height: 500px;
	background: orange;
}

#leftElement {
	width: 43%;
	height: 600px;
	background: orange;
}

/* houseImg, agent */
#rightElement > div{
	background: silver;
	padding : 10px;
}

/* houseImg */
#rightElement > :first-child{
	margin-bottom : 2rem;
}

/* housePrice, board */
#leftElement > div{
	background: silver;
	height : 48%;
}


/* housePrice */
#leftElement > :first-child{ 
	background: white;
	height : 48%;
	margin-bottom : .3rem;
}

</style>
</head>
<body>
	<div class="wrapper">
		<div class="main-element">hcode</div>
		<div class="element-container">
			<div class="element" id = "rightElement">
				<div class="houseImg"> img </div>
				<div class="agentInfo"> agent </div>
			</div>
			<div class="element" id = "leftElement">
				<div class="housePrice"> price </div>
				<div class="board"> board </div>
			</div>
		</div>
	</div>


</body>
</html>