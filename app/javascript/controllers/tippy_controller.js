import { Controller } from '@hotwired/stimulus';
import tippy from 'tippy.js';
import 'tippy.js/dist/tippy.css';
import 'tippy.js/themes/light.css';
import 'tippy.js/animations/scale-extreme.css';

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
