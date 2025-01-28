import { gsap } from './init.js';

// TESTING PURPOSES //
$(document).ready(function() {

  // show cards one by one on scroll
  gsap.utils.toArray('.card:not(.bslib-value-box)').forEach((card, i) => {
    gsap.from(card, {
      scrollTrigger: {
        trigger: card,
        start: 'top 80%',
        toggleActions: 'play none none none'
      },
      y: 50,
      opacity: 0,
      duration: 1,
      delay: 0.5
    });
  });

  // reverse animation on scroll up
  gsap.utils.toArray('.card:not(.bslib-value-box)').forEach((card, i) => {
    gsap.to(card, {
      scrollTrigger: {
        trigger: card,
        start: 'top 80%',
        toggleActions: 'play none none reverse'
      },
      y: 0,
      opacity: 1,
      duration: 1,
      delay: 0.5
    });
  });


});
