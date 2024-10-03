const pay = () => {
  const publicKey = gon.public_key; // PAY.JPの公開鍵をgonから取得
  const payjp = Payjp(publicKey); // PAY.JP公開鍵
  const elements = payjp.elements();
  const numberElement = elements.create('cardNumber');
  const expiryElement = elements.create('cardExpiry');
  const cvcElement = elements.create('cardCvc');

  // カード入力用のフォームにマウント
  numberElement.mount('#number-form');
  expiryElement.mount('#expiry-form');
  cvcElement.mount('#cvc-form');

  const form = document.getElementById('charge-form');
  form.addEventListener("submit", (e) => {
    e.preventDefault(); // フォーム送信のデフォルト動作を停止

    // カード情報からトークンを作成
    payjp.createToken(numberElement).then((response) => {
      if (response.error) {
        // トークン作成エラー時の処理
        console.error("トークン作成エラー:", response.error.message);
        alert("カード情報の入力に問題があります。確認してください。");
      } else {
        // トークン作成成功時の処理
        const token = response.id;
        const renderDom = document.getElementById("charge-form");
        const tokenObj = `<input value=${token} name='token' type="hidden">`;
        renderDom.insertAdjacentHTML("beforeend", tokenObj);

        // カード情報のクリア
        numberElement.clear();
        expiryElement.clear();
        cvcElement.clear();

        // フォームの送信
        document.getElementById("charge-form").submit();
      }
    });
  });
};

// Turboによるページ読み込み時の処理
window.addEventListener("turbo:load", pay);
