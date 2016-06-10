<?php echo $header; ?><?php echo $column_left; ?>
<div id="content">
  <div class="page-header">
    <div class="container-fluid">
      <div class="pull-right">
       	<input type='radio' name='type_export'  value='1'  />Lợi nhuận
		<input type='radio' name='type_export'  value='2' /> Hoa hồng
		<input type='radio' name='type_export'  value='3' checked="checked" /> Tất cả
        <button type="button" id="export" data-toggle="tooltip" title="Export" class="btn btn-danger" ><i class="fa fa-download"></i></button>
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
    <div class="panel panel-default">
      <div class="panel-body">
        <div class="well">
          <div class="row">
            <div class="col-sm-6">
              <div class="form-group">
                <label class="control-label" for="input-nguoi_lap_bieu">Người lập biểu</label>
                 <input type="text" name="nguoi_lap_bieu" value="" id="nguoi_lap_bieu" class="form-control" />
              </div>
              <div class="form-group">
                <label class="control-label" for="input-giam_doc">Tổng giám đốc</label>
                <input type="text" name="giam_doc" value="" id="giam_doc" class="form-control" />
              </div>
            </div>
            <div class="col-sm-6">
            	<div class="form-group">
                <label class="control-label" for="input-ke_toan">Phòng kế toán</label>
                 <input type="text" name="ke_toan" value="" id="ke_toan" class="form-control" />
              </div>
            	
            </div>
          </div>
        </div>
      </div>
      <div class="panel-body">
        <div class="well">
          <div class="row">
            <div class="col-sm-6">
              <div class="form-group">
                <label class="control-label" for="input-date-start"><?php echo $entry_date_start; ?></label>
                <div class="input-group date">
                  <input type="text" name="filter_date_start" value="<?php echo $filter_date_start; ?>" placeholder="<?php echo $entry_date_start; ?>" data-date-format="YYYY-MM-DD" id="input-date-start" class="form-control" />
                  <span class="input-group-btn">
                  <button type="button" class="btn btn-default"><i class="fa fa-calendar"></i></button>
                  </span></div>
              </div>
              <div class="form-group">
                <label class="control-label" for="input-customer">Khách hàng</label>
                <input type="text" name="filter_customer" value="<?php echo $filter_customer; ?>" id="input-customer" class="form-control" />
              </div>
            </div>
            <div class="col-sm-6">
            	<div class="form-group">
                <label class="control-label" for="input-date-end"><?php echo $entry_date_end; ?></label>
                <div class="input-group date">
                  <input type="text" name="filter_date_end" value="<?php echo $filter_date_end; ?>" placeholder="<?php echo $entry_date_end; ?>" data-date-format="YYYY-MM-DD" id="input-date-end" class="form-control" />
                  <span class="input-group-btn">
                  <button type="button" class="btn btn-default"><i class="fa fa-calendar"></i></button>
                  </span></div>
              </div>
            	<?php /* ?>
              <div class="form-group">
                <label class="control-label" for="input-customer"><?php echo $entry_customer; ?></label>
                <input type="text" name="filter_customer" value="<?php echo $filter_customer; ?>" id="input-customer" class="form-control" />
              </div>
              
              <div class="form-group">
                <label class="control-label" for="input-ip"><?php echo $entry_ip; ?></label>
                <input type="text" name="filter_ip" value="<?php echo $filter_ip; ?>" id="input-ip" class="form-control" />
              </div>
              <?php */?>
              <button type="button" id="button-filter" class="btn btn-primary pull-right"><i class="fa fa-search"></i> <?php echo $button_filter; ?></button>
            </div>
          </div>
        </div>
        <div class="panel-heading">
        <h3 class="panel-title"><i class="fa fa-bar-chart"></i> Danh sách report lợi nhuận - hoa hồng</h3>
      	</div>
        <div class="table-responsive">
          <table class="table table-bordered">
            <thead>
              <tr >
              	  <td class="text-left">Khách hàng</td>
              	  <td class="text-left">CMND</td>
                  <td class="text-left" ><?php echo $entry_total_profit; ?></td>
			      <td class="text-left" ><?php echo $entry_total_commission; ?></td>
			      <td class="text-left" ><?php echo $entry_total_gift; ?></td>
			      <td class="text-left"><?php echo $entry_total_payout; ?></td>
			      <td class="text-left">Người giới thiệu</td>
			      <td class="text-left">CMND người gt</td>
			      <td class="text-left">Tài khoản NH</td>
			      <td class="text-left">Tên ngân hàng</td>
              </tr>
            </thead>
            <tbody>
              <?php if ($activities) { ?>
              <?php foreach ($activities as $activity) { ?>
              <tr >
                <td class="text-left"><a href="<?php echo $activity['url_customer']; ?>"><?php echo $activity['name_customer']; ?></a></td>
                <td class="text-left"><?php echo $activity['cmnd'];?></td>
                <td class="text-left"><?php $le_pf = is_int($activity['total_profit']+0)? 0:3; echo number_format($activity['total_profit'],$le_pf,'.',','); ?></td>
                <td class="text-left"><?php $le_cm = is_int($activity['total_commission']+0)? 0:3; echo number_format($activity['total_commission'],$le_cm,'.',','); ?></td>
                <td class="text-left"><?php $le_g = is_int($activity['total_gift']+0)? 0:3; echo number_format($activity['total_gift'],$le_g,'.',','); ?></td>
                <td class="text-left"><?php $le_po = is_int($activity['total_payout']+0)? 0:3; echo number_format($activity['total_payout'],$le_po,'.',','); ?></td>
                <td class="text-left"><?php echo $activity['name_parent']?></td>
                <td class="text-left"><?php echo $activity['cmnd_parent']?></td>
                <td class="text-left"><?php echo $activity['account_bank']?></td>
                <td class="text-left"><?php echo $activity['address_bank']?></td>
              </tr>
              <?php } ?>
              <tr >
              	  <td></td>
                  <td class="text-right" ><b>Tổng</b></td>
                  
                  <td><?php $al_le_pf = is_int($all_total_profit+0)? 0:3; echo number_format($all_total_profit,$al_le_pf,'.',','); ?></td>
                  <td><?php $al_le_cm = is_int($all_total_commission+0)? 0:3; echo number_format($all_total_commission,$al_le_cm,'.',','); ?></td>
                  <td><?php $al_le_g = is_int($all_total_gift+0)? 0:3; echo number_format($all_total_gift,$al_le_g,'.',','); ?></td>
                  <td><?php $al_le_po = is_int($all_total_payout+0)? 0:3; echo number_format($all_total_payout,$al_le_po,'.',','); ?></td>
              	  <td colspan="4"></td>
              </tr>
              <?php } else { ?>
              <tr>
                <td class="text-center" colspan="10"><?php echo $text_no_results; ?></td>
              </tr>
              <?php } ?>
            </tbody>
          </table>
        </div>
        <?php /*?>
        <div class="row">
          <div class="col-sm-6 text-left"><?php echo $pagination; ?></div>
          <div class="col-sm-6 text-right"><?php echo $results; ?></div>
        </div>
        <?php */?>
      </div>
    </div>
  </div>
  <script type="text/javascript"><!--
