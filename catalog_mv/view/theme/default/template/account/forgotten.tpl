<?php echo $header; ?>
<div class="container">
  <div class="row">
    <div class="col-md-8" style="margin:auto; float:none">
      <div id="content" class="<?php echo $class; ?>"><?php echo $content_top; ?>
        <h1><?php echo $heading_title; ?></h1>
        <p><?php echo $text_email; ?></p>
        <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" class="form-horizontal">
          <fieldset>
            <legend><?php echo $text_your_email; ?></legend>
            <div class="form-group required">
              <label class="col-sm-2 control-label" for="input-email"><?php echo $entry_email; ?></label>
              <div class="col-sm-10">
                <input type="text" name="email" value="" placeholder="<?php echo $entry_email; ?>" id="input-email" class="form-control" />
              </div>
            </div>
          </fieldset>
          <div class="buttons clearfix">
            <div class="pull-left"><a href="<?php echo $back; ?>" class="btn btn-default">Back</a></div>
            <div class="pull-right">
              <input type="submit" value="Continue" class="btn btn-primary" />
            </div>
          </div>
        </form>
        <?php if ($error_warning) { ?>
          <div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> <?php echo $error_warning; ?></div>
        <?php } ?>
      
      </div>
    </div>
  </div>
</div>
<?php echo $footer; ?>