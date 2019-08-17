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



function showModal(url, title, width, height, divId) {
    var title = title ? title.trim() : "";
    var width = width ? width : "100%";
    var height = height ? height : "100%";
    //var modal = $(_.template(TemplateManager.get('modal-template'))({
    var modal = $(_.template($('#modal-template').html())({
        title: title,
        url: url
        //,
        //width: width,
        //height: height
    })).modal({
        show: true,
        keyboard: true,
        url: url,
        backdrop: 'static' 
    }).on('hidden.bs.modal', function () {
        $(this).find('iframe').html("").attr("src", "");
        $('#'+divId+'').remove();
    })
    // mordal
    //modal.find('#iframe-loading').show();
    //modal.find('iframe').on("load", function () {
    //    modal.find('#iframe-loading').hide();
    //});
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
    $('body').on('click', 'a.trigger-modal', function () {
        typeof (showModal) === 'function' ?
            //showModal($(this).attr('data-url'), $(this).text(), $(this).attr('data-width'), $(this).attr('data-height')) :
            showModal($(this).attr('data-url'), '[' + $(this).text() + ']     主題:' + $(this).attr('data-text'), $(this).attr('data-width'), $(this).attr('data-height'), $(this).attr('data-divId')) :
            alert('"showModal" is not available.');
    });

    /*
    //解决模态框背景色越来越深的问题
    $(document).on('show.bs.modal', '.modal', function (event) {
        $(this).appendTo($('body'));
    }).on('shown.bs.modal', '.modal.in', function (event) {
        setModalsAndBackdropsOrder();
    }).on('hidden.bs.modal', '.modal', function (event) {
        setModalsAndBackdropsOrder();
    });

    function setModalsAndBackdropsOrder() {
        var modalZIndex = 1040;
        $('.modal.in').each(function (index) {
            var $modal = $(this);
            modalZIndex++;
            $modal.css('zIndex', modalZIndex);
            $modal.next('.modal-backdrop.in').addClass('hidden').css('zIndex', modalZIndex - 1);
        });
        $('.modal.in:visible:last').focus().next('.modal-backdrop.in').removeClass('hidden');
    }

    //覆盖Modal.prototype的hideModal方法
    $.fn.modal.Constructor.prototype.hideModal = function () {
        var that = this
        this.$element.hide()
        this.backdrop(function () {
            //判断当前页面所有的模态框都已经隐藏了之后body移除.modal-open，即body出现滚动条。
            $('.modal.fade.in').length === 0 && that.$body.removeClass('modal-open')
            that.resetAdjustments()
            that.resetScrollbar()
            that.$element.trigger('hidden.bs.modal')
        })
    }
    */


})
