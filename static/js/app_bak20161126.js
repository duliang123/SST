/**
 * 本文件定义主页的方法和组件 
 */
 
$(document).ready(function () {
    jQuery.i18n.properties({
        name : 'message',
        path : basePath + 'i18n/',
        mode : 'map',
        callback : function() {// 加载成功后设置显示内容
//            alert(jQuery.i18n.prop("success"));
        }
    });
    
	$('#APPID').chosen({});
	//获取业务列表 
	$.ajax({
		type : 'POST',
		url : basePath+'nm/personal/appAction/getAppList.action',
		dataType : 'json',
		success : function(result){
			var data = result.data;
			var tempHtml="";
			if(data){
				var noAppid = true; 
				$.each(data, function(name,value){
//					tempHtml+='<optgroup label="'+ value.groupName +'">';
					for(var i=0;i<value.groupList.length;i++){
						var v = value.groupList[i];
						if(v.id == APPID){
							noAppid = false;
							tempHtml+='<option value="'+v.id+'" selected>'+v.applicationName+'</option>';
						}else{
							tempHtml+='<option value="'+v.id+'">'+v.applicationName+'</option>';
						}
					}
//					tempHtml+="</optgroup>";
				});
				$('#APPID').append(tempHtml);
				$('#APPID').trigger("chosen:updated").on('change', function(evt, params) {
					var appid = $(this).val();
				    $.ajax({
                        contentType:'application/x-www-form-urlencoded',
						url : basePath+'nm/personal/appAction/switchApp.action',
						dataType : 'json',
                        data:{appId:appid},
						success : function(result){
							if(result.success){
								printMsg(result.msg.message,1);
								APPID = appid;
								location.reload();
							}else{
								printMsg(result.msg.message,2);
							}							
						}
					});
				 });
				 if(noAppid){
					$('#APPID option').eq(0).prop('selected',true);
					$('#APPID').trigger('change');
				}
			}
		}
	});

	$('.treeview').hover(function(){
		if ($('body').hasClass('mini-navbar')) {
			$('.treeview-menu').addClass('none');
			$(this).find('.treeview-menu').removeClass('none').css('display','block');
		}
	},function () {
		if ($('body').hasClass('mini-navbar')) {
			$('.treeview-menu').addClass('none');
		}
	 });
	
	$('.treeview>a').on('click',function(e){
		if($(this).attr('id')==='home'){
			if(currentPage && currentPage.endsWith('newTask.jsp')){
				var r = true;
				if(JSON.stringify(getAllData(false)) != oldTaskEditContent){
					var r = confirm("您所编辑的作业尚未保存，是否确定离开？");
				}
				if (r == true) {
				    treeview_menu($(this).attr('href'));
				} else {
					return false;
				}
			} else {
				treeview_menu($(this).attr('href'));
			}
		}
		if (!$('body').hasClass('mini-navbar')) {
		      var treeView = $(this).next();
	
		      if ((treeView.is('.treeview-menu')) && (treeView.is(':visible'))) {
		    	  treeView.slideUp('normal', function () {
		          treeView.removeClass('menu-open');
		        });
		        treeView.parent("li").removeClass("active");
	
		      }else if ((treeView.is('.treeview-menu')) && (!treeView.is(':visible'))) {
		        var parent = $(this).parents('ul').first();
		        var ul = parent.find('ul:visible').slideUp('normal');
		        ul.removeClass('menu-open');
		        var parent_li = $(this).parent("li");
	
		        treeView.slideDown('normal', function () {
		          treeView.addClass('menu-open');
		          parent.find('.treeview.active').removeClass('active');
		          parent_li.addClass('active');
		        });
		      }
		      
		      if (treeView.is('.treeview-menu')) {
		        e.preventDefault();
		      } 
			}
	    });
 
	var menuObj =[];
	var urlArray = [];
	$.each($('.treeview'),  function(k,v){
		var treeViewName = $(v).find('a span').html(); 
		var lis = $(v).find('ul li');
		$.each(lis,function(i,v){
			var liName = $(v).text();
			var liUrl = $(v).find('a').attr('href');
			urlArray.push(liUrl);
			menuObj.push({
				treeViewName:treeViewName,
				liName :liName,
				liUrl:liUrl
			});
		});
	}); 
	function treeview_menu(url){
		$(".popover").remove();
		$('.treeview-menu li').removeClass('active');	
		$.each(menuObj,function(i,v){
			if(v.liUrl == url){
				createNewTab(v.liName, v.liUrl, v.treeViewName);
				var lis =$('.treeview').find('ul li').find('a');
				$.each(lis,function(i,v){
					if($(v).attr('href') == url){
						$(v).parent().addClass('active');
						$('.treeview').removeClass('active');
						$(v).parent().parent().parent().addClass('active');
					}	
				});
				return;
			}
		});
	}
	
	$('.king-sidebar-menu>.treeview>.treeview-menu a').click(function(event){
		if(currentPage && currentPage.endsWith('newTask.jsp')){
			var r = true;
			if(JSON.stringify(getAllData(false)) != oldTaskEditContent){
				var r = confirm("您所编辑的作业尚未保存，是否确定离开？");
			}
			if (r == true) {
			    treeview_menu($(this).attr('href'));
			}
		} else {
			treeview_menu($(this).attr('href'));
			
		}
		return false;
	});
	 
	
	//获取url参数
	var query = window.location.href;
	var page = query.substring(query.lastIndexOf('/')+2,query.length);
	var fullPage = './app/'+page+'.jsp';

	if(urlArray.indexOf(fullPage) !=-1){
		treeview_menu(fullPage);
	}else{
		treeview_menu('./app/fastExecuteScript.jsp');
	}
	
	 $('.king-layout6-sidebar').find('li').find('a').click(function(e){
		 if($('body').css('overflow') == 'hidden'){
			 $('body').css('overflow','auto');
		 }
	 });
	 
	 $('.navbar-minimalize').click(function () {
	        $("body").toggleClass("mini-navbar");
	        SmoothlyMenu();
	    });
	 
	 (function(){
		 function showCover(){
			 $('#cover').show();
			 $('#coverClose').click(function(){
				 $('#cover').hide();
			 });
		 }
		 if(isNewUser){
			 showCover();
		 }
		 $('#menu1-instruction').click(function(){
			 showCover();
		 });
         
         $('#menu1-logout').click(function() {
			$.ajax({
				type : 'GET',
				url : basePath + 'nm/user/userAction/logout.action',
				success : function(rs) {
					if(rs.success){
						window.location.href=rs.data.loginUrl;						
					}
				}
			});
		});
	 })();
});