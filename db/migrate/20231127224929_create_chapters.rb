class CreateChapters < ActiveRecord::Migration[7.1]
  def change
    create_table :chapters do |t|
      t.string :title
      t.string :video
      t.text :content
      t.text :quiz
      t.references :product, null: false, foreign_key: true

      t.timestamps
    end
  end
end
