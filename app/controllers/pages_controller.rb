class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]
  def home
    lookup_keys = %w[monthly yearly]
    @prices = Stripe::Price.list(lookup_keys: lookup_keys, active: true, expand: ['data.product']).data.sort_by(&:unit_amount)
  end
end
