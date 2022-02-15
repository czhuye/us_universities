class University < ApplicationRecord
  validates :name, :city, :state, :zip, :program, presence: true
  validates :name, uniqueness: true
  validates :rank, numericality: { only_integer: true }
end
