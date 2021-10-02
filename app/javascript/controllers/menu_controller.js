import { Controller } from 'stimulus';

export default class extends Controller {
  static targets = [ 'menu', 'background', 'link', 'burger' ];
  static classes = [ 'active', 'scale', 'open' ];

  toggle(event) {
    if (event.type === 'keyup' && event.key !== 'Escape') return;

    if (event.type === 'keyup' && event.key === 'Escape' || event.type === 'click' && event.currentTarget === this.backgroundTarget) {
      this.menuTarget.classList.remove(this.activeClass);
      this.burgerTarget.classList.remove(this.openClass);
      setTimeout(() => {
        this.backgroundTarget.classList.add(this.scaleClass);
      }, 500);
      this.linkTargets.forEach(target => target.classList.remove(this.activeClass));
    } else {
      this.menuTarget.classList.toggle(this.activeClass);
      this.burgerTarget.classList.toggle(this.openClass);
      if (this.backgroundTarget.classList.contains(this.scaleClass)) {
        this.backgroundTarget.classList.toggle(this.scaleClass)
      } else {
        setTimeout(() => {
          this.backgroundTarget.classList.toggle(this.scaleClass);
        }, 500)
      }
      this.linkTargets.forEach(target => target.classList.toggle(this.activeClass));
    }
  }
}
