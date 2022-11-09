/**
 * 
 */

function com_check(){
	if($.trim($("#cont_com").val())==""){
      alert("코멘트를 남겨주세요!");
      $("#cont_com").val("").focus();
      return false;
	}
}



	

