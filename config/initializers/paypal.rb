
require 'paypal-sdk-rest'

PayPal::SDK.configure(
  mode: ENV['PAYPAL_MODE'] || 'sandbox',
  client_id: ENV['PAYPAL_CLIENT_ID'],
  client_secret: ENV['PAYPAL_CLIENT_SECRET'],
  ssl_options: { verify_mode: OpenSSL::SSL::VERIFY_NONE }
)
