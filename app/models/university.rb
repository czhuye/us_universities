class University < ApplicationRecord
  validates :name, :city, :zip, presence: true
  validates :name, uniqueness: true
  belongs_to :state
  has_many :programs, through: :university_programs
end
