TemplateManager = {
    templates: {},
    load: function (names) {
        var that = this;
        $.each(names, function (index, name) {
            $.get('tpl/' + name + '.html', function (data) {
                that.templates[name] = data;
            });
        });
    },
    get: function (name, callback) {
        return this.templates[name];
    }
};



function showModal(url, title, width, height) {
    var title = title ? title.trim() : "";
    var width = width ? width : "100%";
    var height = height ? height : "100%";
    //var modal = $(_.template(TemplateManager.get('modal-template'))({
    var modal = $(_.template($('#modal-template').html())({
        title: title,
        url: url,
        width: width,
        height: height
    })).modal({
        show: true,
        keyboard: true,
        url: url
    }).on('hidden.bs.modal', function () {
        $(this).find('iframe').html("").attr("src", "");
        $('#dynamicallyInjectedModal').remove();
    })
    //.on('show', function () {
    //    $('.modal-body', this).css({ width: 'auto', height: 'auto', 'max-height': '100%', 'max-width': '100%' });
    //});
    modal.find('#iframe-loading').show();
    modal.find('iframe').on("load", function () {
        modal.find('#iframe-loading').hide();
    });
}

function myformatter(date) {
    var y = date.getFullYear();
    var m = date.getMonth() + 1;
    var d = date.getDate();
    return y + '/' + (m < 10 ? ('0' + m) : m) + '/' + (d < 10 ? ('0' + d) : d);
}


function getParameterByName(name, url) {
    if (!url) url = window.location.href;
    name = name.replace(/[\[\]]/g, '\\$&');
    var regex = new RegExp('[?&]' + name + '(=([^&#]*)|&|#|$)'),
        results = regex.exec(url);
    if (!results) return null;
    if (!results[2]) return '';
    return decodeURIComponent(results[2].replace(/\+/g, ' '));
}

function myparser(s) {
    if (!s) return new Date();
    var ss = (s.split('/'));
    var y = parseInt(ss[0], 10);
    var m = parseInt(ss[1], 10);
    var d = parseInt(ss[2], 10);
    if (!isNaN(y) && !isNaN(m) && !isNaN(d)) {
        return new Date(y, m - 1, d);
    } else {
        return new Date();
    }
}

$(function () {
    //$('body').on('click', 'a.trigger-modal', function () {
    //    typeof (showModal) === 'function' ?
    //        showModal($(this).attr('data-url'), $(this).text(), $(this).attr('data-width'), $(this).attr('data-height')) :
    //        alert('"showModal" is not available.');
    //});

    var remoto_href = '';

    $('body').on('click', '[data-toggle="modal"]', function () {

        if (remoto_href != jQuery(this).data("remote")) {

            remoto_href = jQuery(this).data("remote");

            jQuery(jQuery(this).data("target")).removeData('bs.modal');

            jQuery(jQuery(this).data("target")).find('.modal-body').empty();

            jQuery(jQuery(this).data("target") + ' .modal-body').load('Close.html');
        }

    });

})
