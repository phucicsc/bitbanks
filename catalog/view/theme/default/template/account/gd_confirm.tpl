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
								<a href="<?php echo $self -> url -> link('account/gd', '', 'SSL'); ?>">Get Donation</a>
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
                            <h1>Information</h1>
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
                                    <div class="panel panel-default ">
                                        <div class="panel-heading">
                        Received Member Information
                        
                                            <div class="pull-right">
                                                <strong>Time Remain: </strong>
                                                <span data-remaintime="241688" class="countdown">
                                                    <span>67:</span>
                                                    <span>05:</span>
                                                    <span>51</span>
                                                </span>
                                            </div>
                                        </div>
                                        <div class="panel-body">
                                            <div class="row">
                                                <div class="col-md-4">
                                                    <h4>Tranfer Information</h4>
                                                    <dl>
                                                        <dt>Account Transfer</dt>
                                                        <dd>7c1</dd>
                                                        <dt>Amount</dt>
                                                        <dd>
                                                            <code>0.75875000 BTC</code>
                                                        </dd>
                                                    </dl>
                                                </div>
                                                <div class="col-md-4">
                                                    <h4>Up Line</h4>
                                                    <dl>
                                                        <dt>Account</dt>
                                                        <dd>6b</dd>
                                                    </dl>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
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