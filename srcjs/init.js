// core
import { gsap } from 'gsap';

// plugins
import { ScrollTrigger } from 'gsap/ScrollTrigger';
import { SplitText } from 'gsap/SplitText';
import { DrawSVGPlugin } from 'gsap/DrawSVGPlugin';

// dev
import { GSDevTools } from "gsap/GSDevTools";

// registrations
gsap.registerPlugin(ScrollTrigger);
gsap.registerPlugin(SplitText);
gsap.registerPlugin(DrawSVGPlugin);
gsap.registerPlugin(GSDevTools); // for debugging purposes only

// exports
export { gsap, ScrollTrigger, SplitText, DrawSVGPlugin, GSDevTools };
