import { Controller } from 'stimulus';

export default class extends Controller {
  static targets = [ 'slide' ];
  static classes = [ 'next', 'previous' ];
  static values = {
    current: Number,
    next: Number,
    previous: Number
  };

  nextSlide(event) {
    if(event.type === 'keyup' && event.key !== 'ArrowRight') return;
    if (!this.next) return;

    this.current.classList.add('previous');
    this.next.classList.remove('next');
    this.previousValue = this.currentValue;
    this.currentValue = this.nextValue;
    this.nextValue += 1;
  }

  previousSlide(event) {
    if(event.type === 'keyup' && event.key !== 'ArrowLeft') return;
    if (!this.previous) return;

    this.current.classList.add('next');
    this.previous.classList.remove('previous');
    this.nextValue = this.currentValue;
    this.currentValue = this.previousValue;
    this.previousValue -= 1;
  }

  get next() {
    return this.slideTargets.find(slide => +slide.dataset.index === this.nextValue);
  }

  get previous() {
    return this.slideTargets.find(slide => +slide.dataset.index === this.previousValue);
  }

  get current() {
    return this.slideTargets.find(slide => +slide.dataset.index === this.currentValue);
  }
}
