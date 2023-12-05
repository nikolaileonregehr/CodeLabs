class AddPriceToSubscriptions < ActiveRecord::Migration[7.1]
  def change
    add_monetize :subscriptions, :price, currency: { present: false }
  end
end
