# --------- # js minify # --------- #
node_modules/uglify-js/bin/uglifyjs /Developer/Sites/87north/public/js/jquery.js \
		/Developer/Sites/87north/public/js/jquery-ui.js \
		/Developer/Sites/87north/public/js/angular.min.js \
		/Developer/Sites/87north/public/js/angular-ui.min.js \
		/Developer/Sites/87north/public/js/bootstrap.min.js \
		/Developer/Sites/87north/public/js/jquery.fancybox.pack.js \
		/Developer/Sites/87north/public/js/jquery.fancybox-media.js \
		/Developer/Sites/87north/public/js/modernizr.custom.79639.js \
        /Developer/Sites/87north/public/js/custom.js \
         -o /Developer/Sites/87north/public/js/87north.min.js \
         --source-map /Developer/Sites/87north/public/js/87north.min.js.map

# --------- # css minify # --------- #
cat /Developer/Sites/87north/public/css/bootstrap.css \
	/Developer/Sites/87north/public/css/bootstrap-responsive.css \
	/Developer/Sites/87north/public/css/angular-ui.css \
	/Developer/Sites/87north/public/css/jquery-ui.css \
	/Developer/Sites/87north/public/css/jquery.fancybox.css \
	/Developer/Sites/87north/public/css/jcarousel.css \
	/Developer/Sites/87north/public/css/flexslider.css \
	/Developer/Sites/87north/public/css/style.css \
	/Developer/Sites/87north/public/css/default.css \
	| node_modules/clean-css/bin/cleancss -o /Developer/Sites/87north/public/css/87north.min.css