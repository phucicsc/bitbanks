<?php
#####################################################################################
#  Module Total Import PRO for Opencart 1.5.x From HostJars opencart.hostjars.com 	#
#####################################################################################

// Heading
$_['heading_title']    	= 'Import sản phẩm tổng thể';

// Tabs
$_['tab_fetch'] 		= 'Step 1: Fetch Feed File';
$_['tab_global'] 		= 'Step 2: Thiết lập cấu hình';
$_['tab_adjust'] 		= 'Step 3: Tùy chỉnh Dữ liệu Import';
$_['tab_mapping'] 		= 'Step 4: Thiết lập sơ đồ các trường dữ liệu';
$_['tab_import'] 		= 'Step 5: Import';

// Text
$_['text_add']     					= 'Thêm';
$_['text_reset']     				= 'Reset';
$_['text_update']     				= 'Thêm/Cập nhật';
$_['text_adjust_help']     			= 'If you need to adjust any data from your feed before importing it you can use the Operations below on the fields in your database. You can also leave this screen open and use phpmyadmin to directly adjust the database table hj_import and then return here to complete the import.';
$_['text_operation']     			= 'Operation';
$_['text_operation_field_name'] 	= 'Field';
$_['text_operation_data'] 			= 'Data';
$_['text_sample'] 					= 'Feed Sample';
$_['text_select_operation']			= '-- Select operation --';
$_['text_select']					= '-- Lựa chọn --';
$_['text_operation_type']			= 'Operation Type';
$_['text_operation_desc']			= 'Mô tả';
$_['text_most_popular']				= 'Phổ biến nhất';
$_['text_advanced']					= 'Cao cấp';
$_['text_more']						= 'Chi tiết';


// Entry
$_['entry_import_file']     		= 'Import Feed File:';
$_['entry_feed_source']				= 'Nguồn Feed:';
$_['entry_file_upload']				= 'File Upload';
$_['entry_file_system']				= 'Hệ thống Files';
$_['entry_feed_format']     		= 'Dịnh dạng file Feed:';
$_['entry_max_file_size']     		= 'Dung lượng tối đa: %d mb';
$_['entry_import_url']    	 		= 'Import Feed URL:';
$_['entry_import_ftp'] 				= 'Import Feed FTP:';
$_['entry_ftp_server'] 				= 'Cấu hình FTP Server:';
$_['entry_ftp_user'] 				= 'Username:';
$_['entry_ftp_pass'] 				= 'Password:';
$_['entry_ftp_path'] 				= 'Absolute path to file:';
$_['entry_import_filepath']    		= 'Import Feed Local File Path:';
$_['entry_xml_product_tag']     	= 'XML Product Tag:';
$_['entry_delimiter']  				= 'CSV Field Delimiter:';
$_['entry_data_feed']  				= 'CSV Data Feed:';
$_['entry_out_of_stock']  			= 'Out of stock status:';
$_['entry_weight_class']  			= 'Weight Class:';
$_['entry_length_class']  			= 'Length Class:';
$_['entry_customer_group']  		= 'Nhóm khách hàng:';
$_['entry_tax_class']  				= 'Tax Class:';
$_['entry_subtract_stock']  		= 'Subtract Stock:';
$_['entry_requires_shipping']  		= 'Requires Shipping:';
$_['entry_minimum_quantity'] 	 	= 'Số lượng tối thiểu:';
$_['entry_product_status']  		= 'Trạng thái sản phẩm:';
$_['entry_language']  				= 'Ngôn ngữ:';
$_['entry_store']  	   				= 'Cửa hàng:';
$_['entry_remote_images']  	   		= 'Download Remote Images:';
$_['entry_remote_images_warning']  	= 'Warning: This will probably timeout for product feeds larger than around 500 products.';
$_['entry_image_subfolder']	   		= 'Image Subfolder:';
$_['entry_ignore_fields'] 			= 'Skip Products Where:';
$_['entry_field_mapping']			= 'Field Mapping:';
$_['entry_import_type']				= 'Import Type:';
$_['entry_price_multiplier']		= 'Price Multiplier:';
$_['entry_image_remove']			= 'Image Remove Text:';
$_['entry_image_prepend']			= 'Image Prepend Text:';
$_['entry_image_append']			= 'Image Append Text:';
$_['entry_split_category']			= 'Category Delimiter:';
$_['entry_top_categories']			= 'Add Categories to Top Bar:';
$_['entry_bottom_category_only']	= 'Add Products to:';
$_['entry_new_items'] 				= 'New Items:';
$_['entry_existing_items'] 			= 'Existing Items:';
$_['entry_delete_diff'] 			= 'Items in store but not in file:';
$_['entry_reset'] 					= 'Empty store before import:';
$_['entry_file_encoding']     		= 'File Encoding:';
$_['entry_first_row_is_headings']	= 'First Row Is Headings:';
$_['entry_use_safe_headings']		= 'Use Safe Headings:';
$_['entry_use_safe_headings_help']	= 'ignore the feed\'s headings';
$_['entry_unzip_feed']				= 'Unzip Feed:';
$_['entry_file_encoding']			= 'File Encoding:';
$_['entry_file_encoding_help']		= 'If you are unsure, use UTF-8:';
$_['entry_required']				= 'Required';
$_['entry_advanced']				= 'Advanced (optional settings)';
$_['entry_yes']						= 'Yes';
$_['entry_no']						= 'No';
$_['entry_all_categories']			= 'Tất cả danh mục';
$_['entry_bottom_category_only']	= 'Chỉ có danh mục đáy';
$_['entry_none'] 					= 'None';
$_['entry_add'] 					= 'Thêm vào';
$_['entry_skip'] 					= 'Bỏ qua';
$_['entry_update'] 					= 'Cập nhật';
$_['entry_ignore'] 					= 'Ignore';
$_['entry_delete'] 					= 'Xóa';
$_['entry_disable'] 				= 'Disable';
$_['entry_zero_quantity']			= 'Quantity to Zero';
$_['entry_import_range'] 			= 'Items to Import:';
$_['entry_to'] 						= 'đến';
$_['entry_from'] 					= 'Từ sản phẩm';
$_['entry_import_range_help']		= 'Import only part of your product feed eg: From 1 to 100 will import the first 100 items in your file';
$_['entry_range'] 					= 'Range';
$_['entry_all'] 					= 'Tất cả';


