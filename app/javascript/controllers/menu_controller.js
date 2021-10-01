import { Controller } from 'stimulus';

export default class extends Controller {
  static targets = [ 'menu', 'face', 'cubeWrapper', 'ring', 'background', 'link' ];
  static classes = [ 'active', 'scale' ];

  toggle(event) {
    if (event.type === 'keyup' && event.key !== 'Escape') return;

    if (event.type === 'keyup' && event.key === 'Escape' || event.type === 'click' && event.currentTarget === this.backgroundTarget) {
      this.menuTarget.classList.remove(this.activeClass);
      this.cubeWrapperTarget.classList.remove(this.activeClass);
      this.ringTarget.classList.remove('active');
      setTimeout(() => {
        this.backgroundTarget.classList.add(this.scaleClass);
      }, 500);
      this.faceTargets.forEach(target => target.classList.remove(this.activeClass));
      this.linkTargets.forEach(target => target.classList.remove(this.activeClass));
    } else {
      this.menuTarget.classList.toggle(this.activeClass);
      this.cubeWrapperTarget.classList.toggle(this.activeClass);
      this.ringTarget.classList.toggle(this.activeClass);
      if (this.backgroundTarget.classList.contains(this.scaleClass)) {
        this.backgroundTarget.classList.toggle(this.scaleClass)
      } else {
        setTimeout(() => {
          this.backgroundTarget.classList.toggle(this.scaleClass);
        }, 500)
      }
      this.faceTargets.forEach(target => target.classList.toggle(this.activeClass));
      this.linkTargets.forEach(target => target.classList.toggle(this.activeClass));
    }
  }
}
