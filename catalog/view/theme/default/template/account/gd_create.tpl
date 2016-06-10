<?php
$self -> document -> setTitle('Create Get Donation');
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
                            <li class="active">
                                <a href="#">Create Get Donation</a>
                            </li>
                        </ol>
                        <div class="page-heading">
                            <h1>Create Get Donation</h1>
                        </div>
                        <div class="container-fluid">
                            <div class="row">
                                    <div class="col-md-12">
                                        <div class="alert alert-edit-account" style="display:none">
                                            <i class="fa fa-check"></i> Create get donation successfull.
                                        </div>
                                        <div class="alert alert-dismissable alert-danger" style="display:none">
                                            <i class="fa fa-fw fa-times"></i>You are not eligible to create  get donation.
                                        </div>
                                    </div>
                            </div>
                            <div class="row">
                                <div class="col-md-12">
                                    <form id="createGD" action="<?php echo $self -> url -> link('account/gd/submit', '', 'SSL'); ?>" class="form-horizontal margin-none" method="post" novalidate="novalidate">
                                        <div class="panel panel-default">
                                            <div class="panel-body">
                                                <div class="form-group">
                                                    <label class="col-md-3 control-label">Receivable Amount:</label>
                                                    <div class="col-md-9">
                                                        <input class="form-control" id="amount" name="amount" type="text" value="0" />
                                                        <span id="amount-error" class="field-validation-error" style="display: none;">
                                                            <span>Please enter your receivable amount</span>
                                                        </span>
                                                        <p class="help-none" id="c-wallet" data-value="<?php echo number_format($c_wallet, 6, '.', ','); ?>">C-Wallet: <?php echo number_format($c_wallet, 6, '.', ','); ?> BTC</p>
                                                        <p class="help-none" id="r-wallet" data-value="<?php echo number_format($r_wallet, 6, '.', ','); ?>">R-wallet: <?php echo number_format($r_wallet, 6, '.', ','); ?> BTC</p>
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label class="col-md-3 control-label">From Wallet: </label>
                                                    <div class="col-md-9">
                                                    <!-- Please check the type of wallet -->
                                                        <label class="radio">
                                                            <input id="C_Wallet" name="FromWallet" type="radio" value="1"/>&nbsp; &nbsp;&nbsp; &nbsp;C-Wallet
                                                        </label>
                                                        <label class="radio">
                                                            <input id="R_Wallet" name="FromWallet" type="radio" value="2"/>&nbsp; &nbsp;&nbsp; &nbsp;R-wallet
                                                        </label>
                                                       

                                                        <br/><br/>
                                                        <span id="wallet-error" class="field-validation-error" style="display: none;">
                                                            <span >Please check the type of wallet</span>
                                                        </span>
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label class="col-md-3 control-label">Transaction Password:</label>
                                                    <div class="col-md-9">
                                                        <input class="form-control" id="Password2" name="Password2" type="password"/>
                                                        <span id="Password2-error" class="field-validation-error" style="display: none;">
                                                            <span >Please enter your password</span>
                                                        </span>
                                                    </div>
                                                </div>
                                                <div class="panel-footer text-right">
                                                    <!-- <input type="hidden" name="type_wallet" id="type_wallet"/> -->
                                                    <div class="loading"></div>
                                                    <button type="submit" class="btn btn-primary">Create</button>
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