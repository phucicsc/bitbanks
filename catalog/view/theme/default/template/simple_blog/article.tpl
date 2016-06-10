<?php echo $header; ?>
<div class="container">
    <?php /*?>
    <ul class="breadcrumb">
        <?php foreach ($breadcrumbs as $breadcrumb) { ?>
        <li>
            <a href="
                <?php echo $breadcrumb['href']; ?>">
                <?php echo $breadcrumb['text']; ?>
            </a>
        </li>
        <?php } ?>
    </ul>
    <?php */ ?>
    <div class="form-group">
        <?php echo $column_left; ?>
        <?php if ($column_left && $column_right) { ?>
        <?php $class = 'col-sm-6'; ?>
        <?php } elseif ($column_left || $column_right) { ?>
        <?php $class = 'col-sm-9'; ?>
        <?php } else { ?>
        <?php $class = 'col-sm-12'; ?>
        <?php } ?>
        <div id="content" class="
            <?php echo $class; ?>" >
            <?php echo $content_top; ?>
            <div class="row">
                <?php if($simple_blog_category_id == 4){?>
                <div style="margin-top:20px">
                    <?php foreach ($cat_child as $cat) {?>
                    <div class="col-sm-6 dmdt" >
                        <a href="
                            <?php echo $cat['href'];?>">
                            <p>
                                <?php echo $cat['name'];?>
                            </p>
                        </a>
                    </div>
                    <?php }?>
                </div>
                <?php }else{?>
                <?php if($articles) { 
                        if($simple_blog_category_id == 2){ ?>
                <div class="tab-blog" style="margin-top:10px">
                    <ul>
                        <?php foreach($articles as $article){ ?>
                        <li>
                            <a href="
                                <?php echo $article['href']; ?>" class="
                                <?php echo ($article['simple_blog_article_id'] == $simple_blog_article_id)? 'visited':''?>">
                                <?php echo ucwords($article['article_title']); ?>
                            </a>
                        </li>
                        <?php }?>
                    </ul>
                </div>
                <div class="title_page" style="margin-bottom:0px">
                    <label>
                        <?php echo ucwords($articles_gt['article_title']); ?>
                    </label>
                </div>
                <div class="conent-tab">
                    <?php echo html_entity_decode($articles_gt['description'], ENT_QUOTES, 'UTF-8');?>
                </div>
                <?php   }else{
                         foreach($articles as $article) { ?>
                <div class="form-group col-sm-6" style="margin-top:10px">
                    <div class="cat_article">
                        <div class="article-title">
                            <a href="
                                <?php echo $article['href']; ?>">
                                <?php echo ucwords($article['article_title']); ?>
                            </a>
                        </div>
                        <?php if($article['image']) { ?>
                        <?php if($article['featured_found']) { ?>
                        <div class="article-image" style="float:left;margin-right:10px">
                            <img src="
                                <?php echo $article['image']; ?>" width="200px" height="auto" alt="
                                <?php echo $article['article_title']; ?>" />
                            </div>
                            <?php } else { ?>
                            <div class="article-thumbnail-image">
                                <img src="
                                    <?php echo $article['image']; ?>" alt="
                                    <?php echo $article['article_title']; ?>" />
                                    <span class="article-description">
                                        <?php echo $article['description']; ?>
                                    </span>
                                </div>
                                <?php } ?>
                                <?php } ?>
                                <?php if($article['featured_found']) { ?>
                                <div class="article-description">
                                    <?php echo $article['description']; ?>
                                </div>
                                <?php } else { ?>
                                <div class="article-description">
                                    <?php echo $article['description']; ?>
                                </div>
                                <?php } ?>
                                <div align="right">
                                    <a class="btn btn-success btn-large" href="
                                        <?php echo $article['href']; ?>">
                                        <b>
                                            <?php echo $button_continue_reading; ?>
                                        </b>
                                    </a>
                                </div>
                            </div>
                            <?php if(!$article['featured_found']) { ?>
                            <div class="article-thumbnail-found"></div>
                            <?php } ?>
                        </div>
                        <?php } } ?>
                        <div class="clr"></div>
                        <div class="row">
                            <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12 text-left">
                                <?php echo $pagination; ?>
                            </div>
                        </div>
                        <?php } else { ?>
                        <h3 class="text-center">
                            <?php echo $text_no_found; ?>
                        </h3>
                        <?php } ?>
                        <?php }?>
                    </div>
                    <?php echo $content_bottom; ?>
                </div>
                <div class="col-sm-3"  style="margin-top:20px">
                    <?php echo $column_right; ?>
                </div>
            </div>
        </div>
        <?php echo $footer; ?>
        <script>
$(function() {
    $( "#tabs" ).tabs();
  });
  </script>