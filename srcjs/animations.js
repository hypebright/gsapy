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

// function that checks if given class is found, returns warning when not
function checkClassExists(className) {
  const elements = gsap.utils.toArray('.' + className);
  if (!elements.length) {
    console.warn(`No elements found for class: ${className}`);
    return false;
  }
  return true;
}

// 1. fadeIn animation
// This animation fades in elements on scroll down, and fades out on scroll up
function fadeIn(animationClass) {
  // check for class
  if (!checkClassExists(animationClass)) {
    return;
  }

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
  // check for class
  if (!checkClassExists(animationClass)) {
    return;
  }

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
function slideIn(animationClass) {
  // check for class
  if (!checkClassExists(animationClass)) {
    return;
  }

  // Kill any previous animations
  killAnimations(animationClass);

  gsap.utils.toArray('.' + animationClass).forEach((el, i) => {
    gsap.from(el, {
      scrollTrigger: {
        trigger: el,
        start: 'top 80%',
        toggleActions: 'play none none none'
      },
      overwrite: true,
      x: -100,
      opacity: 0,
      duration: 1,
      delay: 0.5
    });
  });

  gsap.utils.toArray('.' + animationClass).forEach((el, i) => {
    gsap.to(el, {
      scrollTrigger: {
        trigger: el,
        start: 'top 80%',
        toggleActions: 'play none none reverse'
      },
      overwrite: true,
      x: 0,
      opacity: 1,
      duration: 1,
      delay: 0.5
    });
  });

}

// 4. stack animation
// Display elements as stack
function stack(animationClass) {
  // check for class
  if (!checkClassExists(animationClass)) {
    return;
  }

  // Kill previous animations
  killAnimations(animationClass);

  gsap.timeline({
    scrollTrigger: {
      trigger: '.gsapy-animations',
      pin: true,
      start: 'top top',
      end: 'bottom top',
      scrub: 1,
      ease: 'linear'
    }
  }).to('.' + animationClass, {
    height: 0,
    paddingBottom: 0,
    opacity: 0,
    stagger: 0.5
  });
}

// export functions
export { fadeIn, zoomIn, stack, slideIn };
