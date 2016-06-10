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
      	<div>
 		<table style=" margin-top:10px;border-spacing: 1px;"  class="tb-search"   width="100%">
			<thead>
			  <tr class="title-balance">
			  	<th width="15%" >
			    	Username	
			    </th>
			  	<th width="20%">
			    	<?php echo $text_username;?>	
			    </th>
			    <th width="15%" >
			    	CMND	
			    </th>
			    <th width="20%">
			    	<?php echo $text_money_invest;?>   	
			    </th>
			    <th width="10%">
			    	<?php echo $text_package;?>   	
			    </th>
			    <th width="10%">
			    	<?php echo $text_month_invest;?>   	
			    </th>  
				<th width="10%">
			    	<?php echo $text_date;?> 	    
			    </th> 
			  </tr>
			   </thead>
			  <tbody>
	<?php /* 	 <ul class="pagination1 "> */ ?>
		  <?php  
		  $totalPackage = 0;
			foreach($listChild as $key=>$item){
				$totalPackage = $totalPackage + $item['money_invest'];
				$csstr = "tbbgl-tr";
				if($key%2 == 0){	
					$csstr = "tbbgc-tr";
				}
		
		
			?>
		      <tr  class="<?php echo $csstr;?>" >
				
				<td><?php echo $item['username'];?></td>
				<td><?php echo $item['name'];?></td>
		        <td><?php echo $item['cmnd']; ?></td> 
		       	<td>
		       	<?php 
		       		$le_mi = is_int($item['money_invest']+0)? 0:3;
		       		echo number_format($item['money_invest'],$le_mi,'.',',');
		       	?>
		       	</td>
				<td>
				<?php 
					echo $item['package_vn'];
				?> 
				</td>
		        <td>
		        <?php 
					echo $item['month_invest']; 
		        ?> </td>   
		        <td>
		        <?php 
		        	echo date('d-m-Y',strtotime($item['date_added'])); 
		        ?>
		        </td>          
		      </tr>
		   <?php } ?> 
		      <tr style="border-top:1px solid #ccc">
		      <td colspan="3" align="right"><b>Tổng gói đầu tư</b></td>
		      <td align="center">
		      <b>
		      <?php 
		      $le_tt = is_int($totalPackage+0)? 0:3;
		      echo number_format($totalPackage,$le_tt,'.',',');
		      ?>
		      </b>
		      </td>
		      <td colspan="3"></td>
		      </tr>
		   </tbody>
		</table>
	<?php /* 	</ul> */ ?>
 	</div>
      <?php echo $content_bottom; ?></div>
      <column id="column-right" class="col-sm-2 hidden-xs">
    	<?php echo $column_right; ?>
      </column>
    </div>
</div>
<?php echo $footer; ?>
<script type="text/javascript">
jQuery(document).ready(function() {
	//jQuery(".pagination1").quickPagination();
	
});
</script>