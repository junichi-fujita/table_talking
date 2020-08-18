document.addEventListener('turbolinks:load', () => {
  // js.erb 内で使用できるように変数を定義しておく
  window.messageContainer = document.getElementById('message-container');

  // 以下のプログラムが他のページで動作しないようにしておく
  if (messageContainer === null) {
    return;
  }

  // App.room = App.cable.subscriptions.create("RoomChannel", {
  App.room = App.cable.subscriptions.create("RoomChannel", {
    play_room_id: $('#room').data('room_id'),
    connected: function () {
      // サブスクリプションがサーバーで使用できるようになったときに呼び出されます
    },

    disconnected: function () {
      // サブスクリプションがサーバーによって終了されたときに呼び出されます
    },

    received: function (data) {
      // このチャネルのWebSocketに着信データがあるときに呼び出されます
      messageContainer.insertAdjacentHTML('beforeend', data['message']);
    }
  });
});