class CreateOrganizations < ActiveRecord::Migration[6.0]
  def change
    create_table :organizations do |t|
      t.string :name, null: false, unique: true
      t.string :tax_id, null: false

      t.timestamps
    end
  end
end
