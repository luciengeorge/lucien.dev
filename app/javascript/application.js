import "@hotwired/turbo-rails";
import "controllers";
import "trix";
import "@rails/actiontext";
import AOS from 'aos';
import gtag from './components/analytics';

document.addEventListener('turbo:load', () => {
  const vh = window.innerHeight * 0.01;
  document.documentElement.style.setProperty('--vh', `${vh}px`);
  AOS.init();
});
