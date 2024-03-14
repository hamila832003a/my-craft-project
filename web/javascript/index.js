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