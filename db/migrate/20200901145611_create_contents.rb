class CreateContents < ActiveRecord::Migration[6.0]
  def change
    create_table :contents do |t|
      t.datetime :datetime
      t.text :content
      t.integer :user_id
      t.integer :reactor

      t.timestamps
    end
  end
end
