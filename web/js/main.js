// navigation menu
document.getElementById('sm-menu-f').addEventListener('click', checkNav);
window.addEventListener("keyup", function (e) {
  if (e.keyCode == 27) closeNav();
}, false);

function checkNav() {
  if (document.body.classList.contains('hamburgler-active')) {
    closeNav();
  } else {
    openNav();
  }
}

function closeNav() {
  document.body.classList.remove('hamburgler-active');
}

function openNav() {
  document.body.classList.add('hamburgler-active');
}

//  Dropdown menu on navigation
// Loop through all dropdown buttons to toggle between hiding and showing its dropdown content - This allows the user to have multiple dropdowns without any conflict 
var dropdown = document.getElementsByClassName("dropdown-btn");
var i;

for (i = 0; i < dropdown.length; i++) {
  dropdown[i].addEventListener("click", function () {
    this.classList.toggle("active");
    var dropdownContent = this.nextElementSibling;
    if (dropdownContent.style.display === "block") {
      dropdownContent.style.display = "none";
    } else {
      dropdownContent.style.display = "block";
    }
  });
}