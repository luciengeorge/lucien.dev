import { Application } from 'stimulus';
import { definitionsFromContext } from 'stimulus/webpack-helpers';
import LazyLoader from 'stimulus-lazy-loader';
import { Tabs, Toggle, Slideover } from 'tailwindcss-stimulus-components';

const application = Application.start();
application.register('lazy-loader', LazyLoader);
application.register('tabs', Tabs);
application.register('toggle', Toggle);
application.register('slideover', Slideover);
const context = require.context('controllers', true, /_controller\.js$/);
application.load(definitionsFromContext(context));
