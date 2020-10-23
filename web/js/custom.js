var lang = {
    sProcessing: 'Procesando...',
    sLengthMenu: 'Mostrar _MENU_ registros',
    sZeroRecords: 'No se encontraron resultados',
    sEmptyTable: 'Ningún dato disponible en esta tabla',
    sInfo: 'Mostrando registros del _START_ al _END_ de un total de _TOTAL_ registros',
    sInfoEmpty: 'Mostrando registros del 0 al 0 de un total de 0 registros',
    sInfoFiltered: '(filtrado de un total de _MAX_ registros)',
    sInfoPostFix: '',
    sSearch: 'Buscar:',
    sUrl: '',
    sInfoThousands: ',',
    sLoadingRecords: 'Cargando...',
    oPaginate: {
        sFirst: 'Primero',
        sLast: 'Último',
        sNext: 'Siguiente',
        sPrevious: 'Anterior'
    },
    oAria: {
        sSortAscending: ': Activar para ordenar la columna de manera ascendente',
        sSortDescending: ': Activar para ordenar la columna de manera descendente'
    },
    buttons: {
        print: 'Imprimir',
        copy: 'Copiar',
        copyTitle: 'Añadido al portapapeles',
        copyKeys: 'Presione <i>ctrl</i> o <i>\u2318</i> + <i>C</i> para copiar los datos de la tabla al portapapeles. <br><br>Para cancelar, haga clic en este mensaje o presione Esc.',
        copySuccess: {
            _: '%d lineas copiadas',
            1: '1 linea copiada'
        }
    },
    select: {
        rows: {
            _: '%d filas seleccionadas',
            1: '1 fila seleccionada'
        }
    }
};

$.fn.selectpicker.defaults = {
    noneSelectedText: 'Seleccione...',
    noneResultsText: 'No hay resultados {0}',
    countSelectedText: '{0} items seleccionados',
    maxOptionsText: ['Límite alcanzado ({n} {var} max)', 'Límite del grupo alcanzado({n} {var} max)', ['elementos', 'element']],
    multipleSeparator: ', ',
    selectAllText: 'Seleccionar Todos',
    deselectAllText: 'Desmarcar Todos'
};

toastr.options = {
    closeButton: false,
    debug: false,
    newestOnTop: false,
    progressBar: false,
    positionClass: 'toast-bottom-right',
    preventDuplicates: false,
    onclick: null,
    showDuration: 300,
    hideDuration: 1000,
    timeOut: 5000,
    extendedTimeOut: 1000,
    showEasing: 'swing',
    hideEasing: 'linear',
    showMethod: 'fadeIn',
    hideMethod: 'fadeOut'
};

