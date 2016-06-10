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
 		<table style=" margin-top:10px;border-spacing: 1px;"  class="tb-ctp"   width="100%" border="1">
			<thead>
			  <tr class="title-ctp">
			  	<th width="5%" >
			    	Tháng	
			    </th>
			  	<th width="13%">
			    	HV trực tiếp
			    </th>
			    <th width="15%" >
			    	HV gián tiếp	
			    </th>
			    <th width="15%">
			    	CT phí trực tiếp   	
			    </th>
			    <th width="15%">
			    	CT phí gián tiếp  	
			    </th>
			    <th width="17%">
			    	Tổng CT phí dự kiến  	
			    </th>
			    <th width="20%">
			    	Tổng CT phí thực tế  	
			    </th>   
			  </tr>
			   </thead>
			  <tbody>
		  <?php  
		  $n=1;
			foreach($listCTP as $key=>$item){
				$csstr = "tbbgl-tr";
				if($key%2 == 0){	
					$csstr = "tbbgc-tr";
				}
		
		
			?>
		      <tr  class="<?php echo $csstr;?>" >
				<td><?php echo $key+1;?></td>
         		<td><?php echo $item->numHVTT;?></td>
         		<td><?php echo ($item->numTotalHVGT > $item->numHVGT)? $item->numHVGT.'/'.$item->numTotalHVGT:$item->numHVGT;?></td>
         		<td><?php echo number_format($item->CTP_HVTT,0,'.',',');?></td>
         		<td><?php echo number_format($item->CTP_HVGT,0,'.',',');?></td>
         		<td><?php echo number_format($item->CTP_DuKien,0,'.',',');?></td>
         		<td><?php echo number_format($item->CTP_Thuc,0,'.',',');?></td>
		      </tr>
		   <?php
			if($n==12){
				break;
			}
			$n++ ;} ?> 

		   </tbody>
		</table>
 	</div>
      <?php echo $content_bottom; ?></div>
      <column id="column-right" class="col-sm-2 hidden-xs">
    	<?php echo $column_right; ?>
      </column>
    </div>
</div>
<?php echo $footer; ?>
