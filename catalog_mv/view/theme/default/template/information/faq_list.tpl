<?php echo $header; ?>
<div class="container">

  <div class="row">
    <div id="content" class="<?php echo $class; ?>">
      <div class="row">
      <div  class="col-sm-8" >
      <h3 class="head-title"><?php echo $heading_title; ?></h3>
      <table class="table table-bordered table-striped table-hover">
	    <thead>
		  <tr>
		
			<th><?php echo $text_question; ?></th>
			<th><?php echo $text_answer; ?></th>
		
			
		  </tr>
		</thead>
		<tbody>
		<?php foreach ($all_faq as $faq) { ?>
		  <tr>
		     <td style="vertical-align:middle"><?php echo $faq['question']; ?></td>
		   <td style="vertical-align:middle"><?php echo $faq['answer']; ?></td>
		  
		   </tr>
		<?php } ?>
		</tbody>
	  </table>
	    <div class="row">
        <div class="col-sm-12 text-right"><?php echo $pagination; ?></div>
      </div>
	  </div>
	  <div class="col-sm-4">
	  <div class="postask">
        <div class="titlepostask"><strong>Đặt câu hỏi</strong></div>
        <input class="form-control postask_input " id="txtname" name="txtname" type="text" placeholder="Tên của bạn (bắt buộc)">
        <input id="txtEmail" name="txtEmail" class="form-control postask_input" type="text" placeholder="Email (nhận email khi có trả lời)">
        <textarea id="txtquestion" rows="7" name="content_faq" class="form-control postask_input" placeholder="Nhập nội dung câu hỏi của bạn"></textarea>
        <div class="sendinfo pull-right">
            <button id="button-send-faq" type="button" class="">Gửi câu hỏi</button>
        </div>
		</div>
      </div >
	  </div>
	
	</div>
    </div>
</div>
<?php echo $footer; ?> 
<script>
$('#button-send-faq').on('click', function() {
	var name = $('#txtname').val();
	var email = $('#txtEmail').val();
	var question = $('#txtquestion').val();
	if($.trim(name) == ''){
		alert('Xin vui lòng nhập tên của bạn');
		return false;
	}
	if($.trim(email) == ''){
		alert('Xin vui lòng nhập email của bạn');
		return false;
	}
	if($.trim(question) == ''){
		alert('Xin vui lòng nhập nội dung câu hỏi của bạn');
		return false;
	}
	$.ajax({
		url: 'index.php?route=information/faq/insert',
		type: 'post',
		dataType: 'json',
		data: 'name=' + name+'&email='+email+'&question='+question,
		beforeSend: function() {
		},
		complete: function() {
		},
		success: function(json) {
			$('#txtname').val('');
			$('#txtEmail').val('');
			$('#txtquestion').val('');
			alert(json['success']);
		}
	});
		
	});
</script>