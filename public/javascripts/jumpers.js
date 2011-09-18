(function($) {
    $(document)
        .bind("application:ready", function() {

            $('#new_jumper')
                .bind("ajax:beforeSend", function (evt, xhr, settings) {
                    $('#new_jumper .loading').css('display', 'inline-block');
                    $('#new_jumper #jumper_submit').hide();
                })

                .bind("ajax:success", function (evt, data, status, xhr) {
                    $('#new_jumper .loading').hide();
                    $('#new_jumper #jumper_submit').show();
                    var newjumper = $(xhr.responseText);
                    $('#jumpers').prepend(newjumper);
                    $('#jumpers').sortable("refresh");
                    newjumper.find(".jumper").parent().parent().effect("highlight", {}, 800);
                    $('#jumper_name').val("").focus();
                });

            $('ul#jumpers')
                .sortable({
                    dropOnEmpty: false,
                    zIndex: 5,
                    cursor: 'move',
                    items: 'li',
                    opacity: 1,
                    scroll: false,
                    update: function() {
                        $.ajax({
                            type: 'post',
                            data: $('ul#jumpers').sortable('serialize'),
                            dataType: 'script',
                            url: '/randomizers/' + $(location).prop("pathname").split("/")[2] + '/jumpers_sort'
                        });
                    }
                });
            $('li form').live({
                "ajax:beforeSend": function(evt, xhr, settings) {
                    if (xhr.status == "200") {
                         $(this).closest('div.jumper').find('.loading').css('display', 'inline-block');
                    }
                },
                "ajax:success": function(evt, data, status, xhr) {
                   if (xhr.status == "200") {
                        var jumper = $(this).closest("div.jumper");
                        jumper.find('.loading').hide();
                        jumper.parent().effect("highlight", {}, 1337);
                    }
                }
            });


            $('.delete_jumper').live({
                "ajax:success": function(evt, data, status, xhr) {
                    $(this).closest("div.jumper").parent().fadeOut();
                }
            });

            $('.refresh').live({
                "ajax:success": function(evt, data, status, xhr) {
                    $('h2.output').text(JSON.parse(xhr.responseText).randomizer)
                }
            })
        });
})(jQuery);
