<?php
$self -> document -> setTitle('Get Donation');
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
								<a href="#">Get Donation List</a>
							</li>
						</ol>
						<div class="page-heading">
							<h1>Get Donation List</h1>
							<div class="options">
								<div class="btn-toolbar">
									<a href="<?php echo $self -> url -> link('account/gd/create', '', 'SSL'); ?>" class="btn btn-default"><i class="fa fa-fw fa-plus"></i>Create Get Donation</a>
								</div>
							</div>
						</div>
						<?php if(count($gds) > 0) { ?>
						<div class="container-fluid">
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
														<td data-title="AMOUNT"><?php echo number_format($key['amount'], 8, '.', ','); ?> BTC</td>
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
														<td data-title="TRANSFER LIST"">
														<a href="<?php echo intval($key['status']) !== 0 ? $self -> url -> link('account/gd/transfer', 'token='.$key["id"].'', 'SSL') : 'javascript:;' ?>">Transfer list</a>
														</td>
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
						<?php } ?>
					</div>
					<!-- #page-content -->
				</div>
			</div>
		</div>
	</div>
</div>