<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<!DOCTYPE html>
<html>
<head>
<style>
        .seat {
            width: 30px;
            height: 30px;
        }
        
        .clicked {
            background-color: red;
            color: white;
        }
        
        .soldOut {
        	background-color: black;
            color: white;
        }
        
        #select,#info {display:inline-block;}
    </style>
<title>ticketing</title>
</head>

<body>
	<div id=container>
		
		<div id="body">
		<form id="ticketingForm" method="post">
			<sec:authorize access="isAuthenticated()">
			<sec:authentication property="principal" var="user" />
				<input type="hidden" name="tk_id" value="${user.username}">
			</sec:authorize>
			<input type="hidden" id="show_no" name="show_no" value="${dto.show_no}">
			<input type="hidden" name="tk_no" id="tk_no">
			<div id="select">
				<ul>
					<li><div id="selectPeople">
						성인 : <select class="people" id="tk_a" name="tk_a">
							<option value="0">선택</option>
							<c:forEach begin="1" end="8" var="i">
								<option value="${i}">${i}</option>
							</c:forEach>
						</select> 명
						청소년 : <select class="people" id="tk_c" name="tk_c">
						<option value="0">선택</option>
							<c:forEach begin="1" end="8" var="i">
								<option value="${i}">${i}</option>
							</c:forEach>
						</select> 명
					</div></li>
					<li><div id="selectSeat" class="seat-wrapper"></div></li>
				</ul>
			</div>
			<div id="info">
				<ul>
					<li><div id="title">${dto.mov_title}</div></li>
					<li><div id="th_no">${dto.cine_name} / ${dto.th_no}관</div></li>
					<li><div id="show_date"><fmt:formatDate value="${dto.show_date}" pattern="yyyy년 MM월 dd일"/></div></li>
					<li><div id="show_time">${dto.show_h}시 ${dto.show_m}분</div></li>
					<li>선택좌석<div id="seat"></div><input type="hidden" id="tk_seat" name="tk_seat"></li>
					<li><div id="people"></div></li>
					<li><div id="pay_msg"></div><input type="hidden" id="tk_pay" name="tk_pay"></li>
					<li><div><input type="submit" value="다음"></div></li>
				</ul>
			</div>
		</form>
		</div>
		
	</div>
</body>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
	
	$(function(){
		
		let test = [];
		let selectedSeats = new Array();
		let selectedSeatsMap = [];
		const seatWrapper = document.querySelector(".seat-wrapper");
		let clicked = "";
		let div = "";
		let th_row = ${dto.th_row};
		let th_col = ${dto.th_col};
		let people_chk = 0;
		let ss_len = 0;
		
		let tk_no = Math.floor(Math.random() * 1000000);
		$("#tk_no").val("${dto.mov_no}"+tk_no);
		
		for (let i = 0; i < th_col; i++) {
		    div = document.createElement("div");
		    seatWrapper.append(div);
		    for (let j = 0; j < th_row; j++) {
		        const input = document.createElement('input');
		        input.type = "button";
		        input.name = "seats"
		        input.classList = "seat";
		        //3중포문을 사용하지 않기위해 
		        mapping(input, i, j);
		      	
		        div.append(input);
		        input.addEventListener('click', function(e) {
		            
		            //중복방지 함수
		            selectedSeats = selectedSeats.filter((element, index) => selectedSeats.indexOf(element) != index);
					
		            //click class가 존재할때(제거해주는 toggle)
		            if (input.classList.contains("clicked")) {
		            	
		                input.classList.remove("clicked");
		                clicked = document.querySelectorAll(".clicked");
		                selectedSeats.splice(selectedSeats.indexOf(e.target.value), 1);
		                clicked.forEach((data) => {
		                    selectedSeats.push(data.value);
		                });
		                
		                ss_len = selectedSeats.length;
		                
		                $("#seat").empty();
		                $("#seat").append(selectedSeats);
		                $("#tk_seat").val(selectedSeats);
		                //click class가 존재하지 않을때 (추가해주는 toggle)
		            } else {
		            	
		            	if(people_chk==0){
	                		alert("예매 인원을 선택하세요.");
	                		return false;
		            	}
		            	
		            	if(ss_len==people_chk){
		                	alert(people_chk+"석까지 선택하실 수 있습니다.");
		                	return false;
		                }
		            	
		                input.classList.add("clicked");
		                clicked = document.querySelectorAll(".clicked");
		                clicked.forEach((data) => {
		                    selectedSeats.push(data.value);
		                });
		                
		                ss_len = selectedSeats.length;
		                
		                $("#seat").empty();
		                $("#seat").append(selectedSeats);
		                $("#tk_seat").val(selectedSeats);
		            }
		           
		        })
                
                $.ajax({
        			url:"/ticket/selectSeat",
        			data:"show_no="+$("#show_no").val(),
        			method:"get"
        		}).done(function(data){
        			
        			for (let k in data){
        	        	let seat_arr = data[k].split(",");
        	        	for(let p in seat_arr){
        	        		if(seat_arr[p]==input.value){
        			        	input.classList.add("soldOut");
        			        	input.disabled = "true";
        			        }//if
        	        	}//for
        	        }//for
        		
        		})//ajax
		        
		    }
		}

		function mapping(input, i, j) {
		    if (i === 0) {
		        input.value = "A" + j;
		    } else if (i === 1) {
		        input.value = "B" + j;
		    } else if (i === 2) {
		        input.value = "C" + j;
		    } else if (i === 3) {
		        input.value = "D" + j;
		    } else if (i === 4) {
		        input.value = "E" + j;
		    } else if (i === 5) {
		        input.value = "F" + j;
		    } else if (i === 6) {
		        input.value = "G" + j;
		    } else if (i === 7) {
		    	input.value = "H" + j;
		    } else if (i == 8) {
		    	input.value = "I" + j;
		    }
		}
		
		
		
		let chk = 0;
		
		$(".people").focus(function(){
			chk = $(this).val();
		}).change(function(){
			let a = Number($("#tk_a").val());
			let c = Number($("#tk_c").val());
			let str = "";
			let pay = 0;
			
			if(a+c>8){
				alert("인원은 8명까지 선택할 수 있습니다.");
				$(this).val(chk);
				return false;
			}//if
			
			if(a+c<ss_len){
				alert("좌석을 취소한 후 변경 해 주세요");
				$(this).val(chk);
				return false;
			}//if
			
			people_chk = a+c;
			
			$("#pay_msg").empty();
			$("#people").empty();
			
			if(a!=0){
				str += "<div>성인 "+a+"인</div>";
				pay += a * 10000;
			}//if
			if(c!=0){
				str += "<div>청소년 "+c+"인</div>";
				pay += c * 7000;
			}//if
			
			$("#people").append(str);
			$("#tk_pay").val(pay);
			$("#pay_msg").append("총 "+pay+"원");
			
		})//.peopleChange
		
		$("#ticketingForm").submit(function(){
			
			if(people_chk==0){
				alert("예매할 인원을 선택하세요");
				return false;
			}//if
			
			if(people_chk!=ss_len){
				alert("예매 좌석을 확인 해 주세요");
				return false;
			}//if
			
		})//submit
		
	})//ready
	
</script>
</html>