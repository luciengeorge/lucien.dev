import { Controller } from 'stimulus';

export default class extends Controller {
  static targets = [ 'menu', 'face', 'cubeWrapper', 'ring', 'background' ];
  static classes = [ 'active', 'scale' ];

  toggle(event) {
    if (event.type === 'keyup' && event.key !== 'Escape') return;

    if (event.type === 'keyup' && event.key === 'Escape' || event.type === 'click' && event.currentTarget === this.backgroundTarget) {
      this.menuTarget.classList.remove(this.activeClass);
      this.cubeWrapperTarget.classList.remove(this.activeClass);
      this.ringTarget.classList.remove('active');
      this.faceTargets.forEach(target => target.classList.remove(this.activeClass));
      this.backgroundTarget.classList.add(this.scaleClass);
    } else {
      this.menuTarget.classList.toggle(this.activeClass);
      this.cubeWrapperTarget.classList.toggle(this.activeClass);
      this.ringTarget.classList.toggle(this.activeClass);
      this.backgroundTarget.classList.toggle(this.scaleClass);
      this.faceTargets.forEach(target => target.classList.toggle(this.activeClass));
    }
  }
}
