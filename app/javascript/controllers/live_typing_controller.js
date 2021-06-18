import { Controller } from 'stimulus';
import MarkdownIt from 'markdown-it';

export default class extends Controller {
  static targets = [ 'pre', 'style', 'markdown' ];
  static values = {
    openComment: Boolean,
    introDone: Boolean,
    markdownDone: Boolean,
  };

  connect() {
    this.writeStyles(this.styles(), this.preTarget, 0, this.time());
  }

  writeStyleChar(char, target) {
    let text;
    if (target === this.preTarget) {
      if (char === '/' && this.openCommentValue === false) {
        this.openCommentValue = true;
        text = target.innerHTML + char;
      } else if (char === '/' && this.openCommentValue === true) {
        this.openCommentValue = false
        text = target.innerHTML.replace(/(\/[^\/]*\*)$/, '<em class="comment">$1/</em>');
      }
      else if (char === ':') {
        text = target.innerHTML.replace(/([a-zA-Z- ^\n]*)$/, '<em class="key">$1</em>:');
      }
      else if (char === ';') {
        text = target.innerHTML.replace(/([^:]*)$/, '<em class="value">$1</em>;');
      }
      else if (char === '{') {
        text = target.innerHTML.replace(/(.*)$/, '<em class="selector">$1</em>{');
      } else {
        text = target.innerHTML + char;
      }
    } else {
      text = target.innerHTML + char;
    }
    target.innerHTML = text;
    if (target === this.preTarget) this.styleTarget.insertAdjacentHTML('beforeend', char);
  }

  writeStyles(message, target, index, interval) {
    if (index < message.length) {
      target.scrollTop = target.scrollHeight;
      this.writeStyleChar(message[index++], target);
      const newInterval = this.newInterval(message, index);
      setTimeout(() => {
        this.writeStyles(message, target, index, newInterval)
      }, newInterval);
    } else {
      if (!this.introDoneValue) this.introDoneValue = true;
      if (target === this.markdownTarget && this.introDoneValue && !this.markdownDoneValue) this.markdownDoneValue = true;
    }
  }

  time() {
    return window.innerWidth <= 578 ? 4 : 16;
  }

  newInterval(message, index) {
    const comma = /\D[\,]\s$/;
    const endOfBlock = /[^\/]\n\n$/;
    const endOfSentence = /[\.\?\!]\s$/;
    const slice = message.slice(index - 2, index + 1);
    if (comma.test(slice)) return this.time() * 30;
    if (endOfBlock.test(slice)) return this.time() * 50;
    if (endOfSentence.test(slice)) return this.time() * 70;
    return this.time();
  }

  introDoneValueChanged() {
    if (!this.introDoneValue) return;

    this.writeStyles(this.markdown(), this.markdownTarget, 0, this.time());
  }

  markdownDoneValueChanged() {
    if (!this.markdownDoneValue) return;

    const md = new MarkdownIt()
    const markdown = md.render(this.markdownTarget.innerHTML);
    this.markdownTarget.innerHTML = markdown;
  }

  styles() {
    return `/*
 * Hey! My name is Lucien George.
 * I am a Web Developer from Beirut, Lebanon 🇱🇧
 *
 * How are you doing today?
 *
 * Don't mind me. I'm just coding this website at the moment.
 *
 * I'll just inject some CSS into a <style> element
 * that I am writing right now
 *
 * Let's give it a go!
 *
 */

 /*
 * Let's start easy with some text styling
 */

.live-text {
  font-size: 12px;
  line-height: 1.4;
  -webkit-font-smoothing: subpixel-antialiased;
}

/*
* A bit boring 🤔. Let's pimp it a little and add some styling to the page.
*/

pre {
  width: 100%;
  margin: 0 auto;
  font-size:
  transition: all 500ms;
  overflow: auto;
  max-height: 70vh;
  color: #ffffff;
  background-color: #090e15;
  padding: 32px 24px;
  border-radius: 15px;
  box-shadow: 0px 0px 10px rgba(6, 78, 59, 0.3);
}

/*
 * That's a start. Let's add some colors to it though.
 */

pre em:not(.comment) { font-style: normal; }

.comment       { color: #707e84; }
.selector      { color: #fba738; }
.selector .key { color: #fba738; }
.key           { color: #00bceb; }
.value         { color: #ff8321; }

/*
 * Much better! Looks exactly like my text editor 👨‍💻
 * Anw, that's not why you're here. So let's get to it.
 * Let me tell you a little bit more about myself.
 */

/*
 * First, we'll move this s*** over
 */

#flex {
  transition: all 500ms;
  width: 100%;
  display: flex;
  align-items: start;
  justify-content: around;
}

pre {
  flex: 0 1 50%;
  margin-left: 5px;
}

#markdown {
  white-space: pre-wrap;
  line-height: initial;
  max-height: 70vh;
  overflow: scroll;
  overflow-wrap: break-word;
  transition: all 500ms;
  flex: 0 0 50%;
  background: #ffffff;
  margin-right: 5px;
  padding: 32px 24px;
  border-radius: 15px;
  box-shadow: 0px 0px 10px rgba(6, 78, 59, 0.3);
}

#markdown ul {
  list-style: initial;
  margin-top: -20px;
  line-height: 1;
}`;
  }

  markdown() {
    return `### Who am I?
I am  a lead teacher and web developer at Le Wagon London.
I also co-founded [Impact Lebanon](https://www.impactlebanon.org), a charity aiming at helping Lebanon go through its current Financial Crisis.
Moreover, I co-founded [krowl.io](https://www.krowl.io), a virtual workspace to help students work from home.

#### Projects
- [Impact Lebanon](https://www.impactlebanon.org)
- [Krowl](https://www.krowl.io)
and of course,
- [lucien-george.com](https://www.lucien-george.com)

#### Open source
- [stimulus-lazy-loader](https://www.npmjs.com/package/stimulus-lazy-loader)
- [stimulus-checkbox](https://www.npmjs.com/package/stimulus-checkbox)

#### Technologies
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

#### Spoken languages
* French (native)
* English (fluent)
* Arabic (fluent)
* Spanish (basic)

#### Contact
* [me@lucien-george.com](mailto:me@lucien-george.com)
* [+44 7845 714513](tel:+447845714513)
* [GitHub](https://github.com/lucien-george)
* [LinkedIn](https://www.linkedin.com/in/luciengeorge)`;
  }
}
