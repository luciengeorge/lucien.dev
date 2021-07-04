import { Controller } from 'stimulus';

export default class extends Controller {
  static targets = [ 'menu' ];
  static classes = [ 'active' ];

  toggle(event) {
    if (event.type === 'keyup' && event.key !== 'Escape') return;

    if (event.type === 'keyup' && event.key === 'Escape') {
      this.menuTarget.classList.remove(this.activeClass);
    } else {
      this.menuTarget.classList.toggle(this.activeClass)
    }
  }
}
