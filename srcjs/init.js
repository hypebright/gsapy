// core
import { gsap } from 'gsap';

// plugins
import { ScrollTrigger } from 'gsap/ScrollTrigger';
import { SplitText } from 'gsap/SplitText';
import { DrawSVGPlugin } from 'gsap/DrawSVGPlugin';

// registrations
gsap.registerPlugin(ScrollTrigger);
gsap.registerPlugin(SplitText);
gsap.registerPlugin(DrawSVGPlugin);

// exports
export { gsap, ScrollTrigger, SplitText, DrawSVGPlugin };
