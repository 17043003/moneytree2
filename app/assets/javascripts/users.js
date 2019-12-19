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
        event.stopPropagation(); // フォーム部分をクリックしてもモーダルが消えないようにする
    });


    $(document).on('click', '.signup-btn', function () {
        $('.signup-modal').show();
    });

    $(document).on('click', '.signup-modal', function () {
        $('.signup-modal').hide();
    });

    $(document).on('click', '.signup-content', function (event) {
        event.stopPropagation(); // フォーム部分をクリックしてもモーダルが消えないようにする
    });
});