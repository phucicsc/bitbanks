<?php
$self -> document -> setTitle('Create Provide Donation');
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
							<li class="active">
								<a href="#">Create Provide Donation</a>
							</li>
						</ol>
						<div class="container-fluid">
							<div class="row">
                                <div class="col-md-12">
                                    <div class="alert alert-edit-account" style="display:none">
                                        <i class="fa fa-check"></i> Create provide donation successfull.
                                    </div>
                                    <div class="alert alert-dismissable alert-danger" style="display:none">
								        <i class="fa fa-fw fa-times"></i>You are not eligible to create  provide donation.
								    </div>
                                </div>
                            </div>
							<div class="row">
								<div class="col-md-12" id="pdWrap" style="">
									<div class="panel panel-default">
										<div class="panel-heading">
											<h4 class="heading">Create Provide Donation</h4>
										</div>

										<form id="submitPD" class="form-horizontal margin-none" name="buy_share_form" action="<?php echo $self -> url -> link('account/pd/submit', '', 'SSL'); ?>" method="post" novalidate="novalidate">
											<div class="panel-body">
												<div class="form-group">
													<label class="col-md-3 control-label">Amount</label>
													<div class="col-md-9">
														<select class="form-control valid" id="amount" name="amount">
															<option value="">-- Choose your amount --</option>
															<option value="0.3">0.30000 BTC</option>
															<option value="0.5">0.50000 BTC</option>
															<option value="1.0">1.00000 BTC</option>
														</select>
														<span id="amount-error" class="field-validation-error" style="display: none;">
                                                            <span >The amount field is required.</span>
                                                        </span>
													</div>
												</div>
												<div class="form-group">
													<label class="col-md-3 control-label">Transaction Password</label>
													<div class="col-md-9">
														<input class="form-control" id="Password2" name="Password2" type="password"/>
														<span id="Password2-error" class="field-validation-error" style="display: none;">
                                                            <span >The transaction password field is required.</span>
                                                        </span>
													</div>
												</div>
												<div class="panel-footer text-right">
													<div class="loading"></div>
													<button type="submit" class="btn btn-primary" style="font-weight:700">
														Create PD
													</button>
												</div>
											</div>
										</form>
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