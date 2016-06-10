<div class="panel panel-default">
  <div class="panel-heading">
    <h3 class="panel-title"><i class="fa fa-bar-chart"></i> <?php echo $heading_title; ?></h3>
  </div>
  <ul class="list-group">
    <li class="list-group-item thongke" >Tổng số lượng hội viên: <?php echo $totalCustomers;?></li>
    <li class="list-group-item thongke">Tổng số lượng cộng tác phí: <?php echo number_format($totalCTP,0,'.',',');?></li>
  	<li class="list-group-item thongke">Tổng số lượng hội phí: <?php echo number_format($totalHP,0,'.',',');?></li>
    <li class="list-group-item thongke">Tổng số lượng hội viên mới tháng trước: <?php echo $totalNewLast;?></li>
    <li class="list-group-item thongke">Tổng số lượng hội viên mới tháng hiện tại: <?php echo $totalNew;?></li>
  	<li class="list-group-item thongke">Tổng số lượng hội viên bị off: <?php echo $totalCusOff;?></li>
  	<li class="list-group-item thongke">Tổng số người truy cập hôm qua: <?php echo $onlineYesterday;?></li>
  	<li class="list-group-item thongke">Tổng số người truy cập hiện tại: <?php echo $onlineToday;?></li>
  </ul>
</div>