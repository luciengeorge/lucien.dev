import {application} from './application'
import {definitionsFromContext} from 'stimulus/webpack-helpers'
import LazyLoader from 'stimulus-lazy-loader'
import {Tabs, Toggle, Slideover} from 'tailwindcss-stimulus-components'

application.register('lazy-loader', LazyLoader)
application.register('tabs', Tabs)
application.register('toggle', Toggle)
application.register('slideover', Slideover)
const context = require.context('./', true, /_controller\.js$/)
application.load(definitionsFromContext(context))
