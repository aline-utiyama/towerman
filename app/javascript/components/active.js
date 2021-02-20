const activeButton = () => {
  const text = document.querySelector("#post_reply_comment");
    text.addEventListener('keyup', (event) => {
      console.log(event);
    });
}

export {activeButton};
