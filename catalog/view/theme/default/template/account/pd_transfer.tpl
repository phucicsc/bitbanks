<?php
	$self -> document -> setTitle('Transfer List');
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
                                <a href="">Transfer</a>
                            </li>
                        </ol>
                        <div class="page-heading">
                            <h1>Transfer List</h1>
                        </div>
                        <?php if ($transferList) { ?>
                            <div class="container-fluid">
                                <div class="row">
                                    <div class="col-md-12">
                                        <div class="panel panel-default">
                                            <div id="no-more-tables" class="panel-body panel-no-padding">
                                                <table class="table datatable table-striped table-fixed-header" style="border-bottom: 0 !important">
                                                    <thead>
                                                        <tr>
                                                            <th>NO.</th>
                                                            <th>TRANSACTION</th>
                                                            <th>DATE</th>
                                                            <th>ACCOUNT RECEIVED</th>
                                                            <th>AMOUNT</th>
                                                            <th>PD STATUS</th>
                                                            <th>GD STATUS</th>
                                                            <th>TIME REMAIN</th>
                                                            <th>CONFIRM</th>
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                        <tr>
                                                        <?php foreach ($transferList as $key => $value) { ?>
                                                            <td data-title="NO.">1</td>
                                                            <td data-title="TRANSACTION">TC<?php echo $value['transfer_code']  ?></td>
                                                            <td data-title="DATE"><?php echo date("d/m/Y H:i A", strtotime($value['date_added'])); ?></td>
                                                            <td data-title="ACCOUNT RECEIVED"><?php echo $value['username'] ?></td>
                                                            <td data-title="AMOUNT"><?php echo number_format($value['amount'], 8, '.', ','); ?> BTC</td>
                                                            <td data-title="PD STATUS" class="status">
                                                            <?php
                                                                switch (intval($value['pd_satatus'])) {
                                                                    case 0:
                                                                        echo '<span class="label label-inverse">Waitting</span>';
                                                                        break;
                                                                    case 1:
                                                                        echo '<span class="label label-success">Finished</span>';
                                                                        break;
                                                                }
                                                            ?>
                                                            </td>
                                                            <td data-title="GD STATUS" class="status">
                                                            <?php
                                                                switch (intval($value['gd_status'])) {
                                                                    case 0:
                                                                        echo '<span class="label label-inverse">Waitting</span>';
                                                                        break;
                                                                    case 1:
                                                                        echo '<span class="label label-success">Finished</span>';
                                                                        break;
                                                                }
                                                            ?>
                                                            </td>
                                                            <td data-title="TIME REMAIN" class="countdown" data-countdown="<?php echo $value['date_finish'] ?>">
                                                            </td>
                                                            <td>
                                                                <a md-ink-ripple="" class="btn btn-sm btn-success" href="<?php echo $self -> url -> link('account/pd/confirm', 'token='.$value['id'].'', 'SSL'); ?>">Confirm</a>
                                                            </td>
                                                        </tr>
                                                        <?php } ?>
                                                    </tbody>
                                                </table>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        <?php }?>
                    </div>
                    <!-- #page-content -->
                </div>
            </div>
        </div>
    </div>
</div>