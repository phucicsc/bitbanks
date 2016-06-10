<?php echo $header; ?>
<div >
  <div class="row">
  <?php echo $content_top; ?>
  </div>
 </div>
 <?php /*?>
 <div class="bg_breadcrumb">
 <div class="container">
 	<div class="br_home"></div>
 </div>
 </div>
 <?php */ ?>
 <div class="container" style="margin-top:20px">
  <div class="row">
  <column id="column-left" class="col-sm-4 hidden-xs">
  <?php echo $column_left; ?>
  </column>
    <?php if ($column_left && $column_right) { ?>
    <?php $class = 'col-sm-4'; ?>
    <?php } elseif ($column_left || $column_right) { ?>
    <?php $class = 'col-sm-9'; ?>
    <?php } else { ?>
    <?php $class = 'col-sm-12'; ?>
    <?php } ?>
    <div id="content" class="<?php echo $class; ?>"><?php echo $content_middle; ?></div>
    <column id="column-right" class="col-sm-3 hidden-xs">
    <?php echo $column_right; ?>
    </column>
    </div>
    <div class="row"> <?php echo $content_bottom; ?></div>
</div>
<?php echo $footer; ?>