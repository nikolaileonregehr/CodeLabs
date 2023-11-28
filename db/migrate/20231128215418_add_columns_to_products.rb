class AddColumnsToProducts < ActiveRecord::Migration[7.1]
  def change
    add_column :products, :duration, :string
    add_column :products, :level, :string
  end
end
