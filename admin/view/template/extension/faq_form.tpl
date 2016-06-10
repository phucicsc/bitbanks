<?php echo $header; ?><?php echo $column_left; ?>
<div id="content">
  <div class="page-header">
    <div class="container-fluid">
      <div class="pull-right">
        <button type="submit" form="form-faq" data-toggle="tooltip" title="<?php echo $button_save; ?>" class="btn btn-primary"><i class="fa fa-save"></i></button>
        <a href="<?php echo $cancel; ?>" data-toggle="tooltip" title="<?php echo $button_cancel; ?>" class="btn btn-default"><i class="fa fa-reply"></i></a></div>
      <h1><?php echo $heading_title; ?></h1>
      <ul class="breadcrumb">
        <?php foreach ($breadcrumbs as $breadcrumb) { ?>
        <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
        <?php } ?>
      </ul>
    </div>
  </div>
  <div class="container-fluid">
    <?php if ($error) { ?>
    <div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> <?php echo $error; ?>
      <button type="button" class="close" data-dismiss="alert">&times;</button>
    </div>
    <?php } ?>
    <div class="panel panel-default">
      <div class="panel-heading">
        <h3 class="panel-faq"><i class="fa fa-pencil"></i> <?php echo $heading_title; ?></h3>
      </div>
      <div class="panel-body">
        <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form-faq" class="form-horizontal">
          <div class="form-group ">
               <label class="col-sm-3 control-label" for="input-name">Tên người gửi</label>
                <div class="col-sm-9">
                          <input type="text" name="name" value="<?php echo $name; ?>" placeholder="Tên người gửi" id="input-name" class="form-control" />
                </div>
          </div>
         <div class="form-group ">
               <label class="col-sm-3 control-label" for="input-email">Email người gửi</label>
                <div class="col-sm-9">
                          <input type="text" name="email" value="<?php echo $email; ?>" placeholder="Email người gửi" id="input-email" class="form-control" />
                </div>
          </div>
          <ul class="nav nav-tabs" id="language">
			<?php foreach ($languages as $language) { ?>
			<li><a href="#language<?php echo $language['language_id']; ?>" data-toggle="tab"><img src="view/image/flags/<?php echo $language['image']; ?>" faq="<?php echo $language['name']; ?>" /> <?php echo $language['name']; ?></a></li>
			<?php } ?>
		  </ul>
		  <div class="tab-content">
			<?php foreach ($languages as $language) { ?>
			<div class="tab-pane" id="language<?php echo $language['language_id']; ?>">
			  <div class="form-group required">
				<label class="col-sm-2 control-label" for="input-title<?php echo $language['language_id']; ?>"><?php echo $text_question; ?></label>
				<div class="col-sm-10">
				  <input type="text" name="faq[<?php echo $language['language_id']; ?>][question]" value="<?php echo isset($faq[$language['language_id']]) ? $faq[$language['language_id']]['question'] : ''; ?>" placeholder="<?php echo $text_question; ?>" id="input-faq<?php echo $language['language_id']; ?>" class="form-control" />
				</div>
			  </div>
			  
			  <div class="form-group">
				<label class="col-sm-2 control-label" for="input-answer<?php echo $language['language_id']; ?>"><?php echo $text_answer; ?></label>
				<div class="col-sm-10">
				  <textarea name="faq[<?php echo $language['language_id']; ?>][answer]" placeholder="<?php echo $text_answer; ?>" id="input-answer<?php echo $language['language_id']; ?>"><?php echo isset($faq[$language['language_id']]) ? $faq[$language['language_id']]['answer'] : ''; ?></textarea>
				</div>
			  </div>
			</div>
			<?php } ?>
		  </div>
		  
		  
		  <div class="form-group">
			<label class="col-sm-2 control-label" for="input-status"><?php echo $text_status; ?></label>
			<div class="col-sm-10">
			  <select name="status" id="input-status" class="form-control">
				<?php if ($status) { ?>
				<option value="1" selected="selected"><?php echo $text_enabled; ?></option>
				<option value="0"><?php echo $text_disabled; ?></option>
				<?php } else { ?>
				<option value="1"><?php echo $text_enabled; ?></option>
				<option value="0" selected="selected"><?php echo $text_disabled; ?></option>
				<?php } ?>
			  </select>
			</div>
		  </div>
        </form>
      </div>
    </div>
  </div>
</div>
<script type="text/javascript">
$('#language a:first').tab('show');

<?php foreach ($languages as $language) { ?>
$('#input-answer<?php echo $language['language_id']; ?>').summernote({height: 300});
<?php } ?>
</script>
<?php echo $footer; ?>