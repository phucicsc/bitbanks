<?php
// Text
$_['text_home']            = 'Trang chủ';
$_['text_blog']            = 'Tin tức';
$_['text_error_art']       = 'Không có bài viết nào!';
$_['text_error_cat']       = 'Không tìm thấy danh mục tin!';


// Article & Category Info
$_['text_subcategory']     = 'Danh mục con';
$_['text_art_infoName']    = 'Posted by <span itemprop="author">%s</span>';
$_['text_art_infoCategory']= ' in <span itemprop="articleSection">%s</span>';
$_['text_art_InfoDate']    = ' on <span itemprop="dateCreated">%s</span>';
$_['text_update']          = 'Cập nhật gần đây nhất: ';
$_['text_tags']            = 'Tags: ';
$_['text_related']         = 'Bài viết liên quan: ';
$_['text_related_product'] = 'Sản phẩm liên quan: ';
$_['text_related_article'] = 'Bài viết liên quan đến sản phẩm';

// Comment
$_['text_comments']        = '%s Ý kiến';
$_['text_replies']         = '(%s Trả lời)';
$_['text_comment']         = 'Ý kiến';
$_['text_no_comment']      = 'Không có ý kiến nào';
$_['text_postComment']     = 'Đưa một ý kiến';
$_['text_postReply']       = 'Trả lời ý kiến';
$_['text_no_comments']     = 'No comment yet, be the first to comment!';
$_['text_note_publish']    = '(Chưa được quảng bá ra)';
$_['text_note_website']    = '(Site url with http://)';
$_['text_wait']            = 'Hãy đợi chút!';
$_['button_submit']        = 'Gửi đi';
$_['text_success']         = 'Cám ơn ý kiến của bạn.';
$_['text_approval']        = 'Ý kiến của bạn đã được gửi đến ban quản trị để được xét duyệt.';
$_['text_reply']           = 'Trả lời';
$_['text_cancel_reply']    = 'Hủy trả lời';

// Comment Entry
$_['entry_name']           = 'Họ và tên: ';
$_['entry_email']          = 'E-mail: ';
$_['entry_site']           = 'Website: ';
$_['entry_comment']        = 'Ý kiến: ';
$_['entry_captcha']        = 'Mã bảo mật: ';
$_['text_login_comment']   = 'Attention: You need to <a href="%s">logged in</a> to comment!';

//Mail Notification
$_['text_mail_subject']    = '[%s] Đăng ý kiến mới cho bài viết: "%s"';
$_['text_mail_greeting']   = 'New comments have been posted on <a href="%s" target="_blank" title="%s">%s</a> article.<br /><br />';
$_['text_mail_article']    = '<b>Bài viết:</b>';
$_['text_mail_article1']   = '<a href="%s" target="_blank" title="%s">%s</a>';
$_['text_mail_name']       = '<b>Tác giả:</b>';
$_['text_mail_mail']       = '<b>E-mail:</b>';
$_['text_mail_mail1']      = '<a href="mailto:%s">%s</a>';
$_['text_mail_url']        = '<b>Url:</b>';
$_['text_mail_url1']       = '<a href="%s" target="_blank" title="%s">%s</a><br />';
$_['text_mail_message']    = '<b>Comment:</b>';
$_['text_mail_footer']     = '<br /><br />You can see all comments on this post here:';
$_['text_mail_footer1']    = '<a href="%s" target="_blank" title="%s">%s</a><br /><br />';

// Search
$_['text_search_blog']     = 'Blog Search Result';
$_['text_search_result']   = 'There is no article that matches the search criteria.';
$_['text_search_more']     = 'more..';


// Error
$_['error_common']         = 'Warning: Please check required form bellow!';
$_['error_name']           = 'Name between 2 - 25 characters !';
$_['error_email']          = 'E-mail address not valid !';
$_['error_content']        = 'Comment must be between %s and %s characters!';
$_['error_captcha']        = 'Verification code does not match the image!';

$_['read_more']            = 'Read more..';
$_['day_short']            = array(1 => "Mon", 2 => "Tue", 3 => "Wed", 4 => "Thu", 5 => "Fri", 6 => "Sat",7 => "Sun");
$_['day_long']             = array(1 => "Monday", 2 => "Tuesday", 3 => "Wednesday", 4 => "Thursday", 5 => "Friday", 6 => "Saturday", 7 => "Sunday");
$_['month_short']          = array(1 => "Jan", 2 => "Feb", 3 => "Mar", 4 => "Apr", 5 => "May", 6 => "Jun", 7 => "Jul", 8 => "Aug", 9 => "Sep", 10 => "Oct", 11 => "Nov", 12 => "Dec");
$_['month_long']           = array(1 => "January", 2 => "February", 3 => "March", 4 => "April", 5 => "May", 6 => "June", 7 => "July", 8 => "August", 9 => "September", 10 => "October", 11 => "November", 12 => "December");

// Date Format
// %1 = long month, %2 = short month, %3 = long day, %4 = short day
// other format except the month and dayname above still use http://php.net/manual/en/function.date.php

$_['date_format']          = 'F d, Y';
$_['date_format_short']    = '%2 d, Y'; // M d, Y = Jun 10, 2013
$_['date_format_long']     = '%1 d, Y'; // F d, Y = Juni 10, 2013
$_['date_time_format']     = '%1 d, Y H:i'; // M d, Y H:i = Jun 10, 2013 17:25
?>