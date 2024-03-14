import {Application} from '@hotwired/stimulus'
import {definitionsFromContext} from '@hotwired/stimulus-webpack-helpers'
import {Tabs, Toggle, Slideover} from 'tailwindcss-stimulus-components'

const application = Application.start()
application.register('tabs', Tabs)
application.register('toggle', Toggle)
application.register('slideover', Slideover)
const context = require.context('controllers', true, /_controller\.js$/)
application.load(definitionsFromContext(context))
