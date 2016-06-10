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

  <div class="row"><?php // echo $column_left; ?>
    <?php if ( $column_right) { ?>
    <?php $class = 'col-sm-9'; ?>
    <?php } else { ?>
    <?php $class = 'col-sm-12'; ?>
    <?php } ?>
    <div id="content" class="<?php echo $class; ?>">
      <h1><?php echo $heading_title; ?></h1>
      <?php echo $text_message; ?>
      <div class="buttons">
        <div class="pull-right"><a href="<?php echo $continue; ?>" class="btn btn-primary"><?php echo $button_continue; ?></a></div>
      </div>
      <?php echo $content_bottom; ?></div>
    <?php echo $column_right; ?></div>
</div>
<?php echo $footer; ?>