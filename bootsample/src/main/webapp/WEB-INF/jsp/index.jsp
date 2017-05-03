<!DOCTYPE HTML>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://ckeditor.com" prefix="ckeditor" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
<head>
	<meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta http-equiv="Pragma" content="no-cache"> 
    <meta http-equiv="Cache-Control" content="no-cache"> 
    <meta http-equiv="Expires" content="Sat, 01 Dec 2001 00:00:00 GMT">
    
    <title>Magazine Manager | Home</title>
    
    <link href="static/css/bootstrap.min.css" rel="stylesheet">
     <link href="static/css/style.css" rel="stylesheet">
    
    <!--[if lt IE 9]>
		<script src="static/js/html5shiv.min.js"></script>
		<script src="static/js/respond.min.js"></script>
	<![endif]-->
</head>
<body>

	<div role="navigation">
		<div class="navbar navbar-inverse">
			<a href="/" class="navbar-brand">Home</a>
			<div class="navbar-collapse collapse">
				<ul class="nav navbar-nav">
					<li><a href="new-task">New Magazine</a></li>
					<li><a href="all-tasks">All Magazines</a></li>
				</ul>
			</div>
		</div>
	</div>
	
	<c:choose>
		<c:when test="${mode == 'MODE_HOME'}">
			<div class="container" id="homeDiv">
				<div class="jumbotron text-center">
					<h1>Team 8 <br>Welcome to Magazine Manager</h1>
				</div>
			</div>
		</c:when>
		<c:when test="${mode == 'MODE_TASKS'}">
			<div class="container text-center" id="tasksDiv">
				<h3>My Magazine</h3>
				<hr>
				<div class="table-responsive">
					<table class="table table-striped table-bordered text-left">
						<thead>
							<tr>
								<th width="5%" >Id</th>
								<th width="20%">Name</th>
								<th width="30%">Description</th>
								<th width="15%">Download File</th>
								<th width="15%">Date Created</th>
								<th width="5%" >Finished</th>
								<th width="5%" ></th>
								<th width="5%" ></th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="task" items="${tasks}">
								<tr>
									<td width="5%"> ${task.id}</td>
									<td width="20%"><a href="detail-task?id=${task.id}">${task.name}</a></td>
									<td width="30%">${task.description}</td>
									<td width="15%"><a href="${task.file}" target="_blank">${task.file}</a></td>
									<td width="15%"><fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss" value="${task.dateCreated}"/></td>
									<td width="5%">${task.finished}</td>
									<td width="5%"><a href="update-task?id=${task.id}"><span class="glyphicon glyphicon-pencil"></span></a></td>
									<td width="5%"><a href="delete-task?id=${task.id}"><span class="glyphicon glyphicon-trash"></span></a></td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
		</c:when>
		<c:when test="${mode == 'MODE_NEW' || mode == 'MODE_UPDATE'}">
		
			<div class="container text-center">
				<h3>Manage Magazine</h3>
				<hr>
				<form class="form-horizontal" enctype="multipart/form-data"enctype="multipart/form-data" method="POST" action="save-task">
					<input type="hidden" name="id" value="${task.id}"/>
					<div class="form-group">
						<label class="control-label col-md-3">Title</label>
						<div class="col-md-7">
							<input type="text" class="form-control" name="name" value="${task.name}" placeholder="Tiêu đề"/>
						</div>				
					</div>
					<div class="form-group">
						<label class="control-label col-md-3">Content</label>
						<div class="col-md-7">
							<textarea id="ckeditor2"  class="form-control" name="description" placeholder="Nội dung">${task.description}</textarea>
							<ckeditor:replace replace="ckeditor2" basePath="/ckeditor/" />		
						</div>				
					</div>
					<div class="form-group">
						<label for="message" class="control-label col-md-3">Đính kèm</label>
						<div class="col-md-7">
							<div class="input-group">
								<label class="input-group-btn"> <span
									class="btn btn-primary"> Browse&hellip; <input type="file" name="file"
										style="display: none;" multiple>
									</span>
						</label> <input type="text" class="form-control" readonly placeholder="Url file">		
							</div>
							</div>
					</div>
					
					
					
					
					<div class="form-group">
						<label class="control-label col-md-3">Finished</label>
						<div class="col-md-7">
							<input type="radio" class="col-sm-1" name="finished" value="true"/>
							<div class="col-sm-1">Yes</div>
							<input type="radio" class="col-sm-1" name="finished" value="false" checked/>
							<div class="col-sm-1">No</div>
						</div>				
					</div>		
					<div class="form-group">
						<input type="submit" class="btn btn-primary" value="Save"/>
					</div>
				</form>
			</div>
		</c:when>
		<c:when test="${mode == 'MODE_DETAIL'}">
			<div class="container text-center">
				<h3>DETAIL Magazine</h3>
				<hr>
				<form class="form-horizontal" enctype="multipart/form-data"enctype="multipart/form-data" method="POST" action="save-task">
					<input type="hidden" name="id" value="${task.id}"/>
					<div class="form-group">
						<label class="control-label col-md-3">Title</label>
						<div class="col-md-7">
							<p class="form-control">${task.name}</p>
						</div>				
					</div>
					<div class="form-group">
						<label class="control-label col-md-3">Content</label>
						<div class="col-md-7">
							<p class="form-control">${task.description}</p>	
						</div>				
					</div>
					<div class="form-group">
						<label for="message" class="control-label col-md-3">Đính kèm</label>
						<div class="col-md-7">
							<div class="input-group">
								<a href="${task.file}" class="control-label col-md-3" target="_blank">${task.file}</a>		
							</div>
							</div>
					</div>
					<div class="form-group">
						<label class="control-label col-md-3">Date</label>
						<div class="col-md-7">
							<p class="control-label col-md-3">${task.dateCreated}</p>	
						</div>				
					</div>
						

				</form>
			</div>
		</c:when>		
		
				
	</c:choose>
	<!-- <script type="text/javascript">
			                //Replace the <textarea id="editor1"> with a CKEditor
			                // instance, using default configuration.
			                CKEDITOR.replace('editor1');
			            </script> -->
			            
	
	<script src="static/js/jquery-1.11.1.min.js"></script>
    <script src="static/js/bootstrap.min.js"></script>
    <script type="text/javascript">
    $(function() {

		  // We can attach the `fileselect` event to all file inputs on the page
		  $(document).on('change', ':file', function() {
		    var input = $(this),
		        numFiles = input.get(0).files ? input.get(0).files.length : 1,
		        label = input.val().replace(/\\/g, '/').replace(/.*\//, '');
		    input.trigger('fileselect', [numFiles, label]);
		  });

		  // We can watch for our custom `fileselect` event like this
		  $(document).ready( function() {
		      $(':file').on('fileselect', function(event, numFiles, label) {
		    	  	
		          var input = $(this).parents('.input-group').find(':text'),
		              log = numFiles > 1 ? numFiles + ' files selected' : label;

		          if( input.length ) {
		              input.val(log);
		          } else {
		              if( log ) alert(log);
		          }
		          var filePath = $(this).val();
		            console.log(filePath);
		      });
		  });
		  
		});
    </script>
</body>
</html>