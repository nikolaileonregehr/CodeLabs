class Stripe::WebhooksController < ApplicationController
  skip_before_action :verify_authenticity_token, :authenticate_user!

  def create
    webhook_secret = 'whsec_n0Ioa2zBh6XvsgjmozHz6dhZpAIBf2S6'
    payload = request.body.read

    sig_header = request.env['HTTP_STRIPE_SIGNATURE']
    event = nil

    begin
      event = Stripe::Webhook.construct_event(payload, sig_header, webhook_secret)
    rescue JSON::ParserError => e
      # Invalid payload
      render json: { error: 'Invalid payload' }, status: 400
      return
    rescue Stripe::SignatureVerificationError => e
      # Invalid signature
      render json: { error: 'Webhook signature verification failed' }, status: 400
      return
    end

    handle_stripe_event(event)

    render json: { message: 'success' }
  end

  private

  def handle_stripe_event(event)
    case event.type
    when 'customer.created'
      handle_customer_created(event)
    when 'customer.subscription.deleted', 'customer.subscription.updated', 'customer.subscription.created'
      handle_subscription_event(event)
    end
  end

  def handle_customer_created(event)
    customer = event.data.object
    user = User.find_by(email: customer.email)
    user&.update(stripe_customer_id: customer.id)
  end

  def handle_subscription_event(event)
    subscription = event.data.object
    user = User.find_by(stripe_customer_id: subscription.customer)

    return unless user.present?

    if user.active? == true
      user.status = "subscribed"
      user.save
    else
      user.status = "unsubscribed"
      user.save
    end
    user.update(
      plan: subscription.items.data[0].price.recurring.interval,
      subscription_status: subscription.status,
      subscription_ends_at: Time.at(subscription.current_period_end).to_datetime
    )
  end
end
