class DeliveryType < ApplicationRecord
  has_many :clients

  validates :name, presence: true, uniqueness: true

  def destroy_id_from_clients
    Client.where(delivery_type_id: self.id).update(delivery_type_id: nil)
  end
end
