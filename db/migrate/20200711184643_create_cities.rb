class CreateCities < ActiveRecord::Migration[6.0]
  def change
    create_table :cities do |t|
      t.belongs_to :state, null: false
      t.string :name, null: false, unique: true

      t.timestamps
    end
  end
end
