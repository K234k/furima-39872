const pay = () => {
  const publicKey = gon.public_key; // PAY.JPの公開鍵
  const payjp = Payjp(publicKey); // PAY.JPオブジェクトの初期化
  const elements = payjp.elements();

  // クレジットカード情報入力用の要素を生成
  const numberElement = elements.create('cardNumber');
  const expiryElement = elements.create('cardExpiry');
  const cvcElement = elements.create('cardCvc');
  // 生成した要素をDOMにマウント
  numberElement.mount('#number-form');
  expiryElement.mount('#expiry-form');
  cvcElement.mount('#cvc-form');

  // フォームの送信イベントを処理
  const form = document.getElementById('charge-form');
  form.addEventListener("submit", (e) => {
    e.preventDefault(); // デフォルトのフォーム送信をキャンセル
    // PAY.JPを使用してトークンを生成
    payjp.createToken(numberElement).then(function (response) {
      if (response.error) {
        // エラー処理
        console.log("Error:", response.error);
      } else {
        // トークンが生成された場合の処理
        const token = response.id;
        const renderDom = document.getElementById("charge-form");
        const tokenObj = `<input value=${token} name='token' type="hidden">`;
        renderDom.insertAdjacentHTML("beforeend", tokenObj);
        // クレジットカード情報のフィールドをクリア
        numberElement.clear();
        expiryElement.clear();
        cvcElement.clear();
    
        // トークンを含むフォームを送信
        document.getElementById("charge-form").submit();
      }
    });
  });
};

// ページロード時に関数を実行
window.addEventListener("turbo:load", pay);
window.addEventListener("turbo:render", pay);
