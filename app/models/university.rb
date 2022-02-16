class University < ApplicationRecord
  validates :name, :city, :zip, presence: true
  # validates :program, presence: true
  validates :name, uniqueness: true
  belongs_to :state
end
