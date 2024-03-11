//= require jquery
$(document).ready(function() {
    $('.toggleReplies').on('click', function() {
        console.log("i was called")
        var commentId = $(this).data('comment-id');
        var $button = $(this);
        var $replies = $('#comment_' + commentId + ' .reply');

        $replies.toggleClass('hidden');

        if ($replies.hasClass('hidden')) {
            $button.text('View ' + $button.data('replies-count') + ' replies');
        } else {
            $button.text('Hide Replies');
        }
    });
});