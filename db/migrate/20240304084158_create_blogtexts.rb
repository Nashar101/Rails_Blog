class CreateBlogtexts < ActiveRecord::Migration[7.1]
  def change
    create_table :blogtexts do |t|
      t.string :owner

      t.timestamps
    end
  end
end
