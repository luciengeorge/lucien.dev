FerrumPdf.configure do |config|
  # Heroku containers require sandbox to be disabled for headless Chrome.
  config.browser_options = {
    "no-sandbox" => true,
    "disable-setuid-sandbox" => true,
  }

  config.browser_path = ENV["BROWSER_PATH"] if ENV["BROWSER_PATH"].present?
end
