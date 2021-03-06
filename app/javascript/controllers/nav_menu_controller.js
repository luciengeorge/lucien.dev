import { Controller } from 'stimulus';

export default class extends Controller {
  static targets = [ 'button', 'menu', 'closeIcon', 'openIcon' ];

  toggle() {
    this.openIconTarget.classList.toggle('hidden');
    this.closeIconTarget.classList.toggle('hidden');
    this.openIconTarget.classList.toggle('block');
    this.closeIconTarget.classList.toggle('block');
    this.menuTarget.classList.toggle('hidden');
  }
}
