(function($) {
    $(function() {
        $(document).trigger("application:ready");
        if (backgroundColor) {
            $('.content').css('background-image', 'none').css('background-color', backgroundColor);
        }
        if (fontColor) {
            $('.output').css('color', fontColor);
        }
    });
})(jQuery);
