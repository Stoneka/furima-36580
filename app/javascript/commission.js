 function taxProgram() {
  const priceInput = document.getElementById("item-price");
  priceInput.addEventListener("input", () => {
  const inputValue = priceInput.value;
  const commission = document.getElementById("add-tax-price");
    commission.innerHTML = inputValue/10
  const profitAmount = document.getElementById("profit");
    profitAmount.innerHTML = inputValue*9/10
  })
  
};

window.addEventListener('load', taxProgram)