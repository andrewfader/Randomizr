(function($) {
    $(document)
        .bind("application:ready", function() {
            var spinner = new Spinner();
            $('#new_jumper')
                .bind("ajax:beforeSend", function (evt, xhr, settings) {
                    var loading = $('#new_jumper .loading');
                    spinner.spin(loading);
                    $('#new_jumper #jumper_submit').hide();
                })

                .bind("ajax:success", function (evt, data, status, xhr) {
                    spinner.stop();
                    $('#new_jumper #jumper_submit').show();
                    var newjumper = $(xhr.responseText);
                    $('#jumpers').prepend(newjumper);
                    $('#jumpers').sortable("refresh");
                    newjumper.find(".content").effect("highlight", {}, 1337);
                    $('#jumper_name').val("").focus();
                });

            $('ul#jumpers')
                .sortable({
                    axis: 'y',
                    dropOnEmpty:false,
                    cursor: 'move',
                    items: 'li',
                    opacity: 0.4,
                    scroll: true,
                    update: function() {
                        $.ajax({
                            type: 'post',
                            data: $('ul#jumpers').sortable('serialize'),
                            dataType: 'script',
                            url: '/randomizers/' + $(location).prop("pathname").split("/")[2] + '/jumpers_sort'
                        });
                    }
                });
        });

    $('.jumper form').live({
        "ajax:beforeSend": function(evt, xhr, settings) {
            var loading = $(this).closest('div.jumper').find('.loading');
            spinner.spin(loading);
        },

        "ajax:success": function() {
            spinner.stop;
            var jumper = $(this).closest("div.jumper");
            var content = jumper.find(".content");
            content.effect("highlight", {}, 1337);
        }
    });


    $('.actions a.delete_jumper').live({
        "ajax:success": function(evt, data, status, xhr) {
            var jumper = $(this).closest("div.jumper");
            jumper.fadeOut();
        }
    });
})(jQuery);
