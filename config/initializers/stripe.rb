Rails.configuration.stripe = {
  publishable_key: ENV['STRIPE_PUBLISHABLE_KEY'],
  secret_key:      ENV['STRIPE_SECRET_KEY']
}

Stripe.api_key = "sk_test_51OJfuEA7UmY4VSRuRwScyub99yzueKZ9jyA39Fy3FTIGMj56vEa4jQSJM3fhmXAYqNFJqqmcnPZsKnxPJj3IvmlM00pqNNmxP8"
