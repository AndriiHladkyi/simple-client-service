class CreateClients < ActiveRecord::Migration[6.0]
  def change
    create_table :clients do |t|
      t.integer :organization_id
      t.integer :delivery_type_id
      t.string :user_id, null: false
      t.string :first_name, null: false
      t.string :last_name, null: false
      t.string :email, null: false, unique: true

      t.timestamps
    end

    add_index :clients, :email, unique: true
  end
end
