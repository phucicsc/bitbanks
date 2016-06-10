<?php echo $header; ?><?php echo $column_left; ?>
<div id="content">
  <div class="page-header">
    <div class="container-fluid">

      <div class="pull-right">
      <?php if($getGroupId == 1){?>
      <a href="<?php echo $add; ?>" data-toggle="tooltip" title="<?php echo $button_add; ?>" class="btn btn-primary"><i class="fa fa-plus"></i></a>
     <?php }?>
        
       <button type="button" data-toggle="tooltip" title="<?php echo $button_delete; ?>" class="btn btn-danger" onclick="confirm('Are you sure you want to do this?') ? $('#form-customer').submit() : false;"><i class="fa fa-trash-o"></i></button>

      	<!-- <button type="button" id="export" data-toggle="tooltip" title="Export" class="btn btn-danger" ><i class="fa fa-download"></i></button> -->
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
    <?php if ($error_warning) { ?>
    <div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> <?php echo $error_warning; ?>
      <button type="button" class="close" data-dismiss="alert">&times;</button>
    </div>
    <?php } ?>
    <?php if ($success) { ?>
    <div class="alert alert-success"><i class="fa fa-check-circle"></i> <?php echo $success; ?>
      <button type="button" class="close" data-dismiss="alert">&times;</button>
    </div>
    <?php } ?>
    <div class="panel panel-default">
    <?php /*?>
      <div class="panel-body">
      	<div class="well" id="well_customer">
      	  <div class="row loadding row" align="center" style="display:none">
	            <div class="col-sm-12">
				<img src="view/image/ajax-loader-store.gif"  />
				</div>
		   </div>
           <div class="row">
           		<div class="col-sm-5">
           			<button id="button-hp-ctp" data-loading-text="Tính hội phí từ công tác phí vào ngày 1" class="btn btn-primary"><i class="fa fa-plus-circle"></i>Tính hội phí từ công tác phí vào ngày 1 đến ngày 10</button>
           		</div>
           		<div class="col-sm-6">
           			<button id="button-hp-dukien" data-loading-text="Hội phí dự kiến(đủ tháng 30 ngày)" class="btn btn-primary"><i class="fa fa-plus-circle"></i> Hội phí dự kiến(đủ tháng 30 ngày) </button>
           		</div>
           	</div>
           	<div class="row" style="padding-top:15px">	
           		<div class="col-sm-5">
           			<button id="button-off-user" data-loading-text="Off hội viên vào ngày 10" class="btn btn-primary"><i class="fa fa-plus-circle"></i>Off hội viên chưa đóng hội phí vào ngày 10</button> 
           		</div>
           		
           		<div class="col-sm-6">
           			<button id="button-off-user-12thang" data-loading-text="Off HV quá 12 tháng(đủ tháng 30 ngày)" class="btn btn-primary"><i class="fa fa-plus-circle"></i> Off HV quá 12 tháng(đủ tháng 30 ngày) </button>
           		</div>
           </div>
         </div>
      </div>
        <?php */?>
      <!-- <div class="panel-body">
      	<div class="well" id="well_customer">
          <div class="row">
            <div class="col-sm-4">
            <label class="control-label" for="input-month_filter">Tháng</label>
              <div class="form-group">
                <select name="month_filter" class="form-control">
                	<?php for($n=1;$n<=12;$n++){?>
                		<option  value="<?php echo $n;?>" <?php echo $n == $month_filter? 'selected="selected"':'';?>>Tháng <?php echo $n;?></option>
                	<?php }?>
                </select>
              </div>
              <input type="hidden" value="<?php echo $type_filter?>" name="type_filter">
            </div>
            <div class="col-sm-4">
            <label class="control-label" for="input-year_filter">Năm</label>
              <div class="form-group">
                <select name="year_filter" class="form-control">
                	<?php for($m=2016;$m<=2025;$m++){?>
                		<option  value="<?php echo $m;?>" <?php echo $m == $year_filter? 'selected="selected"':'';?>>Năm <?php echo $m;?></option>
                	<?php }?>
                </select>
              </div>
            </div>
           </div>
           <div class="row">
           		<div class="col-sm-3">
           			<button id="button-filter-user-new" data-loading-text="New Member List" class="btn btn-primary"><i class="fa fa-search"></i> New Member List</button>
           		</div>
           		<div class="col-sm-3">
           			<button id="button-filter-user-notHP" data-loading-text="No fee list" class="btn btn-primary"><i class="fa fa-search"></i>No fee list</button>
           		</div>
           		<div class="col-sm-3">
           			<button id="button-filter-user-off" data-loading-text="List member off" class="btn btn-primary"><i class="fa fa-search"></i> List member off</button> 
           		</div>
           		<div class="col-sm-3">
           			<button id="button-filter-user-ctp" data-loading-text="Per diem" class="btn btn-primary"><i class="fa fa-search"></i> Per diem</button> 
           		</div>
           </div>
         </div>
      </div> -->
      <div class="panel-heading">
        <h3 class="panel-title"><i class="fa fa-list"></i> <?php echo $text_list; ?></h3>
      </div>
      <div class="panel-body">
        <div class="well">
          <div class="row">
            
            <div class="col-sm-4">
              <div class="form-group">
                <label class="control-label" for="input-username">Username</label>
                <input type="text" name="filter_username" value="<?php echo $filter_username; ?>" placeholder="Username" id="input-username" class="form-control" />
              </div>
            </div>
            <?php /*?>
            <div class="col-sm-3">
              <div class="form-group">
                <label class="control-label" for="input-customer-group"><?php echo $entry_customer_group; ?></label>
                <select name="filter_customer_group_id" id="input-customer-group" class="form-control">
                  <option value="*"></option>
                  <?php foreach ($customer_groups as $customer_group) { ?>
                  <?php if ($customer_group['customer_group_id'] == $filter_customer_group_id) { ?>
                  <option value="<?php echo $customer_group['customer_group_id']; ?>" selected="selected"><?php echo $customer_group['name']; ?></option>
                  <?php } else { ?>
                  <option value="<?php echo $customer_group['customer_group_id']; ?>"><?php echo $customer_group['name']; ?></option>
                  <?php } ?>
                  <?php } ?>
                </select>
              </div>
              <div class="form-group">
                <label class="control-label" for="input-status"><?php echo $entry_status; ?></label>
                <select name="filter_status" id="input-status" class="form-control">
                  <option value="*"></option>
                  <?php if ($filter_status) { ?>
                  <option value="1" selected="selected"><?php echo $text_enabled; ?></option>
                  <?php } else { ?>
                  <option value="1"><?php echo $text_enabled; ?></option>
                  <?php } ?>
                  <?php if (!$filter_status && !is_null($filter_status)) { ?>
                  <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
                  <?php } else { ?>
                  <option value="0"><?php echo $text_disabled; ?></option>
                  <?php } ?>
                </select>
              </div>
            </div>
            <div class="col-sm-3">
              <div class="form-group">
                <label class="control-label" for="input-approved"><?php echo $entry_approved; ?></label>
                <select name="filter_approved" id="input-approved" class="form-control">
                  <option value="*"></option>
                  <?php if ($filter_approved) { ?>
                  <option value="1" selected="selected"><?php echo $text_yes; ?></option>
                  <?php } else { ?>
                  <option value="1"><?php echo $text_yes; ?></option>
                  <?php } ?>
                  <?php if (!$filter_approved && !is_null($filter_approved)) { ?>
                  <option value="0" selected="selected"><?php echo $text_no; ?></option>
                  <?php } else { ?>
                  <option value="0"><?php echo $text_no; ?></option>
                  <?php } ?>
                </select>
              </div>
              <div class="form-group">
                <label class="control-label" for="input-ip"><?php echo $entry_ip; ?></label>
                <input type="text" name="filter_ip" value="<?php echo $filter_ip; ?>" placeholder="<?php echo $entry_ip; ?>" id="input-ip" class="form-control" />
              </div>
            </div>
            <div class="col-sm-3">
              <div class="form-group">
                <label class="control-label" for="input-date-added">Ngày đăng ký</label>
                <div class="input-group date">
                  <input type="text" name="filter_date_added" value="<?php echo $filter_date_added; ?>" placeholder="<?php echo $entry_date_added; ?>" data-date-format="YYYY-MM-DD" id="input-date-added" class="form-control" />
                  <span class="input-group-btn">
                  <button type="button" class="btn btn-default"><i class="fa fa-calendar"></i></button>
                  </span></div>
              </div>
              
            </div>
            <div class="col-sm-4">
            	<div class="form-group">
                	<label class="control-label" for="input-email"><?php echo $entry_email; ?></label>
                	<input type="text" name="filter_email" value="<?php echo $filter_email; ?>" placeholder="<?php echo $entry_email; ?>" id="input-email" class="form-control" />
              	</div>
            </div>
            <?php */?>

            <!-- <div class="col-sm-4">
            	<div class="form-group">
                	<label class="control-label" for="input-filter_customer_code">Mã hội viên</label>
                	<input type="text" name="filter_customer_code" value="<?php echo $filter_customer_code; ?>" placeholder="Mã hội viên" id="input-filter_customer_code" class="form-control" />
              	</div>
            </div>
             <div class="col-sm-2" style="margin-top:20px">
            </div>
          </div>
          <div class="row">
            <div class="col-sm-4">
              <div class="form-group">
                <label class="control-label" for="input-username">Username</label>
                <input type="text" name="filter_username" value="<?php echo $filter_username; ?>" placeholder="Username" id="input-username" class="form-control" />
              </div>
            </div>
            <div class="col-sm-4">
            	<div class="form-group">
                	<label class="control-label" for="input-phone">Số điện thoại</label>
                	<input type="text" name="filter_phone" value="<?php echo $filter_phone; ?>" placeholder="Số điện thoại" id="input-phone" class="form-control" />
              	</div>
            </div> -->
             <div class="col-sm-2" style="margin-top:20px">
            	<button type="button" id="button-filter" class="btn btn-primary pull-right"><i class="fa fa-search"></i> <?php echo $button_filter; ?></button>
            	
            </div>
           </div>
        </div>

        <form action="<?php echo $delete; ?>" method="post" enctype="multipart/form-data" id="form-customer">
          <div class="table-responsive">
            <table class="table table-bordered table-hover">
              <thead>
                <tr>
                  <td style="width: 1px;" class="text-center"><input type="checkbox" onclick="$('input[name*=\'selected\']').prop('checked', this.checked);" /></td>
                  <td style="width: 40px;" >STT</td>
                 
                  <td style="width: 140px;" class="text-left" >
                    <!--   <?php if ($sort == 'name') { ?>
                      <a href="<?php echo $sort_name; ?>" class="<?php echo strtolower($order); ?>"><?php echo $column_name; ?></a>
                      <?php } else { ?>
                      <a href="<?php echo $sort_name; ?>"><?php echo $column_name; ?></a>
                      <?php } ?> -->
                      Username
                  </td>
                   <td style="">Email</td>
                   <td>Address</td>
                  <td style="width: 110px;">Phone</td>
                  <td style="width: 140px;">Presenter</td>
                  <?php /* ?>
                  <td class="text-left"><?php if ($sort == 'c.email') { ?>
                    <a href="<?php echo $sort_email; ?>" class="<?php echo strtolower($order); ?>"><?php echo $column_email; ?></a>
                    <?php } else { ?>
                    <a href="<?php echo $sort_email; ?>"><?php echo $column_email; ?></a>
                    <?php } ?></td>
                  <td>Tổng hội viên phí</td>
                  <td>Tổng công tác phí</td>
                  <td>Tổng thanh toán</td>
                  <td><?php echo $column_total_balance;?></td>
                  
                  <td class="text-left"><?php if ($sort == 'c.date_added') { ?>
                    <a href="<?php echo $sort_date_added; ?>" class="<?php echo strtolower($order); ?>">Ngày đăng ký</a>
                    <?php } else { ?>
                    <a href="<?php echo $sort_date_added; ?>">Ngày đăng ký</a>
                    <?php } ?></td>
               <? */ ?>
                  <td style="width: 110px; class="text-right"><?php echo $column_action; ?></td>
                </tr>
              </thead>
              <tbody>
                <?php if ($customers) { $n=1;?>
                <?php foreach ($customers as $customer) { ?>
                <tr class="<?php // if($customer['hvOff'] == 1) { echo $customer['hvNew'] == true? 'hvNew ':'';} else echo 'hvOff';?>">
                  <td class="text-center"><?php if (in_array($customer['customer_id'], $selected)) { ?>
                    <input type="checkbox" class="select_cus" name="selected[]" value="<?php echo $customer['customer_id']; ?>" checked="checked" />
                    <?php } else { ?>
                    <input type="checkbox" class="select_cus" name="selected[]" value="<?php echo $customer['customer_id']; ?>" />
                    <?php } ?></td>
                  <td><?php echo $n;?></td>
                  
                  <td class="text-left"><?php echo $customer['username']; ?></td>
                 <td class="text-left"><?php echo $customer['email']; ?></td>
                 <td class="text-left"><?php echo $customer['name_country']; ?></td>
                  <td class="text-left"><?php echo $customer['telephone']; ?></td>
                  <td class="text-left"><?php echo $customer['name_parent']; ?></td>
                  <?php /*?>
                  <td class="text-left"><?php echo $customer['email']; ?></td>
                  <td><?php $le_hp = is_int($customer['total_hoivien_phi']+0)? 0:3; echo number_format($customer['total_hoivien_phi'],$le_hp,'.',','); ?></td>
                  <td><?php $le_ctp = is_int($customer['total_congtac_phi']+0)? 0:3; echo number_format($customer['total_congtac_phi'],$le_ctp,'.',','); ?></td>
                  <td><?php $le_po = is_int($customer['total_payout']+0)? 0:3; echo number_format($customer['total_payout'],$le_po,'.',','); ?></td>
                  <?php */?>
                  <td>
                    <a href="<?php echo $customer['edit']; ?>" data-toggle="tooltip" title="<?php echo $button_edit; ?>" class="btn btn-primary"><i class="fa fa-pencil"></i></a></td>
                </tr>
                <?php $n++; } ?>

                <?php } else { ?>
                <tr>
                  <td class="text-center" colspan="8"><?php echo $text_no_results; ?></td>
                </tr>
                <?php } ?>
              </tbody>
            </table>
          </div>
        </form>
       
        <div class="row">
          <div class="col-sm-6 text-left"><?php echo $pagination; ?></div>
        </div>
        
      </div>
    </div>
  </div>
  <script type="text/javascript"><!--
