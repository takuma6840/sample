class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :name, limit: 30, null: false
      t.date :birthday
      t.text :gender
      t.text :address
      t.text :telephonenumber, null: false

      t.timestamps
    end
  end
end
