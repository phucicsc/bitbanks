<?php 
$self->document->setTitle('Create Pin Transfer');
echo $self->load->controller('common/header'); 
echo $self->load->controller('common/column_left');
?>
<div class="container">
    <div id="wrapper">
        <div id="layout-static">
            <div class="static-content-wrapper">
                <div class="static-content">
                    <div class="page-content">
                        <ol class="breadcrumb">
                            <li>
                                <a href="<?php echo $self->url->link('account/dashboard', '', 'SSL'); ?>">Home</a>
                            </li>
                            <li style="padding:0">
                               >
                            </li>
                            <li>
                                <a href="<?php echo $self->url->link('account/token', '', 'SSL'); ?>">Pin</a>
                            </li>
                            <li style="padding:0">
                               >
                            </li>
                            <li class="active">
                                <a href="javascript:void(0)">Create Pin Transfer</a>
                            </li>
                        </ol>
                        <div class="page-heading mb0" style="margin-top:0px;">
                            <h1>Create Pin Transfer</h1>
                        </div>
                        
                        <div class="container-fluid">
                        <div class="row">
                            <div class="col-md-12">
                                <div class="alert alert-edit-account" style="display:none">
                                    <i class="fa fa-check"></i> Edit account successfull
                                </div>
                            </div>
                        </div>
                            <div class="row">
                                <div class="col-md-12">
                                    <form  id="frmCreatePin" action="<?php echo $self->url->link('account/token/transfersubmit', '', 'SSL'); ?>" class="form-horizontal margin-none" method="post" novalidate="novalidate">
                                        <div class="panel panel-default">
                                            <div class="panel-body">
                                                <div class="form-group">
                                                    <label class="col-md-2 control-label" for="firstname">
                                                        Received Account: <!-- <span class="ast">*</span> -->
                                                    </label>
                                                    <div class="col-md-6">
                                                        <input autocomplete="off" data-link-check-user="<?php echo $self -> url -> link('account/register/checkuser', '', 'SSL'); ?>" data-link="<?php echo $self->url->link('account/token/getaccount', '', 'SSL'); ?>" class="form-control" id="MemberUserName" name="customer" type="text" value=""/>
                                                        <span id="MemberUserName-error" class="field-validation-error">
                                                            <span></span>
                                                        </span>
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label class="col-md-2 control-label" for="firstname">
                                Amount:
                                                        <!-- <span class="ast">*</span> -->
                                                    </label>
                                                    <div class="col-md-6">
                                                        <input autocomplete="off" value="" class="form-control" id="Quantity" name="pin" type="text" />
                                                        <span id="Quantity-error" class="field-validation-error">
                                                            <span></span>
                                                        </span>
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label class="col-md-2 control-label" for="firstname">
                                Transaction Password:
                                                        <!-- <span class="ast">*</span> -->
                                                    </label>
                                                    <div class="col-md-6">
                                                        <input class="form-control" id="TransferPassword" name="TransferPassword" placeholder="Your existing Transfer Password" type="password"/>
                                                        <span id="TransferPassword-error" class="field-validation-error">
                                                            <span></span>
                                                        </span>
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label class="col-md-2 control-label" for="firstname">
                                Message:
                            </label>
                                                    <div class="col-md-6">
                                                        <textarea class="form-control" cols="20" id="Description" name="description" placeholder="Your message" ></textarea>
                                                    </div>
                                                </div>
                                                <div class="panel-footer">
                                                    <div class="row">
                                                        <div class="col-sm-6 col-sm-offset-3">
                                                            <div class="btn-toolbar">
                                                                <button type="submit" class="btn btn-primary">Agree To Transfer</button>
                                                                <a href="<?php echo $self->url->link('account/token', '', 'SSL'); ?>" class="btn btn-default">Cancel</a>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- #page-content -->
                </div>
            </div>
        </div>
    </div>
</div>
<?php echo $self->load->controller('common/footer') ?>