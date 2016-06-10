<div class="home_left col-sm-8">
<?php if($articles) { ?>
    <div class="form-group">
        <div >
            <div class="title_blog" style="text-align: left;">
               <i class="fa icon_new1"></i><?php echo $heading_title; ?>
            </div>
            <div >
                <?php if($articles) { 
                	$i = 1;
                ?>
                	<div class="blog_left col-sm-5">
        	    	<?php foreach ($articles as $article) { ?>
        	    		<?php if($i==1){?>
        	    		<div class="image text-center" >
                            <a href="<?php  echo $article['href']; ?>">
								<img src="<?php echo $article['image']; ?>" width="245px" height="auto"  alt="<?php echo $article['article_title']; ?>" title="<?php echo $article['article_title']; ?>" class="img-responsive " />
							</a>
                       	</div>
        	    		<div class="article-author">
        	    			<a href="<?php echo $article['href']; ?>"><?php echo $article['article_title']; ?></a>
        	    		</div>
        	    		
        	    		<?php if ($article['description']) { ?>
        					<div class="description"><?php echo $article['description']; ?></div>
        				<?php } ?>
        			
        				</div>
        				
        				<div class="blog_right col-sm-7">
        				<?php }else{?>
        					<div class="blog_right_content">
        					<div class="image text-center" style="float:left;margin-right:20px">
                            <a href="<?php  echo $article['href']; ?>">
								<img src="<?php echo $article['image']; ?>" width="90px" height="90px" alt="<?php echo $article['article_title']; ?>" title="<?php echo $article['article_title']; ?>" class="img-responsive " />
							</a>
	                       	</div>
	        	    		<div class="article-author">
	        	    			<a href="<?php echo $article['href']; ?>"><?php echo $article['article_title']; ?></a>
	        	    		</div>
	        	    		
	        	    		<?php if ($article['description']) { ?>
	        					<div class="description"><?php echo $article['description']; ?></div>
	        				<?php } ?>
	        				</div>
        			<?php } $i++;?>
        	    	<?php } ?>
        	    	</div>
        	    	<div class="clr"></div>
        	    	<div class="readmore"><a href="<?php echo $article_link;?>" ><i class="icon_readmore"></i>Xem thêm</a></div>
        	    <?php } else { ?>
        	    	<div class="buttons">
        	    		<div class="center"><?php echo $text_no_found; ?></div>
        	    	</div>
        	    <?php } ?> 
            </div>
        </div>
    </div>
<?php } ?>
</div>
<div class="home_right col-sm-4">
<?php if($articles_right) { ?>
<div class="title_blog" style="text-align: left;">
                <i class="fa icon_new1"></i>Sự kiện
</div>
<div >
<?php if($articles_right) { 
		$j = 1;
	?>
	<?php foreach ($articles_right as $article_right) { ?>
	<div class="article-title article-title<?php echo $j;?>">
		<div class="blog_index">0<?php echo $j;?></div>
    	 <a href="<?php echo $article_right['href']; ?>"><?php echo $article_right['article_title']; ?></a>
    </div>
    <div class="clr"></div>
	<?php $j++; }?>
	<div class="readmore"><a href="<?php echo $article_link_right;?>" class="readmore"><i class="icon_readmore"></i>Xem thêm</a></div>
<?php }?>
</div>
<?php }?>
</div>