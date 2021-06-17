import { Controller } from 'stimulus';

export default class extends Controller {
  static targets = [ 'pre', 'style' ];
  static values = {
    openComment: Boolean
  };

  connect() {
    this.writeStyles(this.styles(), 0, this.time());
  }

  writeStyleChar(char) {
    // begin wrapping open comments
    let styles;
    if (char === '/' && this.openCommentValue === false) {
      this.openCommentValue = true;
      styles = this.preTarget.innerHTML + char;
    } else if (char === '/' && this.openCommentValue === true) {
      this.openCommentValue = false
      styles = this.preTarget.innerHTML.replace(/(\/[^\/]*\*)$/, '<em class="comment">$1/</em>');
    }
    // wrap style declaration
    else if (char === ':') {
      styles = this.preTarget.innerHTML.replace(/([a-zA-Z- ^\n]*)$/, '<em class="key">$1</em>:');
    }
    // wrap style value
    else if (char === ';') {
      styles = this.preTarget.innerHTML.replace(/([^:]*)$/, '<em class="value">$1</em>;');
    }
    // wrap selector
    else if (char === '{') {
      styles = this.preTarget.innerHTML.replace(/(.*)$/, '<em class="selector">$1</em>{');
    }
    else {
      styles = this.preTarget.innerHTML + char;
    }
    this.preTarget.innerHTML = styles;
    this.styleTarget.insertAdjacentHTML('beforeend', char);
  }

  writeStyles(message, index, interval) {
    if (index < message.length) {
      this.preTarget.scrollTop = this.preTarget.scrollHeight;
      this.writeStyleChar(message[index++]);
      const newInterval = this.newInterval(message, index);
      setTimeout(() => {
        this.writeStyles(message, index, newInterval)
      }, newInterval);
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
 * That's a start. Let's add some color to it though.
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
  transition: all 500ms;
  flex: 0 1 50%;
  margin-right: 50px;
}`;
  }

  markdown() {
    return `
### Who am I
I am  a lead teacher and web developer at Le Wagon London.
I also co-founded [Impact Lebanon](https://www.impactlebanon.org), a charity aiming at helping Lebanon go through its current Financial Crisis.
Moreover, I co-founded [krowl.io](https://www.krowl.io), a virtual workspace to help student work from home.

**Some of my projects**
- [Impact Lebanon](https://www.impactlebanon.org)
- [Krowl](https://www.krowl.io)
and of course,
- [lucien-george.com](https://www.lucien-george.com)
`;
  }
}
