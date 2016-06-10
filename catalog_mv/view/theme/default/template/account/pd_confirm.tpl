<?php
$self -> document -> setTitle('Provide Donation');
echo $self -> load -> controller('common/header');
echo $self -> load -> controller('common/column_left');
?>
<div class="container">
    <div id="wrapper">
        <div id="layout-static">
            <div class="static-content-wrapper">
                <div class="static-content">
                    <div class="page-content">
                        <ol class="breadcrumb">
                            <li>
								<a href="<?php echo $self -> url -> link('account/dashboard', '', 'SSL'); ?>">Home</a>
							</li>
							<li style="padding:0">
                                >
                            </li>
							<li>
								<a href="<?php echo $self -> url -> link('account/pd', '', 'SSL'); ?>">Provide Donation</a>
							</li>
							<li style="padding:0">
                                >
                            </li>
							<li class="onBack">
								<a href="#">Transfer</a>
							</li>
							<li style="padding:0">
                                >
                            </li>
							 <li class="active">
                                <a href="#">Confirm</a>
                            </li>
                        </ol>
                        <div class="page-heading">
                            <h1>Confirm Provide Donate</h1>
                            <div class="options">
                                <div class="btn-toolbar">
                                    <a href="#" class="onBack">
                                        <i class="fa fa-angle-double-left"></i> Back to previous page
                                    </a>
                                </div>
                            </div>
                        </div>
                        <div class="container-fluid">
                            <div class="row">
                                <div class="col-md-12">
                                    <form action="/ProvideDonation/Confirm" class="" enctype="multipart/form-data" method="post">
                                        <div class="panel panel-default">
                                            <div class="panel-heading">
                                                <h4>Received Bitcoin Address</h4>
                                            </div>
                                            <div class="panel-body">
                                                <div class="row">
                                                    <div class="col-md-6">
                                                        <div class="form-group">
                                                            <div class="col-md-8">
                                                                <pre>13AcgbcZdjyjxESX8p6nbJgqXuUJ5gsbDx</pre>
                                                                <img src="https://chart.googleapis.com/chart?chs=200x200&amp;cht=qr&amp;chl=bitcoin:13AcgbcZdjyjxESX8p6nbJgqXuUJ5gsbDx?amount=0.71925000"/>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="col-md-6">
                                                        <div class="form-group">
                                                            <label for="GDMemberInfo_UserName">User Name</label>:
                                    Typhu1
                                
                                                        </div>
                                                        <div class="form-group">
                                                            <label for="GDMemberInfo_CountryId">Country</label>:
                                    Viet Nam
                                
                                                        </div>
                                                        <div class="form-group">
                                                            <label>Transfer Amount:</label>
                                    0.71925000 BTC 
                                
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="row">
                                                    <div class="col-md-6">
                                                        <div class="control-group form-group">
                                                            <div class="controls">
                                                                <label class="control-label" for="ConfirmTransactionCode">Your transfer transaction code</label>
                                                                <input class="form-control" id="ConfirmTransactionCode" name="ConfirmTransactionCode" type="text" value=""/>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="col-md-6">
                                                        <div class="control-group form-group">
                                                            <div class="controls">
                                                                <label class="control-label" for="ConfirmPDWalletAdress">Your transfer wallet address</label>
                                                                <input class="form-control" id="ConfirmPDWalletAdress" name="ConfirmPDWalletAdress" type="text" value=""/>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="clearfix"></div>
                                                <div class="panel-footer">
                                                    <div class="row">
                                                        <div class="col-sm-8">
                                                            <button type="submit" class="btn-primary btn">Confirm</button>
                                                            <button type="reset" class="btn-default btn">Cancel</button>
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