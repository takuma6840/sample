class CreateEmployees < ActiveRecord::Migration[6.0]
  def change
    create_table :employees do |t|
      t.string :name, null: false
      t.string :employee_id, null: false
      t.string :password_digest, null: false

      t.timestamps
      t.index :employee_id, unique: true
    end
  end
end
