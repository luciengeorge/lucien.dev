import { Controller } from 'stimulus';
import Masonry from 'masonry-layout';

export default class extends Controller {
  static targets = [ 'grid' ];
  connect() {
    this.start();
  }

  start() {
    new Masonry( this.gridTarget, {
      itemSelector: '.repo--js',
      horizontalOrder: true
    });
  }
}
