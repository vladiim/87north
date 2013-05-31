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

/* Angular js */

var app = angular.module('87north', ['ui.directives']);

app.controller('Ctrl', function($scope) {
    MINIMUM_NIGHTS    = 3;
    WINTER_NIGHT_COST = 220;
    WINTER_WEEK_COST  = 1120;
    SPRING_NIGHT_COST = 245;
    SPRING_WEEK_COST  = 1330;
    SUMMER_WEEK_COST  = 1890;

	$scope.user        = {};
	$scope.user.nights = MINIMUM_NIGHTS;
    // $scope.user.cost   = $scope.user.nights * 220;

	$scope.addNight = function() {
		$scope.user.nights  = $scope.user.nights + 1;
		$scope.changeCost();
	}

	$scope.minusNight = function() {
		if ($scope.user.nights > MINIMUM_NIGHTS) {
			$scope.user.nights = $scope.user.nights - 1;
			$scope.changeCost();
		}
	}

	$scope.changeCost = function() {
		$scope.user.cost = $scope.user.nights * WINTER_NIGHT_COST;
	}

	$scope.sendBooking = function() {
		$.ajax({
			type: "POST",
			url: "/bookings",
			data: $scope.user
		})
	}
});