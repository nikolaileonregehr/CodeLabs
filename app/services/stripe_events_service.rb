class StripeEventsService
  def customer_create(event)
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