// Fields
$_['text_field_oc_title']	 		= 'OpenCart Field';
$_['text_field_feed_title']	 		= 'Feed Field';
$_['text_field_name']     			= 'Tên sp';
$_['text_field_price']     			= 'Giá';
$_['text_field_special_price']     	= 'Giá khuyến mại';
$_['text_field_discount_price']    	= 'Giá đã giảm';
$_['text_field_model']    	 		= 'Mã sản phẩm';
$_['text_field_sku']     			= 'SKU';
$_['text_field_upc']     			= 'UPC';
$_['text_field_ean']     			= 'EAN';
$_['text_field_jan']     			= 'JAN';
$_['text_field_isbn']     			= 'ISBN';
$_['text_field_mpn']     			= 'MPN';
$_['text_field_isbn13']     		= 'ISBN-13';
$_['text_field_author']     		= 'Tác giả';
$_['text_field_translator']       	= 'Dịch giả:';
$_['text_field_binding']            = 'Trình bày bìa:';
$_['text_field_publishingdate']     = 'Ngày xuất bản:';
$_['text_field_numberofpages']      = 'Số trang:';
$_['text_field_booklanguage']       = 'Ngôn ngữ:';
$_['text_field_madein']         	= 'Xuất xứ:';
$_['text_field_material']        	= 'Chất liệu:';
$_['text_field_points']     		= 'Điểm thưởng';
$_['text_field_manufacturer']     	= 'Nhà xuất bản';
$_['text_field_attribute']     		= 'Attribute';
$_['text_field_category']     		= 'Danh mục';
$_['text_field_quantity']     		= 'Số lượng';
$_['text_field_image']     			= 'Hình ảnh';
$_['text_field_additional_image']   = 'Hình ảnh thêm';
$_['text_field_description']     	= 'Mô tả sản phẩm';
$_['text_field_meta_desc']     		= 'Mô tả từ khóa';
$_['text_field_meta_keyw']     		= 'Từ khóa Meta';
$_['text_field_weight']     		= 'Trọng lượng';
$_['text_field_length']     		= 'Chiều dài';
$_['text_field_height']     		= 'Chiều cao';
$_['text_field_width']     			= 'Chiều rộng';
$_['text_field_location']    	 	= 'Location';
$_['text_field_keyword']     		= 'Từ khóa SEO';
$_['text_field_tags']     			= 'Tags sản phẩm';
$_['text_field_sort_order']			= 'Sắp thứ tự';
$_['text_field_option']				= 'Tùy chọn';
$_['text_field_reward']				= 'Điểm thưởng';
$_['text_field_product_related']	= 'Sản phẩm liên quan';
$_['text_field_subtract_stock']		= 'Trạng thái kho';
$_['text_field_requires_shipping']	= 'Yêu cầu vận chuyển';
$_['text_field_minimum_quantity']	= 'Số lượng tối thiểu';
$_['text_field_product_status']		= 'Trạng thái sản phẩm';
$_['text_field_product_reward_group'] = 'Nhóm thưởng';
$_['text_field_layout']				= 'Giao diện';
$_['text_field_download']			= 'Download';
$_['text_mapping_description']		= 'The OpenCart field column contains the name of the field in OpenCart, the Feed Field is where you must enter the heading name of the column that you want to import to each OpenCart field. You can set each field to "None" if you do not have anything to import there. None of the fields are required, but the more you can provide the better your import will be.';
$_['text_feed_sample'] 				= 'Sample From Your Feed';
$_['text_save_profile'] 			= 'Enter a name to save a new settings profile: ';
$_['text_identify_existing'] 		= 'Identify Existing Products by Matching Field: ';
$_['text_documentation'] 			= 'Documentation';

