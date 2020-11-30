<?php

return [

    'backend' => [
        'all' => 'All',
        'active' => 'Active',
        'inactive' => ' InActive',
        'role' => [
            'fields' => [
                'title' => 'Title',
                'title_helper' => '',
                'permissions' => 'Permissions',
                'permissions_helper' => '',
                'selectall' => 'Select all',
                'deselectall' => 'Deselect all',
                'created_at' => 'Created at',
                'created_at_helper' => '',
                'updated_at' => 'Updated at',
                'updated_at_helper' => '',
                'deleted_at' => 'Deleted at',
                'deleted_at_helper' => '',
            ],
        ],
        'order_validate' => 'No Orders Validate Found!',
        'order_unvalidate' => 'No Order Unvalidate Found!',
        'ordervalidate' => [
            'order_id' => 'Order ID',
            'product' => 'Product',
            'price' => 'Price',
            'message' => 'Message',
            'name' => 'Name',
            'bank_acc_no' => 'Bank Account',
        ],
        'reportspam' => [
            'fields' => [
                'title' => 'Title',
                'product' => 'Products',
                'reported_to' => 'Reported By',
                'report' => 'Report',
                'status' => 'Status',
                'created_at' => 'Created At',
                'updated_at' => 'UpdatedAt',
            ],
        ],
        'emailtemplates' => [
            'active' => 'Active',
            'inactive' => 'Inactive',
            'title' => 'Email Templates',
            'title_singular' => 'Email Template',
            'fields' => [
                'title' => 'Title',
                'type' => 'Email Template Type',
                'placeholder' => 'Placeholder',
                'subject' => 'Subject',
                'body' => 'Body',
                'status' => 'Status',
                'createdat' => 'Created At',
                'updatedat' => 'Updated At',
            ],
        ],
        'permission' => [
            'fields' => [
                'title' => 'Title',
                'title_helper' => '',
                'created_at' => 'Created at',
                'created_at_helper' => '',
                'updated_at' => 'Updated at',
                'updated_at_helper' => '',
                'deleted_at' => 'Deleted at',
                'deleted_at_helper' => '',
            ],
        ],
        'user' => [
            'profile' => [
                'change_password' => 'Change password',
                'current_password' => 'Current password',
                'new_password' => 'New password',
                'confirm_password' => 'Confirm password',
            ],
            'fields' => [
                'id' => 'ID',
                'id_helper' => '',
                'name' => 'Name',
                'fname' => 'First Name',
                'last_name' => 'Last Name',
                'name_helper' => '',
                'email' => 'Email',
                'email_helper' => '',
                'email_verified_at' => 'Email verified at',
                'email_verified_at_helper' => '',
                'password' => 'Password',
                'password_helper' => '',
                'roles' => 'Roles',
                'roles_helper' => '',
                'selectall' => 'Select all',
                'deselectall' => 'Deselect all',
                'remember_token' => 'Remember Token',
                'remember_token_helper' => '',
                'status' => 'Status',
                'created_at' => 'Created at',
                'created_at_helper' => '',
                'updated_at' => 'Updated at',
                'updated_at_helper' => '',
                'deleted_at' => 'Deleted at',
                'deleted_at_helper' => '',
            ],
        ],
        'product' => [
            'fields' => [
                'category' => 'Category',
                'select_category' => 'Select Category',
                'subcategory' => 'SubCategory',
                'select_subcategory' => 'Select SubCategory',
                'select_brand' => 'Select Brand',
                'title' => 'Title',
                'brand' => 'Brand',
                'description' => 'Description',
                'default_image' => 'Default Image',
                'image' => 'Product Images',
                'choose_file' => 'Choose a file',
                'video' => 'Product Video',
                'seller_name' => 'Seller Name',
                'select_seller' => 'Select Seller',
                'rate' => 'Price',
                'sale_rate' => 'Sale Rate',
                'status' => 'Status',
                'short_description' => 'Short Description',
                'long_description' => 'Description',
                'product_type' => 'Product Type',
                'product_type_new' => 'New',
                'product_type_old' => 'Old',
                'product_delivery_type' => 'Delivery Type',
                'product_delivery_both' => 'Both',
                'product_delivery_delivery' => 'Delivery',
                'product_delivery_picked_up' => 'Picked Up',
                'delivery_price' => 'Delivery Price',
                'city' => 'City',
            ],
        ],
        'setting' => [
            'seo_settings' => 'SEO Settings',
            'company_contact_details' => 'Company Contact Details',
            'mail_settings' => 'Mail Settings',
            'footer_settings' => 'Footer Settings',
            'terms_condition_settings' => 'Terms and Condition Settings',
            'site_logo' => 'Site Logo',
            'favicon' => 'Favicon',
            'choose_file' => 'Choose a file',
            'metatitle' => 'Metatitle',
            'seo_keyword' => 'Seo Keyword',
            'seo_description' => 'Seo Description',
            'company_address' => 'Company Address',
            'company_contact' => 'Company Contact',
            'from_name' => 'From Name',
            'from_email' => 'From Email',
            'footer_text' => 'Footer Text',
            'copyright_text' => 'Copyright Text',
            'terms' => 'Terms',
            'disclaimer' => 'Disclaimer',
        ],
        'cms' => [
            'fields' => [
                'title' => 'Title',
                'description' => 'Description',
                'cannonical_link' => 'Cannonical Link',
                'seo_title' => 'SEO Title',
                'seo_keyword' => 'SEO Keyword',
                'seo_description' => 'SEO Description',
                'status' => 'Status',
                'created_at' => 'Created At',
                'updated_at' => 'Updated At',
            ],
        ],
        'country' => [
            'fields' => [
                'name' => 'Name',
                'code' => 'Code',
                'phonecode' => 'Phone Code',
                'status' => 'Status',
            ],
        ],
        'state' => [
            'fields' => [
                'name' => 'Name',
                'select_country' => 'Select Country',
                'country_name' => 'Country Name',
                'status' => 'Status',
            ],
        ],
        'city' => [
            'fields' => [
                'name' => 'Name',
                'country_name' => 'Country Name',
                'select_country' => 'Select Country',
                'select_state' => 'Select State',
                'state_name' => 'State Name',
                'status' => 'Status',
            ],
        ],
        'category' => [
            'fields' => [
                'category_name' => 'Category name',
                'status' => 'Status',
                'image' => 'Category Image',
                'choose_file' => 'Choose a file',
                'display_home' => 'Display On Homepage',
                'sort_order' => 'Sort Order',
            ],
        ],
        'sub_category' => [
            'fields' => [
                'category' => 'Category',
                'name' => 'Name',
                'status' => 'Status',
                'select' => 'Please select category',
                'created_at' => 'Created At',
                'image' => 'Category Image',
                'choose_file' => 'Choose a file',
                'category_name' => 'Category name',
            ],
        ],
        'brand' => [
            'fields' => [
                'id' => 'ID',
                'category' => 'Category',
                'category_name' => 'Category Name',
                'select' => 'Please select category',
                'sub_category' => 'Sub Category',
                'sub_category_select' => 'Please select subcategory',
                'name' => 'Name',
                'status' => 'Status',
                'created_at' => 'Created At',
                'image' => 'Brand Image',
                'choose_file' => 'Choose a file',
            ],
        ],
        'seller' => [
            'fields' => [
                'first_name' => 'First name',
                'last_name' => 'Last name',
                'email' => 'Email',
                'password' => 'Password',
                'password_helper' => '',
                'shop_name' => 'Shop Name',
                'shop_url' => 'Shop Url',
                'phone_number' => 'Phone Number',
                'status' => 'Status',
            ],
        ],
        'buyer' => [
            'fields' => [
                'email' => 'Email',
                'password' => 'Password',
                'password_helper' => '',
                'first_name' => 'First name',
                'last_name' => 'Last name',
                'status' => 'Status',
            ],
        ],
        'order' => [
            'fields' => [
                'marketplace' => 'MarketPlace',
                'invoice' => 'Invoice',
                'date' => 'Date',
                'from' => 'From',
                'to' => 'To',
                'email' => 'Email',
                'item' => 'Item',
                'description' => 'Description',
                'price' => 'Price',
                'qty' => 'Qty',
                'total' => 'Total',
                'subtotal' => 'Subtotal',
                'service_charge' => 'Service Charge',
                'delivery_charge' => 'Delivery Charge',
                'shipping_charge' => 'Shipping Charge',
                'select_seller' => 'Select Seller',
                'date_time_label' => 'Date/Time',
                'order_id' => 'Order ID',
                'product' => 'Product',
                'buyer' => 'Buyer',
                'seller' => 'Seller',
                'transaction_id' => 'Transaction ID',
                'status' => 'Status',
                'pending' => 'Pending',
                'success' => 'Success',
                'failed' => 'Failed',
                'created_at' => 'Created At',
                'image' => 'Product Images',
            ],
        ],
        'productquote' => [
            'fields' => [
                'product' => 'Product',
                'buyer' => 'Buyer',
                'seller' => 'Seller',
                'price' => 'Price',
                'date_time_label' => 'Date/Time',
                'status' => 'Status',
                'pending' => 'Pending',
                'approve' => 'Approve',
                'reject' => 'Reject',
            ],
        ],
    ],

    'frontend' => [
        'marketplace' => 'MarketPlace',
        'active' => 'Active',
        'inactive' => ' InActive',
        'home' => 'Home',
        'index' => [
            'popular_category' => 'Popular Categories',
            'search_now' => 'Search Now',
            'recently_arrived' => 'Recently Arrived',
            'brand' => 'Brands',
            'category' => 'All',
            'category_placeholder' => 'What are you looking for ...',
            'overall' => 'Overall',
            'results' => 'results',
            'for' => 'for',
        ],
        'footer' => [
            'payment_options' => 'Payment options',
            'privacy_policy' => 'Privacy Policy',
            'terms_sales' => 'Terms of sales',
            'all_right_reserved' => '21,AchaTrust - all rights reserved',
            'copyright' => 'Copyrights',
        ],
        'buyerregister' => [
            'create_account' => 'Create an account',
            'have_bussiness' => 'Have a business',
            'create_bussiness_account' => 'Create a business account',
            'fields' => [
                'email_address' => 'Email Address',
                'password' => 'Password',
                'first_name' => 'First Name',
                'last_name' => 'Last Name',
            ],
        ],
        'sellerregister' => [
            'create_account' => 'Create an account',
            'fields' => [
                'email_address' => 'Email Address',
                'password' => 'Password',
                'first_name' => 'First Name',
                'last_name' => 'Last Name',
                'shop_name' => 'Shop Name',
                'shop_url' => 'Shop URL',
                'phone_number' => 'Phone Number',
            ],
        ],
        'product' => [
            'fields' => [
                'category' => 'Category',
                'select_category' => 'Select Category',
                'subcategory' => 'SubCategory',
                'select_subcategory' => 'Select SubCategory',
                'select_brand' => 'Select Brand',
                'title' => 'Title',
                'brand' => 'Brand',
                'description' => 'Description',
                'ask_seller_des' => 'Description',
                'image' => 'Product Images',
                'upload_image' => 'Upload Images',
                'upload_video' => 'Upload Video',
                'choose_file' => 'Choose a file',
                'video' => 'Product Video',
                'rate' => 'Price',
                'sale_rate' => 'Sale Rate',
                'status' => 'Status',
                'category_name' => 'Category name',
                'seller_add_product' => 'Seller Add Product',
                'seller_edit_product' => 'Seller Edit Product',
                'Condition' => 'Condition',
                'delivery' => 'Delivery',
                'product_image_help' => 'Please upload image size more than 500px X 500px and so on. Width and height should be in same proportions for the Images.',
                'results' => 'results',
                'product_delivery' => 'Delivery',
                'pickup' => 'Pickup',
                'used' => 'Used',
                'location' => 'Location',
                'date' => 'Date',
                'new' => 'New',
            ],
            'title' => 'Products List',
            'createproduct' => 'Add Product',
            'placeholder' => 'Placeholder',
            'norecordfound' => 'No records found!',
            'productview' => 'Product View',
            'productsquote' => 'Products Quotes',
            'buyer' => 'Buyer',
            'productname' => 'Product Name',
            'price' => 'Price',
            'comment' => 'Comment',
            'approve' => 'Approve',
            'reject' => 'Reject',
            'addtocart' => 'Add to Cart',
            'buynow' => 'Add to Cart',
            'quotethisproduct' => 'Quote This Product',
            'quotetdetails' => 'Enter Quote Details',
            'productaddcartsuccess' => 'Product added successfully in cart!',
            'productaddedcart' => 'Product alreday added in cart!',
            'somethingwentwrong' => 'Something went Wrong!',
            'seller_item_for_sale' => 'Sellers Item for Sale',
            'seller' => 'Seller',
            'my_product' => 'My Product',
            'edit_detail' => 'Edit Detail',
            'remove_product' => 'Remove',
            'no_records' => 'No Records Found',
            'processing_file' => 'Processing dropped files',
            'reports_to' => 'Reports To AchaTrust',
            'sold' => 'Sold Out',
            'product_list' => [
                'sort_by' => 'Short by',
                'filter_price' => 'Price',
                'filter_by' => 'Filter By',
                'low_high' => 'Low to High',
                'high_low' => 'High to Low',
                'brand' => 'Select Brand',
                'see_more' => 'See More',
                'under' => 'Under',
                'over' => 'over',
                'min' => 'min',
                'max' => 'max',
                'noproductfound' => 'No Products Found!',
                'yes' => 'YES',
                'no' => 'NO',
            ],
            'product_details' => [
                'ask_seller' => 'Ask the Seller',
                'make_offer' => 'Make an Offer',
                'buy_now' => 'Buy Now',
                'quote_price' => 'Quote Price',
                'comment' => 'Comment',
            ],
            'make_an_Offer' => 'Make an Offer',
            'buy_now' => 'Buy Now',
            'ask_the_seller' => 'Ask the Seller',
            'reports_to_title' => 'Report to AchaTrust',
            'reports_to_label' => 'We handle thousands of reported ads every day. We give priority to ads that have been reported by multiple visitors. Read the rules and conditions that apply to placing an ad here.',
            'product_type' => 'Product Type',
            'product_type_old' => 'Old',
            'product_type_new' => 'New',
            'delivery_type' => 'Delivery Type',
            'delivery_type_delivery' => 'Delivery',
            'delivery_type_pickup' => 'Pick Up',
            'delivery_type_both' => 'Both (Delivery & Pick Up)',
            'delivery_price' => 'Delivery Price',
        ],
        'cart' => [
            'title' => 'Cart',
            'total' => 'Total',
            'subtotal' => 'Subtotal',
            'price' => 'Price',
            'cartempty' => "<h2 class='text-danger mb-4'>Your Cart is empty!</h2><p>You have iteams in your Shopping  Cart.<br>Let's go buy something!</p>",
        ],
        'quote' => [
            'title' => 'My Quotes',
            'id' => 'Quote ID',
            'seller' => 'Seller',
            'productname' => 'Product Name',
            'date' => 'Date',
            'quoteprice' => 'Quote Price',
            'comment' => 'Comments',
            'status' => 'Status',
            'actions' => 'Actions',
        ],
        'myorder' => [
            'title' => 'My Orders / Tracking',
            'success' => 'Success',
            'fail' => 'Failed',
            'noorder' => 'No Orders Found!',
            'no_itme_sold' => 'No Items Sold Found!',
            'no_item_purchase' => 'No Items Purchase Found!',
            'price' => 'Price',
            'status' => 'Status',
            'order' => 'Order',
            'item_purchase' => 'Items Purchased',
            'item_sold' => 'Items Sold',
            'shipping_price' => 'Shipping price',
            'service_charge' => 'Service charges',
            'total' => 'Total',
            'write_review' => 'Write Review',
            'review_rating' => 'Review & Ratings',
            'first_name' => 'First Name',
            'last_name' => 'Last Name',
            'bank_acc_no' => 'Bank Account Number',
            'order_placed' => 'Order Placed',
            'buyer' => 'Buyer',
        ],
        'checkout' => [
            'payment_method' => 'Payment Method',
            'yourcart' => 'Your cart',
            'billing_info' => 'Billing Information',
            'fill_form' => 'Fill Form Below',
            'shipping_info' => 'Shipping information',
            'same_as_billing_info' => 'Same as Billing Information',
            'fields' => [
                'firstname' => 'First name',
                'lastname' => 'Last name',
                'email' => 'Email Address',
                'telephone' => 'Telephone',
                'address' => 'Address',
                'city' => 'City',
                'state' => 'State/Territory',
                'country' => 'Country',
                'postcode' => 'Postcode',
                'ship_to_same_address' => 'Ship to the same Address',
                'description' => 'Lorem ipsum carrots enhanced rebates. I have never been blinded by their hatred of the desire, which he hates, they would have everything here, rejecting some of them deal corruptly. Lorem ipsum carrots enhanced rebates.',
                'please_consider' => 'Please consider this when selecting your shipping options.',
                'shipping_regular' => 'Regular (1-6 weeks, no tracking)',
                'shipping_express' => 'Express (2-8 days, tracking)',
                'more_info_shipping' => 'See more info on shipping',
                'choose_best_method' => 'Choose your best Payment Method',
                'creditcard' => 'Credit Card Details',
                'debitcard' => 'Debit Card Details',
                'expiry_date' => 'Expiry Date',
                'card_number' => 'Card Number',
                'cardholder_name' => 'Cardholder Name',
                'order_summary' => 'Order Summary',
                'subtotal' => 'Subtotal',
                'tax' => 'Tax',
                'delivery' => 'Shipping price',
                'shipping' => 'Service charges',
                'total' => 'Total',
                'select_country' => 'Select Country',
            ],
        ],
        'myoffer' => [
            'title' => 'Approve/Reject Offer',
            'no_record' => 'No Offers Found!',
            'buy_now' => 'Buy Now',
            'approve' => 'Approved',
            'reject' => 'Rejected',
            'pending' => 'Pending',
            'awaiting' => 'Awaiting',
            'offer_received' => 'Offer Received',
            'offer_sent' => 'Offer Sent',
            'fields' => [
                'home' => 'Home',
                'price' => 'Price',
                'offer_price' => 'Offer Price ',
                'description' => 'Description',
                'comments' => 'Comments',
                'status' => 'Status',
                'buyer' => 'Buyer',
                'seller' => 'Seller',
            ],
        ],
        'my_account' => [
            'personal_info' => 'Personal Info',
            'your_profile' => 'Your Profile',
            'fields' => [
                'firstname' => 'First name',
                'lastname' => 'Last name',
                'email' => 'Email',
                'phone' => 'Phone Number',
                'new_password' => 'New Password',
            ],
        ],
        'login' => [
            'sign_in' => 'Sign in',
            'sign_in_facebook' => 'Sign in with Facebook',
            'sign_in_google' => 'Sign in with Google',
            'dont_have_account' => "Don't have an account",
            'create_here' => 'Create here',
            'or' => 'Or',
        ],
        'submit' => 'Submit',
        'back' => 'Back',
        'privacy_policy' => 'Privacy Policy',
        'about_us' => 'About Us',
        'mymessage' => [
            'title' => 'Messages',
            'no_record' => 'No Message Found!',
            'reply_message' => 'Reply message',
            'fields' => [
                'message' => 'Message',
                'user' => 'User',
                'comments' => 'Comments',
                'type_message' => 'Type Message',
            ],
        ],
    ],
];
