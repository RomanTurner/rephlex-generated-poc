const target = document.querySelector(".target");
const trigger = document.querySelector(".trigger");

const handleClick = () => {
  target.classList.toggle("success");
};

trigger.addEventListener("click", handleClick);
