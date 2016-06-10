<?php echo $header; ?>
<div class="container">
    <div class="row">
        <?php echo $content_top; ?>
    </div>
</div>
<?php /*?>
<div class="bg_breadcrumb">
    <div class="container">
        <ul class="breadcrumb">
            <li class="br_home"></li>
            <?php foreach ($breadcrumbs as $breadcrumb) { ?>
            <li>
                <a href="<?php echo $breadcrumb['href']; ?>">
                    <?php echo $breadcrumb[ 'text']; ?>
                </a>
            </li>
            <?php } ?>
        </ul>
    </div>
</div>
<?php */?>
<div id="wordwrap">


    <div class="container">
        <div class="bg-content">
           
            <div class="row">
                <?php // echo $column_left; ?>
                <?php if ($column_right) { ?>
                <?php $class='col-sm-12' ; ?>
                <?php } else { ?>
                <?php $class='col-sm-12' ; ?>
                <?php } ?>
                <div id="content" class="<?php echo $class; ?> login-index">
                    <div class="row row_login">                        
                        <div class="col-md-9 col-login-index">
                              <div class="header-login-logo"></div>
                            <form action="<?php echo $action; ?>" method="post">
                                <div class="well w_login">
                                    <h2 class="text-center">Login</h2>
                                    <div class="input-group form-group">
                                        <span class="input-group-addon"><i class="fa fa-user"></i></span>
                                        <input type="text" name="email" value="<?php echo $email; ?>" placeholder="User name" id="input-email" class="form-control" />
                                    </div>
                                    <div class="input-group form-group">
                                        <span class="input-group-addon"><i class="fa fa-key"></i></span>
                                        <input type="password" name="password" value="<?php echo $password; ?>" placeholder="Password" id="input-password" class="form-control" />
                                    </div>
                                    <div class="input-group form-group">
                                        <span class="input-group-addon"><i class="fa fa-lock"></i></span>
                                        <input type="text" name="capcha" value="" placeholder="Insert capcha" id="capcha" maxlength="6" size="6" class="form-control"/>
                                        <img src="capcha_code.php"/>
                                    </div>
                                    <div class="input-group form-group">
                                        <input type="submit" value="Login" class="btn-login" />
                                    </div>
                                    <div class="input-group form-group">
                                        <a href="<?php echo $forgotten; ?>">Forgot your password</a>
                                    </div>

                                    <?php if ($redirect) { ?>
                                    <input type="hidden" name="redirect" value="<?php echo $redirect; ?>" />
                                    <?php } ?>
                                </div>
                                 <?php if ($success) { ?>
                                    <div class="alert alert-success"><i class="fa fa-check-circle"></i>
                                        <?php echo $success; ?>
                                    </div>
                                    <?php } ?>
                                    <?php if ($error_warning) { ?>
                                    <div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i>
                                        <?php echo $error_warning; ?>
                                    </div>
                                <?php } ?>
                            </form>
                        </div>
                    </div>
                    <?php echo $content_bottom; ?>
                </div>
                <?php // echo $column_right; ?>
            </div>

        </div>
    </div>
</div>
<?php echo $footer; ?>