class CreateMessages < ActiveRecord::Migration[5.0]
  def change
    create_table :messages do |t|
      t.string :message
      t.integer :user_id, null: false, default: 0

      t.timestamps
    end

    add_index :messages, :user_id
  end
end
