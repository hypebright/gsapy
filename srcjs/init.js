// core
import { gsap } from 'gsap';

// plugins
import { ScrollTrigger } from 'gsap/ScrollTrigger';
import { SplitText } from 'gsap/SplitText';

// registrations
gsap.registerPlugin(ScrollTrigger);
gsap.registerPlugin(SplitText);

// exports
export { gsap, ScrollTrigger, SplitText };
