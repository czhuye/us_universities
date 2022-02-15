class University < ApplicationRecord
  validates :name, :city, :state, :zip, presence: true
  # validates :program, presence: true
  validates :name, uniqueness: true
end
