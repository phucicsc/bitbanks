<?php echo $header; ?><?php echo $column_left; ?>
<div id="content">
  <div class="page-header">
    <div class="container-fluid">
      <div class="pull-right">
        <button type="submit" form="form-cus-his" data-toggle="tooltip" title="<?php echo $button_save; ?>" class="btn btn-primary"><i class="fa fa-save"></i></button>
        <a href="<?php echo $cancel; ?>" data-toggle="tooltip" title="<?php echo $button_cancel; ?>" class="btn btn-default"><i class="fa fa-reply"></i></a></div>
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
    <div class="panel panel-default">
      <div class="panel-heading">
        <h3 class="panel-faq"><i class="fa fa-pencil"></i> <?php echo $heading_title; ?></h3>
      </div>
      <div class="panel-body">
        <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form-cus-his" class="form-horizontal">
           <div class="form-group required">
              <label class="col-sm-3 control-label" for="input-money_invest">Giá trị đơn hàng</label>
                    <div class="col-sm-9">
                        <input type="text" name="money_invest" value="<?php echo number_format($money_invest,0,'.',',');?>" placeholder="Giá trị đơn hàng" id="money_invest" onkeyup="intergerCommas('money_invest')" class="form-control" />
                    </div>
            </div>
            <div class="form-group ">
              	<label class="col-sm-3 control-label" for="input-floor">Tầng vòng tay nhân ái</label>
                    <div class="col-sm-9">
                        <input type="text" name="floor" value="<?php echo $floor;?>" placeholder="Tầng vòng tay nhân ái" id="floor" class="form-control" />
                    </div>
            </div>
            <div class="form-group ">
              	<label class="col-sm-3 control-label" for="input-percent_manage">Chi phí QL phòng</label>
                    <div class="col-sm-9">
                        <input type="text" name="percent_manage" value="<?php echo $percent_manage;?>" placeholder="Chi phí QL phòng" id="percent_manage" class="form-control" />
                    </div>
            </div>
			<div class="form-group ">
              	<label class="col-sm-3 control-label" for="input-bonus_first">Thưởng hoa hồng môi giới lần đầu</label>
                    <div class="col-sm-9">
                        <input type="text" name="bonus_first" value="<?php echo number_format($bonus_first,0,'.',',');?>" placeholder="Thưởng hoa hồng môi giới lấn đầu" id="bonus_first" onkeyup="intergerCommas('bonus_first')" class="form-control" />
                    </div>
            </div>
           <div class="form-group ">
              	<label class="col-sm-3 control-label" for="input-bonus_second">Thưởng hoa hồng tái mua hàng</label>
                    <div class="col-sm-9">
                        <input type="text" name="bonus_second" value="<?php echo number_format($bonus_second,0,'.',',');?>" placeholder="Thưởng hoa hồng tái mua hàng" id="bonus_second" onkeyup="intergerCommas('bonus_second')" class="form-control" />
                    </div>
            </div>
            <div class="form-group ">
              	<label class="col-sm-3 control-label" for="input-num_vtna">Xét chương trình vòng tay nhân ái</label>
                    <div class="col-sm-9">
                        <input type="text" name="num_vtna" value="<?php echo $num_vtna;?>" placeholder="Xét chương trình vòng tay nhân ái" id="num_vtna" class="form-control" />
                    </div>
            </div>
               <div class="form-group ">
              	<label class="col-sm-3 control-label" for="input-salary">Chia cổ tức phổ thông/tháng</label>
                    <div class="col-sm-9">
                        <input type="text" name="salary" value="<?php echo number_format($salary,0,'.',',');?>" placeholder="Chia cổ tức phổ thông/tháng" id="salary" onkeyup="intergerCommas('salary')" class="form-control" />
                    </div>
               </div>
               <div class="form-group ">
              	<label class="col-sm-3 control-label" for="input-month_salary">Thời hạn hưởng</label>
                    <div class="col-sm-9">
                        <input type="text" name="month_salary" value="<?php echo $month_salary;?>" placeholder="Thời hạn hưởng" id="month_salary" class="form-control" />
                    </div>
               </div>
               <div class="form-group ">
              	<label class="col-sm-3 control-label" for="input-type_gift">Tặng</label>
                    <div class="col-sm-9">
                        <input type="text" name="type_gift" value="<?php echo number_format($type_gift,0,'.',',');?>" placeholder="Tặng" onkeyup="intergerCommas('type_gift')" id="type_gift" class="form-control" />
                    </div>
               </div>
        </form>
      </div>
    </div>
  </div>
</div>

<?php echo $footer; ?>
<script type="text/javascript">
function intergerCommas(id_item){
	var value = $('#'+id_item).val().replace(/,/g, '');
	var valueNumber = addCommas(value);
	$('#'+id_item).val(valueNumber);
}


function addCommas(nStr){
	 nStr += '';
	 x = nStr.split('.');
	 x1 = x[0];
	 x2 = x.length > 1 ? '.' + x[1] : '';
	 var rgx = /(\d+)(\d{3})/;
	 while (rgx.test(x1)) {
	  x1 = x1.replace(rgx, '$1' + ',' + '$2');
	 }
	 return x1 + x2;
	}
</script>