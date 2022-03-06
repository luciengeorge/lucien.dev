// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
require("@rails/ujs").start();
require("@rails/activestorage").start();
require("channels");
require("trix");
require("@rails/actiontext");

import "controllers";
import AOS from 'aos';
import 'stylesheets/tailwind/before.scss';
import 'stylesheets/application.scss';
import 'stylesheets/tailwind/after.scss';
import 'aos/dist/aos.css';
import '@animated-burgers/burger-rotate/dist/styles.css';
import gtag from './components/analytics';

document.addEventListener('turbo:load', () => {
  const vh = window.innerHeight * 0.01;
  document.documentElement.setProperty('--vh', `${vh}px`);
  AOS.init();
});
