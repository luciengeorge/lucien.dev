import { Controller } from 'stimulus';
import { writeText } from '../packs/components/live_typing';

export default class extends Controller {
  static targets = [ 'pre', 'style' ];

  connect() {
    writeText(this.text(), this.preTarget, 0, this.styleTarget, () => {
      this.element.dispatchEvent(new Event(`${this.identifier}-done`));
    });
  }

  updateStyles(event) {
    this.styleTarget.innerText = event.currentTarget.innerText.replace('<br>', '');
  }

  transition() {
    writeText(this.transitionText(), this.preTarget, 0, this.styleTarget, () => {
      this.element.dispatchEvent(new Event(`${this.identifier}-transition-done`));
    });
  }

  renderSuccess() {
    writeText(this.transitionSuccessText(), this.preTarget, 0, this.styleTarget, () => {
      this.preTarget.setAttribute('contenteditable', 'true');
    });
  }

  skip(event) {
    event.preventDefault();
    this.preTarget.setAttribute('data-skip', true);
  }

  text() {
    return `/*
 * Hey! My name is Lucien 👋
 * I am a Web Developer from Beirut, Lebanon 🇱🇧
 *
 * How are you doing?
 *
 * It's a beautiful day to code a website 👨‍💻
 *
 * I am just adding some style to this ugly page
 *
 * Let's see...
 *
 * How about we start easy with some text styling huh?
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
  transition: all 500ms;
  white-space: pre-wrap;
  width: 100%;
  margin: 0 auto;
  overflow: scroll;
  max-height: calc(100vh - 130px);
  color: #ffffff;
  padding: 32px 24px;
  border-radius: 5px;
  border: 1px solid white;
  flex: 0 0 100%;
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
 * Well that's great and all but that's not why you're here.
 * So let's get to it.
 * Let me tell you a little bit more about myself.
 */

/*
 * But first, let's move this s*** over
 */

#flex {
  transition: all 500ms;
  width: 100%;
  display: flex;
  align-items: start;
  justify-content: around;
}

pre {
  flex: 0 0 50%;
  margin-left: 5px;
}

#markdown {
  transition: all 500ms;
  white-space: pre-wrap;
  line-height: initial;
  max-height: calc(100vh - 130px);
  overflow: scroll;
  overflow-wrap: break-word;
  color: white;
  flex: 0 0 50%;
  margin-right: 5px;
  padding: 32px 24px;
  border-radius: 5px;
  border: 1px solid white;
}

/*
* let's make sure this is responsive
*/

@media only screen and (max-width: 640px) {
  #flex {
    flex-direction: column;
  }

  pre {
    flex: 0 0 100%;
    margin-left: 5px;
  }

  #markdown {
    flex: 0 0 100%;
    margin-right: 0;
    margin-bottom: 10px;
  }
}

/*
* Okay we're ready now!
*/`;
  }

  transitionText() {
    return `

/*
* This text looks like 💩 at the moment.
* Let's fix that. Shall we?
*
* Drum roll... 🥁
* 3...
* 2...
* 1...
* Go!
*/`;
  }

  transitionSuccessText() {
    return `

/*
* Boom 💥 Much better 😄
* Ha there I am! A bit too big though 😅
* Let's make that image smaller
*/

#markdown img {
  transition: all 500ms;
  max-width: 35%;
}

/*
 * Let's add some more styling to the text
 */

#markdown p {
  color: rgba(255, 255, 255, 0.8);
}

#markdown h3 {
  position: relative;
  display: inline-block;
  margin-bottom: 1em;
}

#markdown h3::after {
  content: '';
  width: 50%;
  height: 3px;
  background: white;
  position: absolute;
  bottom: -3px;
  left: 0;
}

#markdown ul {
  list-style: initial;
  margin-top: -20px;
  line-height: 1;
}

#markdown a {
  color: #ffffff;
  text-decoration: underline;
  font-weight: 900;
}

/*
* TADA 🎉 This was fun! Hope you enjoyed it as much as I did.
* Big thanks to Jake Albaugh and Samuel Reed
* who were the first to do a page like this one.
* The code used here was heavily inspired from their projects.
*/

/*
* The best part about this box is that it's completely editable.
* So have fun, change some of the CSS, hell, break the page!
*/

/*
* Coded with love ✌️. Over and out.
*/`;
  }
}
