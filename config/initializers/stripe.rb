if Rails.env == 'production'
  Rails.configuration.stripe = {
    :publishable_key => LIVE_PUBLISHABLE_KEY,
    :secret_key      => LIVE_SECRET_KEY
  }
else
  Rails.configuration.stripe = {
    :publishable_key => TEST_PUBLISHABLE_KEY,
    :secret_key      => TEST_SECRET_KEY
  }
end

  Stripe.api_key = Rails.configuration.stripe[:secret_key]
