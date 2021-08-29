import consumer from "./consumer"

consumer.subscriptions.create("CommentChannel", {
  connected() {
    // Called when the subscription is ready for use on the server
  },

  disconnected() {
    // Called when the subscription has been terminated by the server
  },

  received(data) {
    const html = `<p><strong> <a href="/users/${data.comment.user_id}">
     ${data.user_name.nickname} </a></strong> : &thinsp; ${data.comment.text}</p>`;
    const comments = document.getElementById('comment_list');
    const newComment = document.getElementById('comment_text');
    comments.insertAdjacentHTML('afterbegin', html);
    newComment.value='';
  }
});
