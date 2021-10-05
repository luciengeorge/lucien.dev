import { Controller } from 'stimulus';
import { writeText } from '../packs/components/live_typing';

export default class extends Controller {
  static targets = [ 'pre', 'style', 'skipCta' ];
  static classes = [ 'noTransition' ];

  connect() {
    writeText(this.text, this.preTarget, 0, this.styleTarget, () => {
      this.element.dispatchEvent(new Event(`${this.identifier}-done`));
    });
  }

  updateStyles(event) {
    this.styleTarget.innerText = event.currentTarget.innerText.replace('<br>', '');
  }

  transition() {
    writeText(this.transitionText, this.preTarget, 0, this.styleTarget, () => {
      this.element.dispatchEvent(new Event(`${this.identifier}-transition-done`));
    });
  }

  renderSuccess() {
    writeText(this.transitionSuccessText, this.preTarget, 0, this.styleTarget, () => {
      this.preTarget.setAttribute('contenteditable', 'true');
      this.skipCtaTarget.remove();
    });
  }

  skip(event) {
    event.preventDefault();
    this.styleTarget.insertAdjacentHTML('afterbegin', `
      * {
        -webkit-transition: none !important;
        -moz-transition: none !important;
        -o-transition: none !important;
        transition: none !important;
      }`);
    this.preTarget.setAttribute('data-skip', true);
  }

  get text() {
    return `/*
 * Hey! My name is Lucien 👋
 * I am a Software Engineer from Beirut, Lebanon 🇱🇧
 * How are you doing?
 *
 * It's a beautiful day to build a website 👨‍💻
 * I am just adding some styles to this ugly page
 * Let's see...
 * How about we start by animating, well, everything!
 */

* {
  -webkit-transition: all 500ms;
  -moz-transition: all 500ms;
  -ms-transition: all 500ms;
  -o-transition: all 500ms;
  transition: all 500ms;
}

/*
 * let's also add some basic text styling
 */

.live-text {
  font-size: 12px;
  line-height: 1.4;
  -webkit-font-smoothing: subpixel-antialiased;
}

/*
 * A bit boring 🤔. Let's pimp it up a little and add some styling to the page.
 */

pre {
  max-height: calc(100vh - 130px);
  white-space: pre-wrap;
  margin: 0 auto;
  overflow: scroll;
  color: #ffffff;
  padding: 32px 24px;
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
 * But first, let's get the page ready
 */

#markdown {
  white-space: pre-wrap;
  line-height: initial;
  max-height: calc(100vh - 130px);
  overflow: scroll;
  overflow-wrap: break-word;
  color: #000000;
  padding: 32px 24px;
}

/*
 * let's make sure this looks good on small screens
 */

@media only screen and (max-width: 640px) {
  #flex {
    flex-direction: column;
  }

  pre {
    color: #ffffff;
    flex: 0 0 98%;
    max-height: calc(50vh - 65px);
    border-radius: 5px;
    border: 1px solid white;
    margin: 0 auto;
    margin-bottom: 8px;
  }

  #markdown {
    color: #ffffff;
    flex: 0 0 98%;
    max-height: calc(50vh - 65px);
    border-radius: 5px;
    border: 1px solid white;
    margin: 0 auto;
  }
}

/*
 * Okay we're ready now!
 */`;
  }

  get transitionText() {
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

  get transitionSuccessText() {
    return `

/*
 * Boom 💥 Much better 😄
 * Ha there I am! A bit too big though 😅
 * Let's make that image smaller
 */

#markdown img {
  max-width: 35%;
}

/*
 * Let's add some more styling to the text
 */

#markdown p {
  color: rgba(0, 0, 0, 0.8);
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
  background: #000000;
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
  color: #000000;
  text-decoration: underline;
}

@media only screen and (max-width: 640px) {
  #markdown p {
    color: rgba(255, 255, 255, 0.8);
  }

  #markdown h3::after {
    background: #ffffff;
  }

  #markdown a {
    color: #ffffff;
  }
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
