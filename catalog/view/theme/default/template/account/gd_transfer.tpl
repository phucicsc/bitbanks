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
                            <li class="active">
                                <a href="">Transfer</a>
                            </li>
                        </ol>
                        <div class="page-heading">
                            <h1>Transfer List </h1>
                        </div>

                            <div class="container-fluid">
                                <div class="row">
                                    <div class="col-md-12">
                                        <div class="panel panel-default">
                                            <div class="panel-body panel-no-padding">
                                             <div id="no-more-tables" class="panel-body panel-no-padding">
                                                <table class="table datatable table-striped">
                                                    <thead>
                                                        <tr>
                                                            <th>NO.</th>
                                                            <th>TRANSACTION</th>
                                                            <th>DATE</th>
                                                            <th>ACCOUNT TRANSFER</th>
                                                            <th>AMOUNT</th>
                                                            <th>PD STATUS</th>
                                                            <th>GD STATUS</th>
                                                            <th>TIME REMAIN</th>
                                                            <th></th>
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                  
                                                        <tr>
                                                            <td data-title="NO." >1</td>
                                                            <td data-title="TRANSACTION">TCsdfsad</td>
                                                            <td data-title="DATE">5/30/2016 6:20:25 PM</td>
                                                            <td data-title="ACCOUNT TRANSFER">7c1</td>
                                                            <td data-title="AMOUNT">0.75875000 BTC</td>
                                                            <td data-title="PD STATUS" class="status">
                                                                <span class="label label-default">Waitting</span>
                                                            </td>
                                                            <td data-title="GD STATUS" class="status">
                                                                <span class="label label-default">Waitting</span>
                                                            </td>
                                                            <td data-title="TIME REMAIN" class="countdown">
                                                            </td>
                                                            <td >
                                                                <a class="btn btn-sm btn-success" href="<?php echo $self -> url -> link('account/gd/confirm', '', 'SSL'); ?>">Info</a>
                                                            </td>
                                                        </tr>
                                                  
                                                    </tbody>
                                                </table>
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