import { Controller } from 'stimulus';
import { writeText } from '../packs/components/live_typing';
import MarkdownIt from 'markdown-it';

export default class extends Controller {
  static targets = [ 'markdown' ];

  start() {
    writeText(this.text(), this.markdownTarget, 0, null, () => {
      this.element.dispatchEvent(new Event(`${this.identifier}-done`));
    });
  }

  render() {
    this.markdownTarget.classList.add('shrink-down');
    const md = new MarkdownIt();
    const html = md.render(this.markdownTarget.innerHTML);
    this.markdownTarget.innerHTML = html;
    setTimeout(() => {
      this.markdownTarget.classList.remove('shrink-down');
      this.element.dispatchEvent(new Event(`${this.identifier}-rendered`));
    }, 500);
  }

  text() {
    return `### Who am I?
I am  a lead teacher and web developer at Le Wagon London.
I also co-founded [Impact Lebanon](https://www.impactlebanon.org), an initiative incubator aiming at helping Lebanon go through its current financial crisis.
Moreover, I co-founded [krowl.io](https://www.krowl.io), a virtual workspace to help students work from home.

### Main projects
- [Impact Lebanon](https://www.impactlebanon.org)
- [Thawra Chronicles](https://www.thawra-chronicles.org)
- [Krowl](https://www.krowl.io)
- [lucien-george.com](https://www.lucien-george.com)

### Open source projects
- [stimulus-lazy-loader](https://www.npmjs.com/package/stimulus-lazy-loader)
- [stimulus-checkbox](https://www.npmjs.com/package/stimulus-checkbox)

### Technologies
* Ruby on Rails
* JavaScript
* React
* Python
* SQL
* HTML
* CSS
* Java
* Kotlin
* C#
* C
* git

### Spoken languages
* French (native)
* English (fluent)
* Arabic (fluent)
* Spanish (basic)

### Contact
* [me@lucien-george.com](mailto:me@lucien-george.com)
* [+44 7845 714513](tel:+447845714513)
* [GitHub](https://github.com/lucien-george)
* [LinkedIn](https://www.linkedin.com/in/luciengeorge)`;
  }
}
