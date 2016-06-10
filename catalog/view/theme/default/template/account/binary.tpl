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
    <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
    <?php } ?>
  </ul>
 </div>
</div>
<?php */?>
<div class="container" >

  <div class="row">
  <column id="column-left" class="col-sm-3 ">
  <?php echo $column_left; ?>
  </column>
    <?php if ($column_left && $column_right) { ?>
    <?php $class = 'col-sm-8'; ?>
    <?php } elseif ($column_left || $column_right) { ?>
    <?php $class = 'col-sm-9'; ?>
    <?php } else { ?>
    <?php $class = 'col-sm-12'; ?>
    <?php } ?>
    <div id="content" class="<?php echo $class; ?> content_border">

      <div class="title_page">
      <label><?php echo $heading_title; ?></label>
      </div>
   <div class="binary_content">
<div class="personal_contain" >

    <div class="personal">

      <div class="info-personal">
      <label style="color:#015cb7;font-weight: bold;">Màu xanh:</label> là hội viên bình thường <br><label style="color:#d0a522;font-weight: bold;">Màu vàng:</label> là hội viên bị OFF <br> <label style="color:#ab3738;font-weight: bold;">Màu đỏ:</label> là hội viên mới trong tháng hiện tại <br>
       Tài khoản: <span id="ajax_firstname"></span>  <br>Điện thoại: <span id="ajax_telephone"></span></div>

    </div>

    <div class="personal-left">

		Tổng số tầng: <span id="ajax_floor">0</span> <br>
    	Tổng hội viên: <span id="ajax_total">0</span><br> 


    <div class="clr"></div>
</div>

<div style="clear:both;"></div>

<div class="tootbar-top">
	<ul>
    	<li><a href="javascript:void(0)" onclick='click_node(<?php echo intval($customer_id); ?>)'><span>Trở lên đầu</span></a></li>
    </ul>
</div>
<div class="clr"></div>
<div class="personal-tree">
	<img src="<?php echo $base.'image/ajax-loader-store.gif'; ?>"  />
</div>
	
</div>
  </div>
      <?php echo $content_bottom; ?></div>
      <column id="column-right" class="col-sm-2 hidden-xs">
    	<?php echo $column_right; ?>
      </column>
    </div>
</div>
<?php echo $footer; ?>

<script>

(function($) {

jQuery.fn.show_tree = function(node) {	

		positon = node.iconCls.split(" "); 

		var line_class = positon[1]+'line '+'linefloor'+node.fl;

		var node_class = positon[1]+'_node '+'nodefloor'+node.fl;

		var html = '<div class=\''+line_class+'\'></div>';

   		html += '<div class=\''+node_class+'\'><a onclick=\'click_node('+node.id+')\' value=\''+node.id+'\' title=\''+node.name+' - Cấp bậc('+node.level_user+')\'><img src=\'images/icon_level/'+positon[0]+'.jpg\' /></a>';

   		html += '<div id=\''+node.id+'\' ></div>';

		html += '</div>';

		$(this).append(html);

		var i=0;

		//alert(node.id+' va '+node.children.length+' va '+i);

		$.each( node.children, function( key, value ) {

			i++;

			//alert(node.id+' va '+i);

			if(typeof(value.id)  != "undefined"){				

				$('#'+node.id).show_tree(value);

			}else{

				if(i==1 && node.children !=1){

				}else if(i==2&& node.children !=1){

				}

			}

		});

};


jQuery.fn.show_infomation = function(node) {	

	$.getJSON(

			"<?php echo $base;?>"+"index.php?route=account/binary/getInfoUser&id="+node,

	  function(data){

		$(this).find('dd').html('');		  

		  if(data.id !=0){

		  	$.each(data, function (k,v){

				$('#ajax_'+k).html(v);

			});			

		  }

		}
	);

};

// xay dung cay voi id truyen vo

jQuery.fn.build_tree = function(id, method) {		

		if(typeof(id)  == "undefined")

		$('.personal-tree').html('<img src="<?php echo $base.'image/ajax-loader-store.gif'; ?>"  />');

		$.ajax({

		  url: "<?php echo $base;?>"+'index.php?route=account/binary/'+method,

		  dataType: 'json',

		  data: {id : id},

		  success: function(json_data){

			  var rootnode = json_data[0];

			   $('.personal-tree').html('');

			   $('.personal-tree').show_tree(rootnode);

			   $('.personal_contain').show_infomation(rootnode.id);

			   $('#current_top').html("Goto "+rootnode.name + "\'s");

			}

		});	

};

})(jQuery);

function click_node(id){

	jQuery(document).build_tree(id,'getJsonBinaryTree');

}

function upto_level(id){

	var top = jQuery('.personal-tree > div a').eq(0).attr('value');

	jQuery(document).build_tree(top,'getJsonBinaryTreeUplevel');

}

function goto_bottom_left(){

	jQuery(document).build_tree(<?php echo intval($customer_id); ?>,'goBottomLeft');

}

function goto_bottom_right(){

	jQuery(document).build_tree(<?php echo intval($customer_id); ?>,'goBottomRight');

}

function goto_bottom_left_oftop(){

	var top = jQuery('.personal-tree > div a').eq(0).attr('value');

	jQuery(document).build_tree(top,'goBottomLeft');

}

function goto_bottom_right_oftop(){

	var top = jQuery('.personal-tree > div a').eq(0).attr('value');

	jQuery(document).build_tree(top,'goBottomRight');

}

jQuery(document).ready(function($) {

	click_node(<?php echo intval($customer_id); ?>);

});


</script>