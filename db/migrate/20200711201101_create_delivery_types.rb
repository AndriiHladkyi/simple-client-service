class CreateDeliveryTypes < ActiveRecord::Migration[6.0]
  def change
    create_table :delivery_types do |t|
      t.string :name, null: false, unique: true

      t.timestamps
    end

    ['Courier delivery', 'Pick-up from the store', 'Post delivery'].map do |name|
      DeliveryType.create(name: name)
    end
  end
end
