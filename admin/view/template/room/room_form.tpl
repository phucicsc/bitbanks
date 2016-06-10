<?php echo $header; ?>
    <?php echo $column_left; ?>
    
    <div id="content">
        <div class="page-header">
            <div class="container-fluid">
                <div class="pull-right">
                    <button type="submit" form="form-blog-author" data-toggle="tooltip" title="<?php echo $button_save; ?>" class="btn btn-primary"><i class="fa fa-save"></i></button>
                    <a href="<?php echo $cancel; ?>" data-toggle="tooltip" title="<?php echo $button_cancel; ?>" class="btn btn-default"><i class="fa fa-reply"></i></a>
                </div>
                <h1><?php echo $heading_title; ?></h1>
                <ul class="breadcrumb">
                    <?php foreach ($breadcrumbs as $breadcrumb) { ?>
                        <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
                    <?php } ?>
                </ul>
            </div>
        </div> <!-- end of page-header class -->
        
        <div class="container-fluid">
            <?php if ($error_warning) { ?>
                <div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> <?php echo $error_warning; ?>
                    <button type="button" class="close" data-dismiss="alert">&times;</button>
                </div>
            <?php } ?>
            
            <div class="panel panel-default">
                <div class="panel-heading">
                    <h3 class="panel-title"><i class="fa fa-pencil"></i> <?php echo $text_form; ?></h3>
                </div>
                
                <div class="panel-body">
                    <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form-blog-author" class="form-horizontal">
                        
                        <div class="form-group required">
                            <label class="col-lg-2 col-md-2 col-sm-2 col-xs-12 control-label"><span data-toggle="tooltip" title="<?php echo $help_name; ?>"><?php echo $entry_name; ?></label>
                            <div class="col-lg-10 col-md-10 col-sm-10 col-xs-12">
                                <input type="text" name="name" value="<?php echo $name; ?>" class="form-control" />
                				<?php if ($error_name) { ?>
                					<span class="text-danger"><?php echo $error_name; ?></span>
                				<?php } ?>    
                            </div>
                        </div>
                        
                        <div class="form-group ">
                        <label class="col-sm-2 control-label" for="input-id_office">Văn phòng</label>
                        <div class="col-sm-10">
                          <select name="id_office" id="input-id_office" class="form-control">
                          	<option value=""></option>
                            <?php foreach ($listOffice as $office) { ?>
                            <?php if ($office['id'] == $id_office) { ?>
                            <option value="<?php echo $office['id']; ?>" selected="selected"><?php echo $office['name']; ?></option>
                            <?php } else { ?>
                            <option value="<?php echo $office['id']; ?>"><?php echo $office['name']; ?></option>
                            <?php } ?>
                            <?php } ?>
                          </select>
                        </div>
                      	</div>
                        
                        <div class="form-group">
                             <label class="col-lg-2 col-md-2 col-sm-2 col-xs-12 control-label"><?php echo $entry_description; ?></label>
                             <div class="col-lg-10 col-md-10 col-sm-10 col-xs-12">
                                  <textarea name="description" id="description" class="form-control"><?php echo isset($room_description) ? $room_description : ''; ?></textarea>
                             </div>
                         </div>
                        <?php if(! $create){?>
                       	<div class="form-group ">
                        <label class="col-sm-2 control-label" for="input-id_manager">Trưởng phòng</label>
                        <div class="col-sm-10">
                          <select name="id_manager" id="input-id_manager" class="form-control">
                          	<option value=""></option>
                            <?php foreach ($listCustomer as $customer) { ?>
                            <?php if ($customer['customer_id'] == $id_manager) { ?>
                            <option value="<?php echo $customer['customer_id']; ?>" selected="selected"><?php echo $customer['lastname'].' '.$customer['firstname']; ?></option>
                            <?php } else { ?>
                            <option value="<?php echo $customer['customer_id']; ?>"><?php echo $customer['lastname'].' '.$customer['firstname']; ?></option>
                            <?php } ?>
                            <?php } ?>
                          </select>
                        </div>
                      	</div>
                      	<div class="form-group ">
                        <label class="col-sm-2 control-label" for="input-id_vice_president">Phó phòng</label>
                        <div class="col-sm-10">
                          <select name="id_vice_president" id="input-id_vice_president" class="form-control">
                          	<option value=""></option>
                            <?php foreach ($listCustomerNotManager as $customer) { ?>
                            <?php if ($customer['customer_id'] == $id_vice_president) { ?>
                            <option value="<?php echo $customer['customer_id']; ?>" selected="selected"><?php echo $customer['lastname'].' '.$customer['firstname']; ?></option>
                            <?php } else { ?>
                            <option value="<?php echo $customer['customer_id']; ?>"><?php echo $customer['lastname'].' '.$customer['firstname']; ?></option>
                            <?php } ?>
                            <?php } ?>
                          </select>
                          <?php if ($error_id_vice_president) { ?>
                					<span class="text-danger"><?php echo $error_id_vice_president; ?></span>
                		  <?php } ?> 
                        </div>
                      </div>
                      <?php }?>
                         <input type="hidden" name="status" value="1">
                        <?php /*?>
                        <div class="form-group">
                            <label class="col-lg-2 col-md-2 col-sm-2 col-xs-12 control-label"><?php echo $entry_status; ?></label>
                            <div class="col-lg-10 col-md-10 col-sm-10 col-xs-12">
                                <select name="status" class="form-control">
				            		<option value="1" <?php if($status == 1) { echo "selected='selected'"; } ?>><?php echo $text_enabled; ?></option>
				            		<option value="0" <?php if($status == 0) { echo "selected='selected'"; } ?>><?php echo $text_disabled; ?></option>
				            	</select>
                            </div>
                        </div> 
                        <?php */?>
  					</form>
  					<?php if(! $create){?>
                        <fieldset>
						<legend>Thành viên trong phòng :</legend>
						<div class="table-responsive">
						  <table class="table table-bordered table-hover">
						  	<thead>
						      <tr>
						        <td class="text-left">Tên</td>
						        <td class="text-left">Điện thoại</td>
						        <td class="text-right">Email</td>
						        <td class="text-right">Doanh số</td>
						      </tr>
						    </thead>
						    <tbody>
						    <?php foreach ($listCustomer as $customer) {
								$le = is_int($customer['money_order']+0)? 0:3;
						      	?>
						      <tr>
						        <td class="text-left"><?php echo $customer['lastname'].' '.$customer['firstname']; ?></td>
						        <td class="text-left"><?php echo $customer['telephone']; ?></td>
						        <td class="text-right"><?php echo $customer['email']; ?></td>
						        <td class="text-right"><?php echo number_format($customer['money_order'],$le,'.',','); ?></td>
						      </tr>
						      <?php } ?>
						      <?php $le_t = is_int($totalMoneyOrder+0)? 0:3;?>
						      <tr>
						        <td class="text-right" colspan="3"><b>Tổng doanh số</b></td>
						        <td class="text-right"><?php echo number_format($totalMoneyOrder,$le_t,'.',','); ?></td>
						      </tr>
						    </tbody>
						  </table>
						 </div>
						 </fieldset>
                       <?php }?> 	
                        </div>
                </div>
            </div>
        </div>        
    </div>
    
    <script type="text/javascript">
        
         $('#description; ?>').summernote({height: 300});
    
        $('#language a:first').tab('show');
        $('#option a:first').tab('show');
    </script>
<?php echo $footer; ?>