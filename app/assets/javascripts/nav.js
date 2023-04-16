document.addEventListener("DOMContentLoaded", function() {
    const icon = document.querySelector('.fa-solid');
    const menu = document.querySelector('nav ul');
    
    icon.addEventListener('click', function() {
      menu.classList.toggle('show');
    });
      });
  