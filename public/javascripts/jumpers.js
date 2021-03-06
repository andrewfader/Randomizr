(function($) {
    $(document)
        .bind("application:ready", function() {
            $('.add form.jumper')
                .bind("ajax:beforeSend", function (evt, xhr, settings) {
                    $(this).find('.loading').css('display', 'inline-block');
                    $(this).find('#jumper_submit').hide();
                })

                .bind("ajax:success", function (evt, data, status, xhr) {
                    $(this).find('.loading').hide();
                    $(this).find('#jumper_submit').show();
                    var newjumper = $(xhr.responseText);
                    $('#jumpers').append(newjumper);
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
                    jumper = $(this).closest('div.jumper');
                    jumper.find('.loading').css('display', 'inline-block');
                },
                "ajax:success": function(evt, data, status, xhr) {
                    if (xhr.status == "200") {
                        var jumper = $(this).closest("div.jumper");
                        jumper.find('.loading').hide();
                        jumper.parent().effect("highlight");
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
                    $('h2.output').text($.parseJSON(xhr.responseText).randomizer);
                }
            });

            $('.refresh_embedded').live({
                "ajax:success": function(evt, data, status, xhr) {
                    var id = $(this).attr("id").split("_")[1];
                    console.log($(this).attr("id"));
                    $('h2.output_embedded#embed_' + id).find("a").text($.parseJSON(xhr.responseText).randomizer);
                }
            });

            $('li .jumper').live({
                "blur": function() {
                    $(this).parent().find('form').submit();
                }
            });
            var myId;
            $('input#auto').live({
                "change": function() {
                    if ($(this).prop("checked")) {
                        refreshOutput();
                        myId = setInterval(function() {
                            refreshOutput();
                        }, 2000);
                    }
                    else {
                        clearInterval(myId);
                    }
                }
            })
            function refreshOutput() {
                $.getJSON(location.pathname.replace("/edit", "") + ".json", function(data) {
                    $("h2.output").text(data.randomizer);
                });
            }
        });
})(jQuery);
