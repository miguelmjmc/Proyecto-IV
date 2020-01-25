window.onload = function () {

    //=================================================================================================================>
    //=================================================================================================================>
    // dependencies check
    //=================================================================================================================>

    if (!window.jQuery) {
        throw new Error("Jquery is not loaded.");
    }

    //=================================================================================================================>
    //=================================================================================================================>
    // events
    //=================================================================================================================>

    var events = {
        modal: {
            preEvent: '',
            successEvent: 'modal.',
            errorEvent: '',
            postEvent: ''
        },
        form: {
            preEvent: 'form.pre.event',
            invalidEvent: '',
            validEvent: '',
            successEvent: 'form.submit.success',
            errorEvent: '',
            postEvent: ''
        }
    };

    //=================================================================================================================>
    //=================================================================================================================>
    // prevent default
    //=================================================================================================================>

    $(document).on('mousedown', '[readonly]', function (event) {
        event.preventDefault();
    });

    $(document).on('mousedown', 'disabled', function (event) {
        event.preventDefault();
    });

    $(document).on('click', 'a[href="#"]', function (event) {
        event.preventDefault();
    });

    //=================================================================================================================>
    //=================================================================================================================>
    // functions
    //=================================================================================================================>

    $.fn.findAll = function (selector) {
        return this.filter(selector).add(this.find(selector));
    };

    //=================================================================================================================>
    //=================================================================================================================>
    // bootstrap-datepicker
    //=================================================================================================================>

    if ($.fn.datepicker) {
        $(document).on('focus', '.datepicker', function () {
            $(this).datepicker({
                format: 'yyyy/mm/dd',
                language: $('html').attr('lang'),
                autoclose: true,
                clearBtn: true,
                todayBtn: true,
                todayHighlight: true,
                enableOnReadonly: false
            });
        });

        $(document).on('focus', '.datepicker-year-month', function () {
            $(this).datepicker({
                format: 'yyyy/mm',
                language: $('html').attr('lang'),
                autoclose: true,
                clearBtn: true,
                enableOnReadonly: false,
                viewMode: 'months',
                minViewMode: 'months'
            });
        });

        $(document).on('focus', '.datepicker-year', function () {
            $(this).datepicker({
                format: 'yyyy',
                language: $('html').attr('lang'),
                autoclose: true,
                clearBtn: true,
                enableOnReadonly: false,
                viewMode: 'years',
                minViewMode: 'years'
            });
        });
    }

    //=================================================================================================================>
    //=================================================================================================================>
    // bootstrap-selectpicker
    //=================================================================================================================>

    if ($.fn.selectpicker) {
        $(document).on('load', function () {
            $('.selectpicker').selectpicker({
                liveSearch: true,
                selectedTextFormat: 'count'
            });

            $(document).find('.selectpicker[read-only]').prop( 'disabled', true);
        });

        $(document).on('modal.success', function () {
            $(document).find('#modal-default .selectpicker').selectpicker({
                liveSearch: true,
                selectedTextFormat: 'count'
            });

            $(document).find('.selectpicker[readonly]').prop( 'disabled', true);
        });

        $(document).on(events.form.preEvent, function () {
            $(document).find('.selectpicker[disabled]').prop( 'disabled', false);
        })
    }

    //=================================================================================================================>
    //=================================================================================================================>
    // bootstrap-datatable
    //=================================================================================================================>


    //================================================================================================================>
    //================================================================================================================>
    // modal trigger
    //================================================================================================================>

    $(document).on('click', '.modal-trigger', function (event) {
        event.preventDefault();

        $(document).trigger('modal-pre-event');

        $(document).find('.modal-trigger').prop('disabled', true);

        $('#modal-default').remove();
        $('body').append('<div id="modal-default" class="modal fade" role="dialog"></div>');

        $.ajax({
            url: $(this).data('action'),
            type: 'POST',
            data: {_method: $(this).data('method')},
            success: function (data, textStatus, jqXHR) {
                $('#modal-default').html(data).modal('show');

                $(document).trigger('modal.success', [data, textStatus, jqXHR]);
            },
            error: function (jqXHR, textStatus, errorThrown) {
                $(document).trigger('modal.error', [jqXHR, textStatus, errorThrown]);
            }
        });

        $(document).trigger('modal.post.event');
    });

    $(document).on('hidden.bs.modal', '#modal-default', function () {
        $(this).remove();
        $(document).find('.modal-trigger').prop('disabled', false);
    });

    //================================================================================================================>
    //================================================================================================================>
    // form submit
    //================================================================================================================>

    $(document).on('click', '.ajax-submit', function (event) {
            event.preventDefault();

            $(document).trigger(events.form.preEvent);

            var form = ($(this).parents('form'));

            if (!(form[0].checkValidity())) {
                form[0].reportValidity();

                $(document).trigger(events.form.invalidEvent);
            } else {
                $(this).prop('disabled', true);

                $(document).trigger(events.form.validEvent);

                if ($(form).find('input[type="file"]')) {
                    $.ajax({
                        url: form.attr('action'),
                        type: form.attr('method'),
                        data: new FormData($(form)[0]),
                        contentType: false,
                        processData: false,
                        cache: false,
                        success: function (data, textStatus, jqXHR) {
                            $(document).trigger(events.form.successEvent, [data, textStatus, jqXHR]);
                        },
                        error: function (jqXHR, textStatus, errorThrown) {
                            $(document).trigger(events.form.errorEvent, [jqXHR, textStatus, errorThrown]);
                        }
                    });
                } else {
                    $.ajax({
                        url: form.attr('action'),
                        type: form.attr('method'),
                        data: form.serialize(),
                        success: function (data, textStatus, jqXHR) {
                            $(document).trigger(events.form.successEvent, [data, textStatus, jqXHR]);
                        },
                        error: function (jqXHR, textStatus, errorThrown) {
                            $(document).trigger(events.form.errorEvent, [jqXHR, textStatus, errorThrown]);
                        }
                    });
                }

                $(document).trigger(events.form.postEvent);
            }
        }
    );

//=================================================================================================================>
//=================================================================================================================>
// navigation
//=================================================================================================================>

    $(document).on('click', '[data-role="navigation"]', function (event) {
        event.preventDefault();

        var path = $(this).attr('href');

        $.ajax({
            url: path,
            type: 'GET',
            success: function (data) {
                var title = $(data).findAll('title').text();

                $(document).prop('title', title);

                window.history.pushState({}, title, path);

                $('#main-container').replaceWith($(data).findAll('#main-container'));

                $(document).trigger('navigation.success');
            },
            error: function () {
            }
        });
    });

    window.addEventListener('popstate', function (event) {
        $.ajax({
            url: window.location,
            type: 'GET',
            success: function (data) {
                var title = $(data).filter('title').text();

                $(document).prop('title', title);

                $('#main-container').replaceWith($(data).findAll('#main-container'));
                $(document).trigger('navigation.success');
            },
            error: function () {
            }
        });
    });

}
;

