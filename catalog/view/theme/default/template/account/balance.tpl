<?php echo $header; ?>
<div class="container">
  <div class="row">
  <?php echo $content_top; ?>
  </div>
 </div>
 <?php /*?>
<div class="bg_breadcrumb">
 <div class="container">
  <ul class="breadcrumb">
  	<li class="br_home"></li>
    <?php foreach ($breadcrumbs as $breadcrumb) { ?>
    <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
    <?php } ?>
  </ul>
 </div>
</div>
<?php */?>
<div class="container" style="margin-top:20px">
  <div class="row">
  <column id="column-left" class="col-sm-3 " > 
  <?php echo $column_left; ?>
  </column>
    <?php if ($column_left && $column_right) { ?>
    <?php $class = 'col-sm-8'; ?>
    <?php } elseif ($column_left || $column_right) { ?>
    <?php $class = 'col-sm-9'; ?>
    <?php } else { ?>
    <?php $class = 'col-sm-12'; ?>
    <?php } ?>
    <div id="content" class="<?php echo $class; ?>" >
      <div class="title_page">
      <label><?php echo $heading_title; ?></label>
      </div>
      <?php if($has_package){?>
      <div class="form-group ">
	 		<label class="col-sm-3 control-label" ><b>Người giới thiệu<b></label>
            <label class="col-sm-9 control-label" ><b><?php echo ':'.$name_parent;?><b></label>
     </div>
    <div class="form-group ">
	 		<label class="col-sm-3 control-label" ><b><?php echo $text_money_invest; ?>:<b></label>
            <label class="col-sm-3 control-label" ><b>+ <?php $le_mi = is_int($money_invest+0)? 0:3; echo number_format($money_invest,$le_mi,'.',','); ?><b></label>
            <label class="col-sm-3 control-label" ><b><?php echo $entry_month_invest; ?>:<b></label>
            <label class="col-sm-3 control-label" ><b><?php echo $month_invest; ?><b></label>
     </div>
	 <div class="form-group ">
	 		<label class="col-sm-3 control-label" ><b><?php echo $entry_type_contract; ?>:<b></label>
            <label class="col-sm-3 control-label" ><b><?php echo $type_contract;?><b></label>
            <label class="col-sm-3 control-label" ><b><?php echo $entry_date_add; ?>:<b></label>
            <label class="col-sm-3 control-label" ><b><?php echo $date_added;?><b></label>
     </div>
     <div class="form-group ">
            <label class="col-sm-3 control-label" ><b><?php echo $text_total_profit; ?>:<b></label>
            <label class="col-sm-3 control-label" ><b> + <?php $le_pf = is_int($total_profit+0)? 0:3; echo number_format($total_profit,$le_pf,'.',','); ?><b></label>
     		<label class="col-sm-3 control-label" ><b><?php echo $text_total_commission; ?>:<b></label>
            <label class="col-sm-3 control-label" ><b>+ <?php $le_cm = is_int($total_commission+0)? 0:3; echo number_format($total_commission,$le_cm,'.',','); ?><b></label>
     </div>
     <div class="form-group ">
            <label class="col-sm-3 control-label" ><b><?php echo $text_total_gift; ?>:<b></label>
            <label class="col-sm-3 control-label" ><b>+ <?php $le_gt = is_int($total_gift+0)? 0:3; echo number_format($total_gift,$le_gt,'.',','); ?><b></label>
            <label class="col-sm-3 control-label" ><b><?php echo $text_total_payout; ?>:<b></label>
            <label class="col-sm-3 control-label" ><b>- <?php $le_po = is_int($total_payout+0)? 0:3; echo number_format($total_payout,$le_po,'.',','); ?><b></label>
     </div>
     <div class="form-group ">
            <label class="col-sm-3 control-label" ><b><?php echo $text_total_balance; ?>:<b></label>
            <label class="col-sm-3 control-label" ><b><?php $le_bl = is_int($total_balance+0)? 0:3; echo number_format($total_balance,$le_bl,'.',','); ?><b></label>
     </div>
     <?php }else{?>
     	<div class="form-group ">
     		<label class="col-sm-3 control-label" ><b><?php echo $text_total_commission; ?>:<b></label>
            <label class="col-sm-3 control-label" ><b>+ <?php $le_cm = is_int($total_commission+0)? 0:3; echo number_format($total_commission,$le_cm,'.',','); ?><b></label>
            <label class="col-sm-3 control-label" ><b><?php echo $text_total_gift; ?>:<b></label>
	        <label class="col-sm-3 control-label" ><b>+ <?php $le_gt = is_int($total_gift+0)? 0:3; echo number_format($total_gift,$le_gt,'.',','); ?><b></label>
	     </div>
	     <div class="form-group ">
	            <label class="col-sm-3 control-label" ><b><?php echo $text_total_payout; ?>:<b></label>
	            <label class="col-sm-3 control-label" ><b>- <?php $le_po = is_int($total_payout+0)? 0:3; echo number_format($total_payout,$le_po,'.',','); ?><b></label>
	            <label class="col-sm-3 control-label" ><b><?php echo $text_total_balance; ?>:<b></label>
	            <label class="col-sm-3 control-label" ><b><?php $le_bl = is_int($total_balance+0)? 0:3; echo number_format($total_balance,$le_bl,'.',','); ?><b></label>
	     </div>

     <?php }?>
     <div class="clr"></div>
     <?php /* ?>
      <div class="well">
          <div class="row">
          	<div class="col-sm-5">
              <div class="form-group">
                <label class="control-label" for="input-start-date">Từ ngày</label>
                <div class="input-group date">
                  <input type="text" name="filter_start_date" value="<?php echo $filter_start_date; ?>"  data-date-format="DD-MM-YYYY" id="input-date_start" class="form-control" />
                  <span class="input-group-btn">
                  <button type="button" class="btn btn-default"><i class="fa fa-calendar"></i></button>
                  </span></div>
              </div>
            </div>
            
			<div class="col-sm-5">
              <div class="form-group">
                <label class="control-label" for="input-end-date">Đến ngày</label>
                <div class="input-group date">
                  <input type="text" name="filter_end_date" value="<?php echo $filter_end_date; ?>"  data-date-format="DD-MM-YYYY" id="input-end_start" class="form-control" />
                  <span class="input-group-btn">
                  <button type="button" class="btn btn-default"><i class="fa fa-calendar"></i></button>
                  </span></div>
                  
              </div>
            </div>
            <div class="col-sm-1"></div>
            
            <div class="col-sm-1" style="margin-top:25px">
            	<button type="button" id="button-filter" class="btn btn-primary pull-right"><i class="fa fa-search"></i> Lọc dữ liệu</button>
            </div>
            
          </div>
          
     </div>
     <?php */ ?>
 	<div>
 		<table style=" margin-top:10px;border-spacing: 1px;"  class="tb-search"   width="100%">
			<thead>
			  <tr class="title-balance">
			  	<th width="25%">
			    	<?php echo $text_datetime;?>	
			    </th>
			    <th width="20%">
			    	<?php echo $text_amount;?>
			    </th> 
			    <th width="30%">
			    	<?php echo $text_description;?>   	
			    </th>     
				<th width="25%">
			    	<?php echo $text_fromuser;?> 	    
			    </th> 
			  </tr>
			 
			 </thead>
		</table>
		 <ul class="pagination1 "> 
		  <?php  
			foreach($list_balace as $key=>$item){
				$csstr = "bgl-tr";
				if($key%2 == 0){	
					$csstr = "bgc-tr";
				}
		
		
			?>
		      <li class="<?php echo $csstr;?>">
				<div class="page_td"><?php echo date('d-m-Y',$item['date']) ?></div> 
				<?php $le = is_int($item['receive']+0)? 0:3;?>
				<div class="page_td"><?php $type = '+ ';
				 if($item['type_profit'] == 4){
				 	 $type = '- ';
				 }
				 
				 echo $type.number_format($item['receive'],$le,'.',','); ?></div>
		        <div class="page_td" align="left"><?php echo $item['description'] 	?></div>     
		         <div class="page_td"><strong><?php echo $item['from_user']?$item['from_user']: '' ?></strong></div>    
		                 
		      </li>
		   <?php } ?> 
		</ul>
 	</div>
      <?php echo $content_bottom; ?></div>
      <column id="column-right" class="col-sm-2 hidden-xs">
    	<?php echo $column_right; ?>
      </column>
    </div>
</div>
<?php echo $footer; ?>
<script type="text/javascript"><!--
$('.date').datetimepicker({
	pickTime: false
});

$('.datetime').datetimepicker({
	pickDate: true,
	pickTime: true
});

$('.time').datetimepicker({
	pickDate: false
});
//--></script>
  <script type="text/javascript"><!--
$('#button-filter').on('click', function() {
	url = 'index.php?route=account/balance&id_package=<?php echo $id_package;?>';
	
	var filter_start_date = $('input[name=\'filter_start_date\']').val();
	
	if (filter_start_date) {
		url += '&filter_start_date=' + encodeURIComponent(filter_start_date);
	}
	
	var filter_end_date = $('input[name=\'filter_end_date\']').val();
	
	if (filter_end_date) {
		url += '&filter_end_date=' + encodeURIComponent(filter_end_date);
	}
	
	location = url;
});
//--></script>
<script type="text/javascript">
jQuery(document).ready(function() {
	jQuery(".pagination1").quickPagination();
	
});
</script>