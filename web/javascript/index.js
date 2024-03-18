const timeline = gsap.timeline({
  defaults: { duration: .25, ease: "easeInOut" }
});

  timeline.fromTo(".overlay01", { x: -2000,  opacity: 1, delay: .15 }, {x: 0})
  .fromTo(".overlay02", { x: 2000,  opacity: 1, delay: .15 }, {x: 0})
  .fromTo(".overlay03", { y: -2000,  opacity: 1, delay: .15 }, {y: 0})
  .to(".overlay03", { x: '-2000', opacity: 0, delay: .15 })
  .to(".overlay02", { x: '2000', opacity: 0, delay: .15 })
  .to(".overlay01", { y: '2000', opacity: 0 })
  .to(".overlay-main", { duration: 0, display: 'none' })
  .to(".overlay01", { duration: 0, display: 'none' })
  .to(".overlay02", { duration: 0, display: 'none' })
  .to(".overlay03", { duration: 0, display: 'none' })
  .fromTo(".wrapper", { opacity: 0}, {opacity: 1})
//   .from(chars, {
//     delay: .1,
//     duration: 0.8,
//     opacity:0,
//     ease:"circ.out",
//     stagger: 0.02,
// }, "+=0")
;


  const anim = gsap.fromTo(".circleRing", 
  {rotation: 0},
  {rotation: 360,
   repeat: -1,
   ease: "none",
   duration: 6
  });

  ScrollTrigger.create({
    trigger: ".c",
    animation: anim,
    // Uncomment these to see how they affect the ScrollTrigger
    // markers: true,
    // start: "top center",
    // end: "top 100px",
    // toggleClass: "active",
    // pin: true,
    // scrub: 1,
    // onUpdate: self => {
    //   console.log("progress:", self.progress.toFixed(3), "direction:", self.direction, "velocity", self.getVelocity());
    // }
  });

  "use strict";
gsap.registerPlugin(ScrollTrigger);

/* this needs to be fixed on resize */
gsap.utils.toArray(".slider").forEach(element => {

  let sliderWidth = element.offsetWidth;

  gsap.to(element, {
    x: `-${document.querySelector(".slider").clientWidth - window.innerWidth}px`,
    ease: "none",
    scrollTrigger: {
      trigger: ".section-scroll",
      start: "top top",
      end: "+=" + sliderWidth,
      pin: true,
      // pinSpacing: true,
      scrub: 1,
      markers: true,
    },
  });
});