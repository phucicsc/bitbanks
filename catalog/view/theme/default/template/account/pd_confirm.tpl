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
                                <?php if (intval($transferConfirm['pd_satatus']) === 0 ) {?>
                                    <form id="comfim-pd" action="<?php echo $self -> url -> link('account/pd/confirmSubmit', '', 'SSL'); ?>" method="GET">
                                <?php } ?>
                                        <input type="hidden" name="transfer" value="<?php echo $self -> request -> get['token'] ?>">
                                        <div class="panel panel-default">
                                            <div class="panel-heading">
                                                <h4 style="float:left; display:inline-block">Received Bitcoin Address</h4>
                                                <span class="countdown" style="float:right; color:red" data-countdown="<?php echo $transferConfirm['date_finish'] ?>"></span>
                                            </div>
                                            <div class="panel-body">
                                                <div class="row">
                                                    <div class="col-md-6">
                                                        <div class="form-group">
                                                            <div class="col-md-8">
                                                           
                                                                <pre><?php echo $transferConfirm['wallet'] ?></pre>
                                                                <img src="https://chart.googleapis.com/chart?chs=200x200&amp;cht=qr&amp;chl=bitcoin:<?php echo $transferConfirm['wallet']  ?>?amount=<?php echo number_format($transferConfirm['amount'], 8, '.', ','); ?>"/>
                                                    
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="col-md-6">
                                                        <div class="form-group">
                                                            <label for="GDMemberInfo_UserName">User Name</label> : <?php echo $transferConfirm['username'] ?>
                                                        </div>
                                                        <div class="form-group">
                                                            <label for="GDMemberInfo_CountryId">Country</label> : <?php echo $transferConfirm['name'] ?>
                                                        </div>
                                                        <div class="form-group">
                                                            <label>Transfer Amount : <?php echo number_format($transferConfirm['amount'], 8, '.', ','); ?> BTC</label> 
                                
                                                        </div>
                                                    </div>
                                                </div>
                                                <?php if (intval($transferConfirm['pd_satatus']) === 0 ) {?>
                                                    <div class="panel-footer">
                                                        <div class="row">
                                                            <div class="col-sm-8">
                                                                <button type="submit" class="btn-primary btn">Confirm</button>
                                                                <button type="button" class="btn-default btn onBack">Cancel</button>
                                                            </div>
                                                        </div>
                                                    </div>
                                                <?php } ?>
                                            </div>
                                        </div>
                                    <?php if (intval($transferConfirm['pd_satatus']) === 0 ) {?>
                                    </form>
                                    <?php } ?>
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