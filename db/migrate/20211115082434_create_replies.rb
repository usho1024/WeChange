class CreateReplies < ActiveRecord::Migration[5.2]
  def change
    create_table :replies do |t|
      t.integer :user_id, null: false
      t.integer :tweet_id, null: false
      t.string :body, null: false

      t.timestamps
    end
  end
end
