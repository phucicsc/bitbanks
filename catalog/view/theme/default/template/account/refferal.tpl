<?php 
$self->document->setTitle('Dashboard');
echo $self->load->controller('common/header'); echo $self->load->controller('common/column_left');
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
                            <li>
                            	>
                            </li>
                            <li>
                                <a href="<?php echo $self->url->link('account/setting', '', 'SSL'); ?>">Account</a>
                            </li>
                            <li>
                            	>
                            </li>
                            <li class="active">
                                <a href="#">Referral(s)</a>
                            </li>
                        </ol>
                        <div class="page-heading">
                            <div class="options">
                                <div class="btn-toolbar">
                                    <a href="<?php echo $self->url->link('account/register', '', 'SSL'); ?>" class="btn btn-success">
                                        <i class="fa fa-fw fa-plus"></i> Register New Member
                                    </a>
                                </div>
                            </div>
                        </div>
                        <div class="container-fluid">
                            <div class="row">
                                <div class="col-md-12">
                                    <div class="panel panel-default">
                                        <div id="no-more-tables" class=" panel-body panel-no-padding">
                                            <table id="example" class="table table-striped table-bordered" cellspacing="0" width="100%">
                                                <thead>
                                                    <tr>
                                                        <th class="text-center">NO.</th>
                                                        <th>USERNAME</th>
                                                        <th>LEVEL</th>
                                                        <th>DOWNLINE TREE STATISTICS</th>
                                                        <th>EMAIL</th>
                                                        <th>DATE CREATED</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <?php $count = 1; foreach ($refferals as $key => $value) { ?>
                                                       <tr>
                                                        <td data-title="NO." align="center"><?php echo $count ?></td>
                                                        <td data-title="USERNAME"><?php echo $value['username'] ?></td>
                                                        <td data-title="LEVEL">
                                                            <?php echo "L".(intval($value['level']) - 1) ?>
                                                        </td>
                                                        <td data-title="DOWNLINE TREE STATISTICS" class="static-parent" data-link="<?php echo $self->url->link('account/refferal/getlevel', '', 'SSL'); ?>" >
                                                        <!-- static-tree -->
                                                            <div data-parent-id="<?php echo $value['customer_id'] ?>" class="static-tree">
                                                                <?php for ($i=0; $i < 6; $i++) { ?>
                                                                    L<?php echo $i ?>(<span class="z-<?php echo $i ?>"></span>) <?php echo $i < 5 ? '-' : '' ?>
                                                                <?php } ?>
                                                            </div>
                                                        </td>
                                                        <td data-title="EMAIL"><?php echo $value['email'] !== '' ? $value['email']  : '&nbsp;' ?></td>
                                                        <td data-title="DATE CREATED"><?php echo date("d/m/Y H:i A", strtotime($value['date_added'])); ?></td>
                                                    </tr>
                                                    <?php $count++; } ?>
                                                    
                                                </tbody>
                                            </table>

                                            
                                            <div class="panel-footer">
                                                <div class="row">
                                                    <div class="col-md-12">
                                                        <?php echo $pagination ?>
                                                    </div>
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