$(document).ready(function () {

    initializeInputs();

    $(document).on('modal.success', function () {
        initializeInputs();
    });

    $('.animsition').animsition({
        timeout: true
    });


    $(document).on('navigation.success', function (event) {
        $('.box').boxWidget({
            animationSpeed: 500,
            collapseTrigger: '[data-widget="collapse"]',
            removeTrigger: '[data-widget="remove"]',
            collapseIcon: 'fa-minus',
            expandIcon: 'fa-plus',
            removeIcon: 'fa-times'
        });

        $('.datatable').each(function (index) {
            table[index] = $(this).DataTable({
                ajax: $(this).data('src'),
                language: lang,
                responsive: true,
                dom: "<'row'<'col-sm-8 float-right-content'B><'col-sm-4'<'btn-add-container'>><'col-sm-12 date-filter-container'><'col-sm-6'l><'col-sm-6'f>><'row'<'col-sm-12'tr>><'row'<'col-sm-5'i><'col-sm-7'p>>",
                select: {
                    style: 'os',
                    selector: 'td:not(:last-child)',
                    blurable: true
                },
                buttons: [
                    {
                        extend: 'copy',
                        exportOptions: {
                            columns: ':not(:last-child)'
                        }
                    },
                    {
                        extend: 'csv',
                        exportOptions: {
                            columns: ':not(:last-child)'
                        }
                    },
                    {
                        extend: 'excel',
                        exportOptions: {
                            columns: ':not(:last-child)'
                        }
                    },
                    {
                        extend: 'pdf',
                        exportOptions: {
                            columns: ':not(:last-child)'
                        }
                    },
                    {
                        extend: 'print',
                        exportOptions: {
                            columns: ':not(:last-child)'
                        }
                    }
                ]
            });
        });

        $('.datatable-filter').each(function (index) {
            tableFilter[index] = $(this).DataTable({
                order: [0, 'DESC'],
                ajax: $(this).data('src'),
                language: lang,
                responsive: true,
                dom: "<'row'<'col-sm-8 float-right-content'B><'col-sm-4'<'btn-add-container'>><'col-sm-12 date-filter-container'><'col-sm-6'l><'col-sm-6'f>><'row'<'col-sm-12'tr>><'row'<'col-sm-5'i><'col-sm-7'p>>",
                initComplete: function (settings, json) {
                    dateFilter(settings, json, 0);
                },
                select: {
                    style: 'os',
                    selector: 'td:not(:last-child)',
                    blurable: true
                },
                buttons: [
                    {
                        extend: 'copy',
                        exportOptions: {
                            columns: ':not(:last-child)'
                        }
                    },
                    {
                        extend: 'csv',
                        exportOptions: {
                            columns: ':not(:last-child)'
                        }
                    },
                    {
                        extend: 'excel',
                        exportOptions: {
                            columns: ':not(:last-child)'
                        }
                    },
                    {
                        extend: 'pdf',
                        exportOptions: {
                            columns: ':not(:last-child)'
                        }
                    },
                    {
                        extend: 'print',
                        exportOptions: {
                            columns: ':not(:last-child)'
                        }
                    }
                ]
            });
        });
    });

    $(document).on('form.submit.success', function (event, data) {
        if ('success' === data) {
            $.each(table, function (index, value) {
                if ($.fn.DataTable.isDataTable(value)) {
                    value.ajax.reload();
                }
            });

            $.each(tableFilter, function (index, value) {
                if ($.fn.DataTable.isDataTable(value)) {
                    value.ajax.reload();
                }
            });

            $('#modal-default').modal('toggle');

            toastr.success('Exito!. Operación realizada satisfactoriamente.');

            $.ajax({
                type: 'GET',
                url: window.location.pathname,
                success: function (data) {
                    $('#callout').replaceWith($(data).find('#callout'));
                    $('#sidebar-info').replaceWith($(data).find('#sidebar-info'));
                    $('#taxpayer-profile').replaceWith($(data).find('#taxpayer-profile'));
                    $('#taxpayer-profile-economicActivity-table').appendTo($('#taxpayer-profile #appbundle_taxpayer_economicActivity').parents('.form-group'));
                    $('#taxpayer-profile-economicActivity-table').DataTable({
                        info: false,
                        language: lang,
                        lengthChange: false,
                        paging: false,
                        responsive: true,
                        searching: false
                    });
                }
            });
        } else if ('success-reload' === data) {
            location.reload();
        } else if ('error' === data) {
            $('#modal-default').modal('toggle');

            toastr.error('Oops!. La operación no pudo ser realizada. Verifique que el registro no sea una dependencia de otros registros.');
        } else {
            $('#modal-default').empty().append(data);
            initializeInputs();
        }
    });


    $(document).on('form.submit.pre.event', function () {
        $('.modal-container').hide();
        $('.loader').show();

        $('.modal-container select[readonly]').attr('disabled', false);
    });

    $(document).on('click', '.under-construction', function (event) {
        event.preventDefault();

        alert('Caracteristica en Construcción');
    });

    activeLink();

    $(document).on('navigation.success', function (event) {
        activeLink();
    });

    function activeLink() {
        var url = window.location.pathname;

        $(document).find('.sidebar-menu .active').removeClass('active');

        $(document).find('a[href="' + url + '"]').parents('li').addClass('active');
        $(document).find('.treeview[class="active"]').addClass('menu-open');
        $(document).find('.active > .treeview-menu').show();
    }

    $(document).on('focus', '.phone', function () {
        $(this).mask('(0000) 000-0000');
    });

    $(document).on('focus', '.money', function () {
        $(this).maskMoney({
            decimal: ',',
            thousands: '.',
            allowZero: true
        });
    });

    $(document).on('focus', '.rif', function () {
        $(this).mask('A-00000000-0', {
            translation: {
                'A': {pattern: /[vepgjc]/i},
                '0': {pattern: /[0-9]/}
            }
            , onKeyPress: function (value, event) {
                event.currentTarget.value = value.toUpperCase();
            }
        });
    });

    $(document).on('focus', '.bank-account', function () {
        $(this).mask('0000-0000-0000-0000-0000', {
            translation: {
                '0': {pattern: /[0-9]/}
            }
        });
    });


    $('.btn-new').appendTo('.add-btn-container');

    var table = [];

    $('.datatable').each(function (index) {
        table[index] = $(this).DataTable({
            ajax: $(this).data('src'),
            language: lang,
            responsive: true,
            dom: "<'row'<'col-sm-8 float-right-content'B><'col-sm-4'<'btn-add-container'>><'col-sm-12 date-filter-container'><'col-sm-6'l><'col-sm-6'f>><'row'<'col-sm-12'tr>><'row'<'col-sm-5'i><'col-sm-7'p>>",
            select: {
                style: 'os',
                selector: 'td:not(:last-child)',
                blurable: true
            },
            buttons: [
                {
                    extend: 'copy',
                    exportOptions: {
                        columns: ':not(:last-child)'
                    }
                },
                {
                    extend: 'csv',
                    exportOptions: {
                        columns: ':not(:last-child)'
                    }
                },
                {
                    extend: 'excel',
                    exportOptions: {
                        columns: ':not(:last-child)'
                    }
                },
                {
                    extend: 'pdf',
                    exportOptions: {
                        columns: ':not(:last-child)'
                    }
                },
                {
                    extend: 'print',
                    exportOptions: {
                        columns: ':not(:last-child)'
                    }
                }
            ]
        });
    });

    var tableFilter = [];

    $('.datatable-filter').each(function (index) {
        tableFilter[index] = $(this).DataTable({
            order: [0, 'DESC'],
            ajax: $(this).data('src'),
            language: lang,
            responsive: true,
            dom: "<'row'<'col-sm-8 float-right-content'B><'col-sm-4'<'btn-add-container'>><'col-sm-12 date-filter-container'><'col-sm-6'l><'col-sm-6'f>><'row'<'col-sm-12'tr>><'row'<'col-sm-5'i><'col-sm-7'p>>",
            initComplete: function (settings, json) {
                dateFilter(settings, json, 0);
            },
            select: {
                style: 'os',
                selector: 'td:not(:last-child)',
                blurable: true
            },
            buttons: [
                {
                    extend: 'copy',
                    exportOptions: {
                        columns: ':not(:last-child)'
                    }
                },
                {
                    extend: 'csv',
                    exportOptions: {
                        columns: ':not(:last-child)'
                    }
                },
                {
                    extend: 'excel',
                    exportOptions: {
                        columns: ':not(:last-child)'
                    }
                },
                {
                    extend: 'pdf',
                    exportOptions: {
                        columns: ':not(:last-child)'
                    }
                },
                {
                    extend: 'print',
                    exportOptions: {
                        columns: ':not(:last-child)'
                    }
                }
            ]
        });
    });

    $('#taxpayer-profile-economicActivity-table').appendTo($('#taxpayer-profile #appbundle_taxpayer_economicActivity').parents('.form-group'));

    $('#taxpayer-profile-economicActivity-table').DataTable({
        info: false,
        language: lang,
        lengthChange: false,
        paging: false,
        responsive: true,
        searching: false
    });

    $(document).on('change', '#appbundle_taxreturn_taxpayer', function () {

        var form = $(this).closest('form');
        var data = {};

        data[$(this).attr('name')] = $(this).val();
        data['_method'] = form.attr('method');

        $.ajax({
            type: 'POST',
            url: form.attr('action'),
            data: data,
            success: function (data) {
                $(document).find('#tax-return-data').replaceWith($(data).find('#tax-return-data'));
                $(document).find('#tax-return-data .help-block').hide();
                $(document).find('#tax-return-data .form-group').removeClass('has-error');

                initializeInputs();
            }
        });
    });

    $(document).on('keyup', '.declared-amount', function (event) {
        var aliquot = Number((decimalDecoder($(this).find('.form-control').val()) * Number($(this).data('aliquot'))) / 100);
        var minimumTaxable = Number($(this).data('minimum-taxable'));

        if (minimumTaxable > aliquot) {
            $(document).find($(this).data('id')).empty().html(minimumTaxable.toLocaleString('de', {
                minimumFractionDigits: 2,
                maximumFractionDigits: 2
            }));
        } else {
            $(document).find($(this).data('id')).empty().html(aliquot.toLocaleString('de', {
                minimumFractionDigits: 2,
                maximumFractionDigits: 2
            }));
        }

        var subtotal = 0;

        $(document).find('.amount-to-pay').each(function () {
            subtotal += decimalDecoder($(this).text());
        });

        $(document).find($('#tax-return-subtotal')).empty().html(subtotal.toLocaleString('de', {
            minimumFractionDigits: 2,
            maximumFractionDigits: 2
        }));

        var taxFine = ((subtotal * Number($(document).find('#tax-return-tax-fine').data('tax-fine'))) / 100);

        $(document).find($('#tax-return-tax-fine')).empty().html(taxFine.toLocaleString('de', {
            minimumFractionDigits: 2,
            maximumFractionDigits: 2
        }));

        var total = subtotal + taxFine;

        $(document).find($('#tax-return-total')).empty().html(total.toLocaleString('de', {
            minimumFractionDigits: 2,
            maximumFractionDigits: 2
        }));
    });

    var map = new Maplace({
        map_div: '#gmap',
        controls_type: 'list',
        view_all: false
    });

    $(document).on('click', '.modal-map', function (e) {
        e.preventDefault();

        $.ajax({
            type: 'POST',
            url: $(this).data('path'),
            success: function (data) {

                map.Load({
                    locations: data['locations'],
                    map_div: '#gmap',
                    controls_type: 'list',
                    view_all: false,
                    map_options: data['mapOptions']
                });

                $(document).find('#modal-map').modal('show');
            }
        });
    });
});