$('#button-filter').on('click', function() {
	url = 'index.php?route=report/customer_profit&token=<?php echo $token; ?>';
	
	var filter_customer = $('input[name=\'filter_customer\']').val();
	
	if (filter_customer) {
		url += '&filter_customer=' + encodeURIComponent(filter_customer);
	}
	/*
	var filter_ip = $('input[name=\'filter_ip\']').val();
	
	if (filter_ip) {
		url += '&filter_ip=' + encodeURIComponent(filter_ip);
	}
	*/
	var filter_date_start = $('input[name=\'filter_date_start\']').val();
	
	if (filter_date_start) {
		url += '&filter_date_start=' + encodeURIComponent(filter_date_start);
	}

	var filter_date_end = $('input[name=\'filter_date_end\']').val();
	
	if (filter_date_end) {
		url += '&filter_date_end=' + encodeURIComponent(filter_date_end);
	}

	location = url;
});

  $('#export').on('click', function() {
		
		url = 'index.php?route=report/exportProfit&token=<?php echo $token; ?>';
		
		var filter_customer = $('input[name=\'filter_customer\']').val();
		
		if (filter_customer) {
			url += '&filter_customer=' + encodeURIComponent(filter_customer);
		}
		var filter_date_start = $('input[name=\'filter_date_start\']').val();
		
		if (filter_date_start) {
			url += '&filter_date_start=' + encodeURIComponent(filter_date_start);
		}

		var filter_date_end = $('input[name=\'filter_date_end\']').val();
		
		if (filter_date_end) {
			url += '&filter_date_end=' + encodeURIComponent(filter_date_end);
		}

		var type_export = $('input[name=\'type_export\']:checked').val();
		
		if (type_export) {
			url += '&type_export=' + encodeURIComponent(type_export);
		}

		var nguoi_lap_bieu = $('input[name=\'nguoi_lap_bieu\']').val();
		
		if (nguoi_lap_bieu) {
			url += '&nguoi_lap_bieu=' + encodeURIComponent(nguoi_lap_bieu);
		}

		var ke_toan = $('input[name=\'ke_toan\']').val();
		
		if (ke_toan) {
			url += '&ke_toan=' + encodeURIComponent(ke_toan);
		}

		var giam_doc = $('input[name=\'giam_doc\']').val();
		
		if (giam_doc) {
			url += '&giam_doc=' + encodeURIComponent(giam_doc);
		}

		location = url;
	});
//--></script> 
  <script type="text/javascript"><!--
$('.date').datetimepicker({
	pickTime: false
});
//--></script></div>
<?php echo $footer; ?>