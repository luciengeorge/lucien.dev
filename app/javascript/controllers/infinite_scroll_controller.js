import { Controller } from 'stimulus';
import Rails from "@rails/ujs";
import _ from 'lodash';

export default class extends Controller {
  static targets = [ 'entries', 'pagination', 'loader', 'image' ];
  static offset = 300;

  initialize() {
    this.scroll = _.throttle(this.scroll, 500);
  }

  scroll() {
    let url = this.paginationTarget.querySelector("a[rel='next']")?.href;
    const body = document.body;
    const html = document.documentElement;
    const height = Math.max(body.scrollHeight, body.offsetHeight, html.clientHeight, html.scrollHeight, html.offsetHeight);

    if (window.pageYOffset >= height - (window.innerHeight + this.constructor.offset) && url) {
      this.loadNextData(url);
    }
  }

  loadNextData(url) {
    this.loaderTarget.classList.remove('hidden');
    window.scrollTo({
      top: document.body.scrollHeight,
      behavior: 'smooth'
    });
    Rails.ajax({
      type: 'GET',
      url: url,
      dataType: 'json',
      success: (data) => {
        this.entriesTarget.insertAdjacentHTML('beforeend', data.entries);
        this.paginationTarget.innerHTML = data.pagination;
        this.loaderTarget.classList.add('hidden');
        const observer = new IntersectionObserver(
        (entries, observer) => {
          entries.forEach(entry => {
            entry.target.src = entry.target.dataset.src;
            observer.unobserve(entry.target);
          });
        },
        { rootMargin: "0px" });
        this.imageTargets.forEach(target => observer.observe(target));
        this.element.dispatchEvent(new Event('loaded'));
      }
    })
  }
}
