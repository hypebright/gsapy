import { gsap } from './init.js';

// 1. fadeIn animation
// This animation fades in elements on scroll down, and fades out on scroll up

function fadeIn(animationClass) {

  // scroll down
  gsap.utils.toArray('.' + animationClass).forEach((el, i) => {
    gsap.from(el, {
      scrollTrigger: {
        trigger: el,
        start: 'top 80%',
        toggleActions: 'play none none none'
      },
      y: 50,
      opacity: 0,
      duration: 1,
      delay: 0.5
    });
  });

  // scroll up
  gsap.utils.toArray('.' + animationClass).forEach((el, i) => {
    gsap.to(el, {
      scrollTrigger: {
        trigger: el,
        start: 'top 80%',
        toggleActions: 'play none none reverse'
      },
      y: 0,
      opacity: 1,
      duration: 1,
      delay: 0.5
    });
  });
}

// 2. zoomIn animation
// This animation zooms in elements on scroll down, and zooms out on scroll up

function zoomIn(animationClass) {

  // scroll down
  gsap.utils.toArray('.' + animationClass).forEach((el, i) => {
    gsap.from(el, {
      scrollTrigger: {
        trigger: el,
        start: 'top 80%',
        toggleActions: 'play none none none'
      },
      scale: 0.5,
      opacity: 0,
      duration: 1,
      delay: 0.5
    });
  });

  // scroll up
  gsap.utils.toArray('.' + animationClass).forEach((el, i) => {
    gsap.to(el, {
      scrollTrigger: {
        trigger: el,
        start: 'top 80%',
        toggleActions: 'play none none reverse'
      },
      scale: 1,
      opacity: 1,
      duration: 1,
      delay: 0.5
    });
  });
}

// export functions
export { fadeIn, zoomIn };
