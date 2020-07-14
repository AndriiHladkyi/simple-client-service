class City < ApplicationRecord
  belongs_to :state
  has_many   :addresses, dependent: :destroy
  has_one    :country, through: :state

  validates :name, presence: true, uniqueness: true
end
