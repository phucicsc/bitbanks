<?php echo $header; ?><?php echo $column_left; ?>
<div id="content">
  <div class="page-header">
    <div class="container-fluid">
      <div class="pull-right">
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
      <div class="panel-heading">
        <h3 class="panel-title"><i class="fa fa-bar-chart"></i> <?php echo $text_list; ?></h3>
      </div>
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
              <div class="form-group">
                <label class="control-label" for="input-area">Khu vực</label>
              		<select name="filter_area" id="filter-customer" class="form-control">
                         <option value="0" >Chọn khu vực</option>
                         <option value="1" <?php if($filter_area == 1){echo "selected='selected'"; }?>>KV Miền Bắc</option>
                         <option value="2" <?php if($filter_area == 2){echo "selected='selected'"; }?>>KV TP.HCM</option>
                         <option value="3" <?php if($filter_area == 3){echo "selected='selected'"; }?>>KV Bình Phước</option>
                	</select>
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
        <div class="table-responsive">
          <table class="table table-bordered">
            <thead>
              <tr >
              	  <td class="text-left">Khách hàng</td>
              	  <td>CMND</td>
              	  <td class="text-left" >Số hợp đồng</td>
			      <td class="text-left" ><?php echo $entry_money_invest; ?></td>
			      <td class="text-left" width="100px"><?php echo $entry_month_invest; ?></td>
			      <td class="text-left"><?php echo $entry_package; ?></td>
			      <td class="text-left" ><?php echo $entry_p_node; ?></td>
			      <td class="text-left" >CMND Người giới thiệu</td>
			      <td class="text-left" >Thời hạn</td>
              </tr>
            </thead>
            <tbody>
              <?php if ($activities) { ?>
              <?php foreach ($activities as $activity) { ?>
              <tr class="<?php echo $activity['date_end'] != '' ? 'row_disable':'';?>"  >
                <td class="text-left"><a href="<?php echo $activity['url_customer']; ?>"><?php echo $activity['name_customer']; ?></a></td>
                <td class="text-left"><?php echo $activity['cmnd']; ?></td>
                <td class="text-left"><?php echo $activity['number_contract']; ?></td>
                <td class="text-left"><?php echo $activity['money_invest']; ?></td>
                <td class="text-left"><?php echo $activity['month_invest']; ?></td>
                <td class="text-left"><?php echo $activity['package_vn']; ?></td>
                <td class="text-left"><?php echo $activity['name_parent']; ?></td>
                <td class="text-left"><?php echo $activity['cmnd_parent']; ?></td>
                <td class="text-left <?php echo $activity['deadline'] < 3 ? ' deadline':'' ;?>"><?php if($activity['date_end'] == ''){echo $activity['deadline']. ' tháng';} ?></td>
              </tr>
              <?php } ?>
              <tr >
                <td class="text-right" colspan="3"><b>Tổng tiền các gói đầu tư</b></td>
                <td class="text-left" ><?php $le = is_int($totalPackage+0)? 0:3; echo number_format($totalPackage,$le,'.',','); ?></td>
                <td colspan="5"></td>
              </tr>
              <?php } else { ?>
              <tr>
                <td class="text-center" colspan="9"><?php echo $text_no_results; ?></td>
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
	url = 'index.php?route=report/customer_activity&token=<?php echo $token; ?>';
	
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

	var filter_area = $('select[name=\'filter_area\']').val();

	if (filter_area) {
		url += '&filter_area=' + encodeURIComponent(filter_area);
	}

	location = url;
});
  
  $('#export').on('click', function() {
		
		url = 'index.php?route=report/exportPackage&token=<?php echo $token; ?>';
		
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

		var filter_area = $('select[name=\'filter_area\']').val();

		if (filter_area) {
			url += '&filter_area=' + encodeURIComponent(filter_area);
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