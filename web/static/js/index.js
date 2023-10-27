/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */




 var swiper = new Swiper(".featured__filter", {
    spaceBetween: 20,
    centeredSlides: true,
    autoplay: {
      delay: 2000,
      disableOnInteraction: false
    },
    loop: true,
    breakpoints: {
      0: {
        slidesPerView: 1
      },
      640: {
        slidesPerView: 2
      },
      768: {
        slidesPerView: 2
      },
      1024: {
        slidesPerView: 3
      },
    }
  });


// end banner