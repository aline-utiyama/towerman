const firstTest = () => {
  const text = document.querySelector(".main-button");
    text.addEventListener('click', (event) => {
      console.log(event);
    });
}

export {firstTest};
