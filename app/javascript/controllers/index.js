import { Application } from 'stimulus';
import { definitionsFromContext } from 'stimulus/webpack-helpers';
import LazyLoader from 'stimulus-lazy-loader';

const application = Application.start();
application.register('lazy-loader', LazyLoader);
const context = require.context('controllers', true, /_controller\.js$/);
application.load(definitionsFromContext(context));
