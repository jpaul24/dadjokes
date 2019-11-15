import Typed from 'typed.js';

const loadDynamicBannerText = () => {
  new Typed('#banner-typed-text', {
    strings: ["groan", "laugh", "chortle", "chuckle", "outraged"],
    typeSpeed: 100,
    loop: true
  });
}

export { loadDynamicBannerText };
