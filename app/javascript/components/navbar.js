const initUpdateNavbarOnScroll = () => {
  const navbar = document.querySelector('.home-navbar');
  console.log(navbar)
  if (navbar) {
    window.addEventListener('scroll', () => {
      if (window.scrollY >= window.innerHeight) {
        navbar.classList.add('home-navbar-white');
      } else {
        navbar.classList.remove('home-navbar-white');
      }
    });
  }
}

export { initUpdateNavbarOnScroll };
