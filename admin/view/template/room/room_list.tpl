<?php echo $header; ?>
    <?php echo $column_left; ?>
    
    <div id="content">
        <div class="page-header">
            <div class="container-fluid">
                <div class="pull-right">
                    <a href="<?php echo $insert; ?>" data-toggle="tooltip" title="<?php echo $button_insert; ?>" class="btn btn-primary"><i class="fa fa-plus"></i></a>
                    <button type="button" data-toggle="tooltip" title="<?php echo $button_delete; ?>" class="btn btn-danger" onclick="confirm('<?php echo $text_confirm; ?>') ? $('#form-blog-author').submit() : false;"><i class="fa fa-trash-o"></i></button>
                    <?php if(isset($found_user_view_all)) { ?>
	  					<a href="<?php echo $view_all_ticket; ?>" class="btn btn-primary" data-toggle="tooltip" title="<?php echo $button_view_all; ?>"><i class="fa fa-eye"></i></a>
	  				<?php } ?>
                </div>                
                <h1><?php echo $heading_title; ?></h1>
                <ul class="breadcrumb">
                    <?php foreach ($breadcrumbs as $breadcrumb) { ?>
                        <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
                    <?php } ?>
                </ul>                
            </div>
        </div>
        
        <div class="container-fluid">
            <?php if ($error_warning) { ?>
                <div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> <?php echo $error_warning; ?>
                    <button type="button" class="close" data-dismiss="alert">&times;</button>
                </div>
            <?php } ?>
            
            <?php if ($success) { ?>
                <div class="alert alert-success"><i class="fa fa-check-circle"></i> <?php echo $success; ?>
                    <button type="button" class="close" data-dismiss="alert">&times;</button>
                </div>
            <?php } ?>
            
            <div class="panel panel-default">
                <div class="panel-heading">
                    <h3 class="panel-title"><i class="fa fa-list"></i> <?php echo $heading_title; ?></h3>
                </div>
                
                <div class="panel-body">
                    <form action="<?php echo $delete; ?>" method="post" enctype="multipart/form-data" id="form-blog-author">
                        <div class="table-responsive">
                            <table class="table table-bordered table-hover">
                                <thead>
                                    
                                    <tr>
                                        <td style="width: 1px;" class="text-center"><input type="checkbox" onclick="$('input[name*=\'selected\']').prop('checked', this.checked);" /></td>
                                        
                                        <td class="text-left">
                                            <?php if ($sort == 'r.name') { ?>
        			                			<a href="<?php echo $sort_name; ?>" class="<?php echo strtolower($order); ?>"><?php echo $column_author_name; ?></a>
        			                		<?php } else { ?>
        			                			<a href="<?php echo $sort_name; ?>"><?php echo $column_author_name; ?></a>
        			                		<?php } ?>
                                        </td>
				                		<?php /*?>
                                        <td class="text-left">
                                            <?php if ($sort == 'ba.status') { ?>
        			                			<a href="<?php echo $sort_status; ?>" class="<?php echo strtolower($order); ?>"><?php echo $column_status; ?></a>
        			                		<?php } else { ?>
        			                			<a href="<?php echo $sort_status; ?>"><?php echo $column_status; ?></a>
        			                		<?php } ?>
                                        </td>	
				                        <?php */?>
				                        <td>Văn phòng</td>
				                        <td> Trưởng phòng </td>
				                        <td> Phó phòng </td>
				                        <td> Tổng doanh số </td>
        				                <td class="text-right"><?php echo $column_action; ?></td>
                                    </tr>
                                    
                                </thead>
                                
                                <tbody>
                                    <?php if ($rooms) { ?>
			          			        <?php foreach($rooms as $room) { ?>
                                            <tr>
                                                <td class="text-center">
                                                    <?php if (in_array($room['room_id'], $selected)) { ?>
                                                        <input type="checkbox" name="selected[]" value="<?php echo $room['room_id']; ?>" checked="checked" />
                                                    <?php } else { ?>
                                                        <input type="checkbox" name="selected[]" value="<?php echo $room['room_id']; ?>" />
                                                    <?php } ?>
                                                </td>
                                                
                                                <td class="text-left"><?php echo $room['name']; ?></td>
                                                <td><?php echo $room['nameOffice'];?></td>
        	            						<?php /*?><td class="text-left"><?php echo $room['status']; ?></td> <? */ ?>
        	            						<td><?php echo $room['name_manager']; ?></td>
        	            						<td><?php echo $room['name_vice_president']; ?></td>
        	            						<td>
        	            						<?php $le_t = is_int($room['total_money']+0)? 0:3;
        	            							echo number_format($room['total_money'],$le_t,'.',',');
        	            						?>
        	            						</td>
                                                <td class="text-right">
                                                    <a href="<?php echo $room['edit']; ?>" data-toggle="tooltip" title="<?php echo $button_edit; ?>" class="btn btn-primary"><i class="fa fa-pencil"></i></a>
                                                </td>
                                            </tr>
                                        <?php } ?>
                                    <?php } else { ?>
                                        <tr>
        			          				<td class="text-center" colspan="5"><?php echo $text_no_results; ?></td>
        			          			</tr>
                                    <?php } ?>
                                </tbody>
                                
                            </table>
                        </div>
                    </form>
                    <div class="row">
                        <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12 text-left"><?php echo $pagination; ?></div>
                        <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12 text-right"><?php echo $results; ?></div>
                    </div>
                </div>    
            </div>        
        </div>        
    </div>   
    
<?php echo $footer; ?>