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
		
		<!-- 上传图片插件 -->
		<link href="plugins/uploadify/uploadify.css" rel="stylesheet" type="text/css">
		<script type="text/javascript" src="plugins/uploadify/swfobject.js"></script>
		<script type="text/javascript" src="plugins/uploadify/jquery.uploadify.v2.1.4.min.js"></script>
		<!-- 上传图片插件 -->
		<script type="text/javascript">
		var jsessionid = "<%=session.getId()%>";  //勿删，uploadify兼容火狐用到
		</script>
		<!--引入属于此页面的js -->
		<script type="text/javascript" src="static/js/myjs/sys.js"></script>	
		
		<!--提示框-->
		<script type="text/javascript" src="static/js/jquery.tips.js"></script>
		
		
	</head>
<body>

<div id="zhongxin">
 <div class="span6">
	<div class="tabbable">
            <ul class="nav nav-tabs" id="myTab">
              <li class="active"><a data-toggle="tab" href="#home"><i class="green icon-home bigger-110"></i> 配置 NO1</a></li>
              <li><a data-toggle="tab" href="#profile"><i class="green icon-cog bigger-110"></i>配置 NO2</a></li>
              <li><a data-toggle="tab" href="#profile3"><i class="green icon-cog bigger-110"></i>配置 NO3</a></li>
            </ul>
            <div class="tab-content">
			  <div id="home" class="tab-pane in active">
				<form action="head/saveSys.do" name="Form" id="Form" method="post">
				<table id="table_report" class="table table-striped table-bordered table-hover">
					<tr>
						<td style="width:70px;text-align: right;padding-top: 13px;">系统名称:</td>
						<td><input type="text" name="YSYNAME" id="YSYNAME" value="${pd.YSYNAME }" placeholder="这里输入系统名称" style="width:90%" title="系统名称"/></td>
					
						<td style="width:70px;text-align: right;padding-top: 13px;">每页条数:</td>
						<td><input type="number" name="COUNTPAGE" id="COUNTPAGE" value="${pd.COUNTPAGE }" placeholder="这里输入每页条数" style="width:90%" title="每页条数"/></td>
					</tr>
				</table>
				
				<table id="table_report" class="table table-striped table-bordered table-hover">
					<tr>
						<td style="text-align: center;" colspan="100">
							邮件服务器配置
						</td>
					</tr>
					<tr>
						<td style="width:50px;text-align: right;padding-top: 13px;">SMTP:</td>
						<td><input type="text" name="SMTP" id="SMTP" value="${pd.SMTP }" placeholder="例如:smtp.qq.com" style="width:90%" title="SMTP"/></td>
					
						<td style="width:50px;text-align: right;padding-top: 13px;">端口:</td>
						<td><input type="number" name="PORT" id="PORT" value="${pd.PORT }" placeholder="一般为：25" style="width:90%" title="端口"/></td>
					</tr>
					<tr>
						<td style="width:50px;text-align: right;padding-top: 13px;">邮箱:</td>
						<td><input type="email" name="EMAIL" id="EMAIL" value="${pd.EMAIL }" placeholder="请输入邮件服务器邮箱" style="width:90%" title="邮箱"/></td>
					
						<td style="width:50px;text-align: right;padding-top: 13px;">密码:</td>
						<td><input type="password" name="PAW" id="PAW" value="${pd.PAW }" placeholder="请输入邮箱密码" style="width:90%" title="密码"/></td>
					</tr>
				</table>
				
				<table id="table_report" class="table table-striped table-bordered table-hover">
					<tr>
						<td style="text-align: center;" colspan="100">
							短信接口&nbsp;(短信商一&nbsp;<a href="http://www.dxton.com/" target="_blank">官网</a>)
						</td>
					</tr>
					<tr>
						<td style="width:50px;text-align: right;padding-top: 13px;">账号:</td>
						<td><input type="email" name="SMSU1" id="SMSU1" value="${pd.SMSU1 }" placeholder="请输入账号" style="width:90%" title="邮箱"/></td>
					
						<td style="width:50px;text-align: right;padding-top: 13px;">密码:</td>
						<td><input type="password" name="SMSPAW1" id="SMSPAW1" value="${pd.SMSPAW1 }" placeholder="请输入密码" style="width:90%" title="密码"/></td>
					</tr>
					<tr>
						<td style="text-align: center;" colspan="100">
							短信接口&nbsp;(短信商二&nbsp;<a href="http://www.ihuyi.com/" target="_blank">官网</a>)
						</td>
					</tr>
					<tr>
						<td style="width:50px;text-align: right;padding-top: 13px;">账号:</td>
						<td><input type="email" name="SMSU2" id="SMSU2" value="${pd.SMSU2 }" placeholder="请输入账号" style="width:90%" title="邮箱"/></td>
					
						<td style="width:50px;text-align: right;padding-top: 13px;">密码:</td>
						<td><input type="password" name="SMSPAW2" id="SMSPAW2" value="${pd.SMSPAW2 }" placeholder="请输入密码" style="width:90%" title="密码"/></td>
					</tr>
				</table>
		
				<table class="center" style="width:100%" >
					<tr>
						<td style="text-align: center;" colspan="100">
							<a class="btn btn-mini btn-primary" onclick="save();">保存</a>
							<a class="btn btn-mini btn-danger" onclick="top.Dialog.close();">取消</a>
						</td>
					</tr>
				</table>
				</form>
			  </div>
			  <div id="profile" class="tab-pane">
			  	<form action="head/saveSys2.do" name="Form2" id="Form2" method="post">
				<table id="table_report" class="table table-striped table-bordered table-hover">
					<tr>
						<td style="text-align: center;" colspan="100">
							文字水印配置
							<label style="float:left;padding-left: 15px;"><input name="fcheckbox" class="ace-checkbox-2" type="checkbox" id="check1" onclick="openThis1();" /><span class="lbl">开启</span></label>
						</td>
					</tr>
					<tr>
						<td style="width:50px;text-align: right;padding-top: 12px;">内容:</td>
						<td><input type="text" name="fcontent" id="fcontent" value="${pd.fcontent }"  style="width:90%" title="水印文字内容"/></td>
						<td style="width:50px;text-align: right;padding-top: 12px;">字号:</td>
						<td><input type="number" name="fontSize" id="fontSize" value="${pd.fontSize }"  style="width:90%" title="字号"/></td>
					</tr>
					<tr>
						<td style="width:50px;text-align: right;padding-top: 12px;">X坐标:</td>
						<td><input type="number" name="fontX" id="fontX" value="${pd.fontX }"  style="width:90%" title="X坐标"/></td>
						<td style="width:50px;text-align: right;padding-top: 12px;">Y坐标:</td>
						<td><input type="number" name="fontY" id="fontY" value="${pd.fontY }"  style="width:90%" title="Y坐标"/></td>
					</tr>
				</table>
				
				<table id="table_report" class="table table-striped table-bordered table-hover">
					<tr>
						<td style="text-align: center;" colspan="100">
							图片水印配置
							<label style="float:left;padding-left: 15px;"><input name="fcheckbox" class="ace-checkbox-2" type="checkbox" id="check2" onclick="openThis2();" /><span class="lbl">开启</span></label>
						</td>
					</tr>
					<tr>
						<td style="width:50px;text-align: right;padding-top: 12px;">X坐标:</td>
						<td><input type="number" name="imgX" id="imgX" value="${pd.imgX }" style="width:90%" title="X坐标"/></td>
						<td style="width:50px;text-align: right;padding-top: 12px;">Y坐标:</td>
						<td><input type="number" name="imgY" id="imgY" value="${pd.imgY }"  style="width:90%" title="Y坐标"/></td>
					</tr>
					<tr>
						<td style="width:50px;text-align: right;padding-top: 12px;">水印:</td>
						<td colspan="10">
						<div style="float:left;"><img src="<%=basePath%>uploadFiles/uploadImgs/${pd.imgUrl}"  width="100"/></div>
						<div style="float:right;"><input type="file" name="TP_URL" id="uploadify1" keepDefaultStyle = "true"/></div>
						</td>
					</tr>
				</table>
				
				<table class="center" style="width:100%" >
					<tr>
						<td style="text-align: center;" colspan="100">
							<a class="btn btn-mini btn-primary" onclick="save2();">保存</a>
							<a class="btn btn-mini btn-danger" onclick="top.Dialog.close();">取消</a>
						</td>
					</tr>
				</table>
				<input type="hidden" name="isCheck1" id="isCheck1" value="${pd.isCheck1 }"/>
				<input type="hidden" name="isCheck2" id="isCheck2" value="${pd.isCheck2 }"/>
				<input type="hidden" name="imgUrl" id="imgUrl" value="${pd.imgUrl }"/>
				<input type="hidden" value="no" id="hasTp1" />
				</form>
			  </div>
			  
			  
			  <div id="profile3" class="tab-pane">
			  	<form action="head/saveSys3.do" name="Form3" id="Form3" method="post">
				<table id="table_report" class="table table-striped table-bordered table-hover">
					<tr>
						<td style="text-align: center;" colspan="100">
							微信接口配置
						</td>
					</tr>
					<tr>
						<td style="width:120px;text-align: right;padding-top: 12px;">URL(服务器地址):</td>
						<td><input type="text" name="WXURL" id="WXURL" value="<%=basePath%>weixin/index " disabled="disabled"  style="width:90%" title="URL(服务器地址)必须是域名，ip地址验证通不过"/></td>
					</tr>
					<tr>
						<td style="width:120px;text-align: right;padding-top: 12px;">Token(令牌):</td>
						<td><input type="text" name="Token" id="Token" value="${pd.Token }"  style="width:90%" title="URL(服务器地址)"/></td>
					</tr>
				</table>
				
				<table id="table_report" class="table table-striped table-bordered table-hover">
					<tr>
						<td style="text-align: center;" colspan="100">
							即时聊天服务器配置
						</td>
					</tr>
					<tr>
						<td style="width:50px;text-align: right;padding-top: 13px;">地址:</td>
						<td><input type="text" name="WIMIP" id="WIMIP" value="${pd.WIMIP }" placeholder="请输入服务器地址" style="width:90%" title="服务器地址"/></td>
					
						<td style="width:50px;text-align: right;padding-top: 13px;">端口:</td>
						<td><input type="number" name="WIMPORT" id="WIMPORT" value="${pd.WIMPORT }" placeholder="端口" style="width:90%" title="端口"/></td>
					</tr>
				</table>
				
				<table id="table_report" class="table table-striped table-bordered table-hover">
					<tr>
						<td style="text-align: center;" colspan="100">
							在线管理服务器配置
						</td>
					</tr>
					<tr>
						<td style="width:50px;text-align: right;padding-top: 13px;">地址:</td>
						<td><input type="text" name="OLIP" id="OLIP" value="${pd.OLIP }" placeholder="请输入服务器地址" style="width:90%" title="服务器地址"/></td>
					
						<td style="width:50px;text-align: right;padding-top: 13px;">端口:</td>
						<td><input type="number" name="OLPORT" id="OLPORT" value="${pd.OLPORT }" placeholder="端口" style="width:90%" title="端口"/></td>
					</tr>
				</table>
				
				<table class="center" style="width:100%" >
					<tr>
						<td style="text-align: center;" colspan="100">
							<a class="btn btn-mini btn-primary" onclick="save3();">保存</a>
							<a class="btn btn-mini btn-danger" onclick="top.Dialog.close();">取消</a>
						</td>
					</tr>
				</table>
				</form>
			  </div>
			  
			  
            </div>
	</div>
 </div><!--/span-->



</div>
		
<div id="zhongxin2" class="center" style="display:none"><br/><br/><br/><br/><img src="static/images/jiazai.gif" /><br/><h4 class="lighter block green"></h4></div>
	
		<!-- 引入 -->
		<script type="text/javascript">window.jQuery || document.write("<script src='static/js/jquery-1.9.1.min.js'>\x3C/script>");</script>
		<script src="static/js/bootstrap.min.js"></script>
		<script src="static/js/ace-elements.min.js"></script>
		<script src="static/js/ace.min.js"></script>
		<script type="text/javascript">
		$(document).ready(function(){
			if("${pd.isCheck1 }" == "yes"){
				$("#check1").attr("checked",true);
			}else{
				$("#check1").attr("checked",false);
			}
			if("${pd.isCheck2 }" == "yes"){
				$("#check2").attr("checked",true);
			}else{
				$("#check2").attr("checked",false);
			}
		});
		</script>
</body>
</html>