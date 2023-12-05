class DropSubscriptions < ActiveRecord::Migration[7.1]
  def change
    drop_table :subscriptions
  end
end
