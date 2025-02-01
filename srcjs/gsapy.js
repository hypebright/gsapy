import { fadeIn } from './animations.js'

$(document).ready(function() {

  // look for elements that have data-gsapy-id attribute
  $('[data-gsapy-id]').each(function() {

    const id = $(this).data('gsapy-id');
    const animation = $(this).data('gsapy-animation');

    if (animation === 'fadeIn') {
      fadeIn(id);
    }

  });

});
