<?php 
$js = "$(document).ready(function(){";
?>

<fieldset style="margin-top:20px;">
	
	   <div class="personal_contain" >

	   

	<div class="tootbar-top">
		<ul>
	    	<li><a href="javascript:void(0)" onclick='click_node(<?php echo $id_customer; ?>)'><span>Trở lên đầu</span></a></li>
	    </ul>
	</div>

	<div class="clr"></div>
	<div class="personal-tree">
		<img src="view/image/ajax-loader-store.gif"  />
	</div>
		
	</div>

</fieldset>

<script>

(function($) {

jQuery.fn.show_tree = function(node) {	

		positon = node.iconCls.split(" "); 

		var line_class = positon[1]+'line '+'linefloor'+node.fl;

		var node_class = positon[1]+'_node '+'nodefloor'+node.fl;

		var html = '<div class=\''+line_class+'\'></div>';

   		html += '<div class=\''+node_class+'\'><a onclick=\'click_node('+node.id+')\' value=\''+node.id+'\' title=\''+node.name+' \'><img src=\'view/image/icon_level/'+positon[0]+'.jpg\' /></a>';

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

			"index.php?route=sale/customer/getInfoUser&token=<?php echo $token;?>&id="+node,

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


		$('.personal-tree').html('<img src="view/image/ajax-loader-store.gif"  />');

		$.ajax({

		  url: "index.php?route=sale/customer/"+method + "&token=<?php echo $token;?>",

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

	var top = jQuery('.personal-tree'+id+' > div a').eq(0).attr('value');

	jQuery(document).build_tree(top,'getJsonBinaryTreeUplevel');

}

function goto_bottom_left(id){

	jQuery(document).build_tree(id,'goBottomLeft');

}

function goto_bottom_right(id){

	jQuery(document).build_tree(id,'goBottomRight');

}

function goto_bottom_left_oftop(id){

	var top = jQuery('.personal-tree'+id+' > div a').eq(0).attr('value');

	jQuery(document).build_tree(top,'goBottomLeft');

}

function goto_bottom_right_oftop(id){

	var top = jQuery('.personal-tree'+id+' > div a').eq(0).attr('value');

	jQuery(document).build_tree(top,'goBottomRight');

}

jQuery(document).ready(function($) {
	click_node(<?php echo $id_customer;?>);

});


</script>           