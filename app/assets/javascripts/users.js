//= require rails-ujs
//= require activestorage
//= require jquery
//= require turbolinks
//= require_tree .

$(function () {
    $(document).on('click', '.signin-btn', function () {
        $('.signin-modal').show();
        // $('.signin-body').show();
    });

    $(document).on('click', '.signin-modal', function () {
        $('.signin-modal').hide();
    });

    $(document).on('click', '.signin-content', function (event) {
        event.stopPropagation();
    });
});