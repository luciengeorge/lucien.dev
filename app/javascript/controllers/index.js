import { application } from "./application"
import { Tabs, Toggle, Slideover } from 'tailwindcss-stimulus-components'

// Register TailwindCSS stimulus components
application.register('tabs', Tabs)
application.register('toggle', Toggle)
application.register('slideover', Slideover)

// Eager load all controllers defined in the import map under controllers/**/*_controller
import { eagerLoadControllersFrom } from "@hotwired/stimulus-loading"
eagerLoadControllersFrom("controllers", application)
