
function toggleDropDown(){
  const dropdown = document.getElementById("dropDownCont");
  dropdown.classList.toggle("show");
}

document.addEventListener('DOMContentLoaded', () => {
  const dropdown = document.getElementById("dropDownCont");
  const container = dropdown.parentElement;

  container.addEventListener("mouseleave", () => {
    dropdown.classList.remove("show");
  });
});
