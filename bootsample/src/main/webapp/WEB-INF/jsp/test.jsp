<!DOCTYPE HTML>
<html>
<head>
<meta charset="utf-8">
<title>Demo upload và download</title>

<!-- Bootstrap core CSS -->

<link href="static/css/bootstrap.min.css" rel="stylesheet">



<script src="static/js/jquery-2.1.1.min.js"></script>
<script src="static/js/bootstrap.min.js" type="text/javascript"></script>
<script src="static/js/ckeditor.js"></script>

<style type="text/css">
.btn-file {
	position: relative;
	overflow: hidden;
}

.btn-file input[type=file] {
	position: absolute;
	top: 0;
	right: 0;
	min-width: 100%;
	min-height: 100%;
	font-size: 100px;
	text-align: right;
	filter: alpha(opacity = 0);
	opacity: 0;
	outline: none;
	background: white;
	cursor: inherit;
	display: block;
}
</style>

</head>
<body>

	<div class="container">
		<form class="form-horizontal" method="post" action="upload-news">
			
			<div class="form-group">
				<label for="name" class="col-sm-2 control-label">Tiêu đề</label>
				<div class="col-sm-10">
					<input type="text" class="form-control" id="title" name="tile"
						placeholder="Tiêu đề" value="">
				</div>
			</div>
			<div class="form-group">
				<label for="message" class="col-sm-2 control-label">Nội dung</label>
				<div class="col-sm-10">
					<textarea id="editor" class="form-control" rows="4" name="content"></textarea>
					<script>
						CKEDITOR.replace("editor");
					</script>
				</div>
			</div>
			<div class="form-group">
				<label for="message" class="col-sm-2 control-label">Đính kèm</label>
				<div class="col-sm-10">
					<div class="input-group">
						<label class="input-group-btn"> <span
							class="btn btn-primary"> Browse&hellip; <input type="file"
								style="display: none;" multiple>
						</span>
						</label> <input type="text" class="form-control" readonly>
					</div>
				</div>
			</div>
			<div class="form-group">
				<div class="col-sm-10 col-sm-offset-2">
					<input id="submit" name="submit" type="submit" value="Send"
						class="btn btn-primary">
				</div>
			</div>

		</form>
	</div>

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
<script type="text/javascript" src="js/myscript.js"></script>
</html>