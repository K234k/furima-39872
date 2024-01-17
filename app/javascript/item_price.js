window.addEventListener('load', () => {
  const priceInput = document.getElementById("item-price");
  if (priceInput) { // priceInputが存在するか確認
    priceInput.addEventListener("input", () => {
      const inputValue = priceInput.value;
      const addTaxDom = document.getElementById("add-tax-price");
      const profitDom = document.getElementById("profit");

      if (addTaxDom && profitDom) { // addTaxDomとprofitDomが存在するか確認
        // 入力した金額をもとに販売手数料を計算
        const tax = Math.floor(inputValue * 0.1);
        addTaxDom.innerHTML = tax;

        // 出品価格から販売手数料を引いて利益を計算
        const profit = inputValue - tax;  profitDom.innerHTML = profit;
      }
    });}
  });