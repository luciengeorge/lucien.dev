import { Application } from 'stimulus';
import { definitionsFromContext } from 'stimulus/webpack-helpers';
import LazyLoader from 'stimulus-lazy-loader';
import { Dropdown, Modal, Tabs, Popover, Toggle, Slideover } from 'tailwindcss-stimulus-components';

const application = Application.start();
application.register('lazy-loader', LazyLoader);
application.register('dropdown', Dropdown)
application.register('modal', Modal)
application.register('tabs', Tabs)
application.register('popover', Popover)
application.register('toggle', Toggle)
application.register('slideover', Slideover)
const context = require.context('controllers', true, /_controller\.js$/);
application.load(definitionsFromContext(context));
