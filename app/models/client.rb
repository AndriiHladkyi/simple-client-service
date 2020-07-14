class Client < ApplicationRecord
  belongs_to :user
  has_one    :delivery_type
  has_one    :organization
  has_many   :phone_numbers, dependent: :destroy
  has_many   :addresses, dependent: :destroy

  accepts_nested_attributes_for :phone_numbers, allow_destroy: true
  accepts_nested_attributes_for :addresses, allow_destroy: true

  validates :first_name, presence: true
  validates :last_name,  presence: true
  validates :email,      presence: true, 
                         uniqueness: true, 
                         format: { with: URI::MailTo::EMAIL_REGEXP }

  validate :check_main_phone_number
  validate :check_main_address

  def check_main_phone_number
    errors.add(:base, "You can change only 1 number phone as main") if self.phone_numbers.map(&:main).count(true) > 1
  end

  def check_main_address
    errors.add(:base, "You can change only 1 address as main") if self.addresses.map(&:main).count(true) > 1
  end

  def self.user_clients(user_id)
    where(user_id: user_id)
  end

  def organization_name
    self.organization_id ? Organization.find(organization_id).name : 'Without organization'
  end

  def main_delivery_type
    DeliveryType.find(self.delivery_type_id).name if self.delivery_type_id
  end
end
