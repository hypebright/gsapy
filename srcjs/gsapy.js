import { fadeIn, zoomIn } from './animations.js'

$(document).ready(function() {

  // look for elements that have the gsapy CSS class
  // and apply the fadeIn animation to them
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

  });

});
