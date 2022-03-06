import { Controller } from '@hotwired/stimulus';
import tippy from 'tippy.js';

export default class extends Controller {
  static values = {
    content: String
  };

  connect() {
    tippy(this.element, {
      content: this.contentValue,
      animation: 'scale-extreme',
      inertia: true,
      theme: 'light'
    }
    )
  }
}
