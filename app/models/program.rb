class Program < ApplicationRecord
  validates :name, presence: true
  has_many :universities, through: :university_programs
end
