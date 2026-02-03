FerrumPdf.configure do |config|
  # Heroku containers require sandbox to be disabled for headless Chrome.
  config.browser_options = {
    'no-sandbox': nil,
    'disable-setuid-sandbox': nil,
  }
end
