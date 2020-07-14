class PhoneNumber < ApplicationRecord
  belongs_to :client

  validates :num, presence: true,
                  numericality: true,
                  length: { :minimum => 10, :maximum => 15 }
end
