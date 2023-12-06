Stripe.api_key = 'sk_test_51OJfuEA7UmY4VSRugNYy7hQOx2VQV5eyzxE91E3gd2rL6E8bDU0QUOADSvcE6htp6Eev1ZGJvSmTV4Mjkal8wOiJ00xOo59e4z'
Rails.configuration.stripe = {
  # ...
  signing_secret:  ENV['STRIPE_WEBHOOK_SECRET_KEY']
}

# ...
StripeEvent.signing_secret = Rails.configuration.stripe[:signing_secret]
StripeEvent.configure do |events|
  # events.subscribe 'checkout.session.completed', StripeCheckoutSessionService.new
  events.subscribe 'customer.created' do |event|
    StripeEventsService.new.customer_create(event)
  end
  events.subscribe 'customer.subscription.deleted' do |event|
    StripeEventsService.new.handle_subscription_event(event)
  end
  events.subscribe 'customer.subscription.created' do |event|
    StripeEventsService.new.handle_subscription_event(event)
  end
  events.subscribe 'customer.subscription.updated' do |event|
    StripeEventsService.new.handle_subscription_event(event)
  end
end
