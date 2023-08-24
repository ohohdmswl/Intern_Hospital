/**
 * ajax 공통 호출 함수
 *
 * @param
 *   url : 서비스 호출URL
 *   method : post, get
 *   async : true, false
 *   param : data parameter
 *   callback : callback function name
 */
function callAjax(url, method, dataType, async, param, callback) {
	//console.log('>>>>>>param일떄',param);
	
	//method는 post 이다. async는 true/false이다.
	if (method == null || method == "") method = "post";
	
	$.ajax({
		url : url,
		type : method,
		dataType : dataType,
		async : async,
		data : param,
		beforeSend: function(xhr) {
			xhr.setRequestHeader("AJAX", "true");
//			$.blockUI({ message: '<h1><img src="/images/admin/comm/busy.gif" /> Just a moment...</h1>', T:99999 });
		},
		success : function(data) {
			callback(data);
		},
		error : function(xhr, status, err) {
			console.log("xhr : " + xhr);
			console.log("status : " + status);
			console.log("err : " + err);
      			
//			if (xhr.status == 901) {
//				alert("로그인 정보가 없습니다.\n다시 로그인 해 주시기 바랍니다.");
//				location.replace('/login.do');
//			} else {
//				alert('A system error has occurred.' + err);
//			}
		},
		complete: function(data) {
//			$.unblockUI();
		}
	});
}
/*
function comcombo(group_code, combo_name, type, selvalue){
	
	//console.log("comcombo Start !!!!!!!!!!!!!! ");
	
	var selectbox = document.getElementById(combo_name);

	var data = {
			"group_code" : group_code
		};	
	
	$(selectbox).find("option").remove();
  	
	//private String dtl_cod;	
	//private String dtl_cod_nm;
	
	$.ajax({ 
	     type: "POST",  
	     url: "/commonproc/comcombo.do", 
	     dataType: "json",  
	     data : data,
	     success: function(data)
	     { 				
	    	 
		     var json_obj = $.parseJSON(JSON.stringify(data));//parse JSON 
		     var jsonstr = json_obj.list;
		     console.log("jsonstr : " + jsonstr);
		     
		     var jsonstr_obj = $.parseJSON(JSON.stringify(jsonstr));//parse JSON 
		     var listLen = jsonstr_obj.length;

	    	 if(type == "all") {
	    	    $(selectbox).append("<option value=''>전체</option>");
	    	 }		     
		     
	    	 if(type == "sel") {
		    	$(selectbox).append("<option value=''>선택</option>");
		     }
	    	 console.log(" selvalue : " + selvalue);
	         for(var i=0; i<listLen; i++)
	         { 		
	        	 var eleString = JSON.stringify(jsonstr_obj[i]);
	        	 var item_obj = $.parseJSON(eleString);//parse JSON
            
	        	 if(selvalue != null && selvalue != null && selvalue != "") {
	        		 if(selvalue == item_obj.dtl_cod) {
	        			 console.log(" item_obj.dtl_cod : " + item_obj.dtl_cod);
	        			 
	        			 $(selectbox).append("<option value='"+ item_obj.dtl_cod + "' selected>" + item_obj.dtl_cod_nm + "</option>");
	        		 } else {
	        			 $(selectbox).append("<option value='"+ item_obj.dtl_cod + "'>" + item_obj.dtl_cod_nm + "</option>");
	        		 }
	        	 } else {
	        		 $(selectbox).append("<option value='"+ item_obj.dtl_cod + "'>" + item_obj.dtl_cod_nm + "</option>");
	        	 }
	         } 
	         
	         $(selectbox).val(selvalue);
	     },
	     error:function(request,status,error){ alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error); }
	});  
};

function selectComCombo(comtype, combo_name, type, searchkey,selvalue){
	
	//console.log("selectComCombo Start !!!!!!!!!!!!!! ");
	
	var selectbox = document.getElementById(combo_name);

	var data = {
			"comtype" : comtype
		   ,"searchkey" : searchkey
		};	
	
	$(selectbox).find("option").remove();
  		
	$.ajax({ 
	     type: "POST",  
	     url: "/system/selectComCombo.do", 
	     dataType: "json",  
	     data : data,
	     success: function(data)
	     { 				
	    	 
		     var json_obj = $.parseJSON(JSON.stringify(data));//parse JSON 
		     var jsonstr = json_obj.list;
		     console.log("jsonstr : " + jsonstr);
		     
		     var jsonstr_obj = $.parseJSON(JSON.stringify(jsonstr));//parse JSON 
		     var listLen = jsonstr_obj.length;

	    	 if(type == "all") {
	    	    $(selectbox).append("<option value=''>전체</option>");
	    	 }		     
		     
	    	 if(type == "sel") {
		    	$(selectbox).append("<option value=''>선택</option>");
		     }
	    	 console.log(" selvalue : " + selvalue);
	         for(var i=0; i<listLen; i++)
	         { 		
	        	 var eleString = JSON.stringify(jsonstr_obj[i]);
	        	 var item_obj = $.parseJSON(eleString);//parse JSON
            
	        	 if(selvalue != null && selvalue != null && selvalue != "") {
	        		 if(selvalue == item_obj.dtl_cod) {
	        			 console.log(" item_obj.cd : " + item_obj.cd);
	        			 
	        			 $(selectbox).append("<option value='"+ item_obj.cd + "' selected>" + item_obj.name + "</option>");
	        		 } else {
	        			 $(selectbox).append("<option value='"+ item_obj.cd + "'>" + item_obj.name + "</option>");
	        		 }
	        	 } else {
	        		 $(selectbox).append("<option value='"+ item_obj.cd + "'>" + item_obj.name + "</option>");
	        	 }
	        	 
	        	 
	         } 
	         
	         $(selectbox).val(selvalue);
	     },
	     error:function(request,status,error){ alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error); }
	});  
};


*/
