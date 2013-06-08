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

/* Angular js app */

var app = angular.module('87north', ['ui.directives']);

app.controller('Ctrl', function($scope) {
    MINIMUM_NIGHTS     = 2;
	$scope.user        = {};
	$scope.user.nights = MINIMUM_NIGHTS;
    $scope.bookingSent = false;

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

	$scope.sendBooking = function() {
		$scope.bookingSent = true;

		_gaq.push(['_trackEvent', 'BookingForm', 'BookingCompleted']);

		$.ajax({
			type: "POST",
			url: "/bookings",
			data: $scope.user
		})
	}
});