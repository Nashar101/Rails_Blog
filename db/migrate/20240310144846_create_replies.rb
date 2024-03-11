class CreateReplies < ActiveRecord::Migration[7.1]
  def change
    create_table :replies do |t|
      t.integer :comment_id
      t.integer :user_id
      t.text :reply

      t.timestamps
    end
  end
end
