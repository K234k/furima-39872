const price = () => {
    console.log("test")
    const priceInput = document.getElementById("item-price");
    if (!priceInput) return; // priceInputが存在しない場合、処理を中止
  
    priceInput.addEventListener("input", () => {
      const inputValue = Number(priceInput.value) || 0; // 数値変換し、不正な値が入力された場合は0とする
      const addTaxDom = document.getElementById("add-tax-price");
      const profitDom = document.getElementById("profit");
  
      if (!addTaxDom || !profitDom) {
        console.error('必要なDOM要素が見つかりません。');
        return; // addTaxDomとprofitDomが存在しない場合、処理を中止
      }
  
      const tax = Math.floor(inputValue * 0.1); // 販売手数料を計算
      addTaxDom.innerHTML = tax; // 販売手数料をDOMに表示
  
      const profit = inputValue - tax;  // 利益を計算
      profitDom.innerHTML = profit; // 利益をDOMに表示
    });
  };




window.addEventListener("turbo:load", price);
window.addEventListener("turbo:render", price);