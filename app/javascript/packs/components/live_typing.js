const writeChar = (char, target, styleTarget = null) => {
  let text
  if (styleTarget) {
    let openCommentValue = styleTarget.dataset.openComment === 'true'
    if (char === '/' && openCommentValue === false) {
      styleTarget.setAttribute('data-open-comment', true)
      text = target.innerHTML + char
    } else if (char === '/' && openCommentValue === true) {
      styleTarget.setAttribute('data-open-comment', false)
      text = target.innerHTML.replace(
        /(\/[^\/]*\*)$/,
        '<em class="comment">$1/</em>',
      )
    } else if (char === ':') {
      text = target.innerHTML.replace(
        /([a-zA-Z- ^\n]*)$/,
        '<em class="key">$1</em>:',
      )
    } else if (char === ';') {
      text = target.innerHTML.replace(/([^:]*)$/, '<em class="value">$1</em>;')
    } else if (char === '{') {
      text = target.innerHTML.replace(/(.*)$/, '<em class="selector">$1</em>{')
    } else {
      text = target.innerHTML + char
    }
    styleTarget.insertAdjacentHTML('beforeend', char)
  } else {
    text = target.innerHTML + char
  }
  target.innerHTML = text
}

const time = () => {
  if (skip()) return 0

  return 16
}

const newInterval = (message, index) => {
  if (skip()) return time()
  const comma = /\D[\,]\s$/
  const endOfBlock = /[^\/]\n\n$/
  const endOfSentence = /[\.\?\!]\s$/
  const slice = message.slice(index - 2, index + 1)
  if (comma.test(slice)) return time() * 30
  if (endOfBlock.test(slice)) return time() * 50
  if (endOfSentence.test(slice)) return time() * 70
  return time()
}

const writeText = (message, target, index, styleTarget, callback) => {
  let timeoutId
  if (index < message.length) {
    target.scrollTop = target.scrollHeight
    writeChar(message[index++], target, styleTarget)
    const nextInterval = newInterval(message, index)
    if (skip()) {
      // if (timeoutId) window.clearTimeout(timeoutId);
      writeText(message, target, index, styleTarget, callback)
    } else {
      timeoutId = setTimeout(() => {
        writeText(message, target, index, styleTarget, callback)
      }, nextInterval)
    }
  } else {
    callback()
  }
}

const skip = () => {
  return document.querySelector('#style-text')?.dataset?.skip === 'true'
}

export {writeText, skip}
