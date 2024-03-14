const {webpackConfig, merge} = require('@rails/webpacker')
const webpack = require('webpack')

module.exports = merge(webpackConfig, {
  plugins: [
    new webpack.ProvidePlugin({
      process: 'process/browser',
    }),
  ],
})
