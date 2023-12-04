class Subscription < ApplicationRecord
  monetize :price_cents
end
