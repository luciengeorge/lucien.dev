import { Controller } from 'stimulus';
import { writeText, skip } from '../packs/components/live_typing';
import MarkdownIt from 'markdown-it';

export default class extends Controller {
  static targets = [ 'markdown' ];
  static values = {
    imgUrl: String
  };

  start() {
    writeText(this.text, this.markdownTarget, 0, null, () => {
      this.element.dispatchEvent(new Event(`${this.identifier}-done`));
    });
  }

  render() {
    if (skip()) {
      this.markdownTarget.classList.add('shrink-down-no-animation');
    } else {
      this.markdownTarget.classList.add('shrink-down');
    }
    const md = new MarkdownIt({ html: true });
    const html = md.render(this.markdownTarget.innerHTML);
    this.markdownTarget.innerHTML = html;
    if (skip()) {
      this.markdownTarget.classList.remove('shrink-down');
      this.markdownTarget.scrollTop = 0;
      this.element.dispatchEvent(new Event(`${this.identifier}-rendered`));
    } else {
      setTimeout(() => {
        this.markdownTarget.classList.remove('shrink-down');
        this.markdownTarget.scrollTop = 0;
        this.element.dispatchEvent(new Event(`${this.identifier}-rendered`));
      }, 1000);
    }
  }

  get text() {
    return `### About me
That's me 👇✌️
![Me](${this.imgUrlValue})
I know I don't look like much at the moment 😅 We'll fix that in a sec.

I was born and raised in Beirut - Lebanon. I then moved to Montreal to pursue my undergraduate studies. I attended McGill University from 2013 to 2018 as a software engineering student where I learnt the dos and don'ts of software development.

After my graduation I moved to London and attended Le Wagon's web development 9-week long intensive bootcamp. A couple thousand lines of code and 3 web applications later, I started working as a teacher assistant for a period of 4 months while simulateously freelancing for another software company called [Hoxton Digital](https://www.hoxton-digital.com). At Hoxton Digital I was responsible for the development and maintenance of the company's ongoing projects.

In May 2019, I got offered a full-time position at Le Wagon London as a lead teacher and software engineer. I got to be a member of their engineering team working on the company's internal product and the management of our web development and data science courses. I recently got promoted to engineering manager, meaning I am responsible for the well-being and growth of the London dev team.

In Ocotber 2019, amidst of the chaos of the Lebanese financial crisis, I co-founded [Impact Lebanon](https://www.impactlebanon.org), an initiative incubator aiming at helping Lebanon go through its current financial crisis. After the huge explosion that hit us in August 4th, 2020, we desperately wanted to help all the Lebanese who were heavily impacted by the explosion. This led to the creation of a fundraiser. We managed to raise mroe than £6,500,000 that was distributed to vetted NGOs.

Moreover, I co-founded [krowl.io](https://www.krowl.io), a virtual workspace to help students work from home. This is still a work in progress but a MVP is already online.

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
* Heroku

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
