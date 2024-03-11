class AddComments < ActiveRecord::Migration[7.1]
  def change
    create_table :comments do |t|
      t.string :username
      t.string :comment
      t.integer :user_id
      t.integer :blog_id
      t.timestamps
    end
  end
end
