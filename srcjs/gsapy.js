import { fadeIn, zoomIn, stack, slideIn, staggerText } from './animations.js'

$(document).ready(function() {

  // look for elements that have the gsapy CSS class
  $('.gsapy').each(function() {

    const animation = $(this).data('gsapy-animation');

    // append class to element that is a combination of 'gsapy' and the animation
    const animationClass = 'gsapy-' + animation;
    $(this).addClass(animationClass);

    if (animation === 'fadeIn') {
      fadeIn(animationClass);
    }

    if (animation === 'zoomIn') {
      zoomIn(animationClass);
    }

    if (animation === 'stack') {
      stack(animationClass);
    }

    if (animation === 'slideIn') {
      slideIn(animationClass);
    }

    if (animation === 'stagger') {
      staggerText(animationClass);
    }

  });

  // receive message from Shiny
  Shiny.addCustomMessageHandler('update-gsapy', function(message) {
    const elements = document.querySelectorAll('[data-gsapy-id="' + message.id + '"]');

    // remove current animation class (everything starting with gsapy-, e.g. gsapy-zoomIn)
    elements.forEach(function(element) {
      const currentAnimationClass = Array.from(element.classList).find(function(className) {
        return className.startsWith('gsapy-');
      });
      if (currentAnimationClass) {
        element.classList.remove(currentAnimationClass);
      }
    });

    // new animation
    const animationClass = 'gsapy-' + message.animation;

    // append animationClass to all elements
    elements.forEach(function(element) {
      element.classList.add(animationClass);
      element.setAttribute('data-gsapy-animation', message.animation);
    });

    if (message.animation === 'fadeIn') {
      fadeIn(animationClass);
    }

    if (message.animation === 'zoomIn') {
      zoomIn(animationClass);
    }

    if (message.animation === 'stack') {
      stack(animationClass);
    }

    if (message.animation === 'slideIn') {
      slideIn(animationClass);
    }

    if (message.animation === 'stagger') {
      staggerText(animationClass);
    }

  });

});
