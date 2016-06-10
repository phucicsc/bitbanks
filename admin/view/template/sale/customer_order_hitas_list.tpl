<?php echo $header; ?><?php echo $column_left; ?>
<div id="content">
  <div class="page-header">
    <div class="container-fluid">
	  <div class="pull-right"><a href="<?php echo $add; ?>" data-toggle="tooltip" question="<?php echo $button_add; ?>" class="btn btn-primary"><i class="fa fa-plus"></i></a>
        <button type="button" data-toggle="tooltip" question="<?php echo $button_delete; ?>" class="btn btn-danger" onclick="confirm('<?php echo $text_confirm; ?>') ? $('#form-module').submit() : false;"><i class="fa fa-trash-o"></i></button>
      </div>
      <h1><?php echo $heading_title; ?></h1>
      <ul class="breadcrumb">
        <?php foreach ($breadcrumbs as $breadcrumb) { ?>
        <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
        <?php } ?>
      </ul>
    </div>
  </div>
  <div class="container-fluid">
    <?php if ($error) { ?>
    <div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> <?php echo $error; ?>
      <button type="button" class="close" data-dismiss="alert">&times;</button>
    </div>
    <?php } ?>
    <?php if ($success) { ?>
    <div class="alert alert-success"><i class="fa fa-check-circle"></i> <?php echo $success; ?>
      <button type="button" class="close" data-dismiss="alert">&times;</button>
    </div>
    <?php } ?>
    <div class="panel panel-default">
      <div class="panel-heading">
        <h3 class="panel-question"><i class="fa fa-bars"></i> <?php echo $text_list; ?></h3>
        <button type="button" id="button-view-all" class="btn btn-primary pull-right" style="margin-top:-8px;"><?php echo $button_view_all_faq; ?></button>
      </div>
      <div class="panel-body">
      <div class="well">
          <div class="well">
          <div class="row">
            <div class="col-sm-6">
              <div class="form-group">
                <label class="control-label" for="input-name">Giá trị đơn hàng</label>
                <input type="text" name="filter_name" value="<?php echo $filter_name; ?>" placeholder="Giá trị đơn hàng" id="input-name" class="form-control" />
              </div>
              </div>
            <div class="col-sm-6">
              <div class="form-group">
                <label class="control-label" for="input-date-added"><?php echo $entry_date_added; ?></label>
                <div class="input-group date">
                  <input type="text" name="filter_date_added" value="<?php echo $filter_date_added; ?>" placeholder="<?php echo $entry_date_added; ?>" data-date-format="YYYY-MM-DD" class="form-control" />
                  <span class="input-group-btn">
                  <button type="button" class="btn btn-default"><i class="fa fa-calendar"></i></button>
                  </span></div>
              </div>
              <button type="button" id="button-filter" class="btn btn-primary pull-right"><i class="fa fa-search"></i> <?php echo $button_filter; ?></button>
              
               
            </div>
          </div>
        </div>
      
      
      
        <form action="<?php echo $delete; ?>" method="post" enctype="multipart/form-data" id="form-module" class="form-horizontal">
          <div class="table-responsive">
            <table class="table table-bordered table-striped table-hover">
			  <thead>
				<tr>
				  <td width="1" style="text-align: center;"><input type="checkbox" onclick="$('input[name*=\'selected\']').attr('checked', this.checked);" /></td>
				  <td>Giá trị đơn hàng</td>
				  <td>Tầng vòng tay nhân ái</td>
				  <td>Chi phí quản lý phòng</td>
			      <td>Hoa hồng môi giới lần đầu</td>
			      <td>Hoa hồng tái mua hàng</td>
			      <td>Xét chương trình vòng tay nhân ái</td>
			      <td>Chia cổ tức phổ thông/tháng</td>
			      <td>Thời hạn hưởng</td>
			      <td>Tặng</td>
			      <td class="text-left" width="150px">Ngày tạo</td>
			       <td class="text-right"><?php echo $text_action; ?></td>
				</tr>
			  </thead>
			  <tbody>
				<?php if ($all_cus_his) { ?>
				  <?php foreach ($all_cus_his as $cus_his) { ?>
				  <tr>
					<td width="1" style="text-align: center;"><input type="checkbox" name="selected[]" value="<?php echo $cus_his['order_cus_id']; ?>" /></td>
					<td class="text-left"><?php $le_mi = is_int($cus_his['money_invest']+0)? 0:0; echo number_format($cus_his['money_invest'],$le_mi,'.',','); ?></td>
					<td class="text-left"><?php echo $cus_his['floor']; ?></td>
					<td class="text-left"><?php echo $cus_his['percent_manage']; ?></td>
					<td class="text-left"><?php $le_b = is_int($cus_his['bonus_first']+0)? 0:0; echo number_format($cus_his['bonus_first'],$le_b,'.',','); ?></td>
					<td class="text-left"><?php $le_b2 = is_int($cus_his['bonus_second'])? 0:0; echo number_format($cus_his['bonus_second'],$le_b2,'.',','); ?></td>
					<td class="text-left"><?php echo $cus_his['num_vtna']; ?></td>
					<td class="text-left"><?php $le_s = is_int($cus_his['salary']+0)? 0:0; echo number_format($cus_his['salary'],$le_s,'.',','); ?></td>
					<td class="text-left"><?php echo $cus_his['month_salary']; ?></td>
					<td class="text-left"><?php $le_g = is_int($cus_his['type_gift']+0)? 0:0; echo number_format($cus_his['type_gift'],$le_g,'.',','); ?></td>
					<td class="text-left"><?php echo $cus_his['date_added']; ?></td>
					<td class="text-right"><a href="<?php echo $cus_his['edit']; ?>"><?php echo $text_edit; ?></a></td>
				  </tr>
				  <?php } ?>
				<?php } else { ?>
				  <tr>
					<td colspan="12" class="text-center"><?php echo $text_no_results; ?></td>
				  </tr>
				<?php } ?>
			  </tbody>
			</table>
          </div>
        </form>
		<div class="row">
          <div class="col-sm-12 text-right"><?php echo $pagination; ?></div>
        </div>
      </div>
    </div>
  </div>
</div>
 <script type="text/javascript"><!--
$('#button-filter').on('click', function() {
	url = 'index.php?route=extension/faq&token=<?php echo $token; ?>';
	
	var filter_name = $('input[name=\'filter_name\']').val();
	
	if (filter_name) {
		url += '&filter_name=' + encodeURIComponent(filter_name);
	}
	
		
	var filter_date_added = $('input[name=\'filter_date_added\']').val();
	
	if (filter_date_added) {
		url += '&filter_date_added=' + encodeURIComponent(filter_date_added);
	}
	
	location = url;
});

$('#button-view-all').on('click', function() {
	url = 'index.php?route=sale/customer_order_hitas&token=<?php echo $token; ?>';	
	location = url;
});
//--></script> 
 <script type="text/javascript"><!--
$('.date').datetimepicker({
	pickTime: false
});
//--></script>

<?php echo $footer; ?>