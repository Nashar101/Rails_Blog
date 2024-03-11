class ChangeBlogidToBlogtextId < ActiveRecord::Migration[7.1]
  def change
    rename_column :comments, :blog_id, :blogtext_id

  end

end
