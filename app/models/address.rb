class Address < ApplicationRecord
  belongs_to :client
  belongs_to :city
  has_one    :state,   through: :city
  has_one    :country, through: :state

  validates :zip,       presence: true, 
                        numericality: { only_integer: true }, 
                        length: { is: 5 }
  validates :street,    presence: true
  validates :building,  presence: true, 
                        numericality: { only_integer: true }, 
                        length: { minimum: 1, maximum: 3}
  validates :apartment, presence: true, 
                        numericality: { only_integer: true }, 
                        length: { minimum: 1, maximum: 3}

  def full
    "#{country.name}, #{state.name}, #{city.name}, #{zip}, #{street}, #{building}/#{apartment}"
  end

  def client_name
    "#{client.first_name.capitalize} #{client.last_name.capitalize}"
  end
end