// Import
$_['button_fetch']	   			= 'Fetch';
$_['button_import']	   			= 'Import';
$_['button_next']	   			= 'Save &amp; Continue';
$_['button_skip']	   			= 'Bỏ qua';
$_['button_save'] 	   			= 'Lưu';
$_['button_cancel']	   			= 'Hủy';
$_['button_add_operation']	   	= 'Add Adjustment';
$_['button_add_operation']	   	= 'Thực hiện lưu';


// Success
$_['text_success_step1']   		= 'Success: Feed fetched and parsed. Ready for import: %s;';
$_['text_success_step1_csv']    = ' Invalid CSV rows: %s';
$_['text_success_step2']     	= 'Success: Global Settings saved.';
$_['text_success_step3']     	= 'Success: Operations saved.';
$_['text_success_step4']     	= 'Success: Mappings saved.';
$_['text_success_step5']     	= 'Success: Added %s products, Updated %s products';
$_['text_success']     			= 'Success: Settings Saved';

// Error
$_['error_permission'] 			= 'Warning: You do not have permission to modify total import!';
$_['error_empty']      			= 'Warning: No file or empty file!';
$_['error_mac_csv']      		= 'Warning: CSV file contains only one line: If you create your CSV file with Mac you need to save it as "CSV (Windows)"!';
$_['error_wrong_delimiter']    	= 'Warning: The delimiter you have chosen does not seem to be correct!';
$_['error_csv_heading'] 		= "Warning: Your headings are not suitable for direct usage please check every column has a %s heading, or use Safe Headings!";
$_['error_xml_product_tag']		= 'Warning: You must specify a Product Tag for XML files!';
$_['error_xml_format']			= 'Warning: XML format error - please fix your XML file!';
$_['error_no_db'] 				= 'Warning: Step 1 must be completed correctly before proceeding!';
$_['error_upload_exceeds_dir']		= 'The uploaded file exceeds the upload_max_filesize directive in php.ini';
$_['error_upload_exceeds_max'] 		= 'The uploaded file exceeds the MAX_FILE_SIZE directive that was specified in the HTML form';
$_['error_upload_partial']			= 'The uploaded file was only partially uploaded';
$_['error_upload_no_file'] 			= 'No file was uploaded';
$_['error_upload_missing'] 			= 'Missing a temporary folder';
$_['error_upload_failed_to_write'] 	= 'Failed to write file to disk';
$_['error_upload_stopped'] 			= 'File upload stopped by extension';
$_['error_timeout_reached']			= 'Your import did not complete as your server\'s maximum execution of %ss was insufficient. <a alt="How do I fix this?" href="http://helpdesk.hostjars.com/entries/21903992-Fatal-error-Maximum-execution-time-of-30-seconds-exceeded">How do I fix this?</a>';


// Operations Text
$_['operation_multiply_price']			= 'Adjust Price (Multiply)';
$_['operation_multiply']				= 'Multiply';
$_['operation_by']						= 'by';
$_['operation_add_price']				= 'Adjust Price (Add)';
$_['operation_add']						= 'Add';
$_['operation_to']						= 'to';
$_['operation_split_fields_category']	= 'Split Category on Delimiter';
$_['operation_split']					= 'Split';
$_['operation_on']						= 'on';
$_['operation_append_image']			= 'Append Text to Image';
$_['operation_append']					= 'Append';
$_['operation_after']					= 'after';
$_['operation_prepend_image']			= 'Prepend Text to Image';
$_['operation_prepend']					= 'Prepend';
$_['operation_append_text']				= 'Append Text to Any Field';
$_['operation_prepend_text']			= 'Prepend Text to Any Field';
$_['operation_multiply_field']			= 'Multiply any Field';
$_['operation_add_field']				= 'Add to any Field';
$_['operation_split_fields']			= 'Split Any Field';
$_['operation_replace_text']			= 'Replace Text';
$_['operation_replace']					= 'Replace';
$_['operation_with']					= 'with';
$_['operation_in']						= 'in';
$_['operation_remove_text']				= 'Remove Text';
$_['operation_remove']					= 'Remove';
$_['operation_delete_row_equals']		= 'Filter Products (equals)';
$_['operation_delete_row_not_equal']	= 'Filter Products (not equals)';
$_['operation_delete_row_containing']	= 'Filter Products (containing)';
$_['operation_delete_row_not_containing']	= 'Filter Products (not containing)';
$_['operation_exclude_products']		= 'Exclude products where';
$_['operation_equals']					= 'equals';
$_['operation_does_not_equal']			= 'does not equal';
$_['operation_contains']				= 'contains';
$_['operation_does_not_contain']		= 'does not contain';
$_['operation_duplicate_feed']			= 'Clone field';
$_['operation_duplicate']				= 'Duplicate';
$_['operation_merge_columns']			= 'Append Field to Field';
$_['operation_separated_by']			= 'phân cách nhau bởi';
$_['operation_merge_rows']				= 'Merge multi-row products';
$_['operation_common_field']			= 'Common field';
$_['operation_merge_the_following']		= 'Merge the following fields';
$_['operation_replace_newlines']		= 'Convert Newlines to HTML';

//Operations Labels
$_['operation_label_most_popular']	= 'SP phổ biến nhất';
$_['operation_label_advanced']	= 'Advanced';

?>