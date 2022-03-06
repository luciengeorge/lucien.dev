import { Controller } from '@hotwired/stimulus';

export default class extends Controller {
  static targets = [ 'alert' ];

  connect() {
    setTimeout(() => {
      this.alertTargets.forEach(alert => alert.classList.add('hidden'));
    }, 3000);
  }
}
