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
      this.markdownTarget.scrollTop = 0;
      this.element.dispatchEvent(new Event(`${this.identifier}-rendered`));
    }, 1000);
  }

  text() {
    return `### Who am I?
I grew up in Beirut, Lebanon before moving to Montreal to pursue my undergraduate studies. I attended McGill University from 2013 to 2018 as a software engineering student.
I then moved to London and attended Le Wagon's web development 9-week long intensive bootcamp. After graduating from their course I started working as a teacher assistant for a period of 4 months while simulateously freelancing for another software company called [Hoxton Digital](https://www.hoxton-digital.com).
I currently am a full-time lead teacher and software engineer at Le Wagon London.
I co-founded [Impact Lebanon](https://www.impactlebanon.org), an initiative incubator aiming at helping Lebanon go through its current financial crisis. After the huge explosion that hit us in August 4th, 2020, we wanted to help all the Lebanese who were heavily impacted by the explosion. We created a fundraiser and manage to raise as much as £6,603,009 that was distributed to vetted NGOs.
I also co-founded [krowl.io](https://www.krowl.io), a virtual workspace to help students work from home. This is still a work in progress but a priliminary beta version is already online.

### Main projects
- [Impact Lebanon](https://www.impactlebanon.org)
- [Thawra Chronicles](https://www.thawra-chronicles.org)
- [Krowl](https://www.krowl.io)
- [lucien-george.com](https://www.lucien-george.com)
- [idk](https://idk-app.herokuapp.com)
- [ports](https://ports-idk.herokuapp.com)

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
