/**
* @class
*   이미지 롤링를 처리 합니다.
*
* @example
*    $.fn.roate.defaults  = {
*        'duration' : '3000',
*       'stopButton' : '#stopButton',
*        'playButton' : '#playButton',
*        'prevButton' : '#prevButton',
*        'nextButton' : '#nextButton',
*        'movement'  : 'left',
*        'scroll'     : 1,
*        'autoStart'   : false,
*        'interval'   : 2000
*    };
*
*
* @name jQuery.roate
* @author JsYang <yakuyaku@gmail.com>
* @since 2011년 8월 18일 목요일
* @version 1.0
*/

;(function($){

    $.fn.rotate = function( options ) {

        var opts = $.extend( {}, $.fn.rotate.defaults, options ),
            containerBox = [],
            $this = $(this),
            defaultWidth, defaultHeight, curentIndex = 0, distance, childLength, isAnimate = false, timer = null;

        var pm = {}

        var _init = function() {
            _setDefaultSize();
            _setDistance();
            _displayOverFlow();
            _setContainerBox();
            _setEventBind();
        }
        , _setDefaultSize = function() {
            defaultWidth  = opts.defaultWidth || $this.children(':first').width();
            defaultHeight = opts.defulatHeight || $this.children(':first').height();
            childLength   = $this.children().length;
            if ( opts.movement == 'top' ) {
                defaultHeight = defaultHeight * parseInt(opts.scroll,10);
            } else if (  opts.movement == 'opacity' ) {
                opts.opacity = true;
            } else {
                defaultWidth  = defaultWidth * parseInt(opts.scroll,10);
            }

        }
        , _setDistance = function() {
            if ( opts.movement == 'top') {
                distance = defaultHeight;
            } else {
                distance = defaultWidth;
            }
        }
        , _displayOverFlow = function() {
            var $wrap = $("<div class='containterWrap'></div>").css({
                'overflow' : 'hidden',
                'position' : 'relative',
                'width' : defaultWidth,
                'height' : defaultHeight
            });
            $this.wrap( $wrap );
            $this.css({'position':'absolute', 'left': '0', 'top' : '0' });
        }
        , _setContainerBox = function() {
            $this.children().each(function(i){
                containerBox[ containerBox.length ] = this;
            });
        }
        , _setEventBind  = function() {
            $(options.nextButton).bind('click.roate', function(){
                _stopTimer();
                pm.next();
                pm.play();
            });

            $(options.prevButton).bind('click.roate', function(){
                _stopTimer();
                pm.prev();
                pm.play();
            });

            $(options.playButton).bind('click.roate', function(){
                _stopTimer();
                pm.play();
            });

            $(options.stopButton).bind('click.roate', function(){
                pm.stop();
            });

            $this.hover( function(){
                pm.stop();
            }, function(){
                _stopTimer();
                pm.play();
            });

        }
        , _addCurrent = function() {
            curentIndex++;
            if ( curentIndex >= childLength ) {
                curentIndex = 0;
            }
        }, _minusCurrent = function() {
            curentIndex--;
            if ( curentIndex < 0 ) {
                curentIndex = childLength -1;
            }
        }
        , _isAmimate = function() {
            if ( isAnimate ) {
                return true;
            }
            isAnimate = true;
            return false;
        }, _stopTimer = function(){
            if ( timer ) {
                clearInterval( timer );
                _displayPlayButton();
            }
        }, _displayPlayButton = function() {
            $(opts.playButton).css('display', 'inline');
            $(opts.stopButton).css('display', 'none');
        }, _displayStopButton = function() {
            $(opts.playButton).css('display', 'none');
            $(opts.stopButton).css('display', 'inline');
        }, _setOpacity = function ( style ) {
              if ( opts.opacity ) {
                style['display'] = 'none';
                style['opacity'] = 1;
            }
            return style;
        };

        pm.next = function() {
            this.move( $(containerBox[ curentIndex ] ), 'next' );
        };

        pm.prev = function() {
            this.move( $(containerBox[ curentIndex ]) , 'prev' );
        };

        pm.play = function() {
            timer = setInterval(function(){ pm.next() }, opts.interval);
            _displayStopButton();
        };

        pm.stop = function() {
            _stopTimer();
        };

        pm.move = function ( $el, movement ) {
            if ( _isAmimate() === false ) {
                var moveDistance = $this.offset().left - $el.offset().left;
                var moveType = {},setCss = {};
                if ( movement == "next" ) {
                    moveDistance = moveDistance - distance;
                    setCss[opts.movement] = parseInt(moveDistance,10) + parseInt(distance,10);
                } else if( movement == "prev") {
                    moveDistance = moveDistance + distance;
                    setCss[opts.movement] = parseInt(moveDistance,10) - parseInt(distance,10);
                }
                moveType[opts.movement] = moveDistance;
                if ( opts.opacity ) {
                    moveType['opacity'] = 0;
                }
                setCss = _setOpacity( setCss );
                if ( opts.movement == 'top' && movement == 'prev' ) {
                    $this.css('top',-defaultHeight);
                    moveType[opts.movement] = 0;
                    $this.children(':first').before($this.children(':last'));
                }
                $this.animate(moveType, opts.duration, function(){
                    if ( movement == "next" ) {
                        $this.children(':last').after($el);
                        _addCurrent();
                    } else if( movement == "prev")  {
                        if ( opts.movement == 'left' ) {
                            $this.children(':first').before($this.children(':last'));
                        }
                        _minusCurrent();
                    }
                    if ( opts.opacity ) {
                        $this.fadeIn(opts.duration);
                    }
                    $this.css(setCss);
                    isAnimate = false;
                });
            };
        };

        _init();

        if ( opts.autoStart ) {
            pm.play();
        }

        return pm;
    };

    $.fn.rotate.defaults  = {
        'duration' : '3000',
        'stopButton' : '#stopButton',
        'playButton' : '#playButton',
        'prevButton' : '#prevButton',
        'nextButton' : '#nextButton',
        'movement'  : 'left',
        'scroll'     : 1,
        'autoStart'   : false,
        'interval'   : 2000,
        'opacity'    : false
    };

})(jQuery);

