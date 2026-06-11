(() => {
  const footer = document.querySelector(".site-footer");
  const backToTop = document.querySelector(".back-to-top");

  if (!footer || !backToTop) return;

  if (!("IntersectionObserver" in window)) {
    backToTop.classList.add("is-visible");
    return;
  }

  const observer = new IntersectionObserver(([entry]) => {
    backToTop.classList.toggle("is-visible", entry.isIntersecting);
  }, { rootMargin: "0px 0px 180px 0px", threshold: 0 });

  observer.observe(footer);
})();
