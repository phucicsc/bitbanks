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
<?php */ ?>
<div class="container" style="margin-top:20px">

  <div class="row">
  <column id="column-left" class="col-sm-3 hidden-xs" >
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
      <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" class="form-horizontal">
        <fieldset>
          
          <div class="form-group required">
            <label class="col-sm-3 control-label" for="input-password"><?php echo $entry_password; ?></label>
            <div class="col-sm-9">
              <input type="password" name="password" value="<?php echo $password; ?>" placeholder="<?php echo $entry_password; ?>" id="input-password" class="form-control" />
              <?php if ($error_password) { ?>
              <div class="text-danger"><?php echo $error_password; ?></div>
              <?php } ?>
            </div>
          </div>
          <div class="form-group required">
            <label class="col-sm-3 control-label" for="input-confirm"><?php echo $entry_confirm; ?></label>
            <div class="col-sm-9">
              <input type="password" name="confirm" value="<?php echo $confirm; ?>" placeholder="<?php echo $entry_confirm; ?>" id="input-confirm" class="form-control" />
              <?php if ($error_confirm) { ?>
              <div class="text-danger"><?php echo $error_confirm; ?></div>
              <?php } ?>
            </div>
          </div>
        </fieldset>
        <div class="buttons clearfix">
          <div class="pull-left"></div>
          <div class="pull-right">
            <input type="submit" value="<?php echo $button_continue; ?>" class="btn btn-primary" />
          </div>
        </div>
      </form>
      <?php echo $content_bottom; ?></div>
      <column id="column-right" class="col-sm-2 hidden-xs">
    	<?php echo $column_right; ?>
      </column>
    </div>
</div>
<?php echo $footer; ?>