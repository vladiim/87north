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

/* datepicker */

$(function() {
	$( "#datepicker" ).datepicker({ dateFormat: "dd/mm/yy" });
});

/* Angular js */

function Ctrl($scope) {
    MINIMUM_NIGHTS    = 3;
    WINTER_NIGHT_COST = 220;
    WINTER_WEEK_COST  = 1120;
    SPRING_NIGHT_COST = 245;
    SPRING_WEEK_COST  = 1330;
    SUMMER_WEEK_COST  = 1890;

	$scope.night_count = MINIMUM_NIGHTS;
	$scope.user = {};
	$scope.user = { startdate: new Date() };
    $scope.user.cost = $scope.night_count * 220;

	$scope.addNight = function() {
		$scope.night_count  = $scope.night_count + 1;
		$scope.changeCost();
	}

	$scope.minusNight = function() {
		if ($scope.night_count > MINIMUM_NIGHTS) {
			$scope.night_count = $scope.night_count - 1;
		}
	}

	$scope.changeCost = function() {
		$scope.user.cost = $scope.night_count * 220;
	}
}