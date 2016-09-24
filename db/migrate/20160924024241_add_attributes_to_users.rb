class AddAttributesToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :username, :string, null: false, default: ''
    add_column :users, :partment, :string, null: false, default: ''
    add_column :users, :tel, :string, null: false, default: ''
    add_column :users, :tag, :string, null: false, default: ''
  end
end
