/*global jQuery:false */
jQuery(document).ready(function($) {
"use strict";

	// fancybox
	$(".fancybox").fancybox({				
			padding : 0,
			autoResize: true,
			beforeShow: function () {
				this.title = $(this.element).attr('title');
				this.title = '<h4>' + this.title + '</h4>' + '<p>' + $(this.element).parent().find('img').attr('alt') + '</p>';
			},
			helpers : {
				title : { type: 'inside' },
			}
		});

});