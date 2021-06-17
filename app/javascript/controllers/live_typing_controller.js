import { Controller } from 'stimulus';

export default class extends Controller {
  static targets = [ 'styleText', 'styleTag' ];
  static values = {
    openComment: Boolean
  };

  connect() {
    this.writeStyles(this.styles(), 0, this.time());
  }

  writeStyleChar(char) {
    // begin wrapping open comments
    let styles;
    if (char == '/' && this.openCommentValue == false) {
      this.openCommentValue = true;
      styles = this.styleTextTarget.innerHTML + char;
    } else if (char == '/' && this.openCommentValue == true) {
      this.openCommentValue = false
      styles = this.styleTextTarget.innerHTML.replace(/(\/[^\/]*\*)$/, '<em class="comment">$1/</em>');
    }
    // wrap style declaration
    else if (char == ':') {
      styles = this.styleTextTarget.innerHTML.replace(/([a-zA-Z- ^\n]*)$/, '<em class="key">$1</em>:');
    }
    // wrap style value
    else if (char == ';') {
      styles = this.styleTextTarget.innerHTML.replace(/([^:]*)$/, '<em class="value">$1</em>;');
    }
    // wrap selector
    else if (char == '{') {
      styles = this.styleTextTarget.innerHTML.replace(/(.*)$/, '<em class="selector">$1</em>{');
    }
    else {
      styles = this.styleTextTarget.innerHTML + char;
    }
    this.styleTextTarget.innerHTML = styles;
    this.styleTagTarget.insertAdjacentHTML('beforeend', char);
  }

  writeStyles(message, index, interval) {
    if (index < message.length) {
      const pre = this.styleTextTarget;
      pre.scrollTop = pre.scrollHeight;
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
 * Hey! My name is Lucien George. Web Developer from Beirut, Lebanon 🇱🇧
 * How are you doing today?
 *
 * Don't mind me. I'm just coding this home page at the moment.
 *
 * I'll just inject some CSS into a <style> element that I am writing right now
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
  border: 1px solid #064e3b;
  padding: 32px 24px;
  box-sizing: border-box;
  border-radius: 15px;
  box-shadow: 0px 4px 0px 2px rgba(6, 78, 59, 0.1);
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
 * Let's build my little pen heart.
 */


/* First, we'll move this s*** over */

pre { left: 50%; }

/*
 *
 * Wahoo!
 *
 * We did it!
 *
 * I mean *I* did it, but you know, whatever...
 * jake albaugh definitely did not have anything
 * to do with this.
 *
 * This pen loves CodePen!
 *
 * See you later!
 *
 */
    `;
  }
}
