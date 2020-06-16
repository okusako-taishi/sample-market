window.addEventListener('DOMContentLoaded', function(){
    let submit = document.getElementById("payment_card_submit-button"); //IDがtoken_submitの場合に取得されます
    Payjp.setPublicKey('pk_test_fd131483f6fd624848a9c8ef'); //ここに公開鍵を直書き
      submit.addEventListener('click', function(e){ //ボタンが押されたときに作動します
      e.preventDefault(); //ボタンを一旦無効化します
      let card = {
        number: document.getElementById("payment_card_no").value,
        cvc: document.getElementById("payment_card_cvc").value,
        exp_month: document.getElementById("payment_card_month").value,
        exp_year: document.getElementById("payment_card_year").value
      }; //入力されたデータを取得します。
      Payjp.createToken(card, function(status, response) {
        if (status === 200) { //成功した場合
          $(".number").removeAttr("name");
          $(".cvc").removeAttr("name");
          $(".exp_month").removeAttr("name");
          $(".exp_year").removeAttr("name"); //データを自サーバにpostしないように削除
          $("#charge-form").append(
            $('<input type="hidden" name="payjp-token">').val(response.id)
          ); //取得したトークンを送信できる状態にします
          document.inputForm.submit();
          alert("登録が完了しました"); //確認用
        } else {
          alert("カード情報が正しくありません。"); //確認用
        }
      });
    });
  });