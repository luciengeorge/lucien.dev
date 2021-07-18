import { Controller } from 'stimulus';

export default class extends Controller {
  static targets = [ 'menu', 'face', 'cubeWrapper', 'ring' ];
  static classes = [ 'active' ];

  toggle(event) {
    if (event.type === 'keyup' && event.key !== 'Escape') return;

    if (event.type === 'keyup' && event.key === 'Escape') {
      this.menuTarget.classList.remove(this.activeClass);
      this.cubeWrapperTarget.classList.remove(this.activeClass);
      this.ringTarget.classList.remove('active');
      this.faceTargets.forEach(target => target.classList.remove(this.activeClass));
    } else {
      this.menuTarget.classList.toggle(this.activeClass);
      this.cubeWrapperTarget.classList.toggle(this.activeClass);
      this.ringTarget.classList.toggle(this.activeClass);
      this.faceTargets.forEach(target => target.classList.toggle(this.activeClass));
    }
  }
}
