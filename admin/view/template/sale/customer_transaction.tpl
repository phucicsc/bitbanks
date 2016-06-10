<div class="row">
<div class="col-sm-1">
<label class="control-label" for="input-month_filter">Tháng</label>
</div>
<div class="col-sm-3">
            
              <div class="form-group">
                <select name="month_filter" class="form-control">
                	<option value="0" <?php echo 0 == $month_filter? 'selected="selected"':'';?>>Tất cả</option>
                	<?php for($n=1;$n<=12;$n++){?>
                		<option  value="<?php echo $n;?>" <?php echo $n == $month_filter? 'selected="selected"':'';?>>Tháng <?php echo $n;?></option>
                	<?php }?>
                </select>
              </div>
              
 </div>
 <div class="col-sm-2">
    <button type="button" data-toggle="tooltip" title="Tìm kiếm" class="btn btn-primary" onclick="searchPackage();"><i class="fa fa-search"></i> Tìm kiếm</button>
  </div>
</div>
<div class="clr"></div>
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

<fieldset>
<legend>Danh sách công tác phí </legend>
<div class="table-responsive">
  <table class="table table-bordered table-hover">
    <thead>
      <tr>
        <td class="text-left"><?php echo $column_date_added; ?></td>
        <td class="text-left"><?php echo $column_description; ?></td>
        <td class="text-right"><?php echo $column_from_user; ?></td>
        <td class="text-right">Số tiền phát sinh</td>
      </tr>
    </thead>
    <tbody>
       <?php foreach ($transactions as $transaction) {
		$le = is_int($transaction['amount']+0)? 0:0;
      	?>
      <tr>
        <td class="text-left"><?php echo $transaction['date_added']; ?></td>
        <td class="text-left"><?php echo $transaction['description']; ?></td>
        <td class="text-right"><a href="<?php echo $transaction['url_customer_from'];?>"><?php echo $transaction['from_userid']; ?></a></td>
        <td class="text-right"><?php echo $transaction['type_profit'] == 1? "-":""; echo number_format($transaction['amount'],$le,'.',','); ?></td>
      </tr>
      <?php } ?>
      <tr>
      	<td></td>
      	<td></td>
        <td class="text-right"><b>Tổng công tác phí</b></td>
        <td class="text-left"><?php $le_ctp = is_int($tongctphi+0)? 0:3; echo number_format($tongctphi,$le_ctp,'.',','); ?></td>
      </tr>
      <tr>
      	<td></td>
      	<td></td>
        <td class="text-right"><b>Tổng hội phí phát sinh từ công tác phí</b></td>
        <td class="text-left"><?php $le_hp_ctp = is_int($tongPHFromCTP+0)? 0:3; echo number_format($tongPHFromCTP,$le_hp_ctp,'.',','); ?></td>
      </tr>
      <?php /*?>
      <tr>
      	<td></td>
      	<td></td>
        <td class="text-right"><b>Tổng công tác phí thực</b></td>
        <td class="text-left"><?php $le_ctp_thuc = is_int($tongctphithuc+0)? 0:3; echo number_format($tongctphithuc,$le_ctp_thuc,'.',','); ?></td>
      </tr>
      <?php */?>
      </tbody>
  </table>
</div>

</fieldset>

         