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
 		<table style=" margin-top:10px;border-spacing: 1px;"  class="tb-nothp" border="1"  width="100%">
			<thead>
			  <tr class="title-nothp">
			    <th width="5%" >STT</th>
			  	<th width="15%" >
			    	Mã HV	
			    </th>
			  	<th width="25%">
			    	Tên HV	
			    </th>
			    <th width="15%" >Ngày sinh</th>
			    <th width="15%" >
			    	Điện thoại	
			    </th>
			    <th width="25%">
			    	Tên HV giới thiệu
			    </th>
			  </tr>
			   </thead>
			  <tbody>
			  <?php  
			foreach($listUserNotHP as $key=>$item){
				$csstr = "tbbgl-tr";
				if($key%2 == 0){	
					$csstr = "tbbgc-tr";
				}
		
		
			?>
		      <tr  class="<?php echo $csstr;?>" >
				<td><?php echo $key+1;?></td>
				<td><?php echo $item['customer_code'];?></td>
				<td><?php echo $item['firstname'];?></td>
		        <td><?php echo  date('d-m-Y',strtotime($item['date_birth'])); ?></td> 
				<td>
				<?php 
					echo $item['telephone'];
				?> 
				</td>
		        <td>
		        <?php 
					echo $item['p_node']; 
		        ?> </td>   
		      </tr>
		   <?php } ?> 

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