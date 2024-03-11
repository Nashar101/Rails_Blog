class AddTitleToBlogtexts < ActiveRecord::Migration[7.1]
  def change
    add_column :blogtexts, :title, :string
  end
end
