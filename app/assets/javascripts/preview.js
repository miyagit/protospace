$(document).on('turbolinks:load', function () {

 //画像ファイルプレビュー表示のイベント追加 fileを選択時に発火するイベントを登録
  $('input[type=file]').change( function(e) {
    var file = e.target.files[0],
        reader = new FileReader(),
        t = this;
        img = $(this).prev()[0];

   // 画像ファイル以外の場合は何もしない
    if(file.type.indexOf("image") < 0){
      alert('画像を選択してください');
      $(this).val('');
      return false;
    }

   // ファイル読み込みが完了した際のイベント登録
    reader.onload = (function(file) {
      return function(e) {
        $(img).attr({
                  src: e.target.result,
                  width: "100%",
                  height:"100%",
                  class: "preview",
                  title: file.name
              });
      };
    })(file);

   reader.readAsDataURL(file);
  });
});
