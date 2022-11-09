/**
 * 
 */
 
 
 function count(type)  {
  const resultElement = document.getElementById('now');
  
  let number = resultElement.innerText;
  
  if(type === 'plus') {
    number = parseInt(number) + 1;
  }else if(type === 'minus')  {
    number = parseInt(number) - 1;
  }
  
  if(0<=number && number<=6){
  	resultElement.innerText = number;
  }else if(number>6){
  	alert("인원 선택은 6명까지 가능합니다.");
  	number = parseInt(number) - 1;
  	resultElement.innerText = number;
  }
  
  
}
 
 function count2(type)  {
  const resultElement = document.getElementById('now2');
  
  let number = resultElement.innerText;
  
  if(type === 'plus') {
    number = parseInt(number) + 1;
  }else if(type === 'minus')  {
    number = parseInt(number) - 1;
  }
  
  if(0<=number && number<=6){
  	resultElement.innerText = number;
  }else if(number>6){
  	alert("인원 선택은 6명까지 가능합니다.");
  	number = parseInt(number) - 1;
  	resultElement.innerText = number;
  }
  
  
  
}






$( document ).ready( function() {
    $( '.seat-condition' ).click( function() {
       $( '#seat_btn'+ $(this).val() ).toggleClass( 'on' );
    });
 });


function mnClk(movienum){
	if($('#movieSel').val() == ""){
		$('#movie_btn_0' + movienum).addClass('active');
	} else {
		$('#movie_btn_0' + $('#movieSel').val()).removeClass('active');
		$('#movie_btn_0' + movienum).addClass('active');
	}
	
	
	$('#movieSel').val(movienum);
	
	var params = "movienum=" + movienum;
	
	var token = $("meta[name='_csrf']").attr("content");
    var header = $("meta[name='_csrf_header']").attr("content");

	$.ajax({
		type:"POST",
		url:"movieData",
		data: params,
		beforeSend : function (xhr){
            xhr.setRequestHeader(header, token)
        },
		success:function(data){
			
		},
		error:function(e){
			alert(e.responseText);
		}
	});
	
	
	
}


function regionClk(theaternum){
	
	if($('#regionSel').val() == ""){
		$('#theater_seo_btn_' + theaternum).addClass('active');
	} else {
		$('#theater_seo_btn_' + $('#regionSel').val()).removeClass('active');
		$('#theater_seo_btn_' + theaternum).addClass('active');
	}
	$('#regionSel').val(theaternum);
	
	var params = "theaternum=" + theaternum;
	
	var token = $("meta[name='_csrf']").attr("content");
    var header = $("meta[name='_csrf_header']").attr("content");
	
	$.ajax({
		type:"POST",
		url:"regionDetailList",
		data: params,
		beforeSend : function (xhr){
            xhr.setRequestHeader(header, token)
        },
		success:function(data){
			
		},
		error:function(e){
			alert(e.responseText);
		}
	});
	

	
}


function dateClk(year,month,day){
	
	if($('#dateSel2').val() == ""){
		$('#day-btn_'+day).addClass('select');
	} else {
		$('#day-btn_' + $('#dateSel2').val()).removeClass('select');
		$('#day-btn_' +day).addClass('select');
	}
	$('#dateSel2').val(day);
	var strMonth = "";
	
	if(month<10){
		strMonth = "0" + String(month);
	}else{
		strMonth = String(month);
	}
	
	var strDate = "";
	
	strDate = year+"."+strMonth+"."+day;
	$('#dateSel').val(strDate);
	
	selectConfirm();
	
}

function selectConfirm(){
	
	var flag = false;
	
	var movieSel = $('#movieSel').val();
	if(movieSel !=""){
		params =  movieSel;
		flag = true;
	}
	
	var regionSel = $('#regionSel').val();
	if(regionSel !=""){
		params = regionSel;
		flag = true;
	}
	
	var dateSel = $('#dateSel').val();
	if(dateSel !=""){
		params =  dateSel;
		flag = true;
	}
	
	movieTotalData(params)
	
}


function movieTotalData(params){
	var movieSele = $('#movieSel').val();
	var regionSele = $('#regionSel').val();
	var dateSele = $('#dateSel').val();
	
	var token = $("meta[name='_csrf']").attr("content");
    var header = $("meta[name='_csrf_header']").attr("content");
	
	$.ajax({
		type:"POST",
		url:"movieTotalData",
		data: {movieSel:movieSele,regionSel:regionSele,dateSel:dateSele},
		traditional:true,
		beforeSend : function (xhr){
            xhr.setRequestHeader(header, token)
        },
		success:function(result){
			console.log(result)
			$("#movieschedule").html(result);
		},
		error:function(e){
			alert(e.responseText);
		}
	});
}


function hourClk(movietotalnum){
	if($('#movieTotalSel').val() == ""){
		$('#hour_btn_' + movietotalnum).addClass('sel');
	} else {
		$('#hour_btn_' + $('#movieTotalSel').val()).removeClass('sel');
		$('#hour_btn_' + movietotalnum).addClass('sel');
	}
	$('#movieTotalSel').val(movietotalnum);
	
	var movieTotalSele = $('#movieTotalSel').val();
	var token = $("meta[name='_csrf']").attr("content");
    var header = $("meta[name='_csrf_header']").attr("content");
	
	$.ajax({
		type:"POST",
		url:"movieSelect",
		data: {movieTotalSel:movieTotalSele},
		traditional:true,
		beforeSend : function (xhr){
            xhr.setRequestHeader(header, token)
            },
		success:function(result){
			$("#moviesele").html(result);
		},
		error:function(e){
			alert(e.responseText);
		}
	});
}










 
 
 
 