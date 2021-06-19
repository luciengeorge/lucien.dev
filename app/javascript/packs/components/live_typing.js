const writeChar = (char, target, styles = false, styleTarget = null) => {
  let text;
  if (styles) {
    let openCommentValue = styleTarget.dataset.openComment === 'true';
    if (char === '/' && openCommentValue === false) {
      styleTarget.setAttribute('data-open-comment', true);
      text = target.innerHTML + char;
    } else if (char === '/' && openCommentValue === true) {
      styleTarget.setAttribute('data-open-comment', false);
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
    styleTarget.insertAdjacentHTML('beforeend', char);
  } else {
    text = target.innerHTML + char;
  }
  target.innerHTML = text;
}

const time = () => {
  return window.innerWidth <= 578 ? 4 : 16;
}

const newInterval = (message, index) => {
  const comma = /\D[\,]\s$/;
  const endOfBlock = /[^\/]\n\n$/;
  const endOfSentence = /[\.\?\!]\s$/;
  const slice = message.slice(index - 2, index + 1);
  if (comma.test(slice)) return time() * 30;
  if (endOfBlock.test(slice)) return time() * 50;
  if (endOfSentence.test(slice)) return time() * 70;
  return time();
}

const writeText = (message, target, index, interval, styles, styleTarget, callback) => {
  if (index < message.length) {
    target.scrollTop = target.scrollHeight;
    writeChar(message[index++], target, styles, styleTarget);
    const nextInterval = newInterval(message, index);
    setTimeout(() => {
      writeText(message, target, index, nextInterval, styles, styleTarget, callback);
    }, nextInterval);
  } else {
    callback();
  }
}

export { writeText, time };
