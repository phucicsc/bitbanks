<?php 
$self->document->setTitle('Pin Transfer History');
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
                                <a href="javascript:void(0)">Pin Transfer History</a>
                            </li>
                        </ol>
                        <div class="page-heading">
                            <h1>Pin Transfer History</h1>
                            <div class="options">
                                <div class="btn-toolbar">
                                    <a href="<?php echo $self->url->link('account/token/transfer', '', 'SSL'); ?>" class="btn btn-default"><i class="fa fa-fw fa-exchange "></i>Pin Transfer</a>
                                </div>
                            </div>
                        </div>
                        <div class="container-fluid">
                            <div class="row">
                            <?php if(count($history) > 0){ ?>
                                <div class="col-md-12">
                                    <div class="panel panel-default">                                        
                                        <div class="panel-body panel-no-padding">
                                            <div id="no-more-tables" class="panel-body panel-no-padding">
                                                <table id="example" class="table table-striped table-fixed-header table-hover" cellspacing="0" width="100%">
                                                    <thead>
                                                        <tr>
                                                            <th>TYPE</th>
                                                            <th>AMOUNT</th>
                                                            <th>SYSTEM DESCRIPTION</th>
                                                            <th>USER DESCRIPTION</th>
                                                            <th>DATE TIME</th>
                                                        </tr>
                                                    </thead>
                                                    <tbody>

                                                        <?php foreach ($history as $value => $key){ ?>
                                                            <tr>
                                                                <td data-title="TYPE" align="left"><?php echo $key['type'] ?></td>
                                                                <td data-title="AMOUNT" align="left">
                                                                    <strong class="amount"><?php echo $key['amount'] ?></strong>
                                                                </td>
                                                                <td data-title="SYSTEM DESCRIPTION" align="left"><?php echo $key['system_description'] ?></td>
                                                                <td data-title="USER DESCRIPTION" style="width:40%" align="left"><?php echo !$key['user_description'] ? '&nbsp;' : $key['user_description'] ?></td>
                                                                <td data-title="DATE TIME" align="left">
                                                                    <span class="title-date"><?php echo date("d/m/Y H:i A", strtotime($key['date_added'])); ?></span>
                                                                </td>
                                                            </tr>
                                                        <?php } ?>
                                                    </tbody>
                                                </table>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            <?php } ?>
                            </div>
                            <div class="row" style="margin-bottom:15px">
                                <div class="col-md-12">
                                    <?php echo $pagination; ?>
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