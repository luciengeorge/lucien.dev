import { Controller } from '@hotwired/stimulus';
import { enter, leave } from 'el-transition';

export default class extends Controller {
  static targets = [ 'modal', 'overlay', 'wrapper' ];

  toggle(event) {
    event.preventDefault();
    if (this.wrapperTarget.classList.contains('hidden')) {
      this.enterTransition();
    } else {
      this.leaveTransition();
    }
    this.wrapperTarget.classList.toggle('hidden');
  }

  closeWithKeyboard(event) {
    if (!this.hasWrapperTarget || !this.hasModalTarget || !this.hasOverlayTarget) return;
    if (this.wrapperTarget.classList.contains('hidden') || event.keyCode !== 27) return;
    this.leaveTransition();
    this.wrapperTarget.classList.add('hidden');
  }

  leaveTransition() {
    leave(this.modalTarget);
    leave(this.overlayTarget);
  }

  enterTransition() {
    enter(this.modalTarget);
    enter(this.overlayTarget);
  }
}
