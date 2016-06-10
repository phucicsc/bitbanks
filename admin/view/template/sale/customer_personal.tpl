<?php 
$js = "$(document).ready(function(){";
?>

<fieldset>
<legend>Introduced tree</legend>
   <div class="binary_content">

	<ul id="tt">
		<img src="view/image/ajax-loader-store.gif"  />
	</ul>
  </div>
	<?php 
		$js .=	"$('#tt').tree({

				dnd: true,

				lines: true,

				animate: true,

				url: 'index.php?route=sale/customer/getJsonPersonalTree&token=".$token."&id_customer=".intval($id_customer)."',
		
				onClick: function(node){
					$('#tt').html('Loading...');
					$('#tt').tree({
						dnd: true,

						lines: true,
		
						animate: true,
		
						url: 'index.php?route=sale/customer/getJsonPersonalTree&token=".$token."&id_customer='+node.id

					})

				} 

			});"
?>
</fieldset>


<?php 	$js .=	"});";
$noconflic = "if (jQuery) jQuery.noConflict();";
?>
<script type="text/javascript">

<?php echo $js;?>

</script>            