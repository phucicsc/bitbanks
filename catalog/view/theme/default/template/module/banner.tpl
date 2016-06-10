<div id="banner<?php echo $module; ?>" class="banner_li">
 <ul>
  <?php foreach ($banners as $banner) { ?>
  <li class="item">
    <?php if ($banner['link']) { ?>
    <a href="<?php echo $banner['link']; ?>"><img src="<?php echo $banner['image']; ?>" alt="<?php echo $banner['title']; ?>" class="img-responsive" /></a>
    <?php } else { ?>
    <img src="<?php echo $banner['image']; ?>" alt="<?php echo $banner['title']; ?>" class="img-responsive" />
    <?php } ?>
  </li>
  <?php } ?>
 </ul>
</div>
