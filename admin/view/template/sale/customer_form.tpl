<?php echo $header; ?><?php echo $column_left; ?>
<div id="content">
   <div class="page-header">
      <div class="container-fluid">
         <div class="pull-right">
            <?php if($getGroupId == 1){?>
            <button type="submit" form="form-customer" data-toggle="tooltip" title="<?php echo $button_save; ?>" class="btn btn-primary"><i class="fa fa-save"></i></button>
            <?php }?>
            <a href="<?php echo $cancel; ?>" data-toggle="tooltip" title="<?php echo $button_cancel; ?>" class="btn btn-default"><i class="fa fa-reply"></i></a>
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
      <div class="panel panel-default">
         <div class="panel-heading">
            <h3 class="panel-title"><i class="fa fa-pencil"></i> <?php echo $text_form; ?></h3>
         </div>
         <div class="panel-body">
            <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form-customer" class="form-horizontal">
               <ul class="nav nav-tabs">
                  <li class="active"><a href="#tab-general" data-toggle="tab">Overview</a></li>
                  <?php if ($customer_id) { ?>
                  <!--        <li><a href="#tab-hoiphi" data-toggle="tab">Hội viên phí</a></li> -->
                  <!-- <li><a id="ac-tab-transaction" href="#tab-transaction" data-toggle="tab">Lịch sử công tác phí</a></li> -->
                  <!-- <li><a id="ac-tab-tabletransaction" href="#tab-tabletransaction" data-toggle="tab">Bảng công tác phí</a></li> -->
                  <li><a id="ac-tab-personal" href="#tab-personal" data-toggle="tab">Chart System</a></li>
                  <li><a href="#tab-pin" data-toggle="tab">Pin</a></li>
                  <li><a href="#tab-c-wallet" data-toggle="tab">C - Wallet</a></li>
                  <li><a href="#tab-r-wallet" data-toggle="tab">R - Wallet</a></li>
                  <li><a href="#tab-pd" data-toggle="tab">Provide Donation</a></li>
                  <li><a href="#tab-gd" data-toggle="tab">Get Donation</a></li>
                  <li><a href="#tab-level" data-toggle="tab">Level</a></li>
                  <!-- <li><a id="ac-tab-binary" href="#tab-binary" data-toggle="tab">Biểu đồ nhị phân</a></li> -->
                  <?php /* ?>
                  
                  <li><a href="#tab-ip" data-toggle="tab"><?php echo $tab_ip; ?></a></li>
                  <?php */?>
                  <?php } ?>
               </ul>
               <div class="tab-content">
                  <div class="tab-pane active" id="tab-general">
                     <div class="row">
                        <div class="col-sm-12">
                           <div class="tab-content">
                              <div class="tab-pane active" id="tab-customer">
                                 <!-- <div class="form-group required">
                                    <div class="col-sm-5">
                                     <label class=" control-label" for="input-customer_code">Membership Code</label>
                                       <input type="text" name="customer_code" value="<?php echo $customer_code; ?>" placeholder="Mã hội viên" id="input-customer_code" class="form-control" />
                                       <?php if ($error_customer_code) { ?>
                                       <div class="text-danger"><?php echo $error_customer_code; ?></div>
                                       <?php } ?>
                                     </div>
                                     <div class="col-sm-1"></div>
                                    <div class="col-sm-6">
                                     <label class=" control-label" for="input-firstname">Full name</label>
                                       <input type="text" name="firstname" value="<?php echo $firstname; ?>" placeholder="Họ tên" id="input-firstname" class="form-control" />
                                       <input type="hidden" name="lastname" value="">
                                       <?php if ($error_firstname) { ?>
                                       <div class="text-danger"><?php echo $error_firstname; ?></div>
                                       <?php } ?>
                                     </div>
                                    </div> -->
                                 <div class="form-group">
                                    <div class="col-sm-5 input-group date required" >
                                       <div style="display: none;">
                                          <label class=" control-label required" for="input-date_create">Date of birth</label>
                                          <input  type="text" name="date_birth" value="01/01/1970" placeholder="Ngày tháng năm sinh" data-date-format="DD-MM-YYYY" id="date_birth" class="form-control" />
                                       
                                       <span class="input-group-btn">
                                       <button style="margin-top:28px" type="button" class="btn btn-default"><i class="fa fa-calendar"></i></button>
                                       </span>
                                       <?php if ($error_date_birth) { ?>
                                       <div class="text-danger"><?php echo $error_date_birth; ?></div>
                                       <?php  } ?>
                                       </div>
                                    </div>
                                     <div class="col-sm-6 required">
                                       <div style="display: none;">
                                          <label class=" control-label" for="input-account_bank"><?php echo $entry_account_bank; ?></label>
                                          <input type="text" name="account_bank" value="43534789568" placeholder="<?php echo $entry_account_bank; ?>" id="input-account_bank" class="form-control" />
                                          <?php if ($error_account_bank) { ?>
                                          <div class="text-danger"><?php echo $error_account_bank; ?></div>
                                          <?php  } ?>
                                       </div>
                                    </div>



                                 </div>
                                 
                                 <div class="form-group ">
                                    <div class="col-sm-5 ">
                                       <label class=" control-label" for="input-cmnd">Citizenship Card/Passport No</label>                                       
                                          <input type="text" name="cmnd" value="<?php echo $cmnd; ?>" placeholder="<?php "CMND" ?>" id="input-cmnd" class="form-control " />
                                          <?php if ($error_cmnd) { ?>
                                          <div class="text-danger"><?php echo $error_cmnd; ?></div>
                                          <?php  } ?>
                                          
                                    </div>

                                    <div class="col-sm-4" style="display:none;">
                                       <label class=" control-label" for="input-address">Address</label>
                                       <input type="text" name="address_cus" value="<?php echo $address_cus; ?>" placeholder="Địa chỉ" id="input-address" class="form-control" />
                                    </div>
                                    <div class="col-sm-1"></div>
                                    <div class="col-sm-6">
                                       <label class=" control-label" for="input-address">Country</label>
                                       <select class="form-control" id="country" name="country_id">
                                          <option value="">-- Choose your Country --</option>
                                          <?php foreach ($country as $key=> $value) {?>                     
                                          <option value="<?php echo $value['id'] ?>" <?php if ($value['id']== $country_id){echo "selected";} else{echo "";} ?>>
                                             <?php echo $value[ 'name'] ?>
                                          </option>
                                          <?php } ?>
                                       </select>
                                    </div>
                                   
                                 </div>
                                 <?php ?>
                                 <div class="form-group ">
                                    <div class="col-sm-5">
                                       <label class=" control-label" for="input-email">Email Address</label>
                                       <input type="text" name="email" value="<?php echo $email; ?>" placeholder="<?php echo $entry_email; ?>" id="input-email" class="form-control" />
                                       <?php if ($error_email) { ?>
                                       <div class="text-danger"><?php echo $error_email; ?></div>
                                       <?php  } ?>
                                      
                                    </div>
                                    <div class="col-sm-1"></div>
                                    <div class="col-sm-6 required" >
                                       <label class=" control-label" for="input-telephone">Phone Number</label>
                                       <input type="text" name="telephone" value="<?php echo $telephone; ?>" placeholder="<?php echo $entry_telephone; ?>" id="input-telephone" class="form-control" />
                                       <?php if ($error_telephone) { ?>
                                       <div class="text-danger"><?php echo $error_telephone; ?></div>
                                       <?php  } ?>
                                    </div>
                                 </div>
                                 <div class="form-group ">
                                    <div class="col-sm-5 required">
                                       <label class=" control-label" for="input-wallet">Wallet</label>
                                       <input type="text" name="wallet" value="<?php echo $wallet; ?>" placeholder="<?php echo $entry_wallet; ?>" id="input-wallet" class="form-control" />
                                       <?php if ($error_wallet) { ?>
                                       <div class="text-danger"><?php echo $error_wallet; ?></div>
                                       <?php  } ?>
                                    </div>
                                    <div class="col-sm-1"></div>
                                    <div class="col-sm-6">
                                       <label class=" control-label" for="input-p_node">Code introduced members</label>
                                       <input type="text" name="p_node_cus"  value="<?php echo $name_parrent;//$p_node//$name_parrent;?>" placeholder="<?php echo $entry_p_node?>" id="input-p_node" class="form-control" <?php if($p_node != '') echo "disabled='disabled'";?>  />
                                       <input type="hidden" name="p_node" value="<?php echo $p_node;?>" /> 
                                       <?php if ($error_p_node) { ?>
                                       <div class="text-danger"><?php echo $error_p_node; ?></div>
                                       <?php  } ?>
                                    </div>
                                    <!--  <div class="col-sm-6">
                                       <label class=" control-label" for="input-ma_thue">Tax code</label>
                                       <input  type="text" name="ma_thue" value="<?php echo $ma_thue; ?>" placeholder="Mã số thuế"  id="ma_thue" class="form-control" />
                                       </div> -->
                                 </div>
                                 <?php /*?>
                                 <div class="form-group">
                                    <label class="col-sm-2 control-label" for="input-newsletter"><?php echo $entry_newsletter; ?></label>
                                    <div class="col-sm-10">
                                       <select name="newsletter" id="input-newsletter" class="form-control">
                                          <?php if ($newsletter) { ?>
                                          <option value="1" selected="selected"><?php echo $text_enabled; ?></option>
                                          <option value="0"><?php echo $text_disabled; ?></option>
                                          <?php } else { ?>
                                          <option value="1"><?php echo $text_enabled; ?></option>
                                          <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
                                          <?php } ?>
                                       </select>
                                    </div>
                                 </div>
                                 <?php */ ?>
                                 <div class="form-group">
                                    <div class="col-sm-5">
                                       <label class=" control-label" for="input-username">Username</label>
                                       <input type="text" name="username" value="<?php echo $username; ?>" placeholder="Username" id="input-username" class="form-control" />
                                       <?php if ($error_username) { ?>
                                       <div class="text-danger"><?php echo $error_username; ?></div>
                                       <?php } ?>
                                    </div>
                                    <div class="col-sm-5" style="display: none;">
                                       <label class=" control-label" for="input">The monthly membership</label>
                                       <select class="form-control">
                                          <option><?php echo number_format($hv_phi,0,'.',',');?> đ</option>
                                       </select>
                                    </div>
                                    <div class="col-sm-1 "></div>
                                    <div class="col-sm-6" style="display: none;">
                                       
                                    </div>  
                                    <div class="col-sm-6" style="display: none;">
                                       <label class=" control-label" for="input-note">Note</label>
                                       <textarea name="note" rows="" cols="" class="form-control"></textarea>
                                    </div>
                                 </div>
                                 <div class="form-group required" >
                                    <div class="col-sm-5 required">
                                       <label class=" control-label" for="input-password"><?php echo $entry_password; ?></label>
                                       
                                       <div class="input-group"> 
                                             <span class="input-group-addon"><i class="fa fa-key fa-fw"></i></span>
                                             <input type="password" name="password" value="<?php echo $password; ?>" placeholder="Enter Your Password" id="password" class="form-control" autocomplete="off" />
                                             <?php if ($error_password) { ?>
                                             <div class="text-danger"><?php echo $error_password; ?></div>
                                             <?php  } ?>
                                       </div>
                                    </div>
                                    <div class="col-sm-1"></div>
                                    <div class="validate">
                                    
                                    <div class="col-sm-6 required">
                                       <label class=" control-label" for="input-transactionpassword">Transaction Password</label>
                                        <div class="input-group"> 
                                             <span class="input-group-addon"><i class="fa fa-key fa-fw"></i></span>
                                             <input type="password" name="transaction_password" value="" placeholder="transaction password" id="transactionpassword" class="form-control" autocomplete="off" />
                                            
                                       </div>
                                                  
                                    </div>
                                 </div>
                                 </div>
                              
                                 <div class="form-group ">                                    
                                    <div class="col-sm-5">
                                       <label class=" control-label" for="input-status"><?php echo $entry_status; ?></label>
                                       <select name="status" id="input-status" class="form-control" >
                                          <?php if ($status) { ?>
                                          <option value="1" selected="selected"><?php echo $text_enabled; ?></option>
                                          <option value="0"><?php echo $text_disabled; ?></option>
                                          <?php } else { ?>
                                          <option value="1"><?php echo $text_enabled; ?></option>
                                          <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
                                          <?php } ?>
                                       </select>
                                    </div>
                                     <div class="col-sm-1"></div>
                                         <div class="col-sm-6 input-group date">
                                             <label class=" control-label" for="input-date_create">Joined</label>
                                             <input  type="text" name="date_create" value="<?php echo $date_create; ?>" placeholder="Ngày đăng ký" data-date-format="DD-MM-YYYY" id="date_create" class="form-control" />
                                             <span class="input-group-btn">
                                             <button style="margin-top:28px" type="button" class="btn btn-default"><i class="fa fa-calendar"></i></button>
                                             </span>
                                          </div>
                                    </div>                              
                              </div>
                              <?php $address_row = 1; ?>
                              <?php foreach ($addresses as $address) { ?>
                              <div class="tab-pane" id="tab-address<?php echo $address_row; ?>">
                                 <input type="hidden" name="address[<?php echo $address_row; ?>][address_id]" value="<?php echo $address['address_id']; ?>" />
                                 <div class="form-group required">
                                    <label class="col-sm-3 control-label" for="input-firstname<?php echo $address_row; ?>"><?php echo $entry_firstname; ?></label>
                                    <div class="col-sm-9">
                                       <input type="text" name="address[<?php echo $address_row; ?>][firstname]" value="<?php echo $address['firstname']; ?>" placeholder="<?php echo $entry_firstname; ?>" id="input-firstname<?php echo $address_row; ?>" class="form-control" />
                                       <?php if (isset($error_address[$address_row]['firstname'])) { ?>
                                       <div class="text-danger"><?php echo $error_address[$address_row]['firstname']; ?></div>
                                       <?php } ?>
                                    </div>
                                 </div>
                                 <div class="form-group required">
                                    <label class="col-sm-3 control-label" for="input-lastname<?php echo $address_row; ?>"><?php echo $entry_lastname; ?></label>
                                    <div class="col-sm-9">
                                       <input type="text" name="address[<?php echo $address_row; ?>][lastname]" value="<?php echo $address['lastname']; ?>" placeholder="<?php echo $entry_lastname; ?>" id="input-lastname<?php echo $address_row; ?>" class="form-control" />
                                       <?php if (isset($error_address[$address_row]['lastname'])) { ?>
                                       <div class="text-danger"><?php echo $error_address[$address_row]['lastname']; ?></div>
                                       <?php } ?>
                                    </div>
                                 </div>
                                 <div class="form-group">
                                    <label class="col-sm-3 control-label" for="input-company<?php echo $address_row; ?>"><?php echo $entry_company; ?></label>
                                    <div class="col-sm-9">
                                       <input type="text" name="address[<?php echo $address_row; ?>][company]" value="<?php echo $address['company']; ?>" placeholder="<?php echo $entry_company; ?>" id="input-company<?php echo $address_row; ?>" class="form-control" />
                                    </div>
                                 </div>
                                 <div class="form-group required">
                                    <label class="col-sm-3 control-label" for="input-address-1<?php echo $address_row; ?>"><?php echo $entry_address_1; ?></label>
                                    <div class="col-sm-9">
                                       <input type="text" name="address[<?php echo $address_row; ?>][address_1]" value="<?php echo $address['address_1']; ?>" placeholder="<?php echo $entry_address_1; ?>" id="input-address-1<?php echo $address_row; ?>" class="form-control" />
                                       <?php if (isset($error_address[$address_row]['address_1'])) { ?>
                                       <div class="text-danger"><?php echo $error_address[$address_row]['address_1']; ?></div>
                                       <?php } ?>
                                    </div>
                                 </div>
                                 <div class="form-group">
                                    <label class="col-sm-3 control-label" for="input-address-2<?php echo $address_row; ?>"><?php echo $entry_address_2; ?></label>
                                    <div class="col-sm-9">
                                       <input type="text" name="address[<?php echo $address_row; ?>][address_2]" value="<?php echo $address['address_2']; ?>" placeholder="<?php echo $entry_address_2; ?>" id="input-address-2<?php echo $address_row; ?>" class="form-control" />
                                    </div>
                                 </div>
                                 <div class="form-group required">
                                    <label class="col-sm-3 control-label" for="input-city<?php echo $address_row; ?>"><?php echo $entry_city; ?></label>
                                    <div class="col-sm-9">
                                       <input type="text" name="address[<?php echo $address_row; ?>][city]" value="<?php echo $address['city']; ?>" placeholder="<?php echo $entry_city; ?>" id="input-city<?php echo $address_row; ?>" class="form-control" />
                                       <?php if (isset($error_address[$address_row]['city'])) { ?>
                                       <div class="text-danger"><?php echo $error_address[$address_row]['city']; ?></div>
                                       <?php } ?>
                                    </div>
                                 </div>
                                 <div class="form-group required">
                                    <label class="col-sm-3 control-label" for="input-postcode<?php echo $address_row; ?>"><?php echo $entry_postcode; ?></label>
                                    <div class="col-sm-9">
                                       <input type="text" name="address[<?php echo $address_row; ?>][postcode]" value="<?php echo $address['postcode']; ?>" placeholder="<?php echo $entry_postcode; ?>" id="input-postcode<?php echo $address_row; ?>" class="form-control" />
                                       <?php if (isset($error_address[$address_row]['postcode'])) { ?>
                                       <div class="text-danger"><?php echo $error_address[$address_row]['postcode']; ?></div>
                                       <?php } ?>
                                    </div>
                                 </div>
                                 <div class="form-group required">
                                    <label class="col-sm-3 control-label" for="input-country<?php echo $address_row; ?>"><?php echo $entry_country; ?></label>
                                    <div class="col-sm-9">
                                       <select name="address[<?php echo $address_row; ?>][country_id]" id="input-country<?php echo $address_row; ?>" onchange="country(this, '<?php echo $address_row; ?>', '<?php echo $address['zone_id']; ?>');" class="form-control">
                                          <option value=""><?php echo $text_select; ?></option>
                                          <?php foreach ($countries as $country) { ?>
                                          <?php if ($country['country_id'] == $address['country_id']) { ?>
                                          <option value="<?php echo $country['country_id']; ?>" selected="selected"><?php echo $country['name']; ?></option>
                                          <?php } else { ?>
                                          <option value="<?php echo $country['country_id']; ?>"><?php echo $country['name']; ?></option>
                                          <?php } ?>
                                          <?php } ?>
                                       </select>
                                       <?php if (isset($error_address[$address_row]['country'])) { ?>
                                       <div class="text-danger"><?php echo $error_address[$address_row]['country']; ?></div>
                                       <?php } ?>
                                    </div>
                                 </div>
                                 <div class="form-group required">
                                    <label class="col-sm-3 control-label" for="input-zone<?php echo $address_row; ?>"><?php echo $entry_zone; ?></label>
                                    <div class="col-sm-9">
                                       <select name="address[<?php echo $address_row; ?>][zone_id]" id="input-zone<?php echo $address_row; ?>" class="form-control">
                                       </select>
                                       <?php if (isset($error_address[$address_row]['zone'])) { ?>
                                       <div class="text-danger"><?php echo $error_address[$address_row]['zone']; ?></div>
                                       <?php } ?>
                                    </div>
                                 </div>
                                 <?php foreach ($custom_fields as $custom_field) { ?>
                                 <?php if ($custom_field['location'] == 'address') { ?>
                                 <?php if ($custom_field['type'] == 'select') { ?>
                                 <div class="form-group custom-field custom-field<?php echo $custom_field['custom_field_id']; ?>" data-sort="<?php echo $custom_field['sort_order'] + 1; ?>">
                                    <label class="col-sm-3 control-label" for="input-address<?php echo $address_row; ?>-custom-field<?php echo $custom_field['custom_field_id']; ?>"><?php echo $custom_field['name']; ?></label>
                                    <div class="col-sm-9">
                                       <select name="address[<?php echo $address_row; ?>][custom_field][<?php echo $custom_field['custom_field_id']; ?>]" id="input-address<?php echo $address_row; ?>-custom-field<?php echo $custom_field['custom_field_id']; ?>" class="form-control">
                                          <option value=""><?php echo $text_select; ?></option>
                                          <?php foreach ($custom_field['custom_field_value'] as $custom_field_value) { ?>
                                          <?php if (isset($address['custom_field'][$custom_field['custom_field_id']]) && $custom_field_value['custom_field_value_id'] == $address['custom_field'][$custom_field['custom_field_id']]) { ?>
                                          <option value="<?php echo $custom_field_value['custom_field_value_id']; ?>" selected="selected"><?php echo $custom_field_value['name']; ?></option>
                                          <?php } else { ?>
                                          <option value="<?php echo $custom_field_value['custom_field_value_id']; ?>"><?php echo $custom_field_value['name']; ?></option>
                                          <?php } ?>
                                          <?php } ?>
                                       </select>
                                       <?php if (isset($error_address[$address_row]['custom_field'][$custom_field['custom_field_id']])) { ?>
                                       <div class="text-danger"><?php echo $error_address[$address_row]['custom_field'][$custom_field['custom_field_id']]; ?></div>
                                       <?php } ?>
                                    </div>
                                 </div>
                                 <?php } ?>
                                 <?php if ($custom_field['type'] == 'radio') { ?>
                                 <div class="form-group custom-field custom-field<?php echo $custom_field['custom_field_id']; ?>" data-sort="<?php echo $custom_field['sort_order'] + 1; ?>">
                                    <label class="col-sm-3 control-label"><?php echo $custom_field['name']; ?></label>
                                    <div class="col-sm-9">
                                       <div>
                                          <?php foreach ($custom_field['custom_field_value'] as $custom_field_value) { ?>
                                          <div class="radio">
                                             <?php if (isset($address['custom_field'][$custom_field['custom_field_id']]) && $custom_field_value['custom_field_value_id'] == $address['custom_field'][$custom_field['custom_field_id']]) { ?>
                                             <label>
                                             <input type="radio" name="address[<?php echo $address_row; ?>][custom_field][<?php echo $custom_field['custom_field_id']; ?>]" value="<?php echo $custom_field_value['custom_field_value_id']; ?>" checked="checked" />
                                             <?php echo $custom_field_value['name']; ?></label>
                                             <?php } else { ?>
                                             <label>
                                             <input type="radio" name="address[<?php echo $address_row; ?>][custom_field][<?php echo $custom_field['custom_field_id']; ?>]" value="<?php echo $custom_field_value['custom_field_value_id']; ?>" />
                                             <?php echo $custom_field_value['name']; ?></label>
                                             <?php } ?>
                                          </div>
                                          <?php } ?>
                                       </div>
                                       <?php if (isset($error_address[$address_row]['custom_field'][$custom_field['custom_field_id']])) { ?>
                                       <div class="text-danger"><?php echo $error_address[$address_row]['custom_field'][$custom_field['custom_field_id']]; ?></div>
                                       <?php } ?>
                                    </div>
                                 </div>
                                 <?php } ?>
                                 <?php if ($custom_field['type'] == 'checkbox') { ?>
                                 <div class="form-group custom-field custom-field<?php echo $custom_field['custom_field_id']; ?>" data-sort="<?php echo $custom_field['sort_order'] + 1; ?>">
                                    <label class="col-sm-3 control-label"><?php echo $custom_field['name']; ?></label>
                                    <div class="col-sm-9">
                                       <div>
                                          <?php foreach ($custom_field['custom_field_value'] as $custom_field_value) { ?>
                                          <div class="checkbox">
                                             <?php if (isset($address['custom_field'][$custom_field['custom_field_id']]) && in_array($custom_field_value['custom_field_value_id'], $address['custom_field'][$custom_field['custom_field_id']])) { ?>
                                             <label>
                                             <input type="checkbox" name="address[<?php echo $address_row; ?>][custom_field][<?php echo $custom_field['custom_field_id']; ?>][]" value="<?php echo $custom_field_value['custom_field_value_id']; ?>" checked="checked" />
                                             <?php echo $custom_field_value['name']; ?></label>
                                             <?php } else { ?>
                                             <label>
                                             <input type="checkbox" name="address[<?php echo $address_row; ?>][custom_field][<?php echo $custom_field['custom_field_id']; ?>][]" value="<?php echo $custom_field_value['custom_field_value_id']; ?>" />
                                             <?php echo $custom_field_value['name']; ?></label>
                                             <?php } ?>
                                          </div>
                                          <?php } ?>
                                       </div>
                                       <?php if (isset($error_address[$address_row]['custom_field'][$custom_field['custom_field_id']])) { ?>
                                       <div class="text-danger"><?php echo $error_address[$address_row]['custom_field'][$custom_field['custom_field_id']]; ?></div>
                                       <?php } ?>
                                    </div>
                                 </div>
                                 <?php } ?>
                                 <?php if ($custom_field['type'] == 'text') { ?>
                                 <div class="form-group custom-field custom-field<?php echo $custom_field['custom_field_id']; ?>" data-sort="<?php echo $custom_field['sort_order'] + 1; ?>">
                                    <label class="col-sm-3 control-label" for="input-address<?php echo $address_row; ?>-custom-field<?php echo $custom_field['custom_field_id']; ?>"><?php echo $custom_field['name']; ?></label>
                                    <div class="col-sm-9">
                                       <input type="text" name="address[<?php echo $address_row; ?>][custom_field][<?php echo $custom_field['custom_field_id']; ?>]" value="<?php echo (isset($address['custom_field'][$custom_field['custom_field_id']]) ? $address['custom_field'][$custom_field['custom_field_id']] : $custom_field['value']); ?>" placeholder="<?php echo $custom_field['name']; ?>" id="input-address<?php echo $address_row; ?>-custom-field<?php echo $custom_field['custom_field_id']; ?>" class="form-control" />
                                       <?php if (isset($error_address[$address_row]['custom_field'][$custom_field['custom_field_id']])) { ?>
                                       <div class="text-danger"><?php echo $error_address[$address_row]['custom_field'][$custom_field['custom_field_id']]; ?></div>
                                       <?php } ?>
                                    </div>
                                 </div>
                                 <?php } ?>
                                 <?php if ($custom_field['type'] == 'textarea') { ?>
                                 <div class="form-group custom-field custom-field<?php echo $custom_field['custom_field_id']; ?>" data-sort="<?php echo $custom_field['sort_order'] + 1; ?>">
                                    <label class="col-sm-3 control-label" for="input-address<?php echo $address_row; ?>-custom-field<?php echo $custom_field['custom_field_id']; ?>"><?php echo $custom_field['name']; ?></label>
                                    <div class="col-sm-9">
                                       <textarea name="address[<?php echo $address_row; ?>][custom_field][<?php echo $custom_field['custom_field_id']; ?>]" rows="5" placeholder="<?php echo $custom_field['name']; ?>" id="input-address<?php echo $address_row; ?>-custom-field<?php echo $custom_field['custom_field_id']; ?>" class="form-control"><?php echo (isset($address['custom_field'][$custom_field['custom_field_id']]) ? $address['custom_field'][$custom_field['custom_field_id']] : $custom_field['value']); ?></textarea>
                                       <?php if (isset($error_address[$address_row]['custom_field'][$custom_field['custom_field_id']])) { ?>
                                       <div class="text-danger"><?php echo $error_address[$address_row]['custom_field'][$custom_field['custom_field_id']]; ?></div>
                                       <?php } ?>
                                    </div>
                                 </div>
                                 <?php } ?>
                                 <?php if ($custom_field['type'] == 'file') { ?>
                                 <div class="form-group custom-field custom-field<?php echo $custom_field['custom_field_id']; ?>" data-sort="<?php echo $custom_field['sort_order'] + 1; ?>">
                                    <label class="col-sm-3 control-label"><?php echo $custom_field['name']; ?></label>
                                    <div class="col-sm-9">
                                       <button type="button" id="button-address<?php echo $address_row; ?>-custom-field<?php echo $custom_field['custom_field_id']; ?>" data-loading-text="<?php echo $text_loading; ?>" class="btn btn-default"><i class="fa fa-upload"></i> <?php echo $button_upload; ?></button>
                                       <input type="hidden" name="address[<?php echo $address_row; ?>][custom_field][<?php echo $custom_field['custom_field_id']; ?>]" value="<?php echo (isset($address['custom_field'][$custom_field['custom_field_id']]) ? $address['custom_field'][$custom_field['custom_field_id']] : ''); ?>" />
                                       <?php if (isset($error_address[$address_row]['custom_field'][$custom_field['custom_field_id']])) { ?>
                                       <div class="text-danger"><?php echo $error_address[$address_row]['custom_field'][$custom_field['custom_field_id']]; ?></div>
                                       <?php } ?>
                                    </div>
                                 </div>
                                 <?php } ?>
                                 <?php if ($custom_field['type'] == 'date') { ?>
                                 <div class="form-group custom-field custom-field<?php echo $custom_field['custom_field_id']; ?>" data-sort="<?php echo $custom_field['sort_order'] + 1; ?>">
                                    <label class="col-sm-3 control-label" for="input-address<?php echo $address_row; ?>-custom-field<?php echo $custom_field['custom_field_id']; ?>"><?php echo $custom_field['name']; ?></label>
                                    <div class="col-sm-9">
                                       <div class="input-group date">
                                          <input type="text" name="address[<?php echo $address_row; ?>][custom_field][<?php echo $custom_field['custom_field_id']; ?>]" value="<?php echo (isset($address['custom_field'][$custom_field['custom_field_id']]) ? $address['custom_field'][$custom_field['custom_field_id']] : $custom_field['value']); ?>" placeholder="<?php echo $custom_field['name']; ?>" data-date-format="YYYY-MM-DD" id="input-address<?php echo $address_row; ?>-custom-field<?php echo $custom_field['custom_field_id']; ?>" class="form-control" />
                                          <span class="input-group-btn">
                                          <button type="button" class="btn btn-default"><i class="fa fa-calendar"></i></button>
                                          </span>
                                       </div>
                                       <?php if (isset($error_address[$address_row]['custom_field'][$custom_field['custom_field_id']])) { ?>
                                       <div class="text-danger"><?php echo $error_address[$address_row]['custom_field'][$custom_field['custom_field_id']]; ?></div>
                                       <?php } ?>
                                    </div>
                                 </div>
                                 <?php } ?>
                                 <?php if ($custom_field['type'] == 'time') { ?>
                                 <div class="form-group custom-field custom-field<?php echo $custom_field['custom_field_id']; ?>" data-sort="<?php echo $custom_field['sort_order'] + 1; ?>">
                                    <label class="col-sm-3 control-label" for="input-address<?php echo $address_row; ?>-custom-field<?php echo $custom_field['custom_field_id']; ?>"><?php echo $custom_field['name']; ?></label>
                                    <div class="col-sm-9">
                                       <div class="input-group time">
                                          <input type="text" name="address[<?php echo $address_row; ?>][custom_field][<?php echo $custom_field['custom_field_id']; ?>]" value="<?php echo (isset($address['custom_field'][$custom_field['custom_field_id']]) ? $address['custom_field'][$custom_field['custom_field_id']] : $custom_field['value']); ?>" placeholder="<?php echo $custom_field['name']; ?>" data-date-format="HH:mm" id="input-address<?php echo $address_row; ?>-custom-field<?php echo $custom_field['custom_field_id']; ?>" class="form-control" />
                                          <span class="input-group-btn">
                                          <button type="button" class="btn btn-default"><i class="fa fa-calendar"></i></button>
                                          </span>
                                       </div>
                                       <?php if (isset($error_address[$address_row]['custom_field'][$custom_field['custom_field_id']])) { ?>
                                       <div class="text-danger"><?php echo $error_address[$address_row]['custom_field'][$custom_field['custom_field_id']]; ?></div>
                                       <?php } ?>
                                    </div>
                                 </div>
                                 <?php } ?>
                                 <?php if ($custom_field['type'] == 'datetime') { ?>
                                 <div class="form-group custom-field custom-field<?php echo $custom_field['custom_field_id']; ?>" data-sort="<?php echo $custom_field['sort_order'] + 1; ?>">
                                    <label class="col-sm-3 control-label" for="input-address<?php echo $address_row; ?>-custom-field<?php echo $custom_field['custom_field_id']; ?>"><?php echo $custom_field['name']; ?></label>
                                    <div class="col-sm-9">
                                       <div class="input-group datetime">
                                          <input type="text" name="address[<?php echo $address_row; ?>][custom_field][<?php echo $custom_field['custom_field_id']; ?>]" value="<?php echo (isset($address['custom_field'][$custom_field['custom_field_id']]) ? $address['custom_field'][$custom_field['custom_field_id']] : $custom_field['value']); ?>" placeholder="<?php echo $custom_field['name']; ?>" data-date-format="YYYY-MM-DD HH:mm" id="input-address<?php echo $address_row; ?>-custom-field<?php echo $custom_field['custom_field_id']; ?>" class="form-control" />
                                          <span class="input-group-btn">
                                          <button type="button" class="btn btn-default"><i class="fa fa-calendar"></i></button>
                                          </span>
                                       </div>
                                       <?php if (isset($error_address[$address_row]['custom_field'][$custom_field['custom_field_id']])) { ?>
                                       <div class="text-danger"><?php echo $error_address[$address_row]['custom_field'][$custom_field['custom_field_id']]; ?></div>
                                       <?php } ?>
                                    </div>
                                 </div>
                                 <?php } ?>
                                 <?php } ?>
                                 <?php } ?>
                                 <div class="form-group">
                                    <label class="col-sm-3 control-label"><?php echo $entry_default; ?></label>
                                    <div class="col-sm-9">
                                       <label class="radio">
                                       <?php if (($address['address_id'] == $address_id) || !$addresses) { ?>
                                       <input type="radio" name="address[<?php echo $address_row; ?>][default]" value="<?php echo $address_row; ?>" checked="checked" />
                                       <?php } else { ?>
                                       <input type="radio" name="address[<?php echo $address_row; ?>][default]" value="<?php echo $address_row; ?>" />
                                       <?php } ?>
                                       </label>
                                    </div>
                                 </div>
                              </div>
                              <?php $address_row++; ?>
                              <?php } ?>
                           </div>
                        </div>
                     </div>
                  </div>
                  <div class="tab-pane" id="tab-hoiphi">
                     <div id="hoiphi"></div>
                     <fieldset>
                        <legend>Lịch sử đóng hội viên phí </legend>
                        <div class="table-responsive">
                           <table class="table table-bordered table-hover">
                              <thead>
                                 <tr>
                                    <td class="text-left">Ngày đóng hội phí</td>
                                    <td class="text-left">Mô tả</td>
                                    <td class="text-right">Số tiền đóng hội phí</td>
                                 </tr>
                              </thead>
                              <tbody>
                                 <?php foreach ($listHp as $hp) {
                                    $le = is_int($hp['amount']+0)? 0:0;
                                          ?>
                                 <tr>
                                    <td class="text-left"><?php echo $hp['date_added']; ?></td>
                                    <td class="text-left"><?php echo $hp['description']; ?></td>
                                    <td class="text-right"><?php echo number_format($hp['amount'],$le,'.',','); ?></td>
                                 </tr>
                                 <?php } ?>
                              </tbody>
                           </table>
                        </div>
                     </fieldset>
                     <fieldset>
                        <legend>Cập nhật đóng hội viên phí </legend>
                        <div class="table-responsive">
                           <table class="table table-bordered table-hover tb_hoiphi">
                              <tr>
                                 <?php for($n = 1;$n<=6 ;$n++){?>
                                 <td class="<?php echo $numHP >= $n? "has_phi":"" ;?>" >
                                    <input class="<?php echo $numHP >= $n? "":"select_hp" ;?>" <?php echo $numHP >= $n? 'disabled="disabled"':'' ;?>   type="checkbox"  value="<?php echo $n;?>" <?php echo $numHP >= $n? 'checked="checked"':'' ;?>  > <label> Lần <?php echo $n;?> </label>
                                 </td>
                                 <?php }?>
                              </tr>
                              <tr>
                                 <?php for($n = 7;$n<=12 ;$n++){?>
                                 <td class="<?php echo $numHP >= $n? "has_phi":"" ;?>">
                                    <input class="<?php echo $numHP >= $n? "":"select_hp" ;?>" type="checkbox"  value="<?php echo $n;?>" <?php echo $numHP >= $n? 'checked="checked"':'' ;?>  > <label> Lần <?php echo $n;?> </label>
                                 </td>
                                 <?php }?>
                              </tr>
                           </table>
                        </div>
                     </fieldset>
                     <div class="text-right">
                        <?php if($numHP < 12 ){?>
                        <button id="button-hoiphi" data-loading-text="<?php echo $text_loading; ?>" class="btn btn-primary"><i class="fa fa-plus-circle"></i> Lưu hội phí</button>
                        <?php }?>
                     </div>
                  </div>
                  <?php if ($customer_id) { ?>
                  <div class="tab-pane" id="tab-transaction">
                     <div id="transaction"></div>
                  </div>
                  <div class="tab-pane" id="tab-tabletransaction">
                     <div>
                        <table style=" margin-top:10px;border-spacing: 1px;"  class="tb-ctp"   width="100%" border="1">
                           <thead>
                              <tr class="title-ctp">
                                 <th width="5%" >
                                    Tháng 
                                 </th>
                                 <th width="13%">
                                    HV trực tiếp
                                 </th>
                                 <th width="15%" >
                                    HV gián tiếp  
                                 </th>
                                 <th width="15%">
                                    CT phí trực tiếp    
                                 </th>
                                 <th width="15%">
                                    CT phí gián tiếp    
                                 </th>
                                 <th width="17%">
                                    Tổng CT phí dự kiến   
                                 </th>
                                 <th width="20%">
                                    Tổng CT phí thực tế   
                                 </th>
                              </tr>
                           </thead>
                           <tbody>
                              <?php  
                                 $n=1;
                                 foreach($listCTP as $key=>$item){
                                 $csstr = "tbbgl-tr";
                                 if($key%2 == 0){ 
                                 $csstr = "tbbgc-tr";
                                 }
                                 
                                 
                                 ?>
                              <tr  class="<?php echo $csstr;?>" >
                                 <td><?php echo $key+1;?></td>
                                 <td><?php echo $item->numHVTT;?></td>
                                 <td><?php echo ($item->numTotalHVGT > $item->numHVGT)? $item->numHVGT.'/'.$item->numTotalHVGT:$item->numHVGT;?></td>
                                 <td><?php echo number_format($item->CTP_HVTT,0,'.',',');?></td>
                                 <td><?php echo number_format($item->CTP_HVGT,0,'.',',');?></td>
                                 <td><?php echo number_format($item->CTP_DuKien,0,'.',',');?></td>
                                 <td><?php echo number_format($item->CTP_Thuc,0,'.',',');?></td>
                              </tr>
                              <?php
                                 if($n==12){
                                  break;
                                 }
                                 $n++;
                                 } ?> 
                           </tbody>
                        </table>
                     </div>
                  </div>
                  <div class="tab-pane" id="tab-personal">
                     <div id="personal"></div>
                  </div>
                   </form>
                    
                   <div class="tab-pane" id="tab-pin">                     
                     <div id="pin">                        
                           <div class="row">
                              <div class="col-sm-12">
                                 <div class="tab-content">
                                    <div class="tab-pane active" id="tab-pin">
                                       <form action="<?php echo $actions; ?>" method="post" enctype="multipart/form-data" id="form-customer" class="form-horizontal">
                                           <div class="form-group">
                                             <div class="col-sm-5 ">
                                                <label class=" control-label" for="input">Pin</label>
                                                <input type="text" name="pin" value="<?php echo $pin; ?>" placeholder="Pin" id="input-pin" class="form-control" />
                                             </div>                                      
                                          </div>                                   
                                          <div class="form-group">
                                             <div class="col-sm-6">
                                                <input type="submit" name="submit" class="btn btn-default btnpin" value="Submit" />                                    
                                             </div>                                             
                                          </div>
                                       </form>
                                    </div>
                                 </div>
                              </div>
                           </div>
                        </div>                     
                     </div>
                     <div class="tab-pane" id="tab-c-wallet">                     
                     <div id="pin">                        
                           <div class="row">
                              <div class="col-sm-12">
                                 <div class="tab-content">
                                    <div class="tab-pane active" id="tab-c-wallet">
                                       <form action="<?php echo $actionscwallet; ?>" method="post" enctype="multipart/form-data" id="form-customer" class="form-horizontal">
                                           <div class="form-group">
                                             <div class="col-sm-5 ">
                                                <label class=" control-label" for="input">Amount</label>
                                                <input type="text" name="amount" value="<?php echo $cwallet; ?>" placeholder="Pin" id="input-pin" class="form-control" />
                                             </div>                                      
                                          </div>                                   
                                          <div class="form-group">
                                             <div class="col-sm-6">
                                                <input type="submit" name="submit" class="btn btn-default btnpin" value="Submit" />                                    
                                             </div>                                             
                                          </div>
                                       </form>
                                    </div>
                                 </div>
                              </div>
                           </div>
                        </div>                     
                     </div>
                     <div class="tab-pane" id="tab-r-wallet">                     
                     <div id="pin">                        
                           <div class="row">
                              <div class="col-sm-12">
                                 <div class="tab-content">
                                    <div class="tab-pane active" id="tab-r-wallet">
                                       <form action="<?php echo $actionsrwallet; ?>" method="post" enctype="multipart/form-data" id="form-customer" class="form-horizontal">
                                           <div class="form-group">
                                             <div class="col-sm-5 ">
                                                <label class=" control-label" for="input">Amount</label>
                                                <input type="text" name="amount" value="<?php echo $rwallet; ?>" placeholder="Pin" id="input-pin" class="form-control" />
                                             </div>                                      
                                          </div>                                   
                                          <div class="form-group">
                                             <div class="col-sm-6">
                                                <input type="submit" name="submit" class="btn btn-default btnpin" value="Submit" />                                    
                                             </div>                                             
                                          </div>
                                       </form>
                                    </div>
                                 </div>
                              </div>
                           </div>
                        </div>                     
                     </div>
                     <div class="tab-pane" id="tab-pd">                     
                                           
                           <div class="row">
                              <div class="col-sm-12">
                                 <div class="tab-content">
                                    <div class="tab-pane active" id="tab-pd">
                                       <form action="" method="post" enctype="multipart/form-data" id="form-customer" class="form-horizontal">
                                           <div class="form-group">
                                             <div class="col-sm-5 ">
                                                <label class=" control-label" for="input">Provide Donation</label>
                                                <input type="text" name="pin" value="<?php echo $getpd; ?>" placeholder="Pin" id="input-pin" class="form-control" disabled="disabled" />
                                             </div>                                      
                                          </div>                                
                                         
                                       </form>
                                    </div>
                                 </div>
                              </div>
                           </div>
                           <div class="row">
                           <div class="col-md-12">
                              <div class="col-lg-4 col-md-4 col-sm-6">
                                  <div class="tile">
                                      <div class="tile-heading">Watting</div>
                                      <div class="tile-body">
                                          <i class="fa fa-user"></i>
                                          <h2 class="pull-right">
                                            <?php echo $totalStatusWatting; ?>
                                          </h2>
                                      </div>
                                  </div>
                              </div>
                              <div class="col-lg-4 col-md-4 col-sm-6">
                                  <div class="tile">
                                      <div class="tile-heading">Marched</div>
                                      <div class="tile-body">
                                          <i class="fa fa-eye"></i>
                                          <h2 class="pull-right">
                                             <?php echo $totalStatusMarched; ?>
                                          </h2>
                                      </div>
                                  </div>
                              </div>
                              <div class="col-lg-4 col-md-4 col-sm-6">
                                  <div class="tile">
                                      <div class="tile-heading">Finish</div>
                                      <div class="tile-body">
                                          <i class="fa fa-eye"></i>
                                          <h2 class="pull-right">
                                              <?php echo $totalStatusFinish; ?>
                                          </h2>
                                      </div>
                                  </div>
                              </div>
                           </div>
                           </div>
                           <div class="row">
                              <div class="col-md-12">
                                 <div class="panel panel-default">
                                    <div id="no-more-tables" class="panel-body panel-no-padding">
                                       <table id="example" class="table table-striped table-bordered" cellspacing="0" width="100%">
                                          <thead>
                                             <tr>
                                                <th class="text-center">NO.</th>
                                                <th>ACCOUNT</th>
                                                <th>DATE CREATED</th>
                                                <th>PD NUMBER</th>
                                                <th>FILLED</th>
                                                <th>MAX PROFIT(40%)</th>
                                                <th>STATUS</th>
                                                <th>TRANSFER LIST</th>
                                             </tr>
                                          </thead>
                                          <tbody>
                                          <?php $num = 1; foreach ($pds as $value => $key){ ?>
                                             <tr>
                                                <td data-title="NO." align="center"><?php echo $num ?></td>
                                                <td data-title="ACCOUNT"><?php echo $key['username'] ?></td>
                                                <td data-title="DATE CREATED"><?php echo date("d/m/Y H:i A", strtotime($key['date_added'])); ?></td>
                                                <td data-title="PD NUMBER">PD<?php echo $key['pd_number'] ?></td>
                                                <td data-title="MAX PROFIT"><?php echo number_format($key['filled'], 8, '.', ','); ?> BTC</td>
                                                <td data-title="ACCOUNT"><?php echo number_format($key['max_profit'], 8, '.', ','); ?> BTC</td>
                                                <td data-title="STATUS" class="status"> 
                                                <?php
                                                   switch ($key['status']) {
                                                      case 0:
                                                         echo '<span class="label label-inverse">Waitting</span>';
                                                         break;
                                                      case 1:
                                                         echo '<span class="label label-info">Matched</span>';
                                                         break;
                                                      case 2:
                                                         echo '<span class="label label-success">Finished</span>';
                                                         break;
                                                   }
                                                ?> 
                                                </td>
                                                <td data-title="TRANSFER LIST">Transfer list</td>
                                             </tr>
                                          <?php $num++; } ?>
                                          </tbody>
                                       </table>

                                       <div class="panel-footer">
                                          <div class="row" style="margin:15px 0px">
                                                     <?php echo $pagination; ?>
                                                 </div>
                                       </div>
                                    </div>

                                 </div>
                              </div>
                           </div>
                     
                                            
                     </div>
                     <div class="tab-pane" id="tab-gd">                     
                     <div id="pin">                        
                           <div class="row">
                              <div class="col-sm-12">
                                 <div class="tab-content">
                                    <div class="tab-pane active" id="tab-gd">
                                       <form action="" method="post" enctype="multipart/form-data" id="form-customer" class="form-horizontal">
                                           <div class="form-group">
                                             <div class="col-sm-5 ">
                                                <label class=" control-label" for="input">Get Donation</label>
                                                <input type="text" name="pin" value="<?php echo $getgd; ?>" placeholder="Pin" id="input-pin" class="form-control" disabled="disabled" />
                                             </div>                                      
                                          </div>                                   
                                          
                                       </form>

                                    </div>
                                 </div>
                              </div>
                           </div>
                            <div class="row">
                           <div class="col-md-12">
                              <div class="col-lg-4 col-md-4 col-sm-6">
                                  <div class="tile">
                                      <div class="tile-heading">Watting</div>
                                      <div class="tile-body">
                                          <i class="fa fa-user"></i>
                                          <h2 class="pull-right">
                                            <?php echo $totalStatusWattingGD; ?>
                                          </h2>
                                      </div>
                                  </div>
                              </div>
                              <div class="col-lg-4 col-md-4 col-sm-6">
                                  <div class="tile">
                                      <div class="tile-heading">Marched</div>
                                      <div class="tile-body">
                                          <i class="fa fa-eye"></i>
                                          <h2 class="pull-right">
                                             <?php echo $totalStatusMarchedGD; ?>
                                          </h2>
                                      </div>
                                  </div>
                              </div>
                              <div class="col-lg-4 col-md-4 col-sm-6">
                                  <div class="tile">
                                      <div class="tile-heading">Finish</div>
                                      <div class="tile-body">
                                          <i class="fa fa-eye"></i>
                                          <h2 class="pull-right">
                                              <?php echo $totalStatusFinishGD; ?>
                                          </h2>
                                      </div>
                                  </div>
                              </div>
                           </div>
                           </div>
                           <div class="row">
                              <div class="col-md-12">
                                 <div class="panel panel-default">
                                    <div id="no-more-tables" class="panel-body panel-no-padding">
                                       <table id="example" class="table table-striped table-bordered" cellspacing="0" width="100%">
                                          <thead>
                                             <tr>
                                                <th class="text-center">NO.</th>
                                                  <th>GD NUMBER</th>
                                                  <th>AMOUNT</th>
                                                  <th>DATE CREATED</th>
                                                  <th>STATUS</th>
                                                  <th>TRANSFER LIST</th>
                                             </tr>
                                          </thead>
                                          <tbody>
                                           <?php $num = 1; foreach ($gds as $value => $key){ ?>
                                                    <tr>
                                                        <td data-title="NO." align="center"><?php echo $num ?></td>
                                                        <td data-title="GD NUMBER" >GD<?php echo $key['gd_number'] ?></td>
                                                        <td data-title="AMOUNT"><?php echo number_format($key['amount']); ?> VND</td>
                                                        <td data-title="DATE CREATED"><?php echo date("d/m/Y H:i A", strtotime($key['date_added'])); ?></td>
                                                        <td data-title="STATUS" class="status">
                                                            <?php
                                                                switch ($key['status']) {
                                                                    case 0:
                                                                        echo '<span class="label label-inverse">Waitting</span>';
                                                                        break;
                                                                    case 1:
                                                                        echo '<span class="label label-info">Matched</span>';
                                                                        break;
                                                                    case 2:
                                                                        echo '<span class="label label-success">Finished</span>';
                                                                        break;
                                                                }
                                                             ?>
                                                        </td>
                                        
                                            <td data-title="TRANSFER LIST"><a href="javascript:;">Transfer list</a></td>
                                                    </tr>
                                                <?php $num++; } ?>
                                          </tbody>
                                       </table>

                                       <?php if($pagination){ ?>
                                                <div class="panel-footer">
                                                    <div class="row" style="margin:15px 0px">
                                                        <?php echo $pagination; ?>
                                                    </div>
                                                </div>
                                          <?php }?>
                                    </div>

                                 </div>
                              </div>
                           </div>
                        </div>                     
                     </div>
                     <div class="tab-pane" id="tab-level">                     
                     <div id="pin">                        
                           <div class="row">
                              <div class="col-sm-12">
                                 <div class="tab-content">
                                    <div class="tab-pane active" id="tab-pin">
                                       <form action="<?php echo $actionlevel; ?>" method="post" enctype="multipart/form-data" id="form-customer" class="form-horizontal">
                                           <div class="form-group">
                                             <div class="col-sm-5 ">
                                                <label class=" control-label" for="input">Level</label>
                                                <input type="text" name="level" value="<?php echo $level; ?>" placeholder="level" id="input-pin" class="form-control" />
                                             </div>                                      
                                          </div>                                   
                                          <div class="form-group">
                                             <div class="col-sm-6">
                                                <input type="submit" name="submit" class="btn btn-default btnpin" value="Submit" />                                    
                                             </div>                                             
                                          </div>
                                       </form>
                                    </div>
                                 </div>
                              </div>
                           </div>
                        </div>                     
                     </div>
                  </div>
                  <?php } ?>
               </div>
            
         </div>
      </div>
   </div>
   <script type="text/javascript"><!--
      $('select[name=\'customer_group_id\']').on('change', function() {
        $.ajax({
          url: 'index.php?route=sale/customer/customfield&token=<?php echo $token; ?>&customer_group_id=' + this.value,
          dataType: 'json',
          success: function(json) {
            $('.custom-field').hide();
            $('.custom-field').removeClass('required');
      
            for (i = 0; i < json.length; i++) {
              custom_field = json[i];
      
              $('.custom-field' + custom_field['custom_field_id']).show();
      
              if (custom_field['required']) {
                $('.custom-field' + custom_field['custom_field_id']).addClass('required');
              }
            }
          },
          error: function(xhr, ajaxOptions, thrownError) {
            alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
          }
        });
      });
      
      $('select[name=\'customer_group_id\']').trigger('change');
      //--></script> 
   <script type="text/javascript"><!--
      var address_row = <?php echo $address_row; ?>;
      
      function addAddress() {
        html  = '<div class="tab-pane" id="tab-address' + address_row + '">';
        html += '  <input type="hidden" name="address[' + address_row + '][address_id]" value="" />';
      
        html += '  <div class="form-group required">';
        html += '    <label class="col-sm-2 control-label" for="input-firstname' + address_row + '"><?php echo $entry_firstname; ?></label>';
        html += '    <div class="col-sm-10"><input type="text" name="address[' + address_row + '][firstname]" value="" placeholder="<?php echo $entry_firstname; ?>" id="input-firstname' + address_row + '" class="form-control" /></div>';
        html += '  </div>';
      
        html += '  <div class="form-group required">';
        html += '    <label class="col-sm-2 control-label" for="input-lastname' + address_row + '"><?php echo $entry_lastname; ?></label>';
        html += '    <div class="col-sm-10"><input type="text" name="address[' + address_row + '][lastname]" value="" placeholder="<?php echo $entry_lastname; ?>" id="input-lastname' + address_row + '" class="form-control" /></div>';
        html += '  </div>';
      
        html += '  <div class="form-group">';
        html += '    <label class="col-sm-2 control-label" for="input-company' + address_row + '"><?php echo $entry_company; ?></label>';
        html += '    <div class="col-sm-10"><input type="text" name="address[' + address_row + '][company]" value="" placeholder="<?php echo $entry_company; ?>" id="input-company' + address_row + '" class="form-control" /></div>';
        html += '  </div>';
      
        html += '  <div class="form-group required">';
        html += '    <label class="col-sm-2 control-label" for="input-address-1' + address_row + '"><?php echo $entry_address_1; ?></label>';
        html += '    <div class="col-sm-10"><input type="text" name="address[' + address_row + '][address_1]" value="" placeholder="<?php echo $entry_address_1; ?>" id="input-address-1' + address_row + '" class="form-control" /></div>';
        html += '  </div>';
      
        html += '  <div class="form-group">';
        html += '    <label class="col-sm-2 control-label" for="input-address-2' + address_row + '"><?php echo $entry_address_2; ?></label>';
        html += '    <div class="col-sm-10"><input type="text" name="address[' + address_row + '][address_2]" value="" placeholder="<?php echo $entry_address_2; ?>" id="input-address-2' + address_row + '" class="form-control" /></div>';
        html += '  </div>';
      
        html += '  <div class="form-group required">';
        html += '    <label class="col-sm-2 control-label" for="input-city' + address_row + '"><?php echo $entry_city; ?></label>';
        html += '    <div class="col-sm-10"><input type="text" name="address[' + address_row + '][city]" value="" placeholder="<?php echo $entry_city; ?>" id="input-city' + address_row + '" class="form-control" /></div>';
        html += '  </div>';
      
        html += '  <div class="form-group required">';
        html += '    <label class="col-sm-2 control-label" for="input-postcode' + address_row + '"><?php echo $entry_postcode; ?></label>';
        html += '    <div class="col-sm-10"><input type="text" name="address[' + address_row + '][postcode]" value="" placeholder="<?php echo $entry_postcode; ?>" id="input-postcode' + address_row + '" class="form-control" /></div>';
        html += '  </div>';
      
        html += '  <div class="form-group required">';
        html += '    <label class="col-sm-2 control-label" for="input-country' + address_row + '"><?php echo $entry_country; ?></label>';
        html += '    <div class="col-sm-10"><select name="address[' + address_row + '][country_id]" id="input-country' + address_row + '" onchange="country(this, \'' + address_row + '\', \'0\');" class="form-control">';
          html += '         <option value=""><?php echo $text_select; ?></option>';
          <?php foreach ($countries as $country) { ?>
          html += '         <option value="<?php echo $country['country_id']; ?>"><?php echo addslashes($country['name']); ?></option>';
          <?php } ?>
          html += '      </select></div>';
        html += '  </div>';
      
        html += '  <div class="form-group required">';
        html += '    <label class="col-sm-2 control-label" for="input-zone' + address_row + '"><?php echo $entry_zone; ?></label>';
        html += '    <div class="col-sm-10"><select name="address[' + address_row + '][zone_id]" id="input-zone' + address_row + '" class="form-control"><option value=""><?php echo $text_none; ?></option></select></div>';
        html += '  </div>';
      
        // Custom Fields
        <?php foreach ($custom_fields as $custom_field) { ?>
        <?php if ($custom_field['location'] == 'address') { ?>
        <?php if ($custom_field['type'] == 'select') { ?>
      
        html += '  <div class="form-group custom-field custom-field<?php echo $custom_field['custom_field_id']; ?>" data-sort="<?php echo $custom_field['sort_order'] + 1; ?>">';
        html += '     <label class="col-sm-2 control-label" for="input-address' + address_row + '-custom-field<?php echo $custom_field['custom_field_id']; ?>"><?php echo addslashes($custom_field['name']); ?></label>';
        html += '     <div class="col-sm-10">';
        html += '       <select name="address[' + address_row + '][custom_field][<?php echo $custom_field['custom_field_id']; ?>]" id="input-address' + address_row + '-custom-field<?php echo $custom_field['custom_field_id']; ?>" class="form-control">';
        html += '       <option value=""><?php echo $text_select; ?></option>';
      
        <?php foreach ($custom_field['custom_field_value'] as $custom_field_value) { ?>
        html += '       <option value="<?php echo $custom_field_value['custom_field_value_id']; ?>"><?php echo addslashes($custom_field_value['name']); ?></option>';
        <?php } ?>
      
        html += '       </select>';
        html += '     </div>';
        html += '     </div>';
        <?php } ?>
      
        <?php if ($custom_field['type'] == 'radio') { ?>
        html += '     <div class="form-group custom-field custom-field<?php echo $custom_field['custom_field_id']; ?>">';
        html += '     <label class="col-sm-2 control-label"><?php echo addslashes($custom_field['name']); ?></label>';
        html += '     <div class="col-sm-10">';
        html += '       <div>';
      
        <?php foreach ($custom_field['custom_field_value'] as $custom_field_value) { ?>
        html += '       <div class="radio"><label><input type="radio" name="address[' + address_row + '][custom_field][<?php echo $custom_field['custom_field_id']; ?>]" value="<?php echo $custom_field_value['custom_field_value_id']; ?>" /> <?php echo addslashes($custom_field_value['name']); ?></label></div>';
        <?php } ?>
      
        html += '     </div>';
        html += '   </div>';
        html += '   </div>';
        <?php } ?>
      
        <?php if ($custom_field['type'] == 'checkbox') { ?>
        html += '   <div class="form-group custom-field custom-field<?php echo $custom_field['custom_field_id']; ?>" data-sort="<?php echo $custom_field['sort_order'] + 1; ?>">';
        html += '   <label class="col-sm-2 control-label"><?php echo addslashes($custom_field['name']); ?></label>';
        html += '   <div class="col-sm-10">';
        html += '     <div>';
      
        <?php foreach ($custom_field['custom_field_value'] as $custom_field_value) { ?>
        html += '     <div class="checkbox"><label><input type="checkbox" name="address[<?php echo $address_row; ?>][custom_field][<?php echo $custom_field['custom_field_id']; ?>][]" value="<?php echo $custom_field_value['custom_field_value_id']; ?>" /> <?php echo addslashes($custom_field_value['name']); ?></label></div>';
        <?php } ?>
      
        html += '     </div>';
        html += '   </div>';
        html += '   </div>';
        <?php } ?>
      
        <?php if ($custom_field['type'] == 'text') { ?>
        html += '   <div class="form-group custom-field custom-field<?php echo $custom_field['custom_field_id']; ?>" data-sort="<?php echo $custom_field['sort_order'] + 1; ?>">';
        html += '   <label class="col-sm-2 control-label" for="input-address' + address_row + '-custom-field<?php echo $custom_field['custom_field_id']; ?>"><?php echo addslashes($custom_field['name']); ?></label>';
        html += '   <div class="col-sm-10">';
        html += '     <input type="text" name="address[' + address_row + '][custom_field][<?php echo $custom_field['custom_field_id']; ?>]" value="<?php echo addslashes($custom_field['value']); ?>" placeholder="<?php echo addslashes($custom_field['name']); ?>" id="input-address' + address_row + '-custom-field<?php echo $custom_field['custom_field_id']; ?>" class="form-control" />';
        html += '   </div>';
        html += '   </div>';
        <?php } ?>
      
        <?php if ($custom_field['type'] == 'textarea') { ?>
        html += '   <div class="form-group custom-field custom-field<?php echo $custom_field['custom_field_id']; ?>" data-sort="<?php echo $custom_field['sort_order'] + 1; ?>">';
        html += '   <label class="col-sm-2 control-label" for="input-address' + address_row + '-custom-field<?php echo $custom_field['custom_field_id']; ?>"><?php echo addslashes($custom_field['name']); ?></label>';
        html += '   <div class="col-sm-10">';
        html += '     <textarea name="address[' + address_row + '][custom_field][<?php echo $custom_field['custom_field_id']; ?>]" rows="5" placeholder="<?php echo addslashes($custom_field['name']); ?>" id="input-address' + address_row + '-custom-field<?php echo $custom_field['custom_field_id']; ?>" class="form-control"><?php echo addslashes($custom_field['value']); ?></textarea>';
        html += '   </div>';
        html += '   </div>';
        <?php } ?>
      
        <?php if ($custom_field['type'] == 'file') { ?>
        html += '   <div class="form-group custom-field custom-field<?php echo $custom_field['custom_field_id']; ?>" data-sort="<?php echo $custom_field['sort_order'] + 1; ?>">';
        html += '   <label class="col-sm-2 control-label"><?php echo addslashes($custom_field['name']); ?></label>';
        html += '   <div class="col-sm-10">';
        html += '     <button type="button" id="button-address' + address_row + '-custom-field<?php echo $custom_field['custom_field_id']; ?>" data-loading-text="<?php echo $text_loading; ?>" class="btn btn-default"><i class="fa fa-upload"></i> <?php echo $button_upload; ?></button>';
        html += '     <input type="hidden" name="address[' + address_row + '][<?php echo $custom_field['custom_field_id']; ?>]" value="" id="input-address' + address_row + '-custom-field<?php echo $custom_field['custom_field_id']; ?>" />';
        html += '   </div>';
        html += '   </div>';
        <?php } ?>
      
        <?php if ($custom_field['type'] == 'date') { ?>
        html += '   <div class="form-group custom-field custom-field<?php echo $custom_field['custom_field_id']; ?>" data-sort="<?php echo $custom_field['sort_order'] + 1; ?>">';
        html += '   <label class="col-sm-2 control-label" for="input-address' + address_row + '-custom-field<?php echo $custom_field['custom_field_id']; ?>"><?php echo addslashes($custom_field['name']); ?></label>';
        html += '   <div class="col-sm-10">';
        html += '     <div class="input-group date"><input type="text" name="address[' + address_row + '][custom_field][<?php echo $custom_field['custom_field_id']; ?>]" value="<?php echo addslashes($custom_field['value']); ?>" placeholder="<?php echo addslashes($custom_field['name']); ?>" data-date-format="YYYY-MM-DD" id="input-address' + address_row + '-custom-field<?php echo $custom_field['custom_field_id']; ?>" class="form-control" /><span class="input-group-btn"><button type="button" class="btn btn-default"><i class="fa fa-calendar"></i></button></span></div>';
        html += '   </div>';
        html += '   </div>';
        <?php } ?>
      
        <?php if ($custom_field['type'] == 'time') { ?>
        html += '   <div class="form-group custom-field custom-field<?php echo $custom_field['custom_field_id']; ?>" data-sort="<?php echo $custom_field['sort_order'] + 1; ?>">';
        html += '   <label class="col-sm-2 control-label" for="input-address' + address_row + '-custom-field<?php echo $custom_field['custom_field_id']; ?>"><?php echo addslashes($custom_field['name']); ?></label>';
        html += '   <div class="col-sm-10">';
        html += '     <div class="input-group time"><input type="text" name="address[' + address_row + '][custom_field][<?php echo $custom_field['custom_field_id']; ?>]" value="<?php echo $custom_field['value']; ?>" placeholder="<?php echo addslashes($custom_field['name']); ?>" data-date-format="HH:mm" id="input-address' + address_row + '-custom-field<?php echo $custom_field['custom_field_id']; ?>" class="form-control" /><span class="input-group-btn"><button type="button" class="btn btn-default"><i class="fa fa-calendar"></i></button></span></div>';
        html += '   </div>';
        html += '   </div>';
        <?php } ?>
      
        <?php if ($custom_field['type'] == 'datetime') { ?>
        html += '   <div class="form-group custom-field custom-field<?php echo $custom_field['custom_field_id']; ?>" data-sort="<?php echo $custom_field['sort_order'] + 1; ?>">';
        html += '   <label class="col-sm-2 control-label" for="input-address' + address_row + '-custom-field<?php echo $custom_field['custom_field_id']; ?>"><?php echo addslashes($custom_field['name']); ?></label>';
        html += '   <div class="col-sm-10">';
        html += '     <div class="input-group datetime"><input type="text" name="address[' + address_row + '][custom_field][<?php echo $custom_field['custom_field_id']; ?>]" value="<?php echo addslashes($custom_field['value']); ?>" placeholder="<?php echo addslashes($custom_field['name']); ?>" data-date-format="YYYY-MM-DD HH:mm" id="input-address' + address_row + '-custom-field<?php echo $custom_field['custom_field_id']; ?>" class="form-control" /><span class="input-group-btn"><button type="button" class="btn btn-default"><i class="fa fa-calendar"></i></button></span></div>';
        html += '   </div>';
        html += '   </div>';
        <?php } ?>
      
        <?php } ?>
        <?php } ?>
      
        html += '  <div class="form-group">';
        html += '    <label class="col-sm-2 control-label"><?php echo $entry_default; ?></label>';
        html += '    <div class="col-sm-10"><label class="radio"><input type="radio" name="address[' + address_row + '][default]" value="1" /></label></div>';
        html += '  </div>';
      
          html += '</div>';
      
        $('#tab-general .tab-content').append(html);
      
        $('select[name=\'customer_group_id\']').trigger('change');
      
        $('select[name=\'address[' + address_row + '][country_id]\']').trigger('change');
      
        $('#address-add').before('<li><a href="#tab-address' + address_row + '" data-toggle="tab"><i class="fa fa-minus-circle" onclick="$(\'#address a:first\').tab(\'show\'); $(\'a[href=\\\'#tab-address' + address_row + '\\\']\').parent().remove(); $(\'#tab-address' + address_row + '\').remove();"></i> <?php echo $tab_address; ?> ' + address_row + '</a></li>');
      
        $('#address a[href=\'#tab-address' + address_row + '\']').tab('show');
      
        $('.date').datetimepicker({
          pickTime: false
        });
        
        $('.datetime').datetimepicker({
          pickDate: true,
          pickTime: true
        });
        
        $('.time').datetimepicker({
          pickDate: false
        }); 
        
        $('#tab-address' + address_row + ' .form-group[data-sort]').detach().each(function() {
          if ($(this).attr('data-sort') >= 0 && $(this).attr('data-sort') <= $('#tab-address' + address_row + ' .form-group').length) {
            $('#tab-address' + address_row + ' .form-group').eq($(this).attr('data-sort')).before(this);
          }
      
          if ($(this).attr('data-sort') > $('#tab-address' + address_row + ' .form-group').length) {
            $('#tab-address' + address_row + ' .form-group:last').after(this);
          }
      
          if ($(this).attr('data-sort') < -$('#tab-address' + address_row + ' .form-group').length) {
            $('#tab-address' + address_row + ' .form-group:first').before(this);
          }
        });
        
        address_row++;
      }
      //--></script> 
   <script type="text/javascript"><!--
      function country(element, index, zone_id) {
        $.ajax({
          url: 'index.php?route=sale/customer/country&token=<?php echo $token; ?>&country_id=' + element.value,
          dataType: 'json',
          beforeSend: function() {
            $('select[name=\'address[' + index + '][country_id]\']').after(' <i class="fa fa-circle-o-notch fa-spin"></i>');
          },
          complete: function() {
            $('.fa-spin').remove();
          },
          success: function(json) {
            if (json['postcode_required'] == '1') {
              $('input[name=\'address[' + index + '][postcode]\']').parent().parent().addClass('required');
            } else {
              $('input[name=\'address[' + index + '][postcode]\']').parent().parent().removeClass('required');
            }
      
            html = '<option value=""><?php echo $text_select; ?></option>';
      
            if (json['zone'] && json['zone'] != '') {
              for (i = 0; i < json['zone'].length; i++) {
                html += '<option value="' + json['zone'][i]['zone_id'] + '"';
      
                if (json['zone'][i]['zone_id'] == zone_id) {
                  html += ' selected="selected"';
                }
      
                html += '>' + json['zone'][i]['name'] + '</option>';
              }
            } else {
              html += '<option value="0"><?php echo $text_none; ?></option>';
            }
      
            $('select[name=\'address[' + index + '][zone_id]\']').html(html);
          },
          error: function(xhr, ajaxOptions, thrownError) {
            alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
          }
        });
      }
      
      $('select[name$=\'[country_id]\']').trigger('change');
      //--></script> 
   <script type="text/javascript"><!--
      $('#history').delegate('.pagination a', 'click', function(e) {
        e.preventDefault();
      
        $('#history').load(this.href);
      });
      
      $('#history').load('index.php?route=sale/customer/history&token=<?php echo $token; ?>&customer_id=<?php echo $customer_id; ?>');
      
      $('#button-history').on('click', function(e) {
        e.preventDefault();
      
        $.ajax({
          url: 'index.php?route=sale/customer/history&token=<?php echo $token; ?>&customer_id=<?php echo $customer_id; ?>',
          type: 'post',
          dataType: 'html',
          data: 'comment=' + encodeURIComponent($('#tab-history textarea[name=\'comment\']').val()),
          beforeSend: function() {
            $('#button-history').button('loading');
          },
          complete: function() {
            $('#button-history').button('reset');
          },
          success: function(html) {
            $('.alert').remove();
      
            $('#history').html(html);
      
            $('#tab-history textarea[name=\'comment\']').val('');
          }
        });
      });
      
      
      $('#hoiphi').load('index.php?route=sale/customer/hoiPhiCustomer&token=<?php echo $token; ?>&customer_id=<?php echo $customer_id; ?>');
      
      $('#button-hoiphi').on('click', function(e) {
        e.preventDefault();
        var selected = new Array();
         $(".select_hp:checked").each(function() {
               selected.push($(this).val());
          });
        $.ajax({
          url: 'index.php?route=sale/customer/hoiPhiCustomer&token=<?php echo $token; ?>&customer_id=<?php echo $customer_id; ?>',
          type: 'post',
          dataType: 'html',
          data: 'selected=' + selected,
          beforeSend: function() {
            $('#button-hoiphi').button('loading');
          },
          complete: function() {
            $('#button-hoiphi').button('reset');
          },
          success: function(html) {
            $('.alert').remove();
            window.location.reload()
            
          }
        });
      });
      
      
      //--></script> 
   <script type="text/javascript"><!--
      $('#transaction').delegate('.pagination a', 'click', function(e) {
        e.preventDefault();
      
        $('#transaction').load(this.href);
      });
      $('#ac-tab-transaction').click(function() {
          $('#transaction').load('index.php?route=sale/customer/transaction&token=<?php echo $token; ?>&customer_id=<?php echo $customer_id; ?>');
        });
      $('#transaction').load('index.php?route=sale/customer/transaction&token=<?php echo $token; ?>&customer_id=<?php echo $customer_id; ?>');
      
      $('#button-transaction').on('click', function(e) {
        
        e.preventDefault();
      
        $.ajax({
          url: 'index.php?route=sale/customer/transaction&token=<?php echo $token; ?>&customer_id=<?php echo $customer_id; ?>',
          type: 'post',
          dataType: 'html',
          data: 'id_package= '+encodeURIComponent($('#tab-transaction select[name=\'id_package\']').val())+'&description=' + encodeURIComponent($('#tab-transaction input[name=\'description\']').val()) + '&amount=' + encodeURIComponent($('#tab-transaction input[name=\'amount\']').val()),
          beforeSend: function() {
            $('#button-transaction').button('loading');
          },
          complete: function() {
            $('#button-transaction').button('reset');
          },
          success: function(html) {
            $('.alert').remove();
      
            $('#transaction').html(html);
      
            $('#tab-transaction input[name=\'amount\']').val('');
            $('#tab-transaction input[name=\'description\']').val('');
          }
        });
      });
      
      function searchPackage(){
      
          var month_filter = $('select[name=\'month_filter\']').val();
          $.ajax({
            url: 'index.php?route=sale/customer/searchPackage&token=<?php echo $token; ?>&customer_id=<?php echo $customer_id; ?>',
            type: 'post',
            dataType: 'html',
            data: 'month_filter=' + encodeURIComponent(month_filter),
            beforeSend: function() {
            },
            complete: function() {
            },
            success: function(html) {
              $('#transaction').html(html);
            }
          });
      
      }
      
      $('#ac-tab-personal').click(function() {
        $('#personal').load('index.php?route=sale/customer/personal&token=<?php echo $token; ?>&customer_id=<?php echo $customer_id; ?>');
      });
      $('#personal').load('index.php?route=sale/customer/personal&token=<?php echo $token; ?>&customer_id=<?php echo $customer_id; ?>');
      
      $('#ac-tab-binary').click(function() {
        $('#binary').load('index.php?route=sale/customer/binary&token=<?php echo $token; ?>&customer_id=<?php echo $customer_id; ?>');
      });
      $('#binary').load('index.php?route=sale/customer/binary&token=<?php echo $token; ?>&customer_id=<?php echo $customer_id; ?>');
      
      
      //--></script> 
   <script type="text/javascript"><!--
      $('#reward').delegate('.pagination a', 'click', function(e) {
        e.preventDefault();
      
        $('#reward').load(this.href);
      });
      
      $('#reward').load('index.php?route=sale/customer/reward&token=<?php echo $token; ?>&customer_id=<?php echo $customer_id; ?>');
      
      $('#button-reward').on('click', function(e) {
        e.preventDefault();
      
        $.ajax({
          url: 'index.php?route=sale/customer/reward&token=<?php echo $token; ?>&customer_id=<?php echo $customer_id; ?>',
          type: 'post',
          dataType: 'html',
          data: 'description=' + encodeURIComponent($('#tab-reward input[name=\'description\']').val()) + '&points=' + encodeURIComponent($('#tab-reward input[name=\'points\']').val()),
          beforeSend: function() {
            $('#button-reward').button('loading');
          },
          complete: function() {
            $('#button-reward').button('reset');
          },
          success: function(html) {
            $('.alert').remove();
      
            $('#reward').html(html);
      
            $('#tab-reward input[name=\'points\']').val('');
            $('#tab-reward input[name=\'description\']').val('');
          }
        });
      });
      
      $('#ip').delegate('.pagination a', 'click', function(e) {
        e.preventDefault();
      
        $('#ip').load(this.href);
      });
      
      $('#ip').load('index.php?route=sale/customer/ip&token=<?php echo $token; ?>&customer_id=<?php echo $customer_id; ?>');
      
      $('body').delegate('.button-ban-add', 'click', function() {
        var element = this;
      
        $.ajax({
          url: 'index.php?route=sale/customer/addbanip&token=<?php echo $token; ?>',
          type: 'post',
          dataType: 'json',
          data: 'ip=' + encodeURIComponent(this.value),
          beforeSend: function() {
            $(element).button('loading');
          },
          complete: function() {
            $(element).button('reset');
          },
          success: function(json) {
            $('.alert').remove();
      
            if (json['error']) {
               $('#content > .container-fluid').prepend('<div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> ' + json['error'] + '</div>');
      
              $('.alert').fadeIn('slow');
            }
      
            if (json['success']) {
              $('#content > .container-fluid').prepend('<div class="alert alert-success"><i class="fa fa-check-circle"></i> ' + json['success'] + '</div>');
      
              $(element).replaceWith('<button type="button" value="' + element.value + '" class="btn btn-danger btn-xs button-ban-remove"><i class="fa fa-minus-circle"></i> <?php echo $text_remove_ban_ip; ?></button>');
            }
          }
        });
      });
      
      $('body').delegate('.button-ban-remove', 'click', function() {
        var element = this;
      
        $.ajax({
          url: 'index.php?route=sale/customer/removebanip&token=<?php echo $token; ?>',
          type: 'post',
          dataType: 'json',
          data: 'ip=' + encodeURIComponent(this.value),
          beforeSend: function() {
            $(element).button('loading');
          },
          complete: function() {
            $(element).button('reset');
          },
          success: function(json) {
            $('.alert').remove();
      
            if (json['error']) {
               $('#content > .container-fluid').prepend('<div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> ' + json['error'] + '</div>');
            }
      
            if (json['success']) {
               $('#content > .container-fluid').prepend('<div class="alert alert-success"><i class="fa fa-check-circle"></i> ' + json['success'] + '</div>');
      
              $(element).replaceWith('<button type="button" value="' + element.value + '" class="btn btn-success btn-xs button-ban-add"><i class="fa fa-plus-circle"></i> <?php echo $text_add_ban_ip; ?></button>');
            }
          }
        });
      });
      
      $('#content').delegate('button[id^=\'button-custom-field\'], button[id^=\'button-address\']', 'click', function() {
        var node = this;
        
        $('#form-upload').remove();
        
        $('body').prepend('<form enctype="multipart/form-data" id="form-upload" style="display: none;"><input type="file" name="file" /></form>');
      
        $('#form-upload input[name=\'file\']').trigger('click');
        
        if (typeof timer != 'undefined') {
            clearInterval(timer);
        }
        
        timer = setInterval(function() {
          if ($('#form-upload input[name=\'file\']').val() != '') {
            clearInterval(timer);
            
            $.ajax({
              url: 'index.php?route=tool/upload/upload&token=<?php echo $token; ?>',
              type: 'post',   
              dataType: 'json',
              data: new FormData($('#form-upload')[0]),
              cache: false,
              contentType: false,
              processData: false,   
              beforeSend: function() {
                $(node).button('loading');
              },
              complete: function() {
                $(node).button('reset');
              },    
              success: function(json) {
                $(node).parent().find('.text-danger').remove();
                
                if (json['error']) {
                  $(node).parent().find('input[type=\'hidden\']').after('<div class="text-danger">' + json['error'] + '</div>');
                }
                      
                if (json['success']) {
                  alert(json['success']);
                }
                
                if (json['code']) {
                  $(node).parent().find('input[type=\'hidden\']').attr('value', json['code']);
                }
              },      
              error: function(xhr, ajaxOptions, thrownError) {
                alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
              }
            });
          }
        }, 500);
      });
      
      $('.date').datetimepicker({
        pickTime: false
      });
      
      $('.datetime').datetimepicker({
        pickDate: true,
        pickTime: true
      });
      
      $('.time').datetimepicker({
        pickDate: false
      }); 
      
      // Sort the custom fields
      <?php $address_row = 1; ?>
      <?php foreach ($addresses as $address) { ?>
      $('#tab-address<?php echo $address_row ?> .form-group[data-sort]').detach().each(function() {
        if ($(this).attr('data-sort') >= 0 && $(this).attr('data-sort') <= $('#tab-address<?php echo $address_row ?> .form-group').length) {
          $('#tab-address<?php echo $address_row ?> .form-group').eq($(this).attr('data-sort')).before(this);
        }
      
        if ($(this).attr('data-sort') > $('#tab-address<?php echo $address_row ?> .form-group').length) {
          $('#tab-address<?php echo $address_row ?> .form-group:last').after(this);
        }
      
        if ($(this).attr('data-sort') < -$('#tab-address<?php echo $address_row ?> .form-group').length) {
          $('#tab-address<?php echo $address_row ?> .form-group:first').before(this);
        }
      });
      <?php $address_row++; ?>
      <?php } ?>
      
      
      <?php foreach ($addresses as $address) { ?>
      $('#tab-customer .form-group[data-sort]').detach().each(function() {
        if ($(this).attr('data-sort') >= 0 && $(this).attr('data-sort') <= $('#tab-customer .form-group').length) {
          $('#tab-customer .form-group').eq($(this).attr('data-sort')).before(this);
        }
      
        if ($(this).attr('data-sort') > $('#tab-customer .form-group').length) {
          $('#tab-customer .form-group:last').after(this);
        }
      
        if ($(this).attr('data-sort') < -$('#tab-customer .form-group').length) {
          $('#tab-customer .form-group:first').before(this);
        }
      });
      <?php } ?>
      
      $('input[name=\'p_node_cus\']').autocomplete({
        'source': function(request, response) {
          $.ajax({
            url: 'index.php?route=sale/customer/autocompleteCustomer&token=<?php echo $token; ?>&p_node=' +  encodeURIComponent(request),
            dataType: 'json',     
            success: function(json) {
              response($.map(json, function(item) {
                return {
                  label: item['name_customer'],
                  value: item['customer_id']
                }
              }));
            }
          });
        },
        'select': function(item) {
          $('input[name=\'p_node_cus\']').val(item['label']);
          $('input[name=\'p_node\']').attr("value",item['value']);
        } 
      });
      //--></script>
</div>
<?php echo $footer; ?>