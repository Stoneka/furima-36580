import consumer from "./consumer"

consumer.subscriptions.create("CommentChannel", {
  connected() {
    // Called when the subscription is ready for use on the server
  },

  disconnected() {
    // Called when the subscription has been terminated by the server
  },

  received(data) {
    debugger
    const html = `<p>
                    :${data.text.text}</p>`;
    const comments = document.getElementById('comment_list');
    const newComment = document.getElementById('comment_text');
    comments.insertAdjacentHTML('afterbegin', html);
    newComment.value='';
  }
});
