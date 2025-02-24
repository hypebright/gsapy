import { gsap, ScrollTrigger } from './init.js';

// Utils
// function to make sure any previous animations are killed before applying a new one
function killAnimations(animationClass) {
    gsap.utils.toArray('.' + animationClass).forEach((el) => {
      // Kill any existing tweens on this element
      gsap.killTweensOf(el);

      // Kill any ScrollTrigger instances attached to this element
      ScrollTrigger.getAll().forEach(trigger => {
          if (trigger.trigger === el) {
              trigger.kill();
          }
      });

      // Clear inline styles applied by GSAP
      gsap.set(el, { clearProps: 'all' });
  });
}

// 1. fadeIn animation
// This animation fades in elements on scroll down, and fades out on scroll up

function fadeIn(animationClass) {

  // kill any previous animations
  killAnimations(animationClass);

  // scroll down
  gsap.utils.toArray('.' + animationClass).forEach((el, i) => {
    gsap.from(el, {
      scrollTrigger: {
        trigger: el,
        start: 'top 80%',
        toggleActions: 'play none none none'
      },
      overwrite: true,
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
      overwrite: true,
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

  // kill any previous animations
  killAnimations(animationClass);

  // scroll down
  gsap.utils.toArray('.' + animationClass).forEach((el, i) => {
    gsap.from(el, {
      scrollTrigger: {
        trigger: el,
        start: 'top 80%',
        toggleActions: 'play none none none'
      },
      overwrite: true,
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
      overwrite: true,
      scale: 1,
      opacity: 1,
      duration: 1,
      delay: 0.5
    });
  });
}

// 3. slideIn animation
// TODO

// 4. accordion animation
// Display elements as accordion

function accordion(animationClass) {
  // Kill any previous animations
  killAnimations(animationClass);

  gsap.utils.toArray('.' + animationClass).forEach((el, i) => {
    gsap.from(el, {
      scrollTrigger: {
        trigger: el,
        pin: true,
        scrub: true,
        pinSpacing: false,
        ease: 'linear'
      },
      overwrite: true,
      duration: 1,
      delay: 0.5
    });
  });
}

// export functions
export { fadeIn, zoomIn, accordion };
