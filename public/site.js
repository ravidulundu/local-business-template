(() => {
  // Chrome: backdrop-filter on .site-header creates a new containing block,
  // breaking position:fixed on children. Move nav outside header on mobile.
  const siteHeader = document.querySelector(".site-header");
  const mainNav = document.getElementById("main-nav");
  if (siteHeader && mainNav) {
    const anchor = document.createElement("span");
    anchor.hidden = true;
    mainNav.before(anchor);
    const mq = window.matchMedia("(max-width: 980px)");
    function placeNav() {
      if (mq.matches) {
        if (mainNav.parentElement !== document.body) siteHeader.after(mainNav);
      } else {
        if (mainNav.parentElement !== anchor.parentElement) anchor.after(mainNav);
      }
    }
    placeNav();
    mq.addEventListener("change", placeNav);
  }
})();

(() => {
  const navToggle = document.querySelector(".nav-toggle");
  const mainNav = document.querySelector("#main-nav");
  if (navToggle && mainNav) {
    navToggle.addEventListener("click", () => {
      const isOpen = navToggle.getAttribute("aria-expanded") === "true";
      navToggle.setAttribute("aria-expanded", String(!isOpen));
      navToggle.setAttribute("aria-label", isOpen ? "Abrir menu de navegação" : "Fechar menu de navegação");
      mainNav.classList.toggle("is-open", !isOpen);
    });
    mainNav.querySelectorAll("a").forEach(link => {
      link.addEventListener("click", () => {
        navToggle.setAttribute("aria-expanded", "false");
        navToggle.setAttribute("aria-label", "Abrir menu de navegação");
        mainNav.classList.remove("is-open");
      });
    });
    document.addEventListener("keydown", e => {
      if (e.key === "Escape" && mainNav.classList.contains("is-open")) {
        navToggle.setAttribute("aria-expanded", "false");
        navToggle.setAttribute("aria-label", "Abrir menu de navegação");
        mainNav.classList.remove("is-open");
        navToggle.focus();
      }
    });
  }
})();

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
