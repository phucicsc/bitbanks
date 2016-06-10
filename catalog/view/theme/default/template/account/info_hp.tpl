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
      	<label class="info_hp_year">Năm 2016</label>
 		<table style=" margin-top:10px;border-spacing: 1px;"  class="tb_hp"   width="100%" border="1">
			<tr class="title">
				<td>Lần 1</td>
				<td>Lần 2</td>
				<td>Lần 3</td>
				<td>Lần 4</td>
				<td>Lần 5</td>
				<td>Lần 6</td>
			</tr>
			<tr class="hp">
				<?php for ($n=1;$n<=6;$n++){?>
					<td class="<?php echo $numHP >= $n? "had_hp":"" ;?>"><?php echo $numHP >= $n? "Đã đóng":"Chưa đóng" ;?> </td>
				<?php }?>
			</tr>
			<tr class="title">
				<td>Lần 7</td>
				<td>Lần 8</td>
				<td>Lần 9</td>
				<td>Lần 10</td>
				<td>Lần 11</td>
				<td>Lần 12</td>
			</tr>
			<tr class="hp">
				<?php for ($n=7;$n<=12;$n++){?>
					<td class="<?php echo $numHP >= $n? "had_hp":"" ;?>"><?php echo $numHP >= $n? "Đã đóng":"Chưa đóng" ;?> </td>
				<?php }?>
			</tr>
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