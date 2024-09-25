const price = () => {

  const priceInput = document.getElementById("item-price");
  if (priceInput) {  // priceInputが存在する場合のみ、イベントを追加
    priceInput.addEventListener("input", () => {
      const inputValue = priceInput.value;
      console.log(inputValue);
      
      // 販売手数料（例: 10%）
      const tax = Math.floor(inputValue * 0.1);

      // 販売利益
      const profit = inputValue - tax;

      // 手数料を表示するDOMを取得し、計算結果を代入
      const addTaxDom = document.getElementById("add-tax-price");
      addTaxDom.innerHTML = tax;

      // 利益を表示するDOMを取得し、計算結果を代入
      const profitDom = document.getElementById("profit");
      profitDom.innerHTML = profit;
    });
  }
};

// turbo:loadとturbo:renderイベントでprice関数を呼び出す
window.addEventListener("turbo:load", price);
window.addEventListener("turbo:render", price);
