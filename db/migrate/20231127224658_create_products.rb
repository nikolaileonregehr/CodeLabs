class CreateProducts < ActiveRecord::Migration[7.1]
  def change
    create_table :products do |t|
      t.string :subject
      t.text :description

      t.timestamps
    end
  end
end
