class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      t.belongs_to :city, null: false
      t.belongs_to :client, null: false
      t.string :zip, null: false
      t.string :street, null: false
      t.integer :building, null: false
      t.integer :apartment, null: false
      t.text :comment
      t.boolean :main, default: false

      t.timestamps
    end
  end
end
