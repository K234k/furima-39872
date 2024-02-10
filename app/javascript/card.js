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

  const form = document.getElementById('charge-form')
  form.addEventListener("submit", (e) => {
    payjp.createToken(numberElement).then(function (response) {
      if (response.error) {
      } else {
        const token = response.id;
        const renderDom = document.getElementById("charge-form");
        const tokenObj = `<input value=${token} name='token' type="hidden">`;
        renderDom.insertAdjacentHTML("beforeend", tokenObj);
      }
      numberElement.clear();
      expiryElement.clear();
      cvcElement.clear();
      document.getElementById("charge-form").submit();
    });
    e.preventDefault();
  });
};

// ページロード時に関数を実行
window.addEventListener("turbo:load", pay);
window.addEventListener("turbo:render", pay);
