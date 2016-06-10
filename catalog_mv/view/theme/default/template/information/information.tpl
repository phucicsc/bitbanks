<?php echo $header; ?>
<div class="container">
 <?php /*?>
  <ul class="breadcrumb">
    <?php foreach ($breadcrumbs as $breadcrumb) { ?>
    <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
    <?php } ?>
  </ul>
  <?php */?>
  <div class="row">
  <column id="column-left" class="col-sm-3 ">
  <?php echo $column_left; ?>
  </column>
    <?php if ($column_left && $column_right) { ?>
    <?php $class = 'col-sm-8'; ?>
    <?php } elseif ($column_left || $column_right) { ?>
    <?php $class = 'col-sm-9'; ?>
    <?php } else { ?>
    <?php $class = 'col-sm-12'; ?>
    <?php } ?>
    <div id="content" class="<?php echo $class; ?> "><?php echo $content_top; ?>
      <div class="title_page">
      	<label><?php echo $heading_title; ?></label>
      </div>
      <?php echo $description; ?><?php echo $content_bottom; ?></div>
    <?php echo $column_right; ?></div>
</div>
<?php echo $footer; ?>