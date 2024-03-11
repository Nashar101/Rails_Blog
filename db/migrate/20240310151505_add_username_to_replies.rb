class AddUsernameToReplies < ActiveRecord::Migration[7.1]
  def change
    add_column :replies, :username, :string
  end
end