$('#button-filter').on('click', function() {
	url = 'index.php?route=sale/customer&token=<?php echo $token; ?>';
	
	var filter_name = $('input[name=\'filter_name\']').val();
	
	if (filter_name) {
		url += '&filter_name=' + encodeURIComponent(filter_name);
	}

	var filter_customer_code = $('input[name=\'filter_customer_code\']').val();
	
	if (filter_customer_code) {
		url += '&filter_customer_code=' + encodeURIComponent(filter_customer_code);
	}
	
	var filter_email = $('input[name=\'filter_email\']').val();
	
	if (filter_email) {
		url += '&filter_email=' + encodeURIComponent(filter_email);
	}

	var filter_username = $('input[name=\'filter_username\']').val();
	
	if (filter_username) {
		url += '&filter_username=' + encodeURIComponent(filter_username);
	}
	
	var filter_phone = $('input[name=\'filter_phone\']').val();
	
	if (filter_phone) {
		url += '&filter_phone=' + encodeURIComponent(filter_phone);
	}
	
	var filter_customer_group_id = $('select[name=\'filter_customer_group_id\']').val();
	
	if (filter_customer_group_id != '*') {
		url += '&filter_customer_group_id=' + encodeURIComponent(filter_customer_group_id);
	}	
	
	var filter_status = $('select[name=\'filter_status\']').val();
	
	if (filter_status != '*') {
		url += '&filter_status=' + encodeURIComponent(filter_status); 
	}	
	
	var filter_approved = $('select[name=\'filter_approved\']').val();
	
	if (filter_approved != '*') {
		url += '&filter_approved=' + encodeURIComponent(filter_approved);
	}	
	
	var filter_ip = $('input[name=\'filter_ip\']').val();
	
	if (filter_ip) {
		url += '&filter_ip=' + encodeURIComponent(filter_ip);
	}
		
	var filter_date_added = $('input[name=\'filter_date_added\']').val();
	
	if (filter_date_added) {
		url += '&filter_date_added=' + encodeURIComponent(filter_date_added);
	}
	
	location = url;
});

  $('#export').on('click', function() {
		
		url = 'index.php?route=report/exportCustomer&token=<?php echo $token; ?>';
		
		var filter_name = $('input[name=\'filter_name\']').val();
		
		if (filter_name) {
			url += '&filter_name=' + encodeURIComponent(filter_name);
		}

		var filter_customer_code = $('input[name=\'filter_customer_code\']').val();
		
		if (filter_customer_code) {
			url += '&filter_customer_code=' + encodeURIComponent(filter_customer_code);
		}
		
		var filter_email = $('input[name=\'filter_email\']').val();
		
		if (filter_email) {
			url += '&filter_email=' + encodeURIComponent(filter_email);
		}

		var filter_username = $('input[name=\'filter_username\']').val();
		
		if (filter_username) {
			url += '&filter_username=' + encodeURIComponent(filter_username);
		}
		
		var filter_phone = $('input[name=\'filter_phone\']').val();
		
		if (filter_phone) {
			url += '&filter_phone=' + encodeURIComponent(filter_phone);
		}
		
		var filter_customer_group_id = $('select[name=\'filter_customer_group_id\']').val();
		
		if (filter_customer_group_id != '*') {
			url += '&filter_customer_group_id=' + encodeURIComponent(filter_customer_group_id);
		}	
		
		var filter_status = $('select[name=\'filter_status\']').val();
		
		if (filter_status != '*') {
			url += '&filter_status=' + encodeURIComponent(filter_status); 
		}	
		
		var filter_approved = $('select[name=\'filter_approved\']').val();
		
		if (filter_approved != '*') {
			url += '&filter_approved=' + encodeURIComponent(filter_approved);
		}	
		
		var filter_ip = $('input[name=\'filter_ip\']').val();
		
		if (filter_ip) {
			url += '&filter_ip=' + encodeURIComponent(filter_ip);
		}
			
		var filter_date_added = $('input[name=\'filter_date_added\']').val();
		
		if (filter_date_added) {
			url += '&filter_date_added=' + encodeURIComponent(filter_date_added);
		}

		var month_filter = $('select[name=\'month_filter\']').val();
		
		if (month_filter) {
			url += '&month_filter=' + encodeURIComponent(month_filter);
		}
		var type_filter = $('input[name=\'type_filter\']').val();
		
		if (type_filter) {
			url += '&type_filter=' + encodeURIComponent(type_filter);
		}
		
		
		location = url;
	});

  $('#button-filter-user-new').on('click', function() {
		url = 'index.php?route=sale/customer/filterUserNew&token=<?php echo $token; ?>';
		
		var month_filter = $('select[name=\'month_filter\']').val();
		
		if (month_filter) {
			url += '&month_filter=' + encodeURIComponent(month_filter);
		}

		var year_filter = $('select[name=\'year_filter\']').val();
		
		if (year_filter) {
			url += '&year_filter=' + encodeURIComponent(year_filter);
		}
		
		location = url;
	});

	$('#button-filter-user-notHP').on('click', function() {
		url = 'index.php?route=sale/customer/filterUserNotHP&token=<?php echo $token; ?>';
		
		var month_filter = $('select[name=\'month_filter\']').val();
		
		if (month_filter) {
			url += '&month_filter=' + encodeURIComponent(month_filter);
		}

		var year_filter = $('select[name=\'year_filter\']').val();
		
		if (year_filter) {
			url += '&year_filter=' + encodeURIComponent(year_filter);
		}
		
		location = url;
	});

  $('#button-filter-user-off').on('click', function() {
		url = 'index.php?route=sale/customer/filterUserOff&token=<?php echo $token; ?>';
		
		var month_filter = $('select[name=\'month_filter\']').val();
		
		if (month_filter) {
			url += '&month_filter=' + encodeURIComponent(month_filter);
		}

		var year_filter = $('select[name=\'year_filter\']').val();
		
		if (year_filter) {
			url += '&year_filter=' + encodeURIComponent(year_filter);
		}
		
		location = url;
	});

  $('#button-filter-user-ctp').on('click', function() {
		url = 'index.php?route=sale/customer/filterUserCTP&token=<?php echo $token; ?>';
		
		var month_filter = $('select[name=\'month_filter\']').val();
		
		if (month_filter) {
			url += '&month_filter=' + encodeURIComponent(month_filter);
		}

		var year_filter = $('select[name=\'year_filter\']').val();
		
		if (year_filter) {
			url += '&year_filter=' + encodeURIComponent(year_filter);
		}
		
		location = url;
	});
  
  $('#button-off-user-12thang').on('click', function() {

		$('.loadding').css('display','block');
		$.ajax({
			url: 'index.php?route=sale/customer/OffUser12Thang&token=<?php echo $token; ?>',
			type: 'post',
			dataType: 'json',
			data: '',
			beforeSend: function() {
			},
			complete: function() {
			},
			success: function(json) {
				$('.loadding').css('display','none');
				window.location.reload()
				alert(json['success']);
			}
		});

	});
  $('#button-hp-dukien').on('click', function() {

		$('.loadding').css('display','block');
		$.ajax({
			url: 'index.php?route=sale/customer/makeHPDuKien&token=<?php echo $token; ?>',
			type: 'post',
			dataType: 'json',
			data: '',
			beforeSend: function() {
			},
			complete: function() {
			},
			success: function(json) {
				$('.loadding').css('display','none');
				window.location.reload()
				alert(json['success']);
			}
		});

	});

  $('#button-hp-ctp').on('click', function() {

		$('.loadding').css('display','block');
		$.ajax({
			url: 'index.php?route=sale/customer/makeHPFromCTP&token=<?php echo $token; ?>',
			type: 'post',
			dataType: 'json',
			data: '',
			beforeSend: function() {
			},
			complete: function() {
			},
			success: function(json) {
				$('.loadding').css('display','none');
				window.location.reload()
				alert(json['success']);
			}
		});

	});
	
  $('#button-off-user').on('click', function() {

		$('.loadding').css('display','block');
		$.ajax({
			url: 'index.php?route=sale/customer/offUser&token=<?php echo $token; ?>',
			type: 'post',
			dataType: 'json',
			data: '',
			beforeSend: function() {
			},
			complete: function() {
			},
			success: function(json) {
				$('.loadding').css('display','none');
				window.location.reload()
				alert(json['success']);
			}
		});

	});

  $('#button-off-user').on('click', function() {

		$('.loadding').css('display','block');
		$.ajax({
			url: 'index.php?route=sale/customer/offUser&token=<?php echo $token; ?>',
			type: 'post',
			dataType: 'json',
			data: '',
			beforeSend: function() {
			},
			complete: function() {
			},
			success: function(json) {
				$('.loadding').css('display','none');
				window.location.reload()
				alert(json['success']);
			}
		});

	});
	
  $('#button-payout').on('click', function() {
	  var pay = confirm('Thanh toán chỉ thực hiện cho các hội viên được chọn. Bạn có chắc chắn muốn thanh toán trong khoảng thời gian này?');
		if(pay == true){
			var date_start = $('input[name=\'date_start\']').val();
			var date_end = $('input[name=\'date_end\']').val();
			var d1 = Date.parse(date_start);
			var d2 = Date.parse(date_end);
			if (d1 > d2){
				alert('Ngày bắt đầu phải nhỏ hơn ngày kết thúc');
				return false;
			}
			if(date_start != '' && date_end != ''){
				$('.loadding').css('display','block');
				var selected = new Array();
				 $(".select_cus:checked").each(function() {
				       selected.push($(this).val());
				  });
				$.ajax({
					url: 'index.php?route=sale/customer/payoutCustomer&token=<?php echo $token; ?>',
					type: 'post',
					dataType: 'json',
					data: 'selected=' + selected+'&date_start= '+encodeURIComponent(date_start)+'&date_end=' + encodeURIComponent(date_end),
					beforeSend: function() {
					},
					complete: function() {
					},
					success: function(json) {
						$('.loadding').css('display','none');
						window.location.reload()
						alert(json['success']);
					}
				});
			}else{
				if(date_start == ''){
					$('input[name=\'date_start\']').focus();
					alert('Xin vui lòng chọn ngày bắt đầu');
				}else if(date_end == ''){
					$('input[name=\'date_end\']').focus();
					alert('Xin vui lòng chọn ngày kết thúc');
				}
			}
		}else{
			return false;
		}
	});
