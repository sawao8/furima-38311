const pay = () => {
  Payjp.setPublicKey("pk_test_6ead44cb71b47c5adcd4aff6");
  const form = document.getElementById("charge-form");
  form.addEventListener("submit", (e) => {
    e.preventDefault();

    const formResult = docment.getElementById("charge-form");
    const formDate = new FormDate(formResult);

    const card = {
      number: formDate.get("order_address[number]"),
      exp_month: formDate.get("order_address[exp_month]"),
      exp_year: `20${formDate.get("order_address[exp_year]")}`,
      cvc: formDate.get("order_address[cvc]"),
    };

    Payjp.createToken(card, (status, response) => {
      if (status == 200) {
        const token = response.id;
        const renderDom = document.getElementById("charge-form");
        const tokenObj = `<input value=${token} name='token' type="hidden"> `;
        renderDom.insertAdjacentHTML("beforeend", tokenObj);
      }

      document.getElementById("order_number").removeAttribute("name");
      document.getElementById("order_exp_month").removeAttribute("name");
      document.getElementById("order_exp_year").removeAttribute("name");
      document.getElementById("order_cvc").removeAttribute("name");

      document.getElementById("charge-form").submit();
    });
  });
};

window.addEventListener("load", pay);