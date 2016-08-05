<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html lang="en">
	<head>
		<base href="<%=basePath%>">
		<meta charset="utf-8" />
		<title></title>
		<meta name="description" content="overview & stats" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0" />
		<link href="static/css/bootstrap.min.css" rel="stylesheet" />
		<link href="static/css/bootstrap-responsive.min.css" rel="stylesheet" />
		<link rel="stylesheet" href="static/css/font-awesome.min.css" />
		<link rel="stylesheet" href="static/css/ace.min.css" />
		<link rel="stylesheet" href="static/css/ace-responsive.min.css" />
		<link rel="stylesheet" href="static/css/ace-skins.min.css" />
		<script type="text/javascript" src="static/js/jquery-1.7.2.js"></script>
		<!--提示框-->
		<script type="text/javascript" src="static/js/jquery.tips.js"></script>
		
		<style type="text/css">
		#dialog-add,#dialog-message,#dialog-comment{width:100%; height:100%; position:fixed; top:0px; z-index:99999999; display:none;}
		.commitopacity{position:absolute; width:100%; height:400px; background:#7f7f7f; filter:alpha(opacity=50); -moz-opacity:0.5; -khtml-opacity: 0.5; opacity: 0.5; top:0px; z-index:99999;}
		.commitbox{width:100%; margin:0px auto; position:absolute; top:0px; z-index:99999;}
		.commitbox_inner{width:96%; height:225px;  margin:6px auto; background:#efefef; border-radius:5px;}
		.commitbox_top{width:100%; height:220px; margin-bottom:10px; padding-top:10px; background:#FFF; border-radius:5px; box-shadow:1px 1px 3px #e8e8e8;}
		.commitbox_top textarea{width:95%; height:165px; display:block; margin:0px auto; border:0px;}
		.commitbox_cen{width:95%; height:40px; padding-top:10px;}
		.commitbox_cen div.left{float:left;background-size:15px; background-position:0px 3px; padding-left:18px; color:#f77500; font-size:16px; line-height:27px;}
		.commitbox_cen div.left img{width:30px;}
		.commitbox_cen div.right{float:right; margin-top:7px;}
		.commitbox_cen div.right span{cursor:pointer;}
		.commitbox_cen div.right span.save{border:solid 1px #c7c7c7; background:#6FB3E0; border-radius:3px; color:#FFF; padding:5px 10px;}
		.commitbox_cen div.right span.quxiao{border:solid 1px #f77400; background:#f77400; border-radius:3px; color:#FFF; padding:4px 9px;}
		</style>
		
		<!--引入属于此页面的js -->
		<script type="text/javascript" src="static/js/myjs/sms.js"></script>
	</head>
<body>
		<!-- 编辑手机号  -->
		<div id="dialog-add">
			<div class="commitopacity"></div>
		  	<div class="commitbox">
			  	<div class="commitbox_inner">
			        <div class="commitbox_top">
			        	<textarea name="PHONEs" id="PHONEs" placeholder="请选输入对方手机号,多个请用(;)分号隔开" title="请选输入对方手机号,多个请用(;)分号隔开"></textarea>
			            <div class="commitbox_cen">
			                <div class="left" id="cityname"></div>
			                <div class="right"><span class="save" onClick="savePHONE()">保存</span>&nbsp;&nbsp;<span class="quxiao" onClick="cancel_pl()">取消</span></div>
			            </div>
			        </div>
			  	</div>
		  	</div>
		</div>


		<div id="zhongxin">
		<input type="hidden" name="isAll" id="isAll" value="no"/>
		<input type="hidden" name="TYPE" id="TYPE" value="1"/>
		<table style="width:99%;">
			<tr>
				<td style="margin-top:0px;">
					 <div style="float: left;"><textarea name="PHONE" id="PHONE" rows="1" cols="50" style="width:530px;height:20px;" placeholder="请选输入对方手机号,多个请用(;)分号隔开" title="请选输入对方手机号,多个请用(;)分号隔开">${pd.PHONE}</textarea></div>
					 <div style="float: right;"><a class='btn btn-mini btn-info' title="编辑手机号" onclick="dialog_open();"><i class='icon-edit'></i></a></div>
				</td>
			</tr>
			<tr>
				<td id="nr">
					 <textarea name="CONTENT" id="CONTENT" style="width:98%;height:165px;" rows="7" cols="50" title="第三方短信内容需要提交官方审核,否则发送失败!">您的验证码是：12358 。请不要把验证码泄露给其他人。</textarea>
				</td>
			</tr>
			<tr>
				<td style="text-align: center;">
					<a class="btn btn-mini btn-primary" onclick="sendSms();">发送</a>
					<a class="btn btn-mini btn-danger" onclick="top.Dialog.close();">取消</a>
					<label style="float:left;padding-left: 32px;"><input name="form-field-radio" id="form-field-radio1" onclick="setType('1');" checked="checked" type="radio" value="icon-edit"><span class="lbl">短信接口1</span></label>
					<label style="float:left;padding-left: 5px;"><input name="form-field-radio" id="form-field-radio2" onclick="setType('2');" type="radio" value="icon-edit"><span class="lbl">短信接口2</span></label>
					<label style="float:left;padding-left: 15px;"><input name="form-field-checkbox" class="ace-checkbox-2" type="checkbox" id="allusers" onclick="isAll();" /><span class="lbl">全体用户</span></label>
				</td>
			</tr>
		</table>
		</div>
		
		<div id="zhongxin2" class="center" style="display:none"><br/><img src="static/images/jzx.gif" id='msg' /><br/><h4 class="lighter block green" id='msg'>正在发送...</h4></div>
		
	
	
		<!-- 引入 -->
		<script type="text/javascript">window.jQuery || document.write("<script src='static/js/jquery-1.9.1.min.js'>\x3C/script>");</script>
		<script src="static/js/bootstrap.min.js"></script>
		<script src="static/js/ace-elements.min.js"></script>
		<script src="static/js/ace.min.js"></script>
		
</body>
</html>