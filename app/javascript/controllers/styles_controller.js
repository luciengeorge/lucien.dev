import { Controller } from 'stimulus';
import { writeText, time } from '../packs/components/live_typing';

export default class extends Controller {
  static targets = [ 'pre', 'style' ];

  connect() {
    writeText(this.text(), this.preTarget, 0, time(), true, this.styleTarget, () => {
      this.element.dispatchEvent(new Event(`${this.identifier}-done`));
    });
  }

  updateStyles(event) {
    this.styleTarget.innerText = event.currentTarget.innerText.replace('<br>', '');
  }

  transition() {
    writeText(this.transitionText(), this.preTarget, 0, time(), true, this.styleTarget, () => {
      this.element.dispatchEvent(new Event(`${this.identifier}-transition-done`));
    });
  }

  renderSuccess() {
    writeText(this.transitionSuccessText(), this.preTarget, 0, time(), true, this.styleTarget, () => {
      this.element.dispatchEvent(new Event(`${this.identifier}-transition-success-done`));
    });
  }

  text() {
    return `/*
 * Hey! My name is Lucien George 👋
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
  background-color: #090e15;
  color: #ffffff;
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
}

/*
* Okay we're ready now!
*/`;
  }

  transitionText() {
    return `

/*
* This markdown looks like 💩 at the moment.
* Let's fix that. Shall we?
*
* Drum roll... 🥁
*/`;
  }

  transitionSuccessText() {
    return `

/*
* Boom! Much better! 😄
*/`;
  }
}
