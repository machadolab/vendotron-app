// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require twitter/bootstrap
//= require bootstrap-select/js/bootstrap-select
//= require intercooler-js/src/intercooler
//= require_tree .


var column = '';
var row = '';

$(function() {
    $('body').on("beforeHistorySnapshot.ic",  function(evt, elt){
        $(elt).find('.slot-select').selectpicker('destroy');
    });
});

Intercooler.ready(function(elt) {

    $(elt).find('.slot-select').selectpicker();

    $(elt).find('#column-input').on('change', function() {
        column = $(this).val();
        setIcSrc();
        return column != '' && row != '';
    });

    $(elt).find('#row-input').on('change', function() {
        row = $(this).val();
        setIcSrc();
        return column != '' && row != '';
    });

});

function setIcSrc() {
    $('#slot-form').attr('ic-src','/slots/'+column+row);
}