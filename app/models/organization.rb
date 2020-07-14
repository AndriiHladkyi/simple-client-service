class Organization < ApplicationRecord
  has_many :clients
  
  validates :name,   presence: true, uniqueness: true
  validates :tax_id, presence: true, 
                     length: { is: 10 }, 
                     numericality: { only_integer: true }

  def destroy_id_from_clients
    Client.where(organization_id: self.id).update(organization_id: nil)
  end
end
