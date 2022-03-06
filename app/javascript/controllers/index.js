// Import and register all your controllers from the importmap under controllers/*

import LazyLoader from 'stimulus-lazy-loader';
import { application } from "controllers/application"
import { eagerLoadControllersFrom } from "@hotwired/stimulus-loading"
import { Tabs, Toggle, Slideover } from 'tailwindcss-stimulus-components';

// Eager load all controllers defined in the import map under controllers/**/*_controller
// import { eagerLoadControllersFrom } from "@hotwired/stimulus-loading"
eagerLoadControllersFrom("controllers", application)

// Lazy load controllers as they appear in the DOM (remember not to preload controllers in import map!)
// lazyLoadControllersFrom("controllers", application)
application.register('lazy-loader', LazyLoader);
application.register('tabs', Tabs);
application.register('toggle', Toggle);
application.register('slideover', Slideover);