//--></script> 
  <script type="text/javascript"><!--
$('input[name=\'filter_name\']').autocomplete({
	'source': function(request, response) {
		$.ajax({
			url: 'index.php?route=sale/customer/autocomplete&token=<?php echo $token; ?>&filter_name=' +  encodeURIComponent(request),
			dataType: 'json',			
			success: function(json) {
				response($.map(json, function(item) {
					return {
						label: item['name'],
						value: item['customer_id']
					}
				}));
			}
		});
	},
	'select': function(item) {
		$('input[name=\'filter_name\']').val(item['label']);
	}	
});

$('input[name=\'filter_email\']').autocomplete({
	'source': function(request, response) {
		$.ajax({
			url: 'index.php?route=sale/customer/autocomplete&token=<?php echo $token; ?>&filter_email=' +  encodeURIComponent(request),
			dataType: 'json',			
			success: function(json) {
				response($.map(json, function(item) {
					return {
						label: item['email'],
						value: item['customer_id']
					}
				}));
			}
		});
	},
	'select': function(item) {
		$('input[name=\'filter_email\']').val(item['label']);
	}	
});
//--></script> 
  <script type="text/javascript"><!--
$('.date').datetimepicker({
	pickTime: false
});
//--></script></div>
<?php echo $footer; ?> 
