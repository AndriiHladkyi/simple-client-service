class CreatePhoneNumbers < ActiveRecord::Migration[6.0]
  def change
    create_table :phone_numbers do |t|
      t.belongs_to :client, null: false
      t.string :num, null: false
      t.boolean :main, default: false

      t.timestamps
    end
  end
end
