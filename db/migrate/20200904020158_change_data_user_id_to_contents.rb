class ChangeDataUserIdToContents < ActiveRecord::Migration[6.0]
  def change
    change_column :contents, :user_id, :string
  end
end
