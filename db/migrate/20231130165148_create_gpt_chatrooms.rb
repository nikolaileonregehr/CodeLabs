class CreateGptChatrooms < ActiveRecord::Migration[7.1]
  def change
    create_table :gpt_chatrooms do |t|
      t.string :title

      t.references :student, foreign_key: { to_table: :users }
      t.references :gpt_user, foreign_key: { to_table: :users }

      t.timestamps
    end
  end
end
