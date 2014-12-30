'use strict';
$(function() {
	//configuration
	var width=525;
	var animationSpeed=1000;
	var pause=3000;
	var currentSlide=1;
	var slider=$('.slider');
	/*var	list=slider.find('ul.slides');
	var	length=list.find('li').length;
	var	width =slider.outerWidth();
	var	totalWidth =width * length;
	var	index=0;
	var	next=$('a.next', slider);
	var	prev=$('a.prev',slider);

	//list.find('li').width(width).end().width(totalWidth);

	/*$(window).resize(function(){
		width=slider.outerWidth();
		totalWidth=width*length;
		list.find('li').width(width).end().width(totalWidth).css('margin-left', '-'+(index*width)+'px');

	});*/

	//cache DOM
	var $slider=$('#slider');
	var $slideContainer=$slider.find('.slides');
	var $slides=$slideContainer.find('.slide');

	var interval;
	function startSlider(){
		interval=setInterval(function(){
			$slideContainer.animate({'margin-left':'-='+width}, animationSpeed, function(){
				currentSlide++;
				if(currentSlide===$slides.length){
					currentSlide=1;
					$slideContainer.css('margin-left',0);
				}
			});
		}, pause);
	}
	function stopSlider(){
		clearInterval(interval);
	}

	
	startSlider();
});