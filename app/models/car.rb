class Car < ApplicationRecord
  has_many :producers
  validates_presence_of :model
  validates_numericality_of :producer_id
  validates_numericality_of :fuel
  validates_numericality_of :usage
  validates_numericality_of :year
end
