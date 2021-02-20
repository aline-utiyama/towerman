const active = () => {
  const text = document.querySelector(".white-card");
    text.addEventListener('click', (event) => {
      console.log(event);
    });
}

active();

export {active};
