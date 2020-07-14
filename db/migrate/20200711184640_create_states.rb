class CreateStates < ActiveRecord::Migration[6.0]
  def change
    create_table :states do |t|
      t.belongs_to :country, null: false
      t.string :name, null: false, unique: true

      t.timestamps
    end
  end
end