/******************************************************************************************************************/
//functions
/******************************************************************************************************************/
function methodResolver(method) {
    if (!method) {
        return 'GET'
    }

    if (typeof method === 'string' || method instanceof String) {
        method = method.toUpperCase();

        if ('GET' === method || 'POST' === method || 'PUT' === method || 'PATH' === method || 'DELETE' === method) {
            return method;
        }
    }

    console.log('Invalid supplied method.');
    console.log('Availible methods: GET, POST, PUT, PATH, DELETE.');
    console.log('Using GET as the default method.');

    return 'GET';
}


/*

    //================================================================================================================>
    //================================================================================================================>
    // form submit
    //================================================================================================================>

    $(document).on('click', '[data-role="form-submit"]', function (event) {
        event.preventDefault();

        $(this).prop('disabled', true);

        var form = $(this).parents('form');

        if (null === $(this).find('input:file')) {
            $.ajax({
                type: form.attr('method'),
                url: form.attr('action'),
                data: form.serialize(),
                success: function (data) {
                    if ('success' === data) {
                        location.reload();
                    } else {
                        $('#modal-default').empty().append(data);
                    }
                }
            });
        } else {
            $.ajax({
                cache: false,
                contentType: false,
                processData: false,
                type: form.attr('method'),
                url: form.attr('action'),
                data: new FormData($(form)[0]),
                success: function (data) {
                    if ('success' === data) {
                        location.reload();
                    } else {
                        $('#modal-default').empty().append(data);
                    }
                }
            });
        }
    });


    //=================================================================================================================>
    //=================================================================================================================>
    // content load trigger
    //=================================================================================================================>

    $(document).on('click', '[data-role="content-load-trigger"]', function (event) {
        event.preventDefault();

        var method = 'GET';

        if ($(this).data('method')) {
            method = $(this).data('method');
        }

        $.ajax({
            type: method,
            url: $(this).data('url'),
            success: function (data) {
                $($(this).data('container')).empty().append(data);
            }
        });
    });

    //=================================================================================================================>
    //=================================================================================================================>
    // refresh trigger
    //=================================================================================================================>

    $(document).on('click', '[data-role="refresh-trigger"]', function (event) {
        event.preventDefault();

        var method = 'GET';

        if ($(this).data('method')) {
            method = $(this).data('method');
        }

        $.ajax({
            type: method,
            url: $(this).data('url'),
            success: function (data) {
                $($(this).data('container')).replaceWith($(data).filter($(this).data('container')));
            }
        });
    });



    //=================================================================================================================>
    //=================================================================================================================>
    // others
    //=================================================================================================================>

    $(document).on('mousedown', 'select[readonly]', function (e) {
        e.preventDefault();
    });
 */

/*

$(document).ready(function () {
    $('[data-role="lazy-loading"]').each(function () {
        var method = 'GET';

        if ($(this).data('method')) {
            method = $(this).data('method');
        }

        $.ajax({
            type: method,
            url: $(this).data('url'),
            success: function (data) {
                $(this).empty().append(data);
            }
        });
    });
});


*/
