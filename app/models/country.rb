class Country < ApplicationRecord
  has_many :states, dependent: :destroy

  validates :name, presence: true, uniqueness: true
end
