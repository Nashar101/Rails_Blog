class AddUserIdToBlogtexts < ActiveRecord::Migration[7.1]
  def change
    add_column :blogtexts, :user_id, :integer
  end
end