//================================================================================
//================================================================================
// functions
//================================================================================

function decimalDecoder(string) {
    string = string.replace(/\./g, '');
    string = string.replace(/,/g, '.');

    return Number(string);
}

function dateFilter(settings, json, dateColumn) {

    var table = settings.oInstance.api();

    $.fn.dataTable.ext.search.push(
        function (settings, data, dataIndex) {
            if ($('#startDate').val() === '' && $('#endDate').val() === '') {
                return true;
            }

            if ($('#startDate').val() !== '' || $('#endDate').val() !== '') {
                var iMin_temp = $('#startDate').val();
                if (iMin_temp === '') {
                    iMin_temp = '0/0/0';
                }

                var iMax_temp = $('#endDate').val();
                if (iMax_temp === '') {
                    iMax_temp = '9999/99/99';
                }

                var arr_min = iMin_temp.split('/');
                var arr_max = iMax_temp.split('/');
                var arr_date = data[dateColumn].split('/');
                var aux = arr_date[2].split(' ');
                arr_date[2] = aux[0];

                var iMin = new Date(arr_min[0], arr_min[1], arr_min[2], 0, 0, 0, 0);
                var iMax = new Date(arr_max[0], arr_max[1], arr_max[2], 0, 0, 0, 0);
                var iDate = new Date(arr_date[0], arr_date[1], arr_date[2], 0, 0, 0, 0);

                if (iMin === '' && iMax === '') {
                    return true;
                } else if (iMin === '' && iDate < iMax) {
                    return true;
                } else if (iMin <= iDate && '' === iMax) {
                    return true;
                } else if (iMin <= iDate && iDate <= iMax) {
                    return true;
                }

                return false;
            }
        }
    );

    $('#startDate').datepicker({
        format: 'yyyy/mm/dd',
        language: 'es',
        autoclose: true,
        todayHighlight: true
    }).on('changeDate', function (selected) {
        var minDate = new Date(selected.date.valueOf());
        $('#endDate').datepicker('setStartDate', minDate);
    });

    $('#endDate').datepicker({
        format: 'yyyy/mm/dd',
        language: 'es',
        autoclose: true,
        todayHighlight: true
    }).on('changeDate', function (selected) {
        var maxDate = new Date(selected.date.valueOf());
        $('#startDate').datepicker('setEndDate', maxDate);
    });

    $('#startDate, #endDate').on('changeDate', function () {
        table.draw();
    });
}

function initializeInputs() {

    $('.modal-container select[readonly]').attr('disabled', true);

    $('.selectpicker').selectpicker({
        actionsBox: true,
        liveSearch: true,
        selectedTextFormat: 'count'
    });

    $('.summernote').summernote({
        dialogsInBody: true,
        lang: 'es-ES'
    });

    if ($('.summernote').is('[readonly]')) {
        $('.summernote').summernote('disable');
    }

    $('.datatable-modal').DataTable({
        info: false,
        language: lang,
        lengthChange: false,
        paging: false,
        responsive: true,
        searching: false
    });
}
