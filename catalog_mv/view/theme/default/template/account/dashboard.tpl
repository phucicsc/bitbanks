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
                        <div class="page-heading pt10 pb10 mb0">
                            <h1>Dashboard</h1>
                        </div>
                        <div class="row">
                            <div class="col-md-3 col-sm-6 col-xs-6">
                                <a class="info-tile tile-dark home-info-title" href="javascript:;">
                                    <div class="tile-body">
                                        <div class="tile-image tile-image-c-wallet">
                                            <img src="catalog/view/theme/default/image/cwallet.png"/>
                                        </div>
                                        <div class="tile-footer">
                                            <div class="title pull-left">C - Wallet</div>
                                            <div class="content pull-right c-wallet" data-id="<?php echo $self->session -> data['customer_id'] ?>" data-link="<?php echo $self->url->link('account/dashboard/getCWallet', '', 'SSL'); ?>"></div>
                                        </div>
                                    </div>
                                </a>
                            </div>
                            <div class="col-md-3 col-sm-6 col-xs-6 col-xs-6">
                                <a class="info-tile tile-dark home-info-title" href="javascript:;">
                                    <div class="tile-body">
                                        <div class="tile-image tile-image-r-wallet">
                                            <img src="catalog/view/theme/default/image/rwallet.png"/>
                                        </div>
                                        <div class="tile-footer">
                                            <div class="title pull-left">R - Wallet</div>
                                            <div class="content pull-right r-wallet" data-id="<?php echo $self->session -> data['customer_id'] ?>" data-link="<?php echo $self->url->link('account/dashboard/getRWallet', '', 'SSL'); ?>"></div>
                                        </div>
                                    </div>
                                </a>
                            </div>
                            <div class="col-md-3 col-sm-6 col-xs-6">
                                <a class="info-tile tile-dark home-info-title" href="<?php echo $self->url->link('account/pd', '', 'SSL'); ?>">
                                    <div class="tile-body">
                                        <div class="tile-image tile-image-ph">
                                            <img src="catalog/view/theme/default/image/ph.png"/>
                                        </div>
                                        <div class="tile-footer">
                                            <div class="title pull-left">Provide Donation</div>
                                            <div class="content pull-right pd-count" data-id="<?php echo $self->session -> data['customer_id'] ?>" data-link="<?php echo $self->url->link('account/dashboard/countPD', '', 'SSL'); ?>"></div>
                                        </div>
                                    </div>
                                </a>
                            </div>
                            <div class="col-md-3 col-sm-6 col-xs-6">
                                <a class="info-tile tile-dark home-info-title" href="javascript:;">
                                    <div class="tile-body">
                                        <div class="tile-image tile-image-gh">
                                            <img src="catalog/view/theme/default/image/gh.png"/>
                                        </div>
                                        <div class="tile-footer">
                                            <div class="title pull-left">Get Donation</div>
                                            <div class="content pull-right">0</div>
                                        </div>
                                    </div>
                                </a>
                            </div>

                            <div class="col-md-3 col-sm-6 col-xs-6">
                                <a class="info-tile tile-dark home-info-title" href="<?php echo $self->url->link('account/getDonation', '', 'SSL'); ?>">
                                    <div class="tile-body">
                                        <div class="tile-image tile-image-manager-bonus">
                                            <img src="catalog/view/theme/default/image/managerbonus.png"/>
                                        </div>
                                        <div class="tile-footer">
                                            <div class="title pull-left">Manager Bonus</div>
                                            <div class="content pull-right">$0</div>
                                        </div>
                                    </div>
                                </a>
                            </div>

                            <div class="col-md-3 col-sm-6 col-xs-6">
                                <a class="info-tile tile-dark home-info-title" href="">
                                    <div class="tile-body">
                                        <div class="tile-image tile-image-sponsor-bonus">
                                            <img src="catalog/view/theme/default/image/sponsorbonus.png"/>
                                        </div>
                                        <div class="tile-footer">
                                            <div class="title pull-left">Sponsor Bonus</div>
                                            <div class="content pull-right">$0</div>
                                        </div>
                                    </div>
                                </a>
                            </div>
                            <div class="col-md-3 col-sm-6 col-xs-6">
                                <a class="info-tile tile-dark home-info-title" href="<?php echo $self->url->link('account/token', '', 'SSL'); ?>">
                                    <div class="tile-body">
                                        <div class="tile-image tile-image-pin-balance">
                                            <img src="catalog/view/theme/default/image/pinbalance.png"/>
                                        </div>
                                        <div class="tile-footer">
                                            <div class="title pull-left">Pin Balance</div>
                                            <div class="content pull-right pin-balence"  data-id="<?php echo $self->session -> data['customer_id'] ?>" data-link="<?php echo $self->url->link('account/dashboard/totalpin', '', 'SSL'); ?>"></div>
                                        </div>
                                    </div>
                                </a>
                            </div>
                            
                                                       
                            <div class="col-md-3 col-sm-6 col-xs-6">
                                <a class="info-tile tile-dark home-info-title" href="<?php echo $self->url->link('account/personal', '', 'SSL'); ?>">
                                    <div class="tile-body ">
                                        <div class="tile-image tile-image-downline-tree">
                                            <img src="catalog/view/theme/default/image/downlinetree.png"/>
                                        </div>
                                        <div class="tile-footer">
                                            <div class="title pull-left ">Downline Tree</div>
                                            <div class="content pull-right downline-tree" data-id="<?php echo $self->session -> data['customer_id'] ?>" data-link="<?php echo $self->url->link('account/dashboard/totaltree', '', 'SSL'); ?>"></div>
                                        </div>
                                    </div>
                                </a>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-6">
                                <div class="alert-success alert" style="padding:0px">
                                <h3>Downline tree analytics</h3>
                                <div style="padding:8px 14px;padding-top: 14px;">
                                    <table class="table table-bordered table-hover">
                                        <thead>
                                            <tr>
                                                <th width="50%">Level</th>
                                                <th width="50%">Total</th>
                                            </tr>
                                        </thead>
                                        <tbody>

                                            <?php for ($i=0; $i < 6; $i++) { ?>
                                               <tr>
                                                    <td><code>L<?php echo $i ?></code></td>
                                                    <td data-level="<?php echo $i + 1 ?>" data-id="<?php echo $self->session -> data['customer_id'] ?>" data-link="<?php echo $self->url->link('account/dashboard/analytics', '', 'SSL'); ?>" class="analytics-tree analytics-tree-loading"/>
                                                </tr>
                                            <?php } ?>
                                            
                                        </tbody>
                                    </table>
                                </div>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="alert-success alert aler-order" style="padding:0px; height:380px; color:#333;">
                                    <h3 class="heading">
                                        Buy pin for provide donation
                                    </h3>
                                    <div class="col-md-12 packet">
                                        <div>
                                            <input id="radio1" type="radio" name="btc" value="<?php echo number_format('0.019', 8, '.', ','); ?>" checked="checked" >
                                            <label for="radio1"><span><span></span></span>1 PIN = 0.019 BTC</label>
                                        </div>
                                       
                                        <div>
                                            <input id="radio3" type="radio" name="btc" value="<?php echo number_format('0.855', 8, '.', ','); ?>">
                                            <label for="radio3"><span><span></span></span>50 PIN = 0.855 BTC (10% discount)</label>
                                        </div>
                                        
                                         <div>
                                            <input id="radio10" type="radio" name="btc" value="<?php echo number_format('0.095', 8, '.', ','); ?>">
                                            <label for="radio10"><span><span></span></span>5 PIN = 0.095 BTC</label>
                                        </div>
                                        
                                        <div>
                                            <input id="radio4" type="radio" name="btc" value="<?php echo number_format('1.52', 8, '.', ','); ?>">
                                            <label for="radio4"><span><span></span></span>100 PIN = 1.52 BTC (20% discount)</label>
                                        </div>
                                        <div>
                                            <input id="radio2" type="radio" name="btc" value="<?php echo number_format('0.19', 8, '.', ','); ?>">
                                            <label for="radio2"><span><span></span></span>10 PIN = 0.19 BTC</label>
                                        </div>
                                       <div>
                                            <input id="radio5" type="radio" name="btc" value="<?php echo number_format('13.3', 8, '.', ','); ?>">
                                            <label for="radio5"><span><span></span></span>1000 PIN = 13,3 BTC (30% discount)</label>
                                        </div>
                                        
                                    </div>
                                    <div class="col-md-12 bitcion packet">
                                        <div class="form-group" style="width:60%">
                                            <label class="control-label" for="BitcoinWalletAddress">Bitcoin Wallet Address</label>
                                            <input readonly="true" class="form-control valid" type="text" value="<?php echo $self->config->get('config_wallet');?>">
                                            <br/>
                                            <div class="loading"></div>
                                            <button data-link="<?php echo $self->url->link('account/dashboard/buyPin', '', 'SSL'); ?>" type="button" class="btn btn-primary onsubmitBuye">Submit</button>
                                            <br/>
                                            <br/>
                                           Send <span id="btc"><?php echo number_format('0.019', 8, '.', ','); ?></span> BTC to above address.
                                        </div>
                                        <div class="form-group" style="text-align:center; width:40%" id="bitcion-img" data-value="https://chart.googleapis.com/chart?chs=170x170&chld=L|1&cht=qr&chl=bitcoin:155SQHTM427tw3j15QBRa1rKMmHprNRb3R?amount=">
                                            <img src="https://chart.googleapis.com/chart?chs=170x170&chld=L|1&cht=qr&chl=bitcoin:155SQHTM427tw3j15QBRa1rKMmHprNRb3R?amount=0.01900000">
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-12" style="margin-top:15px;">
                                <div class="alert-success alert" style="padding:0px;">
                                    <h3 class="heading">
                                        <i class="fa fa-bullhorn"></i>
                                        Announcement
                                    </h3>
                                     <div style="padding:8px 14px;padding-top: 14px;">
                                    <div class="media-body innerAnnounce">
                                        <?php foreach ($article_limit as $key => $value) { ?>
                                            <div class="readMore" data-url="/Home/Announcement?id=3">
                                                <h5>
                                                    <a href="#">
                                                        <?php echo ucwords(strtolower($value['article_title'] ))?>
                                                    </a>
                                                </h5>
                                                <p class="text-muted"><?php echo date("d/m/Y", strtotime($value['date_modified'])); ?></p>
                                                <p>
                                                    <?php echo html_entity_decode($value['description'], ENT_QUOTES, 'UTF-8')  ?>
                                                </p>
                                            </div>
                                        <?php  } ?>
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
<?php echo $self->load->controller('common/footer') ?>

