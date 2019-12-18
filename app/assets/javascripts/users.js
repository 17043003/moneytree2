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
});